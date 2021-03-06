<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Orders extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	function Orders_List(){
		$this->db->order_by('ocFecha', 'desc');
		$query= $this->db->get('ordendecompra');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	function getTotalOrders($data=null){

		$this->db->order_by('ocFecha', 'desc');
		if($data['search']['value']!=''){
			$this->db->like('ocObservacion', $data['search']['value']);
			$this->db->limit($data['length'],$data['start']);
		}
		$query= $this->db->get('ordendecompra');
		return $query->num_rows();

	}

	function Orders_List_datatable($data=null){


		$this->db->order_by('ocFecha', 'desc');
		$this->db->limit($data['length'],$data['start']);
		if($data['search']['value']!=''){
			$this->db->like('ocObservacion', $data['search']['value']);
		}
		$query= $this->db->get('ordendecompra');
		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	function getTotalOrdersSales($data=null){
		$this->db->order_by('ocFecha', 'asc');
		if($data['search']['value']!=''){
			$this->db->like('ocObservacion', $data['search']['value']);
			$this->db->limit($data['length'],$data['start']);
		}
		$query= $this->db->get_where('ordendecompra', array('ocEstado' => 'AC', 'ocEsPresupuesto' => false));
		return $query->num_rows();
	}

	function Orders_List_datatable_sales($data=null){
		$this->db->order_by('ocFecha', 'asc');
		$this->db->limit($data['length'],$data['start']);
		if($data['search']['value']!=''){
			$this->db->like('ocObservacion', $data['search']['value']);
		}
		$query= $this->db->get_where('ordendecompra', array('ocEstado' => 'AC', 'ocEsPresupuesto' => false));
		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	function getTotalOrdersPresu($data=null){
		$this->db->order_by('ocFecha', 'asc');
		if($data['search']['value']!=''){
			$this->db->like('ocObservacion', $data['search']['value']);
			$this->db->limit($data['length'],$data['start']);
		}
		$query= $this->db->get_where('ordendecompra', array('ocEstado' => 'AC', 'ocEsPresupuesto' => true));
		return $query->num_rows();
	}

	function Orders_List_datatable_presu($data=null){
		$this->db->order_by('ocFecha', 'asc');
		$this->db->limit($data['length'],$data['start']);
		if($data['search']['value']!=''){
			$this->db->like('ocObservacion', $data['search']['value']);
		}
		$query= $this->db->get_where('ordendecompra', array('ocEstado' => 'AC', 'ocEsPresupuesto' => true));
		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	function getOrder($oId = null){
		if($oId == null)
		{
			return false;
		}
		else
		{
			$data = array();

			//Datos del Ordern
			$query= $this->db->get_where('orden',array('oId'=>$oId));
			if ($query->num_rows() > 0)
			{
				$order = $query->result_array();
				$data['order'] = $order[0];
				$this->db->select("od.*, a.artBarCode");
				$this->db->from('ordendetalle od');
				$this->db->join('articles a','a.artId=od.artId', 'left outer');
				$this->db->where('oId',$oId);
				$query = $this->db->get();
				$detalleCompra=($query->num_rows()>0)?$query->result_array():array();
				$data['detalle']=$detalleCompra;
			}
			return $data;
		}
	}

	function setOrder($data = null){
	    if($data == null)
			{
				return false;
			}
			else
			{
				$action = 	$data['act'];
				$id = 		$data['id'];
				$obser = 	$data['obser'];
				$cliId = 	$data['cliId'];
				$lpId =		$data['lpId'];
				$arts = 	$data['art'];
				$redondeo = 	$data['redondeo'];

				//Datos del vendedor
				$userdata = $this->session->userdata('user_data');
				$usrId = $userdata[0]['usrId'];

				$data = array(
					'ocObservacion'	=>$obser,
					'usrId'			=>$usrId,
					'lpId'			=>$lpId,
					'cliId'			=>$cliId,
					'redondeo'  	=>$redondeo
					);

				switch ($action) {
					case 'Add':
					case 'Pre':
					case 'Ent':
						$this->db->trans_start(); // Query will be rolled back
						if($id <= 0){
							if($action == 'Ent') $data['ocEstado'] = 'EN';
							//Es un registro nuevo
							$data['ocEsPresupuesto']=($action=='Pre')?1:0;
							if($this->db->insert('ordendecompra', $data) == false) {
								return false;
							} else {
								$idOrder = $this->db->insert_id();

								foreach ($arts as $a) {
									$insert = array(
											'ocId'	 		=> $idOrder,
											'artId' 		=> $a['artId'],
											'artDescripcion'=> $a['artDescription'],
											'artPCosto'		=> $a['artCoste'],
											'artPVenta'		=> $a['artFinal'],
											'ocdCantidad'	=> $a['venCant']
										);

									if($this->db->insert('ordendecompradetalle', $insert) == false) {
										return false;
									}
								}

								//Entregar
								$this->entregarOC($idOrder);
							}
						} else {
							//Es solo entregar una oc y cambiar estado
							$update = array(
											'ocEstado' 			=> 'EN',
											'ocEsPresupuesto' 	=> 0
											);
							if($this->db->update('ordendecompra', $update, array('ocId'=>$id)) == false) {
					 			return false;
					 		} else {
					 			//Entregar
					 			$this->entregarOC($id);
					 		}
						}
						$this->db->trans_complete();
						break;
					case 'Edit':{
						if($this->db->update('ordendecompra', $data, array('ocId'=>$id)) == false) {
					 		return false;
					 	}
						if($this->db->delete('ordendecompradetalle', array('ocId'=>$id)) == false) {
					 		return false;
					 	}	else {
							$idOrder = $id;

							foreach ($arts as $a) {
								$insert = array(
									'ocId'	 		=> $idOrder,
									'artId' 		=> $a['artId'],
									'artDescripcion'=> $a['artDescription'],
									'artPCosto'		=> $a['artCoste'],
									'artPVenta'		=> $a['artFinal'],
									'ocdCantidad'	=> $a['venCant']
								);

								if($this->db->insert('ordendecompradetalle', $insert) == false) {
								 return false;
							 }
						 }
					 }

					break;
				}
					default:
						# code...
						break;
				}
				return true;
			}
	}

	function printOrder($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$data['act'] = 'Print';
			$result = $this->getOrder($data);

			//Datos del Cliente
			$query= $this->db->get_where('clientes',array('cliId' => $result['order']['cliId']));
				if ($query->num_rows() != 0)
				{
					$user = $query->result_array();
					$data['cliente'] = $user[0];
				}

			//Datos del Vendedor
			$query= $this->db->get_where('sisusers',array('usrId' => $result['order']['usrId']));
				if ($query->num_rows() != 0)
				{
					$user = $query->result_array();
					$data['user'] = $user[0];
				}

			//Lista de Precio
			$query= $this->db->get_where('listadeprecios',array('lpId' => $result['order']['lpId']));
				if ($query->num_rows() != 0)
				{
					$lista = $query->result_array();
					$data['lista'] = $lista[0];
				}

			$ordId = str_pad($data['id'], 10, "0", STR_PAD_LEFT);
			$html = '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>';
			$html .= '<table width="100%" style="font-family:courier; font-size: 12px;">';
			$html .= '	<tr>
							<td colspan="2" style="text-align: center">
								Documento no válido como factura.<br>
								'.($result['order']['ocEsPresupuesto'] ? '<strong>Presupuesto</strong> <br>' : '') .'
								Número de Orden: <b>0000-'.$ordId.'</b><br>
								Vendedor: <b>'.$data['user']['usrName'].' '.$data['user']['usrLastName'].'</b><br>
								Fecha: <b>'.date("d-m-Y H:i", strtotime($result['order']['ocFecha'])).'</b><br>
								Tel: 0264 - 4961482
							</td>
						</tr>';
			$html .= '	<tr><td colspan="2"><hr></td></tr>';
			$html .= '	<tr><td colspan="2">
							Cliente: <b>'.$data['cliente']['cliApellido'].' '.$data['cliente']['cliNombre'].' / '.$result['order']['ocObservacion'].'</b><br>
							Lista de Precio: <b>'.$data['lista']['lpDescripcion'].'</b>
						</td></tr>';
			$html .= '	<tr><td colspan="2"><hr></td></tr>';
			$html .= '	<tr><td colspan="2">';

			$html .= '<table width="100%">';
			$html .= '<tr style="background-color: #FAFAFA">
						<th colspan="2">Artículo</th>
						<th>Precio</th>
						<th>Cantidad</th>
						<th>Total</th>
					</tr><tr><td colspan="5"><hr></td></tr>';
			$total = 0;

			foreach ($result['detalleCompra'] as $art) {
				$html .= '<tr>';
				$html .= '<td>'.$art['artBarCode'].'</td>';
				$html .= '<td>'.$art['artDescripcion'].'</td>';
				$html .= '<td style="text-align: right">'.number_format($art['artPVenta'], 2, ',', '.').'</td>';
				$html .= '<td style="text-align: right">'.$art['ocdCantidad'].'</td>';
				$coste = $art['artPVenta'] * $art['ocdCantidad'];
				$total += $coste;
				$html .= '<td style="text-align: right">'.number_format($coste, 2, ',', '.').'</td>';
				$html .= '</tr>';
				$html .= '<tr>';
				$html .= '<td colspan="5" style="padding-top: 5px"><hr style="border: 1px solid #D8D8D8;"> </td>';
				$html .= '</tr>';
			}
			//$total += $result['order']['redondeo'];
			//$html .= '<tr><td><h5>Redondeo</h5></td>';
			//$html .= '<td colspan="3" style="text-align: right"><h5>'.($result['order']['redondeo'] >= 0 ? '+' : '').''.number_format($result['order']['redondeo'], 2, ',', '.').'</h5></td></tr>';
			$html .= '<tr>';
			$html .= '<td colspan="5" style="text-align: right">Total  <strong style="font-size: 17px">$ '.number_format($total, 2, ',', '.').'</strong></td></tr>';
			$html .= '</table>';

			$html .= '	</td></tr>';
			$html .= '</table>';

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
			file_put_contents('assets/reports/'.$ordId.'.pdf', $output);

			//Eliminar archivos viejos ---------------
			$dir = opendir('assets/reports/');
			while($f = readdir($dir))
			{
				if((time()-filemtime('assets/reports/'.$f) > 3600*24*1) and !(is_dir('assets/reports/'.$f)))
				unlink('assets/reports/'.$f);
			}
			closedir($dir);
			//----------------------------------------
			return $ordId.'.pdf';
		}
	}

	function entregarOC($idOc){
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
			//Si falla cambiar a estado 'AC'
			$update = array(
							'ocEstado' 			=> 'AC'
							);
			if($this->db->update('ordendecompra', $update, array('ocId'=>$idOc)) == false) {
	 			return false;
	 		}
		}

		//Datos de la orden
		$query= $this->db->get_where('ordendecompra',array('ocId'=>$idOc));
		$data = array();
		if ($query->num_rows() > 0)
		{
			$order = $query->result_array();
			$data['order'] = $order[0];
			$this->db->select("ocd.*, a.*");
			$this->db->from('ordendecompradetalle ocd');
			$this->db->join('articles a','a.artId=ocd.artId');
			$this->db->where('ocId',$idOc);
			$query = $this->db->get();
			$detalleCompra=($query->num_rows()>0)?$query->result_array():array();
			$data['detalleCompra']=$detalleCompra;

			//---------------
			$venta = array(
				'usrId'			=> $usrId,
				'cajaId'		=> $cajaId,
				'cliId'			=> $data['order']['cliId']
				);

			$this->db->trans_start();
			if($this->db->insert('ventas', $venta) == false) {
				return false;
			} else {
				$idVenta = $this->db->insert_id();

				//Actualizar detalle
				$ventaImporte = 0;
				foreach ($data['detalleCompra'] as $a) {
					$insert = array(
							'venId' 		=> $idVenta,
							'artId' 		=> $a['artId'],
							'artCode' 		=> $a['artBarCode'],
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

					$ventaImporte += $a['artPVenta'] * $a['ocdCantidad'];
				}

				//Insertar medio de pago como efectivo
			 	$insert = array(
			 			'venId'			=>	$idVenta,
			 			'medId'			=>	1,
			 			'rcbImporte'	=>	$ventaImporte,
			 			'rcbDesc1'		=>	'',
			 			'rcbDesc2'		=>	'',
			 			'rcbDesc3'		=>	''
			 		);

			 	if($this->db->insert('recibos', $insert) == false) {
			 		return false;
			 	}

				//Actualizar orden de compra
				$update = array('venId' => $idVenta);
				if($this->db->update('ordendecompra', $update, array('ocId'=>$idOc)) == false) {
				 	return false;
				}
			}
			$this->db->trans_complete();
			//---------------
		}
	}

	function printRemito($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$data['act'] = 'Print';
			$result = $this->getOrder($data);

			//Datos del Cliente
			$query= $this->db->get_where('clientes',array('cliId' => $result['order']['cliId']));
				if ($query->num_rows() != 0)
				{
					$user = $query->result_array();
					$data['cliente'] = $user[0];
				}

			//Datos del Vendedor
			$query= $this->db->get_where('sisusers',array('usrId' => $result['order']['usrId']));
				if ($query->num_rows() != 0)
				{
					$user = $query->result_array();
					$data['user'] = $user[0];
				}

			//Lista de Precio
			$query= $this->db->get_where('listadeprecios',array('lpId' => $result['order']['lpId']));
				if ($query->num_rows() != 0)
				{
					$lista = $query->result_array();
					$data['lista'] = $lista[0];
				}

			$ordId = str_pad($data['id'], 10, "0", STR_PAD_LEFT);
			$html = '<table width="100%" style="font-family:courier; font-size: 12px;">';
			$html .= '	<tr>
							<td style="text-align: center; font-family: Impact, Charcoal, sans-serif" width="50%">
								<strong style="font-size: 40px">Adolfo Fernandez</strong> <br>
								<strong>Soluciones Electrónicas<br>
								Santa Mario de Oro 123 -  Caucete - San Juan<br>
								Tel: 0264 - 4961234
							</td>
							<td style="text-align: center" width="50%">
								Documento no válido como factura.<br>
								<strong style="font-size: 20px">Remito</strong> <br>
								Número de Orden: <b>0000-'.$ordId.'</b><br>
								Fecha: <b>'.date("d-m-Y H:i").'</b>
							</td>
						</tr>';
			$html .= '	<tr><td colspan="2"><hr></td></tr>';
			$html .= '	<tr><td colspan="2">
							Cliente: <b>'.$data['cliente']['cliApellido'].' '.$data['cliente']['cliNombre'].' / '.$result['order']['ocObservacion'].'</b>
							</b>
						</td></tr>'; //Lista de Precio: <b>'.$data['lista']['lpDescripcion'].'
			$html .= '	<tr><td colspan="2"><hr></td></tr>';
			$html .= '	<tr><td colspan="2">';

			$html .= '<table width="100%">';
			$html .= '<tr style="background-color: #FAFAFA">
						<th>Cantidad</th>
						<th>Artículo</th>
					</tr><tr><td colspan="5"><hr></td></tr>';
			$total = 0;

			foreach ($result['detalleCompra'] as $art) {
				$html .= '<tr>';
				$html .= '<td style="text-align: left">'.$art['ocdCantidad'].'</td>';
				$html .= '<td>'.$art['artBarCode'].'-'.$art['artDescripcion'].'</td>';
				$html .= '</tr>';
				$html .= '<tr>';
				$html .= '<td colspan="5" style="padding-top: 5px"><hr style="border: 1px solid #D8D8D8;"> </td>';
				$html .= '</tr>';
			}
			$html .= '<tr>';
			$html .= '<td colspan="4" style="text-align: right"><br><br>Firma:.............................................</td></tr>';
			$html .= '<tr><td colspan="4" style="text-align: right"><br><br>Aclaración:........................................</td></tr>';
			$html .= '</table>';

			$html .= '	</td></tr>';
			$html .= '</table>';

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
			file_put_contents('assets/reports/'.$ordId.'.pdf', $output);

			//Eliminar archivos viejos ---------------
			$dir = opendir('assets/reports/');
			while($f = readdir($dir))
			{
				if((time()-filemtime('assets/reports/'.$f) > 3600*24*1) and !(is_dir('assets/reports/'.$f)))
				unlink('assets/reports/'.$f);
			}
			closedir($dir);
			//----------------------------------------
			return $ordId.'.pdf';
		}
	}
}
?>
