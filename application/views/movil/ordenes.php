<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Ventas</h3>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="groups" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th style="width: 1%">Descargar</th>
                <th style="width: 1%">Orden</th>
                <th>Cliente</th>
              </tr>
            </thead>
            <tbody>
              <?php
              	foreach($list as $v)
		        {
                    echo '<td>';
                	echo '<i class="fa fa-fw fa-download" style="color: #00c0ef; cursor: pointer; margin-left: 15px;" onclick="descargar('.$v['oId'].',\'Edit\')"></i>';
                    
                    echo '</td>';
                    echo '<td style="text-align: left">'.$v['oId'].'</td>';
                    echo '<td style="text-align: left">'.$v['cliApellido'].' '.$v['cliNombre'].'</td>';
                    echo '</tr>';
		        }
              ?>
            </tbody>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->
<a href="http://192.168.5.108/afernandez/assets/reports/orders_minorista/208_1553097407.pdf" id="hreff" target="_blank" download>x</a>
<script>
jQuery(document).ready(function($) {
   $('a[href$=".pdf"]')
        .attr('download', '')
        .attr('target', '_blank'); 
});

  $(function () {
    $('#ventas').DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": false,
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
          }
      });
  });

  function descargar(id_){
    WaitingOpen('Generando Comprobante');
    $.ajax({
        type: 'POST',
        data: null,
        url: 'printComprobante/'+id_,
        success: function(result){
            debugger;
            WaitingClose();
            $('#hreff').attr("href",'http://192.168.1.100/afernandez/assets/reports/orders_minorista/'+id_+'.pdf');
            $( "#hreff" ).trigger( "click" );
        },
        error: function(result){
            WaitingClose();
            $('#hreff').attr("href",'http://192.168.1.100/afernandez/assets/reports/orders_minorista/'+id_+'.pdf');
            $( "#hreff" ).trigger( "click" );
            ProcesarError(result.responseText, 'modalRubro');
        },
        dataType: 'json'
    });
  }

  $('#hreff').click(function(){
    event.preventDefault();  
    window.location.href = $(this).attr('href');
  })
  </script>