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

			$venta = array(
				'lpId'					=>	$data['lpr']['id'],
				'lpPorcentaje'	=> 	$data['lpr']['por'],
				'venId'					=>	$data['vend']['id'],
				'cliId'					=>	$data['clie']['id'],
				'oDescuento'		=> 	$data['des'],
				'oEsPresupuesto'=>	$data['esPre'] == 1 ? 1 : 0,
				'oEsVenta'			=> 	$data['esPre'] == 1 ? 0 : 1,
				'oEsPlanReserva'=>	0,
				'oEsMayorista'	=> 	0
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
			if($this->db->insert('orden', $venta) == false) {
				$this->db->trans_complete();
				return false;
			}else {
				$idOrden = $this->db->insert_id();

				//Registrar Detalle
				foreach ($data['det'] as $o) {
					$insert = array(
							'oId' 					=> $idOrden,
							'artId' 				=> $o['artId'],
							'artCode' 			=> $o['artCode'],
							'artDescripcion'=> $o['artDescripcion'],
							'artCosto'			=> $o['artCosto'],
							'artVenta'			=> $o['artventa'],
							'artVentaSD'		=> $o['artventaSD'],
							'artCant'				=> $o['cant']
						);

					if($this->db->insert('ordendetalle', $insert) == false) {
						return false;
					}
					//--------------------------------

					//Si no es presupuesto, modificar stock y registrar pagos
					if($data['esPre'] == 0){
							if($o['actualizaStock'] == 1){
								//Actualizar stock, insertar en tabla stock
								$stock = array(
										'artId' 		=> $o['artId'],
										'stkCant'		=> $o['cant'] * -1,
										'stkOrigen'	=> 'VN',
										'refId'			=> $idOrden
									);

								if($this->db->insert('stock', $stock) == false) {
									return false;
								}
							}
					}
					//----------------------------------

					//medios de pagos
					if($data['esPre'] == 0){
						foreach ($data['medi'] as $m) {
							$medio = array(
								'oId'					=> $idOrden,
								'medId'				=> $m['id'],
								'rcbImporte'	=> $m['imp']
							);

							if($this->db->insert('recibos', $medio) == false) {
								return false;
							}

							//Si es cuenta corriente registrar movieminto
							if($m['id'] == 7){
								$ctacte = array(
									'cctepConcepto'	=>'Venta: '.$idOrden ,
									'cctepRef'			=>	$idOrden,
									'cctepTipo'			=>	'VN',
									'cctepDebe'			=>	$m['imp'],
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
				return $idOrden;
			}
		}
	}

	function setSaleMayorista($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{

			$venta = array(
				'lpId'					=>	$data['lpr']['id'],
				'lpPorcentaje'	=> 	$data['lpr']['por'],
				'venId'					=>	$data['vend']['id'],
				'cliId'					=>	$data['clie']['id'],
				'oDescuento'		=> 	$data['des'],
				'oEsPresupuesto'=>	$data['esPre'] == 1 ? 1 : 0,
				'oEsVenta'			=> 	$data['esPre'] == 1 ? 0 : 1,
				'oEsPlanReserva'=>	0,
				'oEsMayorista'	=> 	1
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
			if($this->db->insert('orden', $venta) == false) {
				$this->db->trans_complete();
				return false;
			}else {
				$idOrden = $this->db->insert_id();

				//Registrar Detalle
				foreach ($data['det'] as $o) {
					$insert = array(
							'oId' 					=> $idOrden,
							'artId' 				=> $o['artId'],
							'artCode' 			=> $o['artCode'],
							'artDescripcion'=> $o['artDescripcion'],
							'artCosto'			=> $o['artCosto'],
							'artVenta'			=> $o['artventa'],
							'artVentaSD'		=> $o['artventaSD'],
							'artCant'				=> $o['cant']
						);

					if($this->db->insert('ordendetalle', $insert) == false) {
						return false;
					}
					//--------------------------------

					//Si no es presupuesto, modificar stock y registrar pagos
					if($data['esPre'] == 0){
							if($o['actualizaStock'] == 1){
								//Actualizar stock, insertar en tabla stock
								$stock = array(
										'artId' 		=> $o['artId'],
										'stkCant'		=> $o['cant'] * -1,
										'stkOrigen'	=> 'VN',
										'refId'			=> $idOrden
									);

								if($this->db->insert('stock', $stock) == false) {
									return false;
								}
							}
					}
					//----------------------------------

					//medios de pagos
					if($data['esPre'] == 0){
						foreach ($data['medi'] as $m) {
							$medio = array(
								'oId'					=> $idOrden,
								'medId'				=> $m['id'],
								'rcbImporte'	=> $m['imp']
							);

							if($this->db->insert('recibos', $medio) == false) {
								return false;
							}

							//Si es cuenta corriente registrar movieminto
							if($m['id'] == 7){
								$ctacte = array(
									'cctepConcepto'	=>'Venta: '.$idOrden ,
									'cctepRef'			=>	$idOrden,
									'cctepTipo'			=>	'VN',
									'cctepDebe'			=>	$m['imp'],
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
				return $idOrden;
			}
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
				'lpPorcentaje'	=> 	$data['lpr']['por'],
				'venId'					=>	$data['vend']['id'],
				'cliId'					=>	$data['clie']['id'],
				'oDescuento'		=> 	$data['des'],
				'oEsPresupuesto'=>	0,
				'oEsVenta'			=> 	0,
				'oEsPlanReserva'=>	1,
				'oEsMayorista'	=> 	0
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
							'artId' 				=> $o['artId'],
							'artCode' 			=> $o['artCode'],
							'artDescripcion'=> $o['artDescripcion'],
							'artCosto'			=> $o['artCosto'],
							'artVenta'			=> $o['artventa'],
							'artVentaSD'		=> $o['artventaSD'],
							'artCant'				=> $o['cant']
						);

					if($this->db->insert('ordendetalle', $insert) == false) {
						return false;
					}
					//--------------------------------

					//Si no es presupuesto, modificar stock y registrar pagos
					if($o['actualizaStock'] == 1){
						//Actualizar stock, insertar en tabla stock
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
					//----------------------------------

					//medios de pagos
					if($data['esPre'] == 0){
						foreach ($data['medi'] as $m) {
							$medio = array(
								'oId'					=> $idOrden,
								'medId'				=> $m['id'],
								'rcbImporte'	=> $m['imp']
							);

							if($this->db->insert('recibos', $medio) == false) {
								return false;
							}

							//Si es cuenta corriente registrar movieminto
							if($m['id'] == 7){
								$ctacte = array(
									'cctepConcepto'	=>'Venta: '.$idOrden ,
									'cctepRef'			=>	$idOrden,
									'cctepTipo'			=>	'VN',
									'cctepDebe'			=>	$m['imp'],
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
				return $idOrden;
			}
		}
	}

	public function getTotalSaleMinorista($data = null){
		$response = array();
		$this->db->select('*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha ');
		$this->db->order_by('oId','desc');
		$this->db->where(array('oEsMayorista'=>0,'oEsPlanReserva'=>0));
		if($data['search']['value']!=''){
			$this->db->where('oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->limit($data['length'],$data['start']);
		}
		$query = $this->db->get('orden');
		return $query->num_rows();
	}

	public function getSaleMinorista ( $data = null){

		$this->db->select('*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha');
		$this->db->order_by('oId','desc');
		$this->db->where(array('oEsMayorista'=>0,'oEsPlanReserva'=>0));
		if($data['search']['value']!=''){
			$this->db->where('oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
		}
		$this->db->limit($data['length'],$data['start']);
		$query = $this->db->get('orden');
		return $query->result_array();
	}

	public function getTotalSaleMayorista($data = null){
		$response = array();
		$this->db->select('*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha ');
		$this->db->order_by('oFecha','desc');
		$this->db->where(array('oEsMayorista'=>1,'oEsPlanReserva'=>0));
		if($data['search']['value']!=''){
			$this->db->where('oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->limit($data['length'],$data['start']);
		}
		$query = $this->db->get('orden');
		return $query->num_rows();
	}

	public function getSaleMayorista( $data = null){

		$this->db->select('*,DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i") as fecha ');
		$this->db->order_by('oFecha','desc');
		$this->db->where(array('oEsMayorista'=>1,'oEsPlanReserva'=>0));
		if($data['search']['value']!=''){
			$this->db->where('oId',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(oFecha, "%d-%m-%Y %H:%i")',$data['search']['value']);
		}
		$this->db->limit($data['length'],$data['start']);
		$query = $this->db->get('orden');
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
			from ordendetalle as od INNER JOIN articles as a ON od.artId=a.artId where oId='".$data['id']."';";

			$query=$this->db->query($sql);
			$result['orden_detalle'] = $query->result_array();

			//return $result;

			//Armar el html------------------------
			$fecha= date('d-m-y',strtotime($result['orden']['oFecha']));
			$fecha=explode('-',$fecha);
			$importe_total=0;

			$html = '
			<table style="width:80%;  border-spacing: 10px;    border-collapse: separate; color: #72324a;">
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

							for($i=($total_art);  $i<=12; $i++){
								$html.= '<tr style="border:1px solid #72324a !important;">';
									$html.= '<td style="width:10%; border-left: 0px !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 20px;"> </td>';
									$html.= '<td style="width:75%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 20px;"> </td>';
									$html.= '<td style="width:15%; border-left: 2px solid #72324a !important; border-bottom: 1px dotted #72324a !important; margin:0px; padding: 20px;"> </td>';
									$html.= '</tr>';
							}
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
			//-------------------------------------

			//se incluye la libreria de dompdf
			require_once("assets/plugin/HTMLtoPDF/dompdf/dompdf_config.inc.php");
			//se crea una nueva instancia al DOMPDF
			$dompdf = new DOMPDF();
			//se carga el codigo html
			$dompdf->load_html(utf8_decode($html));
			//aumentamos memoria del servidor si es necesario
			ini_set("memory_limit","300M");
			//Tamaño de la página y orientación
			$dompdf->set_paper('a3','portrait');
			//lanzamos a render
			$dompdf->render();
			//guardamos a PDF
			//$dompdf->stream("TrabajosPedndientes.pdf");
			$output = $dompdf->output();
			file_put_contents('assets/reports/orders_minorista/'.$data['id'].'.pdf', $output);

			//Eliminar archivos viejos ---------------
			$dir = opendir('assets/reports/');
			while($f = readdir($dir))
			{
				if((time()-filemtime('assets/reports/'.$f) > 3600*24*1) and !(is_dir('assets/reports/'.$f)))
				unlink('assets/reports/'.$f);
			}
			closedir($dir);
			//----------------------------------------
			return $data['id'].'.pdf';
		}
	}


}
	/*
	function getView($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$response = array();
			//Siempre preguntar si esta abierta la caja (para las opciones 1 y 2)
			//para el usuario logueado
			$userdata = $this->session->userdata('user_data');

			//verificar si hay cajas abiertas
			$this->db->select('*');
			$this->db->where(array('cajaCierre'=>null, 'usrId' => $userdata[0]['usrId']));
			$this->db->from('cajas');
			$query = $this->db->get();
			$result = $query->result_array();
			if(count($result) > 0){
				$result = $query->result_array();
				$response['cajaId'] = $result[0]['cajaId'];
				$caja = $result[0];
			} else {
				$response['cajaId'] = -1;
				$response['caja'] = null;
			}

			switch ($data['id']) {
				case '1':
					$query = $this->db->get('configuracion');
					if ($query->num_rows() != 0)
					{
						$configuration = $query->result_array();
						$response['validez'] = $configuration[0];
					}
					$response['ordenes'] = array();

					break;

				case '2':
					$response['ventas'] = array();
					break;

				case '3':
					if($response['cajaId'] != -1){
						$response['caja'] = $caja;
						//calcular ventas
						$this->db->select('sum(ventasdetalle.artFinal * ventasdetalle.venCant) as suma', false);
						$this->db->from('ventasdetalle');
						$this->db->join('ventas', 'ventas.venId = ventasdetalle.venId');
						$this->db->where(array('ventas.cajaId'=>$response['cajaId'], 'ventas.venEstado' => 'AC'));
						$query = $this->db->get();
						$response['caja']['cajaImpVentas'] = $query->row()->suma == null ? '0.00' : $query->row()->suma;

						$query = $this->db->query('select r.medId, m.medDescripcion, sum(r.rcbImporte) as importe from recibos as r
												  join ventas as v on v.venId = r.venId
												  join mediosdepago as m on m.medId = r.medId
												  where v.cajaId = '.$response['cajaId'].'
												  GROUP BY r.medId');

						$response['caja']['medios'] = $query->result_array();

					}
					$response['user'] = $userdata[0];
					break;
			}

			return $response;
		}
	}

	function getTotalVentas($data=null){
		$response = array();
		//Siempre preguntar si esta abierta la caja (para las opciones 1 y 2)
		//para el usuario logueado
		$userdata = $this->session->userdata('user_data');

		//verificar si hay cajas abiertas
		$this->db->select('*');
		$this->db->where(array('cajaCierre'=>null, 'usrId' => $userdata[0]['usrId']));
		$this->db->from('cajas');
		$query = $this->db->get();
		$result = $query->result_array();
		if(count($result) > 0){
			$result = $query->result_array();
			$response['cajaId'] = $result[0]['cajaId'];
			$caja = $result[0];
		} else {
			$response['cajaId'] = -1;
			$response['caja'] = null;
		}


		$this->db->order_by('venFecha', 'desc');
		$this->db->limit($data['length'],$data['start']);
		if($data['search']['value']!=''){
			$this->db->like('venFecha', $data['search']['value']);
		}
		$query= $this->db->get_where('ventas', array('cajaId' => $response['cajaId']));
		return $query->num_rows();
	}

	function Ventas_List_datatable($data=null){

		$response = array();
		//Siempre preguntar si esta abierta la caja (para las opciones 1 y 2)
		//para el usuario logueado
		$userdata = $this->session->userdata('user_data');

		//verificar si hay cajas abiertas
		$this->db->select('*');
		$this->db->where(array('cajaCierre'=>null, 'usrId' => $userdata[0]['usrId']));
		$this->db->from('cajas');
		$query = $this->db->get();
		$result = $query->result_array();
		if(count($result) > 0){
			$result = $query->result_array();
			$response['cajaId'] = $result[0]['cajaId'];
			$caja = $result[0];
		} else {
			$response['cajaId'] = -1;
			$response['caja'] = null;
		}


		$this->db->order_by('venFecha', 'desc');
		$this->db->limit($data['length'],$data['start']);
		if($data['search']['value']!=''){
			$this->db->like('venFecha', $data['search']['value']);
		}
		$query= $this->db->get_where('ventas', array('cajaId' => $response['cajaId']));

		if ($query->num_rows()!=0)
		{

			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	function getOrder($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$idOrder = $data['id'];
			$data = array();
			$query = $this->db->get_where('ordendecompra',array('ocId'=>$idOrder));
			if ($query->num_rows() != 0)
			{
				$order = $query->result_array();
				$data['order'] = $order[0];

				$query = $this->db->get_where('ordendecompradetalle',array('ocId'=>$idOrder));
				if ($query->num_rows() != 0)
				{
					$orderD = $query->result_array();
					$data['orderdetalle'] = array();
					foreach ($orderD as $item) {
						$query= $this->db->get_where('articles',array('artId' => $item['artId']));
						if ($query->num_rows() != 0)
						{
							$art = $query->result_array();
							$item['artBarCode'] = $art[0]['artBarCode'];
						}

						$data['orderdetalle'][] = $item;
					}

				}

				//Get Lista de Precios
				$query= $this->db->get_where('listadeprecios',array('lpId' => $data['order']['lpId']));
				if ($query->num_rows() != 0)
				{
					$lista = $query->result_array();
					$data['lista'] = $lista[0];
				}

				//Get Usuario
				$query= $this->db->get_where('sisusers',array('usrId' => $data['order']['usrId']));
				if ($query->num_rows() != 0)
				{
					$user = $query->result_array();
					$data['user'] = $user[0];
				}
			}


			return $data;
		}
	}

	function getMPagos($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
			$total = $data['to'];

			$data = array();
			$data['idOrden'] = $id;
			$data['total']	= $total;
			$data['tmp']	= array();

			$query = $this->db->get_where('tipomediopago',array('tmpEstado'=>'AC'));
			if ($query->num_rows() != 0)
				{
					$tmp = $query->result_array();
					//$data['tmp'] = $tmp;
					$data['tmp'] = array();
					foreach ($tmp as $item) {
						$query = $this->db->get_where('mediosdepago',array('medEstado'=>'AC', 'tmpId' => $item['tmpId']));
						if ($query->num_rows() != 0)
						{
							$tmpD = $query->result_array();
							$item['tmpD'] = $tmpD;
						} else {
							$item['tmpD'] = array();
						}

						$data['tmp'][] = $item;
					}
				}
			return $data;
		}
	}

	function setSale($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$ocId = $data['id'];
			$pago = $data['pa'];

			//Datos del usuario
			$userdata = $this->session->userdata('user_data');
			$usrId = $userdata[0]['usrId'];

			//Datos de la caja
			$this->db->select('*');
			$this->db->where(array('cajaCierre'=>null, 'usrId' => $usrId));
			$this->db->from('cajas');
			$query = $this->db->get();
			$result = $query->result_array();
			if(count($result) > 0){
				$result = $query->result_array();
				$cajaId = $result[0]['cajaId'];
			} else {
				return false;
			}

			//Datos de la orden
			$orden = $this->getOrder($data);

			$venta = array(
				'usrId'			=> $usrId,
				'cajaId'		=> $cajaId,
				'cliId'			=> $orden['order']['cliId']
				);

			$this->db->trans_start();
			if($this->db->insert('ventas', $venta) == false) {
				return false;
			} else {
				$idVenta = $this->db->insert_id();

				//Actualizar detalle
				foreach ($orden['orderdetalle'] as $a) {
					$insert = array(
							'venId' 		=> $idVenta,
							'artId' 		=> $a['artId'],
							'artCode' 		=> '',
							'artDescription'=> $a['artDescripcion'],
							'artCoste'		=> $a['artPCosto'],
							'artFinal'		=> $a['artPVenta'],
							'venCant'		=> $a['ocdCantidad']
						);

					if($this->db->insert('ventasdetalle', $insert) == false) {
						return false;
					}

					$insert = array(
							'artId' 		=> $a['artId'],
							'stkCant'		=> $a['ocdCantidad'] * -1,
							'stkOrigen'		=> 'VN'
						);

					if($this->db->insert('stock', $insert) == false) {
						return false;
					}
				}

				//Insertar medios de pago
				foreach ($pago as $item) {
					$insert = array(
							'venId'			=>	$idVenta,
							'medId'			=>	$item['mId'],
							'rcbImporte'	=>	$item['imp'],
							'rcbDesc1'		=>	$item['de1'],
							'rcbDesc2'		=>	$item['de2'],
							'rcbDesc3'		=>	$item['de3']
						);

					if($this->db->insert('recibos', $insert) == false) {
						return false;
					}
				}

				//Actualizar orden de compra
				$update = array('ocEstado' => 'FA', 'venId' => $idVenta);
				if($this->db->update('ordendecompra', $update, array('ocId'=>$ocId)) == false) {
					return false;
				}
			}
			$this->db->trans_complete();
		}

		return true;
	}

	function getArticles($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$date = $data['day'];
			$date = explode('-', $date);
			$date = $date[2].'-'.$date[1].'-'.$date[0];

			$query = $this->db->query(" select d.artCode, d.artDescription, sum(d.venCant) as ventas from ventas as v
										join ventasdetalle as d on d.venId = v.venId
										where DATE(venFecha) = '".$date."'
										GROUP BY d.artCode");

			//echo $this->db->last_query();
			return $query->result_array();
		}
	}

	function getSales__($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$date = $data['day'];
			$date = explode('-', $date);
			$date = $date[2].'-'.$date[1].'-'.$date[0];

			$query = $this->db->query(" select v.venId, v.usrId, v.cliId, (select sum( d.venCant * d.artFinal) from ventasdetalle as d where d.venId = v.venId) as importe , o.ocId, o.ocObservacion, u.usrNick
										from ventas as v
										join ordendecompra as o on o.venId = v.venId
										join sisusers as u on u.usrId = v.usrId
										where DATE(venFecha) = '".$date."' and v.venEstado = 'AC'
										GROUP BY v.venId");
			return $query->result_array();
		}
	}
	*/
//}
?>
