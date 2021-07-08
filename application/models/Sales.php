<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Sales extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	function setSaleMinorista($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$oId = $data['oId'];
			$venta = array(
				'lpId'					=>	$data['lpr']['id'],
				'lpPorcentaje'			=> 	$data['lpr']['por'],
				'venId'					=>	$data['vend']['id'],
				'cliId'					=>	$data['clie']['id'],
				'oDescuento'			=> 	$data['des'],
				'oEsPresupuesto'		=>	$data['esPre'] == 1 ? 1 : 0,
				'oEsVenta'				=> 	$data['esPre'] == 1 ? 0 : 1,
				'oEsPlanReserva'		=>	0,
				'oEsMayorista'			=> 	0,
				'oEstado'				=> 	$data['esPre'] == 1 ? 'AC' : 'FA'
			);
			
			//verificar si hay cajas abiertas
			$userdata = $this->session->userdata('user_data');
			$this->db->select('*');
			$this->db->where(array('cajaCierre'=>null));
			$this->db->from('cajas');
			$query = $this->db->get();
			$result = $query->result_array();
			if(count($result) > 0){
				$result = $query->result_array();
				$venta['cajaId'] = $result[0]['cajaId'];
			} else {
				return false;
			}

			//-----------------------------------------------

			$this->db->trans_start();
			if($oId < 0){ // Es una venta o un nuevo presupuesto
				if($this->db->insert('orden', $venta) == false) {
					$this->db->trans_complete();
					return false;
				}else{
					$idOrden = $this->db->insert_id();
				}
			} else {
				//Es el cobro de un presupuesto
				if($this->db->update('orden', array('oEstado' => 'FA', 'cajaId' => $venta['cajaId']), array('oId'=>$oId)) == false) {
					$this->db->trans_complete();
					return false;
				}
			}
				//Registrar Detalle
				foreach ($data['det'] as $o) {
					if($oId < 0){
						$insert = array(
								'oId' 					=> $idOrden,
								'artId' 				=> $o['artId'] == '-' ? null : $o['artId'],
								'artCode' 				=> $o['artCode'],
								'artDescripcion'		=> $o['artDescripcion'],
								'artCosto'				=> $o['artCosto'],
								'artVenta'				=> $o['artventa'],
								'artVentaSD'			=> $o['artventaSD'],
								'artCant'				=> $o['cant']
							);

						if($this->db->insert('ordendetalle', $insert) == false) {
							return false;
						}
					}
					//--------------------------------

					//Si no es presupuesto, modificar stock y registrar pagos
					if($data['esPre'] == 0){
							if($o['actualizaStock'] == 1){
								//Actualizar stock, insertar en tabla stock
								if($o['artId'] != '-' && $o['artId'] != 'NaN'){
									$stock = array(
											'artId' 		=> $o['artId'],
											'stkCant'		=> $o['cant'] * -1,
											'stkOrigen'		=> 'VN',
											'refId'			=> $oId < 0 ? $idOrden : $oId
										);

									if($this->db->insert('stock', $stock) == false) {
										return false;
									}
								}
							}
					}
				}
				//----------------------------------

				//medios de pagos
				if($data['esPre'] == 0){
					foreach ($data['medi'] as $m) {
						$medio = array(
							'oId'				=> $oId < 0 ? $idOrden : $oId,
							'medId'				=> $this->getIdMedio($m['medioCode']),
							'rcbImporte'		=> $m['medioImport'],
							'cajaId'			=> $venta['cajaId'],
							'rcbDesc1'			=> $m['medioDesc1'],
							'rcbDesc2'			=> $m['medioDesc2'],
							'rcbDesc3'			=> $m['medioDesc3']
						);

						if($this->db->insert('recibos', $medio) == false) {
							return false;
						}

						//Si es cuenta corriente registrar movieminto
						if($m['medioCode'] == 'CCT'){
							$ctacte = array(
								'cctepConcepto'			=> 'Venta: '.($oId < 0 ? $idOrden : $oId),
								'cctepRef'				=>	$oId < 0 ? $idOrden : $oId,
								'cctepTipo'				=>	'VN',
								'cctepDebe'				=>	$m['medioImport'],
								'cliId'					=> 	$data['clie']['id'],
								'usrId'					=>	$userdata[0]['usrId'],
								'cajaId'				=>  $venta['cajaId']
							);

							if($this->db->insert('cuentacorrientecliente', $ctacte) == false) {
								return false;
							}
						}
					}
				}
				//----------------------------------
		}

		$this->db->trans_complete();
		return $oId < 0 ? $idOrden : $oId;
	}

	function setSaleMayorista($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$oId = $data['oId'];
			$venta = array(
				'lpId'					=>	$data['lpr']['id'],
				'lpPorcentaje'			=> 	$data['lpr']['por'],
				'venId'					=>	$data['vend']['id'],
				'cliId'					=>	$data['clie']['id'],
				'oDescuento'			=> 	$data['des'],
				'oEsPresupuesto'		=>	$data['esPre'] == 1 ? 1 : 0,
				'oEsVenta'				=> 	$data['esPre'] == 1 ? 0 : 1,
				'oEsPlanReserva'		=>	0,
				'oEsMayorista'			=> 	1,
				'oEstado'				=> 	$data['esPre'] == 1 ? 'AC' : 'FA'
			);


			//verificar si hay cajas abiertas
			if($data['esPre'] == 0){
				$userdata = $this->session->userdata('user_data');
				$this->db->select('*');
				$this->db->where(array('cajaCierre'=>null));
				$this->db->from('cajas');
				$query = $this->db->get();
				$result = $query->result_array();
				if(count($result) > 0){
					$result = $query->result_array();
					$venta['cajaId'] = $result[0]['cajaId'];
				} else {
					return false;
				}
			}
			//-----------------------------------------------

			$this->db->trans_start();
			if($oId < 0){ // Es una venta o un nuevo presupuesto
				if($this->db->insert('orden', $venta) == false) {
					$this->db->trans_complete();
					return false;
				}else{
					$idOrden = $this->db->insert_id();
				}
			} else {
				//Es el cobro de un presupuesto
				if($this->db->update('orden', array('oEstado' => 'FA', 'cajaId' => $venta['cajaId']), array('oId'=>$oId)) == false) {
					$this->db->trans_complete();
					return false;
				}
			}

			//Registrar Detalle
			foreach ($data['det'] as $o) {
				if($oId < 0){
					$insert = array(
							'oId' 					=> $idOrden,
							'artId' 				=> $o['artId'] == '-' ? null : $o['artId'],
							'artCode' 				=> $o['artCode'],
							'artDescripcion'		=> $o['artDescripcion'],
							'artCosto'				=> $o['artCosto'],
							'artVenta'				=> $o['artventa'],
							'artVentaSD'			=> $o['artventaSD'],
							'artCant'				=> $o['cant']
						);

					if($this->db->insert('ordendetalle', $insert) == false) {
						return false;
					}
				}
				//--------------------------------

				//Si no es presupuesto, modificar stock y registrar pagos
				if($data['esPre'] == 0){
						if($o['actualizaStock'] == 1){
							//Actualizar stock, insertar en tabla stock
							if($o['artId'] != '-'){
								$stock = array(
									'artId' 		=> $o['artId'],
									'stkCant'		=> $o['cant'] * -1,
									'stkOrigen'		=> 'VN',
									'refId'			=> $oId < 0 ? $idOrden : $oId
								);

							if($this->db->insert('stock', $stock) == false) {
								return false;
							}
							}
							
						}
				}
			}
			//----------------------------------
			//medios de pagos
			if($data['esPre'] == 0){
				foreach ($data['medi'] as $m) {
					$medio = array(
						'oId'				=> $oId < 0 ? $idOrden : $oId,
						'medId'				=> $this->getIdMedio($m['medioCode']),
						'rcbImporte'		=> $m['medioImport'],
						'cajaId'			=> $venta['cajaId'],
						'rcbDesc1'			=> $m['medioDesc1'],
						'rcbDesc2'			=> $m['medioDesc2'],
						'rcbDesc3'			=> $m['medioDesc3']
					);

					if($this->db->insert('recibos', $medio) == false) {
						return false;
					}

					//Si es cuenta corriente registrar movieminto
					if($m['medioCode'] == 'CCT'){
						$ctacte = array(
							'cctepConcepto'			=> 'Venta: '.($oId < 0 ? $idOrden : $oId),
							'cctepRef'				=>	$oId < 0 ? $idOrden : $oId,
							'cctepTipo'				=>	'VN',
							'cctepDebe'				=>	$m['medioImport'],
							'cliId'					=> 	$data['clie']['id'],
							'usrId'					=>	$userdata[0]['usrId'],
							'cajaId'				=>  $venta['cajaId']
						);

						if($this->db->insert('cuentacorrientecliente', $ctacte) == false) {
							return false;
						}
					}
				}
			}
			//----------------------------------

			$this->db->trans_complete();
			return $oId < 0 ? $idOrden : $oId;
		}
	}

	function getIdMedio($code){
		$this->db->select('*');
		$this->db->where(array('medCodigo' => $code));
		$this->db->from('mediosdepago');
		$query = $this->db->get();
		$result = $query->result_array();
		if(count($result) > 0){
			$result = $query->result_array();
			return $result[0]['medId'];
		} else {
			return false;
		}
	}

	function setSalePreventa($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$venta = array(
				'lpId'					=>	$data['lpr']['id'],
				'lpPorcentaje'			=> 	$data['lpr']['por'],
				'venId'					=>	$data['vend']['id'],
				'cliId'					=>	$data['clie']['id'],
				'oDescuento'			=> 	$data['des'],
				'oEsPresupuesto'		=>	0,
				'oEsVenta'				=> 	0,
				'oEsPlanReserva'		=>	1,
				'oEsMayorista'			=> 	0
			);


			//verificar si hay cajas abiertas
			$userdata = $this->session->userdata('user_data');
			$this->db->select('*');
			$this->db->where(array('cajaCierre'=>null));
			$this->db->from('cajas');
			$query = $this->db->get();
			$result = $query->result_array();
			if(count($result) > 0){
				$result = $query->result_array();
				$venta['cajaId'] = $result[0]['cajaId'];
			} else {
				return false;
			}
			//-----------------------------------------------

			$this->db->trans_start();
			if($this->db->insert('orden', $venta) == false) {
				$this->db->trans_complete();
				return false;
			}else {
				$idOrden = $this->db->insert_id();

				//Registrar Detalle
				foreach ($data['det'] as $o) {
					$insert = array(
							'oId' 					=> $idOrden,
							'artId' 				=> $o['artId'] == '-' ? null : $o['artId'],
							'artCode' 				=> $o['artCode'],
							'artDescripcion'		=> $o['artDescripcion'],
							'artCosto'				=> $o['artCosto'],
							'artVenta'				=> $o['artventa'],
							'artVentaSD'			=> $o['artventaSD'],
							'artCant'				=> $o['cant']
						);

					if($this->db->insert('ordendetalle', $insert) == false) {
						return false;
					}
					//--------------------------------

					//Si no es presupuesto, modificar stock y registrar pagos
					if($o['actualizaStock'] == 1){
						//Actualizar stock, insertar en tabla stock
						if($o['artId'] != '-'){
							$stock = array(
									'artId' 		=> $o['artId'],
									'stkCant'		=> $o['cant'],
									'stkOrigen'	=> 'VN',
									'refId'			=> $idOrden
								);

							if($this->db->insert('stockreserva', $stock) == false) {
								return false;
							}
						}
					}
				}
				//----------------------------------

				//medios de pagos
				if($data['esPre'] == 0 && isset($data['medi'])){
					foreach ($data['medi'] as $m) {
						$medio = array(
							'oId'				=> $idOrden,
							'medId'				=> $this->getIdMedio($m['medioCode']),
							'rcbImporte'		=> $m['medioImport'],
							'cajaId'			=> $venta['cajaId'],
							'rcbDesc1'			=> $m['medioDesc1'],
							'rcbDesc2'			=> $m['medioDesc2'],
							'rcbDesc3'			=> $m['medioDesc3']
						);

						if($this->db->insert('recibos', $medio) == false) {
							return false;
						}

						//Si es cuenta corriente registrar movieminto
						if($m['medioCode'] == 'CCT'){
							$ctacte = array(
								'cctepConcepto'			=> 'Venta: '.$idOrden,
								'cctepRef'				=>	$idOrden,
								'cctepTipo'				=>	'VN',
								'cctepDebe'				=>	$m['medioImport'],
								'cliId'					=> 	$data['clie']['id'],
								'usrId'					=>	$userdata[0]['usrId'],
								'cajaId'				=>  $venta['cajaId']
							);

							if($this->db->insert('cuentacorrientecliente', $ctacte) == false) {
								return false;
							}
						}
					}
				}
				//----------------------------------

				$this->db->trans_complete();
				return $idOrden;
			}
		}
	}

	function setPagoReserva($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{

			//verificar si hay cajas abiertas
			$userdata = $this->session->userdata('user_data');
			$this->db->select('*');
			$this->db->where(array('cajaCierre'=>null));
			$this->db->from('cajas');
			$query = $this->db->get();
			$result = $query->result_array();
			if(count($result) > 0){
				$result = $query->result_array();
				$venta['cajaId'] = $result[0]['cajaId'];
			} else {
				return false;
			}
			//-----------------------------------------------

			$this->db->trans_start();
			$oId = $data['oId'];
			//medios de pagos
			foreach ($data['medi'] as $m) {
				$medio = array(
					'oId'				=> $oId < 0 ? $idOrden : $oId,
					'medId'				=> $this->getIdMedio($m['medioCode']),
					'rcbImporte'		=> $m['medioImport'],
					'cajaId'			=> $venta['cajaId'],
					'rcbDesc1'			=> $m['medioDesc1'],
					'rcbDesc2'			=> $m['medioDesc2'],
					'rcbDesc3'			=> $m['medioDesc3']
				);

				if($this->db->insert('recibos', $medio) == false) {
					return false;
				}

				//Si es cuenta corriente registrar movieminto
				if($m['medioCode'] == 'CCT'){
					$ctacte = array(
						'cctepConcepto'			=> 'Venta: '.($oId < 0 ? $idOrden : $oId),
						'cctepRef'				=>	$oId < 0 ? $idOrden : $oId,
						'cctepTipo'				=>	'VN',
						'cctepDebe'				=>	$m['medioImport'],
						'cliId'					=> 	$data['clie']['id'],
						'usrId'					=>	$userdata[0]['usrId'],
						'cajaId'				=>  $venta['cajaId']
					);

					if($this->db->insert('cuentacorrientecliente', $ctacte) == false) {
						return false;
					}
				}
			}
			//Revisar esto , ojota!
			if($data['saldo'] == 0){
				//Actualizar orden de compra
				//$update = array('oEstado' => 'CO', 'oEsPlanReserva' => 0, 'oEsVenta' => 1);
				$update = array('oEstado' => 'FA', 'oEsPlanReserva' => 0, 'oEsVenta' => 1);
				if($this->db->update('orden', $update, array('oId'=>$oId)) == false) {
					return false;
				}

				$query = $this->db->get_where('stockreserva', array('refId' => $oId));
				foreach ($query->result_array() as $item) {
					$stock = array(
							'artId' 		=> $item['artId'],
							'stkCant'		=> $item['stkCant'] * -1,
							'stkOrigen'	=> 'VN',
							'refId'			=> $oId
						);

						if($this->db->insert('stockreserva', $stock) == false) {
							return false;
						}

						if($this->db->insert('stock', $stock) == false) {
							return false;
						}
				}
			}
			//----------------------------------
			$this->db->trans_complete();
			return $oId;
		}
	}

	function setSalePago($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{

			//verificar si hay cajas abiertas
			$userdata = $this->session->userdata('user_data');
			$this->db->select('*');
			$this->db->where(array('cajaCierre'=>null));
			$this->db->from('cajas');
			$query = $this->db->get();
			$result = $query->result_array();
			if(count($result) > 0){
				$result = $query->result_array();
				$venta['cajaId'] = $result[0]['cajaId'];
			} else {
				return false;
			}
			//-----------------------------------------------

			$this->db->trans_start();
			$oId = $data['oId'];
			//medios de pagos
			foreach ($data['medi'] as $m) {
				$medio = array(
					'oId'					=> $oId,
					'medId'				=> $m['id'],
					'rcbImporte'	=> $m['imp'],
					'cajaId'			=> $venta['cajaId']
				);

				if($this->db->insert('recibos', $medio) == false) {
					return false;
				}
			}
			if($data['saldo'] == 0){
				//Facturada
				//Actualizar orden de compra
				$update = array('oEstado' => 'FA');
				if($this->db->update('orden', $update, array('oId'=>$oId)) == false) {
					return false;
				}

				$query = $this->db->get_where('stockreserva', array('refId' => $oId));
				foreach ($query->result_array() as $item) {
					$stock = array(
							'artId' 		=> $item['artId'],
							'stkCant'		=> $item['stkCant'] * -1,
							'stkOrigen'	=> 'VN',
							'refId'			=> $oId
						);

						if($this->db->insert('stockreserva', $stock) == false) {
							return false;
						}

						if($this->db->insert('stock', $stock) == false) {
							return false;
						}
				}
			}
			//----------------------------------
			$this->db->trans_complete();
			return $oId;
		}
	}

	public function getTotalSaleMinorista($data = null){
		$response = array();
		$this->db->select('orden.*, clientes.*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha');
		$this->db->order_by('orden.oId','desc');
		$this->db->group_by('orden.oId');
		$this->db->where(array('oEsMayorista'=>0,'oEsPlanReserva'=>0));
		if($data['search']['value']!=''){
			$this->db->where('orden.oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('Concat(cliApellido, \' \', cliNombre)', $data['search']['value']);
		}
		$this->db->from('orden');
		$this->db->join('ordendetalle', 'ordendetalle.oId = orden.oId');
		$this->db->join('clientes', 'clientes.cliId = orden.cliId');
		$this->db->join('vendedores', 'vendedores.id = orden.venId');
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function getSaleMinorista ( $data = null){

		$this->db->select('orden.*, clientes.*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha, sum(ordendetalle.artCant * ordendetalle.artVenta) as venta, vendedores.nombre as vendedor');
		$this->db->order_by('orden.oId','desc');
		$this->db->group_by('orden.oId');
		$this->db->where(array('oEsMayorista'=>0,'oEsPlanReserva'=>0));
		if($data['search']['value']!=''){
			$this->db->where('orden.oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('Concat(cliApellido, \' \', cliNombre)', $data['search']['value']);
		}
		$this->db->limit($data['length'],$data['start']);
		$this->db->from('orden');
		$this->db->join('ordendetalle', 'ordendetalle.oId = orden.oId');
		$this->db->join('clientes', 'clientes.cliId = orden.cliId');
		$this->db->join('vendedores', 'vendedores.id = orden.venId');
		$query = $this->db->get();
		//var_dump($this->db->last_query()); 
		$result = array();
		foreach($query->result_array() as $item){
			//(SELECT medDescripcion FROM recibos as r join mediosdepago as m on m.medId = r.medId WHERE r.oId  = orden.oId Limit 1) as mp
			$this->db->select('medDescripcion');
			$this->db->from('recibos');
			$this->db->join('mediosdepago', 'mediosdepago.medId = recibos.medId');
			$this->db->where(array('recibos.oId'=>$item['oId']));
			$query = $this->db->get();
			$item['MP'] = $query->result_array();
			$result[] = $item;
		
		}
		return $result;
	}

	public function getTotalSaleMayorista($data = null){
		$response = array();
		$this->db->select('orden.*, clientes.*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha ');
		$this->db->order_by('oFecha','desc');
		$this->db->group_by('orden.oId');
		$this->db->where(array('oEsMayorista'=>1,'oEsPlanReserva'=>0));
		if($data['search']['value']!=''){
			$this->db->where('orden.oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('Concat(cliApellido, \' \', cliNombre)', $data['search']['value']);
		}
		$this->db->from('orden');
		$this->db->join('ordendetalle', 'ordendetalle.oId = orden.oId');
		$this->db->join('clientes', 'clientes.cliId = orden.cliId');
		$this->db->join('vendedores', 'vendedores.id = orden.venId');
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function getSaleMayorista( $data = null){

		$this->db->select('orden.*, clientes.*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha, sum(ordendetalle.artCant * ordendetalle.artVenta) as venta, vendedores.nombre as vendedor');
		$this->db->order_by('oFecha','desc');
		$this->db->group_by('orden.oId');
		$this->db->where(array('oEsMayorista'=>1,'oEsPlanReserva'=>0));
		if($data['search']['value']!=''){
			$this->db->where('orden.oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('Concat(cliApellido, \' \', cliNombre)', $data['search']['value']);
		}
		$this->db->limit($data['length'],$data['start']);
		$this->db->from('orden');
		$this->db->join('ordendetalle', 'ordendetalle.oId = orden.oId');
		$this->db->join('clientes', 'clientes.cliId = orden.cliId');
		$this->db->join('vendedores', 'vendedores.id = orden.venId');
		$query = $this->db->get();
		return $query->result_array();
	}


	public function getTotalReservaFiltered($data = null){
		$response = array();
		$this->db->select('*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha ');
		$this->db->order_by('oFecha','desc');
		$this->db->where(array('oEsPlanReserva'=>1));
		if($data['search']['value']!=''){
			$this->db->where('oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('Concat(cliApellido, \' \', cliNombre)', $data['search']['value']);
		}
		$this->db->from('orden');
		$this->db->join('clientes', 'clientes.cliId = orden.cliId');
		$this->db->join('vendedores', 'vendedores.id = orden.venId');
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function getReservaFiltered( $data = null){

		$this->db->select('*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha, (select IF(sum(rcbImporte) IS NULL, 0, sum(rcbImporte))  from recibos r where r.oId = orden.oId) as  pago, (select sum(artVenta * artCant) from ordendetalle d where d.oId = orden.oId) as total, vendedores.nombre as vendedor');
		$this->db->order_by('oFecha','desc');
		$this->db->where(array('oEsPlanReserva'=>1));
		if($data['search']['value']!=''){
			$this->db->where('oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('Concat(cliApellido, \' \', cliNombre)', $data['search']['value']);
		}
		$this->db->limit($data['length'],$data['start']);
		$this->db->from('orden');
		$this->db->join('clientes', 'clientes.cliId = orden.cliId');
		$this->db->join('vendedores', 'vendedores.id = orden.venId');
		$query = $this->db->get();
		return $query->result_array();
	}

	public function getSaleById($data){
		if($data['id']!=0){
			$this->db->where(array('oId'=>$data['id']));
			$query=$this->db->get('orden');
			$result['orden'] = $query->row_array();

			$this->db->where('cliId',$result['orden']['cliId']);
			$query=$this->db->get('clientes');
			$result['cliente'] = $query->row_array();

			$this->db->where('id',$result['orden']['venId']);
			$query=$this->db->get('vendedores');
			$result['vendedor'] = $query->row_array();

			$this->db->where('lpId',$result['orden']['lpId']);
			$query=$this->db->get('listadeprecios');
			$result['lista_de_precios'] = $query->row_array();

			$sql="select od.*, a.*,
			(SELECT r.rubDescripcion FROM rubros as r where r.rubId=a.subrId ) as rubro,
			(SELECT m.descripcion FROM marcaart  as m where a.marcaId=m.id ) as marca
			from ordendetalle as od LEFT OUTER JOIN articles as a ON od.artId=a.artId where oId='".$data['id']."';";

			$query=$this->db->query($sql);
			$result['orden_detalle'] = $query->result_array();
		
			//return $result;

			//Armar el html------------------------
			$fecha= date('d-m-y',strtotime($result['orden']['oFecha']));
			$fecha=explode('-',$fecha);
			$importe_total=0;
			$hora = date('H:i',strtotime($result['orden']['oFecha']));
			$limit_page=20;
			if(count($result['orden_detalle']) > 22){
				$pages=count($result['orden_detalle'])/$limit_page;
			} else {
				$pages=1;
			}

			//-------------------------------------------
			
			$html = '
			<table style="width:100%;  border-spacing: 5px; border-collapse: separate; color: #3c3c3c; page-break-after: avoid; border:2px solid #3c3c3c !important; margin:0px auto; border-radius: 10px; font-family: Source Sans Pro ,sans-serif;">
				<tr>
					<td width="50%" style="border-right:1px solid #3c3c3c !important;">
						<center>
							<img <img src="./assets/images/logoEmpresa.png" width="350px">
						</center>
						
						<p style="text-align:center; width:100%;  margin: 0px auto;">Fray Justo Santa Maria de Oro 489 </p>
						<p style="text-align:center; width:100%;  margin: 0px auto;">Tel. 496-3903 - Cel. 154514219 </p>
					</td>
					<td style="text-align: right" width="50%">
							<center><b style="font-size:25px;"> Remito Interno</b><br>
							<span style="font-size:10px;">Documento no válido como factura</span></center>
							<br>
							Fecha: <b>'.$fecha[0].'-'.$fecha[1].'-'.$fecha[2].' '.$hora.'</b><br>
							Número: <b>'.str_pad($data['id'], 8, "0", STR_PAD_LEFT).'</b><br>
							Vendedor: <b>'.$result['vendedor']['codigo'].'-'.$result['vendedor']['nombre'].'</b>
					</td>
				</tr>
				<tr>
					<td colspan=2 style="border-top:1px solid #3c3c3c !important;"><br>
						<table style="width:100%;">
							<tr>
								<td style="width:10%; padding-top:0px;"> Señor: </td>
								<td style="width:90% !important; border-bottom: 1px dotted #3c3c3c; padding-top:0px;font-size:14px; font-weight:bold;color:#000000;">'.$result['cliente']['cliNombre']." ".$result['cliente']['cliApellido'].'</td>
							</tr>
							<tr>
								<td style="width:10%; padding-top:0px;"> Domicilio:  </td>
								<td style="width:90%; border-bottom: 1px dotted #3c3c3c; padding-top:0px;">'.$result['cliente']['cliDomicilio'].'</td>
							</tr>
						</table><br>
					</td>
				</tr>
			</table>';
			
				$next_page=0;
				for( $i=0; $i<ceil($pages);$i++){

					$rows=count($result['orden_detalle']);
					$html.='<table style="width:100%;  border-spacing: 5px; border-collapse: separate; color: #3c3c3c; page-break-after: avoid; border:2px solid #3c3c3c !important; margin:0px auto; border-radius: 10px; font-family: Source Sans Pro ,sans-serif;">
						<tr>
							<td>
								<table style="width:100%;  border-collapse: collapse; border: 0px;">
								<tr style="border:1px solid #3c3c3c !important;text-align:center; font-size:15px; background-color: #D1CECD;">
								<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 5px ;">CANT.</td>
								<td style="width:65%; border-left: 2px solid #3c3c3c !important; text-align:left;border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding:  5px;">DETALLE</td>
								<td style="width:10%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding:  5px;">P.Unit.</td>
								<td style="width:15%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding:  5px;">TOTAL</td>
								</tr>';

									$total_art=count($result['orden_detalle']);

									$from=$next_page;

									$to=($i==0)?$next_page+19:$next_page+40;
									$next_page= $to;

									$row=0;

									for($j=$from;$j<=$to;$j++){

										if(!isset($result['orden_detalle'][$j])){
											break;
										}

										$item=$result['orden_detalle'][$j];

										//var_dump($result['orden_detalle'][$j]);
										//continue;
										$importe_total+= floatval($item['artVenta'] * $item['artCant']);
										$html.= '<tr style="border:1px solid #3c3c3c !important;text-align:center; font-size:15px;">';
										$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 5px ;">'.$item['artCant'].'</td>';
										$html.= '<td style="width:65%; border-left: 2px solid #3c3c3c !important; text-align:left;border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding:  5px;">'.$item['artDescripcion'].'</td>';
										$html.= '<td style="width:10%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding:  5px;">'.number_format($item['artVenta'], 2).'</td>';
										$html.= '<td style="width:15%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding:  5px;">'.number_format(($item['artVenta'] * $item['artCant']), 2).'</td>';
										$html.= '</tr>';
										$row++;
										if(!isset($result['orden_detalle'][$row])){
											break;
										}
									}

									for($j=$row+1;  $j<=(($i==0)?19:40);$j++){
										$html.= '<tr style="border:1px solid #3c3c3c !important;">';
											$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 15px;"> </td>';
											$html.= '<td style="width:65%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 0px;"> </td>';
											$html.= '<td style="width:10%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 0px;"> </td>';
											$html.= '<td style="width:15%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 0px;"> </td>';
											$html.= '</tr>';
									}
									$descuento = 0;
									if( $result['orden']['oDescuento'] > 0){
											$html.= '<tr style="border:1px solid #3c3c3c !important;">';
											$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 15px;"> </td>';
											$html.= '<td style="width:65%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 5px;"> Descuento</td>';
											$html.= '<td style="width:10%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 0px;"> </td>';
											$html.= '<td style="width:15%; border-left: 2px solid #3c3c3c !important; border-bottom: 1px dotted #3c3c3c !important; margin:0px; padding: 5px;"> - '.number_format($result['orden']['oDescuento'],2).'</td>';
											$html.= '</tr>';
											$descuento = $result['orden']['oDescuento'];
									}
								$html .= '</table>
							</td>
						</tr>
						</table><br>';
				}
				
				$html.='<table style="width:100%;  border-spacing: 5px; border-collapse: separate; color: #3c3c3c; page-break-after: avoid; border:2px solid #3c3c3c !important; margin:0px auto; border-radius: 10px; font-family: Source Sans Pro ,sans-serif;">
					<tr>
						<td style="text-align:left; padding: 0px;">
							<b>Observación:</b> 
						</td>
					</tr>
				</table><br>';

				$html.='<table style="width:100%;  border-spacing: 5px; border-collapse: separate; color: #3c3c3c; page-break-after: avoid; border:2px solid #3c3c3c !important; margin:0px auto; border-radius: 10px; font-family: Source Sans Pro ,sans-serif;">
				<tr>
					<td style="font-size:30px; text-align:right; padding: 0px;">
						Total $
					</td>
					<td style="border:2px solid #3c3c3c !important; margin:0px auto; padding: 0px; text-align:right; font-size:20px; background-color: #D1CECD;">
					 '.number_format($importe_total -  $descuento, 2).'
					</td>
				</tr>
			</table>';
			
			//-------------------------------------------
			/*
			$html = '<!DOCTYPE html PUBLIC >
			<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<title></title>
			</head>
			<body>
			<table style="width:100%;  border-spacing: 5px;    border-collapse: separate; color: #72324a; page-break-after: avoid;">
				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;  text-align:center ">
						<h1 style="font-size:30px !important; text-align:center; width:100%; padding-botton:0px;     margin: 0px auto;">
							ADOLFO FERNANDEZ
							<br><span style="width:100%; text-align:right; padding-top:0px; font-size:13px !important;">Soluciones Electronicas</span>
						</h1>
						<p style="text-align:center; width:100%;  margin: 0px auto;">Fray Justo Santa Maria de Oro 489</p>
						<p style="text-align:center; width:100%; margin: 0px auto;">C.P. 5442 Caucete - San Juan - Tel. 496-3903 - Cel. 154514219</p>
					</td>
				</tr>
				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;  text-align:left; padding:5px;">
						<table style="width:100%;">
							<tr style="text-align:center; font-size:18px; font-weight:bold; color:#000000;">
								<td style="width:10% !important; border:2px solid #72324a !important; padding-top:5px; height:10px;">'.$fecha[0].'</td>
								<td style="width:10% !important; border:2px solid #72324a !important; padding-top:5px; height:10px">'.$fecha[1].'</td>
								<td style="width:10% !important; border:2px solid #72324a !important; padding-top:5px; height:10px">'.$fecha[2].'</td>
								<td style="width:70% !important; border:2px solid #72324a !important; padding-top:5px; height:10px; font-size:16px;">
									<span style="width:100%; font-size:13px;">NO VALIDO COMO FACTURA</span> <br>
									PRESUPUESTO VALIDO POR 15 DIAS
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;  text-align:left; padding:5px;">
						<table style="width:100%;">
							<tr>
								<td style="width:10%; padding-top:0px;">  Se&ntilde;or/a  :  </td>
								<td style="width:90% !important; border-bottom: 1px dotted #72324a; padding-top:0px;font-size:14px; font-weight:bold;color:#000000;">'.$result['cliente']['cliNombre']." ".$result['cliente']['cliApellido'].' - Ord.: '.$result['orden']['oId'].'</td>
							</tr>
							<tr>
								<td style="width:10%; padding-top:0px;"> Domicilio:  </td>
								<td style="width:90%; border-bottom: 1px dotted #72324a; padding-top:0px;">'.$result['cliente']['cliDomicilio'].'</td>
							</tr>
						</table>
					</td>
				</tr>
				</table>';

				$arrFrom = array("ñ","Ñ");
				$arrTo = array("&#241;","&#209;");

				$next_page=0;
				for( $i=0; $i<ceil($pages);$i++){					
					
					$rows=count($result['orden_detalle']);
					$html.='<table style="width:100%;  border-spacing: 5px;    border-collapse: separate; color: #72324a; page-break-after: avoid;">
						<tr style="border:2px solid #72324a !important; margin:0px auto;">
							<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;">
								<table style="width:100%;  border-collapse: collapse; border: 0px;">';
									$total_art=count($result['orden_detalle']);	

									$from=$next_page;

									$to=($i==0)?$next_page+22:$next_page+40;
									$next_page= $to;
									
									$row=0;
									
									for($j=$from;$j<$to;$j++){
										
										if(!isset($result['orden_detalle'][$j])){
											break;
										}
										
										$item=$result['orden_detalle'][$j];

										//var_dump($result['orden_detalle'][$j]);
										//continue;
										$importe_total+= floatval($item['artVenta'] * $item['artCant']);
										$html.= '<tr style="border:1px solid #72324a !important;text-align:center; font-size:15px;">';
										$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 5px ;">'.$item['artCant'].'</td>';
										$html.= '<td style="width:65%; border-left: 2px solid #72324a !important; text-align:left;border-bottom: 1px dotted #72324a !important; margin:0px; padding:  5px;">'.str_replace($arrFrom, $arrTo, $item['artDescripcion']).'</td>';
										$html.= '<td style="width:10%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding:  5px;">'.number_format($item['artVenta'], 2).'</td>';
										$html.= '<td style="width:15%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding:  5px;">'.number_format(($item['artVenta'] * $item['artCant']), 2).'</td>';
										$html.= '</tr>';
										$row++;
										if(!isset($result['orden_detalle'][$row])){											
											break;
										}
									}
								
									if($i==0){
										$tope=22;
									}else{
										$tope=30;
									}
									for($k=$row; $k<$tope;$k++){
										$html.= '<tr style="border:1px solid #72324a !important;">';
											$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 15px;"></td>';
											$html.= '<td style="width:65%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 0px;"></td>';
											$html.= '<td style="width:10%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 0px;"></td>';
											$html.= '<td style="width:15%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 0px;"></td>';
											$html.= '</tr>';
									}
								$html .= '</table>
							</td>
						</tr>
						</table><br>';
				}
				
				$html.='<table style="width:100%;  border-spacing: 5px;    border-collapse: separate; color: #72324a; page-break-after: avoid;">				
				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td style="font-size:20px; text-align:left; padding: 0px;">
						'.($result['orden']['oDescuento'] > 0 ? 'Descuento $ '.$result['orden']['oDescuento'] : '').'
					</td>
					<td style="font-size:30px; text-align:right; padding: 0px;"> Total $</td>
					<td colspan="1" style="border:2px solid #72324a !important; margin:0px auto; padding: 0px;border-radius: 10px; text-align:right; font-size:20px; color:#000000;">
					 $ '.number_format($importe_total - $result['orden']['oDescuento'] , 2).'
					</td>
				</tr>
			</table></body></html>';*/
			//-------------------------------------
			//die($html);			
			//se incluye la libreria de dompdf
			require_once("assets/plugin/HTMLtoPDF/dompdf/dompdf_config.inc.php");
			//se crea una nueva instancia al DOMPDF
			$dompdf = new DOMPDF();
			//se carga el codigo html
			$dompdf->load_html(utf8_decode($html));
			//aumentamos memoria del servidor si es necesario
			set_time_limit(600);
			ini_set("memory_limit","600M");
			//Tamaño de la página y orientación
			$dompdf->set_paper('A4','portrait');
			//$dompdf->set_option('isHtml5ParserEnabled', TRUE);

			//lanzamos a render
			$dompdf->render();
			//guardamos a PDF
			//$dompdf->stream("TrabajosPedndientes.pdf");
			$time = time();
			$file_name=$data['id']."_".$time.".pdf";
			$output = $dompdf->output();
			file_put_contents('assets/reports/orders_minorista/'.$file_name, $output);

			//Eliminar archivos viejos ---------------
			$dir = opendir('assets/reports/');
			while($f = readdir($dir))
			{
				if((time()-filemtime('assets/reports/'.$f) > 3600*24*1) and !(is_dir('assets/reports/'.$f)))
				unlink('assets/reports/'.$f);
			}
			closedir($dir);
			//----------------------------------------
			return $file_name;
		}
	}



	public function getReservaDetailHTML($data){

		if($data['id']!=0){
			$this->db->where(array('oId'=>$data['id']));
			$query=$this->db->get('orden');
			$result['orden'] = $query->row_array();

			$this->db->where('cliId',$result['orden']['cliId']);
			$query=$this->db->get('clientes');
			$result['cliente'] = $query->row_array();

			$this->db->where('id',$result['orden']['venId']);
			$query=$this->db->get('vendedores');
			$result['vendedor'] = $query->row_array();

			$this->db->where('lpId',$result['orden']['lpId']);
			$query=$this->db->get('listadeprecios');
			$result['lista_de_precios'] = $query->row_array();

		
			$this->db->select("od.*");
			$this->db->from('ordendetalle od');
			$this->db->join('articles a','a.artId=od.artId', 'left outer');
			$this->db->where('oId',$data['id']);
			$query = $this->db->get();
			$detalleCompra=($query->num_rows()>0)?$query->result_array():array();
			$result['orden_detalle']=$detalleCompra;

			//return $result;

			//Armar el html------------------------
			$fecha= date('d-m-y',strtotime($result['orden']['oFecha']));
			$fecha=explode('-',$fecha);
			$importe_total=0;

			$html = '
			<table style="width:100%;  border-spacing: 10px;    border-collapse: separate; color: #72324a; page-break-inside: avoid;">
				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;  text-align:center ">
						<h1 style="font-size:55px !important; text-align:center; width:100%; padding-botton:0px;">
							ADOLFO FERNANDEZ
							<br><span style="width:100%; text-align:right; padding-top:0px; font-size:15px !important;">Soluciones Electronicas</span>
						</h1>
						<p style="text-align:center; width:100%;">Fray Justo Santa Maria de Oro 489</p>
						<p style="text-align:center; width:100%;">C.P. 5442 Caucete - San Juan - Tel. 496-3903 - Cel. 154514219</p>
					</td>
				</tr>
				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;  text-align:left; padding:5px;">
						<table style="width:100%;">
							<tr style="text-align:center; font-size:20px; font-weight:bold; color:#000000;">
								<td style="width:10% !important; border:2px solid #72324a !important; padding-top:10px; height:30px;">'.$fecha[0].'</td>
								<td style="width:10% !important; border:2px solid #72324a !important; padding-top:10px; height:30px">'.$fecha[1].'</td>
								<td style="width:10% !important; border:2px solid #72324a !important; padding-top:10px; height:30px">'.$fecha[2].'</td>
								<td style="width:70% !important; border:2px solid #72324a !important; padding-top:10px; height:30px;font-size:25px;">
									<span style="width:100%; font-size:18px;">NO VALIDO COMO FACTURA</span> <br>
									PRESUPUESTO VALIDO POR 15 DIAS
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;  text-align:left; padding:5px;">
						<table style="width:100%;">
							<tr>
								<td style="width:10%; padding-top:20px;"> Señor: </td>
								<td style="width:90% !important; border-bottom: 1px dotted #72324a; padding-top:10px;font-size:20px; font-weight:bold;color:#000000;">'.$result['cliente']['cliNombre']." ".$result['cliente']['cliApellido'].'</td>
							</tr>
							<tr>
								<td style="width:10%; padding-top:20px;"> Domicilio:  </td>
								<td style="width:90%; border-bottom: 1px dotted #72324a; padding-top:10px;">'.$result['cliente']['cliDomicilio'].'</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table style="width:100%;  border-spacing: 10px;    border-collapse: separate; color: #72324a; page-break-inside: avoid;">
			
				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;">
						<table style="width:100%;  border-collapse: collapse; border: 0px;">';
							$total_art=count($result['orden_detalle']);
							foreach($result['orden_detalle'] as $item){
								$importe_total+= floatval($item['artVenta']);
								$html.= '<tr style="border:1px solid #72324a !important;text-align:center; font-size:20px;">';
								$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 10px ;">'.$item['artCant'].'</td>';
								$html.= '<td style="width:75%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding:  10px;">'.$item['artDescripcion'].'</td>';
								$html.= '<td style="width:15%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding:  10px;">'.$item['artVenta'].'</td>';
								$html.= '</tr>';
							}

							/*for($i=($total_art);  $i<=12; $i++){
								$html.= '<tr style="border:1px solid #72324a !important;">';
									$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 20px;"> </td>';
									$html.= '<td style="width:75%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 20px;"> </td>';
									$html.= '<td style="width:15%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 20px;"> </td>';
									$html.= '</tr>';
							}*/
						$html .= '</table>
					</td>
				</tr>

				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan="2" style="font-size:40px; text-align:right; padding: 10px;">
						$
					</td>
					<td colspan="1" style="border:2px solid #72324a !important; margin:0px auto; padding: 10px;border-radius: 10px; text-align:right; font-size:23px; color:#000000;">
					 '.number_format($importe_total, 2).'
					</td>
				</tr>
			</table>
				';

			return $html;
		}
		return false;
	}

		/*
	public function getTotalSales($data = null){
		$response = array();
		$this->db->select('*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha ');
		$this->db->order_by('oId','desc');
		$this->db->where(array('oEsMayorista'=>0,'oEsPlanReserva'=>0));
		if(isset($data['search']) && $data['search']['value']!=''){
			$this->db->where('oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('Concat(cliApellido, \' \', cliNombre)', $data['search']['value']);
			$this->db->limit($data['length'],$data['start']);
		}
		$this->db->from('orden');
		$this->db->join('clientes', 'clientes.cliId = orden.cliId');
		$query = $this->db->get();
		return $query->num_rows();
	}
	*/

	public function getSales ( $data = null){

		$this->db->select('*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha');
		$this->db->order_by('oId','desc');
		/*
		$this->db->where(array('oEsMayorista'=>0,'oEsPlanReserva'=>0));
		if(isset($data['search']) && $data['search']['value']!=''){
			$this->db->where('oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('Concat(cliApellido, \' \', cliNombre)', $data['search']['value']);
		}
		*/
		$this->db->limit(50,0);
		$this->db->from('orden');
		$this->db->join('clientes', 'clientes.cliId = orden.cliId');
		$query = $this->db->get();
		return $query->result_array();
	}

	public function getSaleByIdPrint($data){
		if($data['id']!=0){
			$this->db->where(array('oId'=>$data['id']));
			$query=$this->db->get('orden');
			$result['orden'] = $query->row_array();

			$this->db->where('cliId',$result['orden']['cliId']);
			$query=$this->db->get('clientes');
			$result['cliente'] = $query->row_array();

			$this->db->where('id',$result['orden']['venId']);
			$query=$this->db->get('vendedores');
			$result['vendedor'] = $query->row_array();

			$this->db->where('lpId',$result['orden']['lpId']);
			$query=$this->db->get('listadeprecios');
			$result['lista_de_precios'] = $query->row_array();

			$sql="select od.*, a.*,
			(SELECT r.rubDescripcion FROM rubros as r where r.rubId=a.subrId ) as rubro,
			(SELECT m.descripcion FROM marcaart  as m where a.marcaId=m.id ) as marca
			from ordendetalle as od LEFT OUTER JOIN articles as a ON od.artId=a.artId where oId='".$data['id']."';";

			$query=$this->db->query($sql);
			$result['orden_detalle'] = $query->result_array();
		
			//return $result;

			//Armar el html------------------------
			$fecha= date('d-m-y',strtotime($result['orden']['oFecha']));
			$fecha=explode('-',$fecha);
			$importe_total=0;
			$limit_page=20;
			if(count($result['orden_detalle']) > 22){
				$pages=count($result['orden_detalle'])/$limit_page;
			} else {
				$pages=1;
			}
			
			$html = '<!DOCTYPE html PUBLIC >
			<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<title></title>
			</head>
			<body>
			<table style="width:100%;  border-spacing: 5px;    border-collapse: separate; color: #72324a; page-break-after: avoid;">
				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;  text-align:center ">
						<h1 style="font-size:30px !important; text-align:center; width:100%; padding-botton:0px;     margin: 0px auto;">
							ADOLFO FERNANDEZ
							<br><span style="width:100%; text-align:right; padding-top:0px; font-size:13px !important;">Soluciones Electronicas</span>
						</h1>
						<p style="text-align:center; width:100%;  margin: 0px auto;">Fray Justo Santa Maria de Oro 489</p>
						<p style="text-align:center; width:100%; margin: 0px auto;">C.P. 5442 Caucete - San Juan - Tel. 496-3903 - Cel. 154514219</p>
					</td>
				</tr>
				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;  text-align:left; padding:5px;">
						<table style="width:100%;">
							<tr style="text-align:center; font-size:18px; font-weight:bold; color:#000000;">
								<td style="width:10% !important; border:2px solid #72324a !important; padding-top:5px; height:10px;">'.$fecha[0].'</td>
								<td style="width:10% !important; border:2px solid #72324a !important; padding-top:5px; height:10px">'.$fecha[1].'</td>
								<td style="width:10% !important; border:2px solid #72324a !important; padding-top:5px; height:10px">'.$fecha[2].'</td>
								<td style="width:70% !important; border:2px solid #72324a !important; padding-top:5px; height:10px; font-size:16px;">
									<span style="width:100%; font-size:13px;">NO VALIDO COMO FACTURA</span> <br>
									PRESUPUESTO VALIDO POR 15 DIAS
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;  text-align:left; padding:5px;">
						<table style="width:100%;">
							<tr>
								<td style="width:10%; padding-top:0px;"> Señor: </td>
								<td style="width:90% !important; border-bottom: 1px dotted #72324a; padding-top:0px;font-size:14px; font-weight:bold;color:#000000;">'.$result['cliente']['cliNombre']." ".$result['cliente']['cliApellido'].'</td>
							</tr>
							<tr>
								<td style="width:10%; padding-top:0px;"> Domicilio:  </td>
								<td style="width:90%; border-bottom: 1px dotted #72324a; padding-top:0px;">'.$result['cliente']['cliDomicilio'].'</td>
							</tr>
						</table>
					</td>
				</tr>
				</table>';
				$next_page=0;
				for( $i=0; $i<ceil($pages);$i++){					
					
					$rows=count($result['orden_detalle']);
					$html.='<table style="width:100%;  border-spacing: 5px;    border-collapse: separate; color: #72324a; page-break-after: avoid;">
						<tr style="border:2px solid #72324a !important; margin:0px auto;">
							<td colspan=3 style="border:2px solid #72324a !important; margin:0px auto; border-radius: 10px;">
								<table style="width:100%;  border-collapse: collapse; border: 0px;">';
									$total_art=count($result['orden_detalle']);	

									$from=$next_page;

									$to=($i==0)?$next_page+22:$next_page+40;
									$next_page= $to;
									
									$row=0;
									
									for($j=$from;$j<$to;$j++){
										
										if(!isset($result['orden_detalle'][$j])){
											break;
										}
										
										$item=$result['orden_detalle'][$j];

										//var_dump($result['orden_detalle'][$j]);
										//continue;
										$importe_total+= floatval($item['artVenta'] * $item['artCant']);
										$html.= '<tr style="border:1px solid #72324a !important;text-align:center; font-size:15px;">';
										$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 5px ;">'.$item['artCant'].'</td>';
										$html.= '<td style="width:65%; border-left: 2px solid #72324a !important; text-align:left;border-bottom: 1px dotted #72324a !important; margin:0px; padding:  5px;">'.$item['artDescripcion'].'</td>';
										$html.= '<td style="width:10%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding:  5px;">'.number_format($item['artVenta'], 2).'</td>';
										$html.= '<td style="width:15%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding:  5px;">'.number_format(($item['artVenta'] * $item['artCant']), 2).'</td>';
										$html.= '</tr>';
										$row++;
										if(!isset($result['orden_detalle'][$row])){											
											break;
										}
									}
								
									if($i==0){
										$tope=22;
									}else{
										$tope=30;
									}
									for($k=$row; $k<$tope;$k++){
										$html.= '<tr style="border:1px solid #72324a !important;">';
											$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 15px;"></td>';
											$html.= '<td style="width:65%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 0px;"></td>';
											$html.= '<td style="width:10%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 0px;"></td>';
											$html.= '<td style="width:15%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 0px;"></td>';
											$html.= '</tr>';
									}
								$html .= '</table>
							</td>
						</tr>
						</table><br>';
				}
				
				$html.='<table style="width:100%;  border-spacing: 5px;    border-collapse: separate; color: #72324a; page-break-after: avoid;">				
				<tr style="border:2px solid #72324a !important; margin:0px auto;">
					<td colspan="2" style="font-size:30px; text-align:right; padding: 0px;">
						$
					</td>
					<td colspan="1" style="border:2px solid #72324a !important; margin:0px auto; padding: 0px;border-radius: 10px; text-align:right; font-size:20px; color:#000000;">
					 '.number_format($importe_total, 2).'
					</td>
				</tr>
			</table></body></html>';
			//-------------------------------------
			//die($html);			
			//se incluye la libreria de dompdf
			require_once("assets/plugin/HTMLtoPDF/dompdf/dompdf_config.inc.php");
			//se crea una nueva instancia al DOMPDF
			$dompdf = new DOMPDF();
			//se carga el codigo html
			$dompdf->load_html(utf8_decode($html));
			//aumentamos memoria del servidor si es necesario
			set_time_limit(600);
			ini_set("memory_limit","600M");
			//Tamaño de la página y orientación
			$dompdf->set_paper('A4','portrait');
			//$dompdf->set_option('isHtml5ParserEnabled', TRUE);

			//lanzamos a render
			$dompdf->render();
			//guardamos a PDF
			//$dompdf->stream("TrabajosPedndientes.pdf");
			$file_name=$data['id'].".pdf";
			$output = $dompdf->output();
			file_put_contents('assets/reports/orders_minorista/'.$file_name, $output);

			//Eliminar archivos viejos ---------------
			$dir = opendir('assets/reports/');
			while($f = readdir($dir))
			{
				if((time()-filemtime('assets/reports/'.$f) > 3600*24*1) and !(is_dir('assets/reports/'.$f)))
				unlink('assets/reports/'.$f);
			}
			closedir($dir);
			//----------------------------------------
			return $file_name;
		}
	}
}

?>
