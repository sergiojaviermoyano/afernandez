<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Customers extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}

	function Customers_List(){

		$this->db->order_by('cliApellido','asc');
		$this->db->order_by('cliNombre','asc');
		$this->db->select('clientes.*, tipos_documentos.docDescripcion');
		$this->db->from('clientes');
		$this->db->join('tipos_documentos', 'tipos_documentos.docId = clientes.docId', 'left');
		$this->db->where(array('cliDefault' => 0));
		$query= $this->db->get();

		if ($query->num_rows()!=0)
		{
			return $query->result_array();
		}
		else
		{
			return false;
		}
	}

	function getCustomer($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$action = $data['act'];
			$idCust = $data['id'];

			$data = array();

			//Datos del usuario
			$query= $this->db->get_where('clientes',array('cliId'=>$idCust));
			if ($query->num_rows() != 0)
			{
				$c = $query->result_array();
				$data['customer'] = $c[0];
			} else {
				$cust = array();

				//select max id de cliente
				$this->db->select_max('cliId');
 				$query = $this->db->get('clientes');
 				$id = $query->result_array();
				$cust['cliId'] = $id[0]['cliId'] + 1;

				$cust['cliNombre'] = '';
				$cust['cliApellido'] = '';
				$cust['cliDocumento'] = '';
				$cust['cliDomicilio'] = '';
				$cust['cliTelefono'] = '';
				$cust['cliMail'] = '';
				$cust['cliEstado'] = '';
				$cust['cliDefault'] = false;
				$cust['docId'] = 1; //id tipo de documento DNI (DP)

				$data['customer'] = $cust;
			}

			//Readonly
			$readonly = false;
			if($action == 'Del' || $action == 'View'){
				$readonly = true;
			}
			$data['read'] = $readonly;

			//Tipos de Documento
			$this->db->order_by('docDescripcion');
			$query= $this->db->get_where('tipos_documentos',array('DP'));
			if ($query->num_rows() != 0)
			{
				$data['docs'] = $query->result_array();
			}
			return $data;
		}
	}

	function setCustomer($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
			$act = $data['act'];
			$name = $data['name'];
			$lnam = $data['lnam'];
			$doc = $data['doc'];
			$dni = $data['dni'];
			$mail = $data['mail'];
			$dom = $data['dom'];
			$tel = $data['tel'];
			$est = $data['est'];

			$data = array(
				   'docId' => $doc,
				   'cliDocumento' => $dni,
				   'cliNombre' => $name,
				   'cliApellido' => $lnam,
				   'cliDomicilio' => $dom,
				   'cliTelefono' => $tel,
				   'cliMail' => $mail,
				   'cliEstado' => $est
				);

			switch($act){
				case 'Add':
					//Agregar Cliente
					if($this->db->insert('clientes', $data) == false) {
						return false;
					}
					break;

				 case 'Edit':
				 	//Actualizar Cliente
				 	if($this->db->update('clientes', $data, array('cliId'=>$id)) == false) {
				 		return false;
				 	}
				 	break;

				 case 'Del':
				 	//Eliminar cliente
				 	if($this->db->delete('clientes', array('cliId'=>$id)) == false) {
				 		return false;
				 	}
				 	break;
			}
			return true;

		}
	}

	function DefaultCustomer(){
		$query= $this->db->get_where('clientes',array('cliDefault'=>1));
		if ($query->num_rows() != 0)
		{
			$c = $query->result_array();
			return $c[0];
		} else {
			return false;
		}
	}

	function CustomerById($id){
		$query= $this->db->get_where('clientes',array('cliId'=>$id));
		if ($query->num_rows() != 0)
		{
			$c = $query->result_array();
			return $c[0];
		} else {
			return false;
		}
	}

	function findCustomer($data = null){
	if($data == null)
	{
		return false;
	}
	else
	{
			$dni = str_replace(' ', '', $data['dni']);

			$this->db->select('c.cliNombre, c.cliApellido, c.cliDocumento, c.cliId, (SUM( IFNULL( cctepDebe, \'0\' ) ) - SUM( IFNULL( cctepHaber, \'0\' ) )) AS saldo');
			$this->db->from('clientes as c');
			$this->db->join('cuentacorrientecliente as cl', 'cl.cliId = c.cliId', 'left');
			$this->db->where(array('c.cliDocumento'=>$dni));
			$this->db->group_by('c.cliId');
			$query= $this->db->get();
			if ($query->num_rows() != 0)
			{
				$c = $query->result_array();

				$data['cliente'] = $c[0];
				return $data;
			} else {
				return false;
			}
		}
	}

	function findCustomerId($data = null){
	if($data == null)
	{
		return false;
	}
	else
	{
			$id = str_replace(' ', '', $data['id']);

			$this->db->select('clientes.cliNombre, clientes.cliApellido, clientes.cliDocumento, clientes.cliId');
			$this->db->from('clientes');
			$this->db->where(array('clientes.cliId'=>$id));
			$query= $this->db->get();
			if ($query->num_rows() != 0)
			{
				$c = $query->result_array();

				$data['cliente'] = $c[0];
				return $data;
			} else {
				return false;
			}
		}
	}

	function buscadorClientes($data = null){
		$str = '';
		if($data != null){
			$str = $data['str'];
		}

		$clientes = array();

		$this->db->select('
							c.cliId, 
							cliNombre, 
							c.cliApellido, 
							c.cliDocumento, 
							(select 
									SUM( IFNULL( cl.cctepDebe, \'0\' ) )
									 - 
									SUM( IFNULL( cl.cctepHaber, \'0\' ) ) 
							from 
									cuentacorrientecliente  as cl
							where 
									cl.cliId = c.cliId) AS saldo');
		$this->db->from('clientes as c');
		$this->db->like('c.cliNombre', $str, 'both');
		//$this->db->group_by('c.cliId');
		$this->db->or_like('c.cliApellido', $str, 'both');
		$this->db->or_like('c.cliDocumento', $str, 'both');
		$this->db->where(array('c.cliEstado'=>'AC', 'c.cliDocumento !=' =>''));
		$query = $this->db->get();
		if ($query->num_rows()!=0)
		{
			$clientes = $query->result_array();
			return $clientes;
		}

		return array();
	}
}
?>
