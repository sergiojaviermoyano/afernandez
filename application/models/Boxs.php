<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Boxs extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	/*Utilizado para cobranza y/o Pagos*/
	function getMedios(){
		$query = $this->db->get_where('tipomediopago', array('tmpEstado' => 'AC'));
		$items = $query->result_array();
		for($i=0; $i<$query->num_rows(); $i++){
			$query_2 = $this->db->get_where('mediosdepago', array('medEstado' => 'AC', 'tmpId' => $items[$i]['tmpId']));
			$items[$i]['medios'] = $query_2->result_array();
		}
		return $items;
	}
	
	function Medios_List($data_ = null){
		$this->db->select('mediosdepago.*, tipomediopago.tmpDescripción');
		$this->db->from('mediosdepago');
		$this->db->join('tipomediopago', ' tipomediopago.tmpId = mediosdepago.tmpId');
		$this->db->order_by('mediosdepago.medDescripcion', 'desc');
		$this->db->limit(10);
		$query= $this->db->get();

		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return array();
		}
	}

	function getMedio($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$action = $data['act'];
			$medId = $data['id'];

			$data = array();

			//Datos del medio de pago
			$query= $this->db->get_where('mediosdepago',array('medId'=>$medId));
			if ($query->num_rows() != 0)
			{
				$u = $query->result_array();
				$data['medio'] = $u[0];
			} else {
				$medio = array();
				$medio['medId'] = '';
				$medio['medCodigo'] = '';
				$medio['medDescripcion'] = '';
				$medio['tmpId'] = '';
				$medio['medEstado'] = 'AC';

				$data['medio'] = $medio;
			}

			//Readonly
			$readonly = false;
			if($action == 'Del' || $action == 'View'){
				$readonly = true;
			}
			$data['read'] = $readonly;

			//tipos medios de pago
			$query= $this->db->get('tipomediopago');
			if ($query->num_rows() != 0)
			{
				$data['tipos'] = $query->result_array();	
			}
			
			return $data;
		}
	}

	function setMedio($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
			$act = $data['act'];
			$code = $data['code'];
			$desc = $data['desc'];
			$tmpI = $data['tmpI'];
			$esta = $data['esta'];
			
			$data = array(
					'medCodigo' => $code,
					'medDescripcion' => $desc,
					'tmpId' => $tmpI,
					'medEstado' => $esta
				);

			switch($act){
				case 'Add':
					//Agregar Usuario 
					if($this->db->insert('mediosdepago', $data) == false) {
						return false;
					}else{
						return true;
					}
					break;

				 case 'Edit':
				 	//Actualizar usuario
				 	if($this->db->update('mediosdepago', $data, array('medId'=>$id)) == false) {
				 		return false;
				 	}
				 	break;

				 case 'Del':
				 	//Eliminar usuario
				 	if($this->db->delete('mediosdepago', array('medId'=>$id)) == false) {
				 		return false;
				 	}
				 	break;
			}

			return true;

		}
	}

	function Box_List($data_ = null){
		$data = array();
		if($data_ == null){
			$this->db->select('cajas.*, sisusers.usrName, sisusers.usrLastName, (select sum(retImporte) from retiros where cajaId = cajas.cajaId) as retiro');
			$this->db->from('cajas');
			$this->db->join('sisusers', ' sisusers.usrId = cajas.usrId');
			$this->db->order_by('cajas.cajaId', 'desc');
			$this->db->limit(10);
			$query= $this->db->get();

			$data['page'] = 1;
			$data['totalPage'] = ceil($this->db->count_all_results('cajas') / 10);
			$data['data'] = $query->result_array();
		} else {
			$this->db->select('cajas.*, sisusers.usrName, sisusers.usrLastName, (select sum(retImporte) from retiros where cajaId = cajas.cajaId) as retiro');
			$this->db->from('cajas');
			$this->db->join('sisusers', ' sisusers.usrId = cajas.usrId');
			$this->db->order_by('cajas.cajaId', 'desc');
			$this->db->or_like('cajaId', $data_['txt']);
			$this->db->limit(10, (($data_['page'] - 1) * 10));
			$query= $this->db->get();
			$data['page'] = $data_['page'];
			$data['data'] = $query->result_array();

			$this->db->select('*');
			$this->db->from('cajas');
			$this->db->order_by('cajas.cajaId', 'desc');
			$this->db->or_like('cajaId', $data_['txt']);
			$query= $this->db->get();

			$data['totalPage'] = ceil($query->num_rows() / 10);

		}

		//verificar si hay cajas abiertas
		$this->db->where('cajaCierre', null);
		$this->db->from('cajas');
		$data['openBox'] = $this->db->count_all_results();

		return $data;
	}

	function getBox($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$action = $data['act'];
			$idBox = $data['id'];

			$data = array();

			//Datos de la caja
			$this->db->select('cajas.*, sisusers.usrId, sisusers.usrName, sisusers.usrLastName');
			$this->db->from('cajas');
			$this->db->join('sisusers', 'sisusers.usrId = cajas.usrId');
			$this->db->where(array('cajas.cajaId'=>$idBox));
			$query= $this->db->get();
			if ($query->num_rows() != 0)
			{
				$c = $query->result_array();
				$this->db->select('sum(ordendetalle.artVenta * ordendetalle.artCant) as suma', false);
				$this->db->from('ordendetalle');
				$this->db->join('orden', 'orden.oId = ordendetalle.oId');
				$this->db->where(array('orden.cajaId'=>$c[0]['cajaId']));
				$query = $this->db->get();
				//var_dump($query->row());
				$c[0]['cajaImpVentas'] = $query->row()->suma == null ? '0.00' : $query->row()->suma;
				$data['box'] = $c[0];

				//Calcular retiros
				$this->db->select('sum(retImporte) as suma', false);
				$this->db->from('retiros');
				$this->db->where(array('cajaId'=>$idBox));
				$query = $this->db->get();
				$data['box']['cajaRetiros'] = $query->row()->suma == null ? '0.00' : $query->row()->suma;

				//calcular ventas
				$this->db->select('sum(ordendetalle.artVenta * ordendetalle.artCant) as suma', false);
				$this->db->from('ordendetalle');
				$this->db->join('orden', 'orden.oId = ordendetalle.oId');
				$this->db->where(array('orden.cajaId'=>$idBox, 'orden.oEsVenta' => 1));
				$this->db->where_in('orden.oEstado', array('AC','FA'));
				//$this->db->where(array('orden.cajaId'=>$idBox,'orden.oEstado' => 'FA'));
				$query = $this->db->get();
				//echo $this->db->last_query();
				$data['box']['cajaImpVentas'] = $query->row()->suma == null ? '0.00' : $query->row()->suma;

				$query = $this->db->query('select r.medId, m.medDescripcion, sum(r.rcbImporte) as importe from recibos as r
										  join mediosdepago as m on m.medId = r.medId
										  where r.cajaId = '.$idBox.'
										  GROUP BY r.medId');
											//join orden as o on o.oId = r.oId

				$data['box']['medios'] = $query->result_array();

				//Cobros de clientes
				$this->db->select('sum(cuentacorrientecliente.cctepHaber) as suma', false);
				$this->db->from('cuentacorrientecliente');
				$this->db->where(array('cuentacorrientecliente.cajaId'=>$idBox));
				$query = $this->db->get();
				$data['box']['cliente'] = $query->row()->suma == null ? '0.00' : $query->row()->suma;

				//Pagos a proveedores
				$this->db->select('sum(cuentacorrienteproveedor.cctepHaber) as suma', false);
				$this->db->from('cuentacorrienteproveedor');
				$this->db->where(array('cuentacorrienteproveedor.cajaId'=>$idBox));
				$query = $this->db->get();
				$data['box']['proveedor'] = $query->row()->suma == null ? '0.00' : $query->row()->suma;

				//Calcular Ventas
				$this->db->select('count(*) as suma', false);
				$this->db->from('orden');
				$this->db->where(array('cajaId'=>$idBox, 'cliId != '=> null));
				$query = $this->db->get();
				$data['box']['ventas'] = $query->row()->suma == null ? '0' : $query->row()->suma;

				//Calcular Services
				//$this->db->select('count(*) as suma', false);
				//$this->db->from('orden');
				//$this->db->where(array('cajaId'=>$idBox, 'srvId != '=> null));
				//$query = $this->db->get();
				$data['box']['servicios'] = 0; //$query->row()->suma == null ? '0' : $query->row()->suma;

				//Calcular Descuentps
				$this->db->select('sum(oDescuento) as descuento', false);
				$this->db->from('orden');
				$this->db->where(array('cajaId'=>$idBox));
				$query = $this->db->get();
				$data['box']['descuentos'] = $query->row()->descuento == null ? '0' : $query->row()->descuento;

			} else {
				$userdata = $this->session->userdata('user_data');

				$box = array();
				$box['cajaApertura'] = '';
				$box['cajaCierre'] = '';
				$box['cajaImpApertura'] = '';
				$box['cajaImpVentas'] = '0.00';
				$box['cajaImpRendicion'] = '0.00';
				$box['cajaRetiros'] = '0.00';

				$box['usrId'] = $userdata[0]['usrId'];
				$box['usrName'] = $userdata[0]['usrName'];
				$box['usrLastName'] = $userdata[0]['usrLastName'];

				$data['box'] = $box;
				$data['box']['medios'] = array();
				$data['box']['cliente'] = '0.00';
				$data['box']['proveedor'] = '0.00';
				$data['box']['ventas'] = 0;
				$data['box']['servicios'] = 0;
				$data['box']['descuentos'] = 0;
			}

			$data['action'] = $action;

			return $data;
		}
	}

	function setBox($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
			$act = $data['act'];
			$ape = $data['ape'];
			$ven = $data['ven'];
			$cie = $data['cie'];

			switch($act){
				case 'Add':
					//Agregar caja
					$userdata = $this->session->userdata('user_data');

					$data = array(
					   //'cajaApertura' 	=> date('Y-m-d H:i:s'),
					   'cajaCierre'		=> null,
					   'usrId'			=> $userdata[0]['usrId'],
					   'cajaImpApertura'=> $ape,
					   'cajaImpVentas'	=> null,
					   'cajaImpRendicion'=>null
					);

					if($this->db->insert('cajas', $data) == false) {
						return false;
					}
					break;

				case 'Close':
				case 'Cierra':
					//Cerrar caja
					$data = array(
					   'cajaCierre'		=> date('Y-m-d H:i:s'),
					   'cajaImpVentas'	=> $ven,
					   'cajaImpRendicion'=>$cie
					);
					if($this->db->update('cajas', $data, array('cajaId'=>$id)) == false) {
						return false;
					}
					break;
			}

			return true;

		}
	}

	function setRetiro($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$imp = $data['imp'];
			$des = $data['des'];

			$userdata = $this->session->userdata('user_data');

			$this->db->select('cajaId');
			$this->db->from('cajas');
			$this->db->where('cajaCierre', null);
			$query= $this->db->get();
			if ($query->num_rows() != 0)
			{
				$c = $query->result_array();

				$data = array(
					   'usrId'			=> $userdata[0]['usrId'],
					   'retImporte'		=> $imp,
					   'retDescripcion'	=> $des,
					   'cajaId'			=> $c[0]['cajaId']
					);

				if($this->db->insert('retiros', $data) == false) {
						return false;
				}
			} else
			{
				return false;
			}

			return true;
		}
	}

	function isOpenBox(){
		//verificar si hay cajas abiertas
		$this->db->where('cajaCierre', null);
		$this->db->from('cajas');
		return $this->db->count_all_results();
	}

	function getRetiros($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$idBox = $data['id'];
			$this->db->select('retiros.*, sisusers.usrNick');
			$this->db->from('retiros');
			$this->db->join('sisusers', 'sisusers.usrId = retiros.usrId');
			$this->db->where(array('retiros.cajaId'=>$idBox));
			$query= $this->db->get();
			return $query->result_array();
		}
	}

	function printBox($data = null){
		if($data == null){
			return false;
		}
		else
		{
			$data['act'] = 'View';
			$result = $this->getBox($data);
			$importe = 0;

			$html = '<table width="100%" style="font-family: Impact, Charcoal, sans-serif; font-size: 15px;">';
			$html .= '	<tr>

							<td style="text-align: center; font-family: Impact, Charcoal, sans-serif;" >
								<h1 style="font-size: 55px; color: #72324a;" >ADOLFO FERNANDEZ </h1>

								<strong>Soluciones Electronicas<br>
								<i>Fray Justo Santa Maria de Oro 489<br>
								Tel. 496-3903 - Cel. 154514219<br>
								C.P. 5442 Caucete - San Juan </i>
							</td>
						</tr>';
			$html .= '	<tr><td colspan="2"><center><h1>Resumen Cierre de Caja '.str_pad($result['box']['cajaId'], 10, "0", STR_PAD_LEFT).'</h1></center></td></tr>';
			$dateA = date_create($result['box']['cajaApertura']);
			$dateC = date_create($result['box']['cajaCierre']);
			$html .= '	<tr>
							<td colspan="2">
								<table width="100%">
									<tr>
										<td width="33%">
											Apertura: <strong>'.date_format($dateA, 'd-m-Y H:i').'</strong>
										</td>
										<td width="33%">
											Cierre: <strong>'.date_format($dateC, 'd-m-Y H:i').'</strong>
										</td>
										<td width="33%">
											Usuario: <strong>'.$result['box']['usrName'].' '.$result['box']['usrLastName'].'</strong>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2"><hr></td>
						</tr> ';
			$importe = $result['box']['cajaImpApertura'] +  $result['box']['cliente'] - $result['box']['proveedor']; //$result['box']['cajaImpVentas'] +
			$html .= '	<tr>
							<td colspan="2">
								<table width="100%">
									<tr>
										<td width="23%">
											Fondo Inicial (+):
										</td>
										<td width="27%">
											<strong>$ '.number_format($result['box']['cajaImpApertura'],2).'</strong>
										</td>
										<td width="15%">

										</td>
										<td width="35%">

										</td>
									</tr>
									<tr>
										<td width="23%">
											Importe Vendido (*):
										</td>
										<td width="27%">
											<strong>$ '.number_format($result['box']['cajaImpVentas'],2).'</strong>
										</td>
										<td width="15%" style="text-align: right:">
											Ventas:
										</td>
										<td width="35%">
											'.$result['box']['ventas'].'
										</td>
									</tr>
									<tr>
										<td width="23%">
											Cta Cte Clientes (+):
										</td>
										<td width="27%">
											<strong>$ '.$result['box']['cliente'].'</strong>
										</td>
										<td width="15%" style="text-align: right:">
											<!--Servicios:-->
										</td>
										<td width="35%">
											<!--'.$result['box']['servicios'].'-->
										</td>
									</tr>
									<tr>
										<td width="23%">
											Pago Proveedores (-):
										</td>
										<td width="27%">
											<strong>$ '.$result['box']['proveedor'].'</strong>
										</td>
										<td width="15%">

										</td>
										<td width="35%">

										</td>
									</tr>
									<tr>
										<td width="23%">
											Descuentos (-):
										</td>
										<td width="27%">
											<strong>$ '.$result['box']['descuentos'].'</strong>
										</td>
										<td width="15%">

										</td>
										<td width="35%">

										</td>
									</tr>';
									//$importe -= $result['box']['descuentos'];
			$html .=			'	<tr>
										<td colspan="4">
										<hr>
										</td>
									</tr>';
									foreach ($result['box']['medios'] as $key => $item):
									if($item['medDescripcion'] == 'Efectivo'){
										$importe += $item['importe'];
									}
								    $html .= '<tr>
												<td width="23%">
													'.$item['medDescripcion'].' '.($item['medDescripcion'] == 'Efectivo' ? '(+)': '(-)').':
												</td>
												<td width="27%">
													<strong>$ '.$item['importe'].'</strong>
												</td>
												<td width="15%">

												</td>
												<td width="35%">
													'.($item['medDescripcion'] == 'Efectivo' ? '<!--<i>(*) No Afecta el resultado </i>-->': '').'
												</td>
											</tr>';
								    endforeach;
			$html .=			'	<tr>
										<td colspan="4">
										<hr>
										</td>
									</tr>';
									$importe -= $result['box']['cajaRetiros'];
			$html .=			'	<tr>
										<td width="23%">
											Retiros (-):
										</td>
										<td width="27%">
											<strong>$ '.$result['box']['cajaRetiros'].'</strong>
										</td>
										<td width="15%">

										</td>
										<td width="35%">

										</td>
									</tr>';
			$html .=			'	<tr>
										<td colspan="4">
										<hr>
										</td>
									</tr>
									<tr>
										<td width="23%">
											Total a Rendir:
										</td>
										<td width="27%">
											<strong>$ '.number_format($importe, 2, '.', '').'</strong>
										</td>
										<td width="15%">
											Rendición:
										</td>
										<td width="35%">
											<strong>$ '.$result['box']['cajaImpRendicion'].'</strong>
										</td>
									</tr>
									<tr>
										<td colspan="4">
										<hr>
										</td>
									</tr>';
			$html .=			'	<tr>
										<td colspan="4">';
									if(($importe - $result['box']['cajaImpRendicion']) > 0){
										//Faltante
										$html .= '<strong style="color: red"> Faltante: <h2>$ '.number_format($importe - $result['box']['cajaImpRendicion'], 2, '.', '').'</h2></strong>';
									} else {
										//Sobrante
										$html .= '<strong style="color: green"> Sobrante: <h2>$ '.number_format(abs($importe - $result['box']['cajaImpRendicion']), 2, '.', '').'</h2></strong>';
									}
			$html .= 			'		</td>
									</tr>';
			$html .= 				'<tr>
										<td colspan="4">
										<hr>
										</td>
									</tr>
								</table>
							</td>
					  	</tr>';
			$html .= '</table>';
			//die($html);
			//se incluye la libreria de dompdf
			require_once("assets/plugin/HTMLtoPDF/dompdf/dompdf_config.inc.php");
			//se crea una nueva instancia al DOMPDF
			$dompdf = new DOMPDF();
			//se carga el codigo html
			$dompdf->load_html(utf8_decode($html));
			//aumentamos memoria del servidor si es necesario
			ini_set("memory_limit","300M");
			//Tamaño de la página y orientación
			$dompdf->set_paper('a4','portrait');
			//lanzamos a render
			$dompdf->render();
			//guardamos a PDF
			//$dompdf->stream("TrabajosPedndientes.pdf");
			$output = $dompdf->output();

			if(!is_dir(ASSETS.'boxs/')){
				mkdir(ASSETS.'boxs/');
			}
			file_put_contents(ASSETS.'boxs/'.$data['id'].'.pdf', $output);

			//Eliminar archivos viejos ---------------
			$dir = opendir('assets/boxs/');
			while($f = readdir($dir))
			{
				if((time()-filemtime('assets/boxs/'.$f) > 3600*24*1) and !(is_dir('assets/boxs/'.$f)))
				unlink('assets/boxs/'.$f);
			}
			closedir($dir);
			//----------------------------------------
			return $data['id'].'.pdf';
		}
	}


	public function getTotalBoxes($data = null){
		$response = array();
		$this->db->select('c.*,u.usrNick');
		$this->db->from('cajas as c');
		$this->db->join('sisusers as u','c.usrId = u.usrId', 'inner');
		$this->db->order_by('c.cajaId','desc');
		if($data['search']['value']!=''){
			$this->db->where('c.cajaId',$data['search']['value']);
			$this->db->or_like('u.usrNick',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(c.cajaApertura, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(c.cajaCierre, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->limit($data['length'],$data['start']);
		}

		$query = $this->db->get();
		return $query->num_rows();
	}

	public function getBoxes ( $data = null){
		$this->db->select('c.*,u.usrNick, DATE_FORMAT(c.cajaApertura, "%d-%m-%Y %H:%i") as apertura, DATE_FORMAT(c.cajaCierre, "%d-%m-%Y %H:%i") as cierre, (select sum(retImporte) from retiros where cajaId = c.cajaId) as retiro');
		$this->db->from('cajas as c');
		$this->db->join('sisusers as u','c.usrId = u.usrId', 'inner');
		$this->db->order_by('c.cajaId','desc');
		if($data['search']['value']!=''){
			$this->db->where('c.cajaId',$data['search']['value']);
			$this->db->or_like('u.usrNick',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(c.cajaApertura, "%d-%m-%Y %H:%i")',$data['search']['value']);
			$this->db->or_like('DATE_FORMAT(c.cajaCierre, "%d-%m-%Y %H:%i")',$data['search']['value']);
		}
		$this->db->limit($data['length'],$data['start']);
		$query=$this->db->get();
		//echo $this->db->last_query();
		return $query->result_array();
	}

	public function getPagosOrden($data = null){
		$this->db->select('recibos.rcbImporte, DATE_FORMAT(recibos.rcbFecha, \'%d-%m-%Y %H:%i\') as rcbFecha, mediosdepago.medDescripcion, recibos.rcbId');
		$this->db->from('recibos');
		$this->db->join('mediosdepago', 'mediosdepago.medId = recibos.medId');
		$this->db->where(array('oId' => $data['id']));
		$query = $this->db->get();
		return $query->result_array();
	}

	function printRecibo($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			/*
			select  
			
			
			from recibos as r
			join orden as o on o.oId = r.oId 
			join clientes as c on c.cliId = o.cliId
			where r.rcbId = 173
			*/
			$this->db->select('r.oId, r.rcbImporte, r.rcbFecha, o.cliId, c.cliNombre, c.cliApellido, 
			(select sum(d.artVenta * d.artCant) from ordendetalle as d where d.oId = o.oId) as total,
			(SELECT SUM( ra.rcbImporte ) FROM recibos as ra WHERE ra.rcbFecha <= r.rcbFecha	AND ra.oId = r.oId) as pagos');
			$this->db->from('recibos as r');
			$this->db->join('orden as o', 'o.oId = r.oId');
			$this->db->join('clientes as c', 'c.cliId = o.cliId');
			$this->db->where(array('rcbId' => $data['id']));
			$query = $this->db->get();

			$recibo = str_pad($data['id'], 6, "0", STR_PAD_LEFT);
			if($query->num_rows()>0){
				$c = $query->result_array();
				$move = $c[0];
				

			}else{
				return false;
			}

			
			$html = '<table width="100%" style="font-family:courier; font-size: 14px;">';
			$html .= '	<tr style="font-family: Open Sans; font-size: 25px; text-align: center;">
							<td style="text-align: left; width:50%;">
								<b>ADOLFO FERNANDEZ</b><br>
								<span style="font-size: 12px">SOLUCIONES ELECTRONICAS</span><br>
								<span style="font-size: 20px">Recibo</span>
							</td>
							<td>
								N°: <strong>'.$recibo.'</strong>
							</td>
						</tr>
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<tr>
							<td colspan="2">';
							$importe = 0; 
							$dateTime = explode(' ', $move['rcbFecha']);
							$date = explode('-', $dateTime[0]);
							$html.= 'En San Juan a los '.str_pad($date[2], 2, "0", STR_PAD_LEFT).' días del mes de '.$this->getMonth($date[1]).' de '.$date[0].', ';
							
								//Pago
								$html .= 'recibí de <strong>'.$move['cliApellido'].' '.$move['cliNombre'].'</strong> la suma de <strong> $'.number_format($move['rcbImporte'], 2, ',', '.').'.</strong> (pesos '.$this->convertNumber($move['rcbImporte']).').<br>';
								$importe = number_format($move['rcbImporte'], 2, ',', '.');
							
							$html .= 'En concepto de <strong> Pago a cuenta orden N° '.$move['oId'].'.</strong><br>';
							if($move['total'] - $move['pagos'] > 0)
								$html .= 'Saldo <b>$ '.number_format($move['total'] - $move['pagos'], 2, ',', '.').'</b>';
								else
								$html .= 'Saldo <b>$ 0,00 (Cancelado)</b>';
		
			$html .= 		'</td>
						</tr>';
			$html .= 	'<tr>
							<td><br><br>
								<hr>
							</td>
							<td style="text-align: right;">
								Son: <strong style="font-size: 20px; text-align: center;">$'.$importe.'</strong>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="font-size: 10px; text-align: center;">
								<i>* Talón para el cliente.</i>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<br><br>
							</td>
						</tr>';
			$html .= '</table>';

			$html .= '<hr style="border:1px dotted gray;" >';

			/*
			$html .= '<table width="100%" style="font-family:courier; font-size: 14px;">';
			$html .= '	<tr style="font-family: Open Sans; font-size: 25px; text-align: center;">
							<td style="text-align: left; width:50%;">
								<b>ADOLFO FERNANDEZ</b><br>
								<span style="font-size: 12px">SOLUCIONES ELECTRONICAS</span><br>
								<span style="font-size: 20px">Recibo</span>
							</td>
							<td>
								N°: <strong>'.$recibo.'</strong>
							</td>
						</tr>
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<tr>
							<td colspan="2">';
							$importe = 0; 
							$dateTime = explode(' ', $move['rcbFecha']);
							$date = explode('-', $dateTime[0]);
							$html.= 'En San Juan a los '.str_pad($date[2], 2, "0", STR_PAD_LEFT).' días del mes de '.$this->getMonth($date[1]).' de '.$date[0].', ';
						
							//Pago
							$html .= 'recibí de <strong>'.$move['cliApellido'].' '.$move['cliNombre'].'</strong> la suma de <strong> $'.number_format($move['rcbImporte'], 2, ',', '.').'.</strong> (pesos '.$this->convertNumber($move['rcbImporte']).').<br>';
							$importe = number_format($move['rcbImporte'], 2, ',', '.');
							
							$html .= 'En concepto de <strong> Pago a cuenta orden N° '.$move['oId'].'.</strong><br>';
							
							if($move['total'] - $move['pagos'] > 0)
								$html .= 'Saldo <b>$ '.number_format($move['total'] - $move['pagos'], 2, ',', '.').'</b>';
								else
								$html .= 'Saldo <b>$ 0,00 (Cancelado)</b>';
			$html .= 		'</td>
						</tr>';
			$html .= 	'<tr>
							<td><br><br>
								<hr>
							</td>
							<td style="text-align: right;">
								Son: <strong style="font-size: 20px; text-align: center;">$'.$importe.'</strong>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="font-size: 10px; text-align: center;">
								<i>* Talón para Adolfo Fernandez.</i>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<br><br>
								<hr style="border:1px dotted gray;" >
							</td>
						</tr>';
			$html .= '</table>';
			*/

			//se incluye la libreria de dompdf
			require_once("assets/plugin/HTMLtoPDF/dompdf/dompdf_config.inc.php");
			//se crea una nueva instancia al DOMPDF
			$dompdf = new DOMPDF();
			//se carga el codigo html
			$dompdf->load_html(utf8_decode($html));
			//aumentamos memoria del servidor si es necesario
			ini_set("memory_limit","300M");
			//Tamaño de la página y orientación
			$dompdf->set_paper('a4','portrait');
			//lanzamos a render
			$dompdf->render();
			//guardamos a PDF
			//$dompdf->stream("TrabajosPedndientes.pdf");
			$output = $dompdf->output();
			file_put_contents('assets/reports/'.$recibo.'.pdf', $output);

			//Eliminar archivos viejos ---------------
			$dir = opendir('assets/reports/');
			while($f = readdir($dir))
			{
				if((time()-filemtime('assets/reports/'.$f) > 3600*24*1) and !(is_dir('assets/reports/'.$f)))
				unlink('assets/reports/'.$f);
			}
			closedir($dir);
			//----------------------------------------
			return $recibo.'.pdf';
		}
	}

	function convertNumber($number)
	{
	    list($integer, $fraction) = explode(".", (string) $number);

	    $output = "";

	    if ($integer{0} == "-")
	    {
	        $output = "negative ";
	        $integer    = ltrim($integer, "-");
	    }
	    else if ($integer{0} == "+")
	    {
	        $output = "positive ";
	        $integer    = ltrim($integer, "+");
	    }

	    if ($integer{0} == "0")
	    {
	        $output .= "zero";
	    }
	    else
	    {
	        $integer = str_pad($integer, 36, "0", STR_PAD_LEFT);
	        $group   = rtrim(chunk_split($integer, 3, " "), " ");
	        $groups  = explode(" ", $group);

	        $groups2 = array();
	        foreach ($groups as $g)
	        {
	            $groups2[] = $this->convertThreeDigit($g{0}, $g{1}, $g{2});
	        }

	        for ($z = 0; $z < count($groups2); $z++)
	        {
	            if ($groups2[$z] != "")
	            {
	                $output .= $groups2[$z] . $this->convertGroup(11 - $z) . (
	                        $z < 11
	                        && !array_search('', array_slice($groups2, $z + 1, -1))
	                        && $groups2[11] != ''
	                        && $groups[11]{0} == '0'
	                            ? " and "
	                            : ", "
	                    );
	            }
	        }

	        $output = rtrim($output, ", ");
	    }

	    if ($fraction > 0)
	    {
	        $output .= " con ".$this->convertTwoDigit($fraction[0], $fraction[1])." centavos";

	        //for ($i = 0; $i < strlen($fraction); $i++)
	        //{
	        //    $output .= " " . $this->convertDigit($fraction{$i});
	        //}
	    }

	    return $output;
	}

	function convertGroup($index)
	{
	    switch ($index)
	    {
	        case 11:
	            return " decillón";
	        case 10:
	            return " nonillón";
	        case 9:
	            return " octillón";
	        case 8:
	            return " septillón";
	        case 7:
	            return " sextillón";
	        case 6:
	            return " quintrillón";
	        case 5:
	            return " quadrillón";
	        case 4:
	            return " trillón";
	        case 3:
	            return " billón";
	        case 2:
	            return " millón";
	        case 1:
	            return " mil";
	        case 0:
	            return "";
	    }
	}

	function convertThreeDigit($digit1, $digit2, $digit3)
	{
	    $buffer = "";
	    if ($digit1 == "0" && $digit2 == "0" && $digit3 == "0")
	    {
	        return "";
	    }

	    if ($digit1 != "0" )
	    {

	    	if($digit1 != "1" && $digit1 != "5" && $digit1 != "7" && $digit1 != "9")
	        	$buffer .= $this->convertDigit($digit1) . "cien";
	        else{
	        		switch($digit1)
	        		{
	        			case "1":
	        				$buffer .= "cien";
	        				break;
	        			case "5":
	        				$buffer .= "quinien";
	        				break;
	        			case "7":
	        				$buffer .= "setecien";
	        				break;
	        			case "9":
	        				$buffer .= "novecien";
	        				break;
	        		}
	        	}
	        if ($digit2 != "0" || $digit3 != "0")
	        {
	        	if($digit1 != "1")
		        	$buffer .= "tos ";
		        else
		        	$buffer .= "to ";
	        } else {
	        	$buffer .= "tos";
	        }
	    }

	    if ($digit2 != "0")
	    {
	        $buffer .= $this->convertTwoDigit($digit2, $digit3);
	    }
	    else if ($digit3 != "0")
	    {
	        $buffer .= $this->convertDigit($digit3);
	    }

	    return $buffer;
	}

	function convertTwoDigit($digit1, $digit2)
	{
	    if ($digit2 == "0")
	    {
	        switch ($digit1)
	        {
	            case "1":
	                return "diez";
	            case "2":
	                return "veinte";
	            case "3":
	                return "treinta";
	            case "4":
	                return "cuarenta";
	            case "5":
	                return "cincuenta";
	            case "6":
	                return "sesenta";
	            case "7":
	                return "setenta";
	            case "8":
	                return "ochenta";
	            case "9":
	                return "noventa";
	            case "0":
	            	return "cero";
	        }
	    } else if ($digit1 == "1")
	    {
	        switch ($digit2)
	        {
	            case "1":
	                return "once";
	            case "2":
	                return "doce";
	            case "3":
	                return "trece";
	            case "4":
	                return "catorce";
	            case "5":
	                return "quince";
	            case "6":
	                return "dieciséis";
	            case "7":
	                return "diecisiete";
	            case "8":
	                return "dieciocho";
	            case "9":
	                return "diecinueve";
	        }
	    } else if($digit1 == "0"){
	    	switch ($digit2)
	        {
	            case "1":
	                return "un";
	            case "2":
	                return "dos";
	            case "3":
	                return "tres";
	            case "4":
	                return "cuatro";
	            case "5":
	                return "cinco";
	            case "6":
	                return "seis";
	            case "7":
	                return "siete";
	            case "8":
	                return "ocho";
	            case "9":
	                return "nueve";
	            case "0":
	                return "cero";
	        }
	    } else 
	    {
	        $temp = $this->convertDigit($digit2);
	        switch ($digit1)
	        {
	            case "2":
	                return "veinti$temp";
	            case "3":
	                return "treinta y $temp";
	            case "4":
	                return "cuarenta y $temp";
	            case "5":
	                return "cincuenta y $temp";
	            case "6":
	                return "sesenta y $temp";
	            case "7":
	                return "setenta y $temp";
	            case "8":
	                return "ochenta y $temp";
	            case "9":
	                return "noventa y $temp";
	        }
	    }
	}

	function convertDigit($digit)
	{
	    switch ($digit)
	    {
	        case "0":
	            return "cero";
	        case "1":
	            return "un";
	        case "2":
	            return "dos";
	        case "3":
	            return "tres";
	        case "4":
	            return "cuatro";
	        case "5":
	            return "cinco";
	        case "6":
	            return "séis";
	        case "7":
	            return "siete";
	        case "8":
	            return "ocho";
	        case "9":
	            return "nueve";
	    }
	}

	function getMonth($monthNumber){
    	switch ($monthNumber) {
    		case '01':
    			return 'Enero';
    			break;
    		case '02':
    			return 'Febrero';
    			break;
    		case '03':
    			return 'Marzo';
    			break;
    		case '04':
    			return 'Abril';
    			break;
    		case '05':
    			return 'Mayo';
    			break;
    		case '06':
    			return 'Junio';
    			break;
    		case '07':
    			return 'Julio';
    			break;
    		case '08':
    			return 'Agosto';
    			break;
    		case '09':
    			return 'Septiembre';
    			break;
    		case '10':
    			return 'Octubre';
    			break;
    		case '11':
    			return 'Noviembre';
    			break;
    		case '12':
    			return 'Diciembre';
    			break;
    		
    		default:	
    			return '-';
    			break;
    	}
    }
}
?>
