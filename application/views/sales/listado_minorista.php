<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Ventas Minoristas</h3>
          <?php
          /*
          if (strpos($permission,'Add') !== false) {
            echo '<button class="btn btn-block btn-success" style="width: 100px; margin-top: 10px;" data-toggle="modal" onclick="LoadCust(0,\'Add\')" id="btnAdd">Agregar</button>';
          }
          */
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="customers" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center">Acciones</th>
                <th>Nº Orden</th>
                <th>Fecha</th>
                <th>Estado</th>
                <th class="text-center">-</th>
              </tr>
            </thead>
            <tbody>             
            </tbody>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<script>
  $(function () {
    //$("#groups").DataTable();
    $('#customers').DataTable({
        'processing':true,
        'serverSide':true,
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "language": {
                "lengthMenu": "Ver _MENU_ filas por página",
                "zeroRecords": "No hay registros",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "No hay registros disponibles",
                "infoFiltered": "(filtrando de un total de _MAX_ registros)",
                "sSearch": "Buscar:  ",
                "oPaginate": {
                    "sNext": "Sig.",
                    "sPrevious": "Ant."
                }
        },
        'columns':[
            {className:'text-center'},
            null,
            null,
            null,
            {className:'text-center'},
        ],
        ajax:{
            'dataType': 'json',
            'method': 'POST',
            'url':'sale/datatable_minorista',
            'dataSrc': function(response){
                console.log(response);
                console.log(response.data);
                var output = [];
                var permission = $("#permission").val();
                $.each(response.data,function(index,item){
                    var col1,col2,col3,col4, col5='';                    
                    col1='';
                    col1+='<i class="fa fa-fw fa-print" style="color: #A4A4A4; cursor: pointer; margin-left: 15px;" onclick="Print('+item.ocId+')"></i>';

                    /*if(permission.indexOf("Edit")>0  && item.ocEstado=='AC'){
                        col1+='<i  class="fa fa-fw fa-pencil" style="color: #f39c12; cursor: pointer; margin-left: 15px;" onclick="LoadOrder('+item.ocId+',\'Edit\')"></i>';
                    }

                    if(permission.indexOf("Del")>0){
                        col1+='<i  class="fa fa-fw fa-times-circle" style="color: #dd4b39; cursor: pointer; margin-left: 15px;" onclick="LoadOrder('+item.ocId+',\'Del\')"></i>';
                    }

                    if(permission.indexOf("View")>0){
                        col1+='<i  class="fa fa-fw fa-search" style="color: #3c8dbc; cursor: pointer; margin-left: 15px;" onclick="LoadOrder('+item.ocId+',\'View\')"></i>';
                    }*/


                    col2=item.oId;
                    col3=item.oFecha;
                    switch(item.oEstado){
                        case 'AC':{
                            col4='<small class="label pull-left bg-green">Activa</small>';
                            break;
                        }
                        case 'IN':{
                            col4='<small class="label pull-left bg-red">Activa</small>';
                            break;
                        }
                        case 'FA':{
                            col4='<small class="label pull-left bg-blue">Activa</small>';
                            break;
                        }
                        default:{
                            col4='';
                            break;
                        }
                    }
                    //col4=item.oEstado;
                    col5= (item.oEsPresupuesto==0)?'<i class="fa fa-tag"/>':' ';
                    output.push([col1,col2,col3,col4,col5]);
                });
                return output;
            },
            error: function(error){
                console.debug(error);
            }
        }
    });
  });

  var idCli = 0;
  var acCli = '';

  function LoadCust(id_, action){
  	idCli = id_;
  	acCli = action;
  	LoadIconAction('modalAction',action);
  	WaitingOpen('Cargando Cliente');
      $.ajax({
          	type: 'POST',
          	data: { id : id_, act: action },
    		url: 'index.php/customer/getCustomer',
    		success: function(result){
			                WaitingClose();
			                $("#modalBodyCustomer").html(result.html);
			                setTimeout("$('#modalCustomer').modal('show')",800);
    					},
    		error: function(result){
    					WaitingClose();
    					alert("error");
    				},
          	dataType: 'json'
    		});
  }
    

  $('#btnSave').click(function(){

  	if(acCli == 'View')
  	{
  		$('#modalCustomer').modal('hide');
  		return;
  	}

  	var hayError = false;
    if($('#cliId').val() == '')
    {
    	hayError = true;
    }

    if($('#cliNombre').val() == '')
    {
      hayError = true;
    }

    if($('#cliApellido').val() == '')
    {
      hayError = true;
    }

    if($('#cliDocumento').val() == '')
    {
      hayError = true;
    }


    if(hayError == true){
    	$('#errorCust').fadeIn('slow');
    	return;
    }

    $('#errorCust').fadeOut('slow');
    WaitingOpen('Guardando cambios');
    	$.ajax({
          	type: 'POST',
          	data: {
                    id : idCli,
                    act: acCli,
                    name: $('#cliNombre').val(),
                    lnam: $('#cliApellido').val(),
                    doc: $('#docId').val(),
                    dni: $('#cliDocumento').val(),
                    mail: $('#cliMail').val(),
                    dom: $('#cliDomicilio').val(),
                    tel: $('#cliTelefono').val(),
                    est: $('#cliEstado').val()
                  },
    		url: 'index.php/customer/setCustomer',
    		success: function(result){
                			WaitingClose();
                			$('#modalCustomer').modal('hide');
                			setTimeout("cargarView('customer', 'index', '"+$('#permission').val()+"');",1000);
    					},
    		error: function(result){
    					WaitingClose();
    					alert("error");
    				},
          	dataType: 'json'
    		});
  });

</script>

<style type="text/css">
    .contenedor{ width: 350px; float: center;}
    #camara, #foto, #imgCamera{
        width: 320px;
        min-height: 240px;
        border: 1px solid #008000;
    }
</style>

<!-- Modal -->
<div class="modal fade" id="modalCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Cliente</h4>
      </div>
      <div class="modal-body" id="modalBodyCustomer">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
      </div>
    </div>
  </div>
</div>
