<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title" style="color: #00a65a"><strong>Nueva Venta <i class="fa fa-fw fa-cart-plus"></i></strong></h3>
          <i class="fa fa-fw fa-close text-red pull-right" onclick="cargarView('dash', 'accesosdirectos', '')" style="cursor: pointer"></i>
        </div><!-- /.box-header -->
        <div class="box-body">
        	<div class="row">
        		<!-- Lista de Precios y Cliente -->
        		<div class="col-xs-6">
        			<!-- Listas de Precios -->
        			<div class="row">
        				<div class="col-xs-4">
	        				<label style="margin-top: 7px">Lista de Precios</label>
		        		</div>
		        		<div class="col-xs-8">
		        			<select class="form-control" id="lpId">
						      <?php foreach ($lists as $key => $item):?>
						        <option value="<?php echo $item['lpId'];?>" data-porcent="<?php echo $item['lpMargen'];?>" <?php echo $item['lpDefault'] == true ?'selected':''?> ><?php echo $item['lpDescripcion'];?> </option>
						      <?php endforeach;?>
						    </select>
		        		</div>
        			</div><br>
        			<!-- Cliente -->
              <div class="box box-default box-solid" style="padding: 5px;">
          			<div class="row">
          				<div class="col-xs-4">
  	        				<label style="margin-top: 7px">Cliente</label>
  		        		</div>
  		        		<div class="col-xs-4">
  						      <input type="number" id="cliSearch" class="form-control" >
  		        		</div>
                  <div class="col-xs-1">
                    <i class="fa fa-fw fa-search text-teal" style="margin-top: 12px; cursor: pointer;" id="buscador"></i>
                  </div>
                  <div class="col-xs-3">
                    <label style="margin-top: 7px; color: red;" id="saldoCtaCte">$ 0.00</label>
                  </div>
          			</div>
                <div class="row">
          				<div class="col-xs-4">
  	        				<label style="margin-top: 7px">Nombre y DNI: </label>
  		        		</div>
  		        		<div class="col-xs-6">
  						      <label style="margin-top: 7px;" class="text-maroon" id="lblNombre"><?php echo $final['cliNombre'].' '.$final['cliApellido'];?> </label>
  		        		</div>
                  <div class="col-xs-2">
  	        				<label style="margin-top: 7px" id="lblDocumento"><?php echo $final['cliDocumento'];?> </label>
  		        		</div>
          			</div>
                <input type="hidden" id="cliId" value="<?php echo $final['cliId'];?>">
              </div>
              <!-- Vendedor -->
              <div class="row">
        				<div class="col-xs-4">
	        				<label style="margin-top: 7px">Vendedor</label>
		        		</div>
		        		<div class="col-xs-8">
                  <select class="form-control select2" id="venId">
                    <option id="-1" selected></option>
						      <?php foreach ($vendedores as $key => $item):?>
						        <option value="<?php echo $item['id'];?>"><?php echo $item['codigo'].' - '.$item['nombre'];?> </option>
						      <?php endforeach;?>
						    </select>
		        		</div>
        			</div> <br>
	        	</div>
            <!-- Total Venta -->
            <div class="col-xs-6">
              <div class="box box-success box-solid">
                  <div class="box-header with-border">
                    <h3 class="box-title">Total $:</h3>
                    <!-- /.box-tools -->
                  </div>
                  <!-- /.box-header -->
                  <div class="box-body" style="text-align: center">
                    <strong class="text-green"><h1 id="totalSale">0,00</h1></strong>
                  </div>
                  <div style="text-align: right; padding: 5px;">
                    <button type="button" class="btn btn-warning" style="float: left" id="btnServicePresupuesto">Presupuesto</button>
                    <button type="button" class="btn btn-primary" id="btnServiceEfectivo">Efectivo</button>
                    <button type="button" class="btn btn-success" id="btnServiceBuy">Cobrar</button>
                  </div>
              </div>
            </div>
        	</div>
        	<!-- Buscador -->
        	<div class="row">
        		<div class="col-xs-12">
        			<div class="box box-default box-solid">
			            <div class="box-header with-border">
			              <h3 class="box-title">Buscador de Artículos</h3>
			              <!-- /.box-tools -->
			            </div>
			            <!-- /.box-header -->
			            <div class="box-body" id="divBuscador">
			            	<div class="row">
				                <div class="col-xs-1">
				                   <button class="btn btn-block btn-warning" id="btnManualArt"><i class="fa fa-fw fa-hand-paper-o"></i></button>
				                </div>
				                <div class="col-xs-1" style="margin-top: 7px; text-align: right;">
				                    <label>Producto</label>
				                </div>
				                <div class="col-xs-4">
				                    <input type="hidden" class="form-control" id="prodId">
				                    <input type="text" class="form-control" id="lblProducto">
				                </div>
				                <div class="col-xs-2">
				                    <input type="number" class="form-control" placeholder="Cantidad" id="prodCant" value="1">
				                </div>
                        <div class="col-xs-1 text-center">
                          <small id="stockLbl" style="display:block">Stock <br>
                            <b id="stockReal">-</b>
                          </small>
                        </div>
                        <div class="col-xs-2">
				                    <label style="margin-top: 7px" id="prodPrecio" class="pull-right">$0,00 </label>
				                </div>
				                <div class="col-xs-1">
				                  <button class="btn btn-block btn-success" id="btnAddArticles">  <i class="fa fa-fw fa-check"></i></button>
				                </div>
				            </div>
			            </div>
			        </div>
        		</div>
        	</div>
        	<!-- Detalle y Total -->
        	<div class="row">
        		<div class="col-xs-12">
        			<div class="box box-warning box-solid">
			            <div class="box-header with-border">
			              <h3 class="box-title">Detalle</h3>
			              <!-- /.box-tools -->
			            </div>
			            <!-- /.box-header -->
			            <div class="box-body">
			            	<table class="table table-bordered table-hover" id="detailSale">
			            		<thead>
				            		<tr>
				            			<th style="width: 5%"></th>
				            			<th style="width: 10%">Código</th>
				            			<th>Descripción</th>
				            			<th style="width: 5%; text-align: center;">Cantidad</th>
				            			<th style="width: 10%; text-align: center;">Precio</th>
				            			<th style="width: 15%; text-align: center;">Total</th>
                          <th style="width: 5%; text-align: center;">-</th>
				            		</tr>
				            	</thead>
				            	<tbody>

								</tbody>
			            	</table>
			            </div>
			        </div>
        		</div>
        	</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Modal -->
<div class="modal fade" id="modalArtManual" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalActionManual"> </span> Artículo Manual</h4>
      </div>
      <div class="modal-body" id="modalBodyArtManual">
        <div class="box-body">
          <div class="row">
            <div class="col-xs-12">
              <div class="alert alert-danger alert-dismissable" id="errorManual" style="display: none">
                    <h4><i class="icon fa fa-ban"></i> Error!</h4>
                    Revise que todos los campos esten completos
                </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-3">
              <label style="margin-top: 7px;">Artículo <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-8">
              <input type="text" class="form-control" maxlength="100" id="artMdescripcion" value="" >
            </div>
          </div><br>
          <div class="row">
            <div class="col-xs-3">
              <label style="margin-top: 7px;">Precio <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-8">
              <input type="text" class="form-control" id="artMprecio" value="" >
            </div>
          </div><br>
          <div class="row">
            <div class="col-xs-3">
              <label style="margin-top: 7px;">Cantidad <strong style="color: #dd4b39">*</strong>: </label>
            </div>
            <div class="col-xs-8">
              <input type="number" class="form-control" id="artMcantidad" value="" >
            </div>
          </div><br>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="btnAddManualArt">Agregar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Medios de Pago -->
<div class="modal fade" id="modalMedios" tabindex="3000" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"><span> <i class="fa fa-fw fa-money" style="color: #00a65a;"> </i> </span> Medios de Pago</h4>
      </div>
      <div class="modal-body" id="modalBodyMedios">
          <table style="width:100%; border-collapse:separate; border-spacing:0 5px;">
            <!-- Efectivo -->
            <tr>
              <td style="width:60%; text-align: right;">Efectivo</td>
              <td style="width:1%; padding-left:5px; padding-right:5px;">$</td>
              <td><input type="text" class="form-control calcula" id="efectivo" value="" ></td>
            </tr>
            <!-- Visa -->
            <tr>
              <td style="width:60%; text-align: right;">Visa</td>
              <td style="width:1%; padding-left:5px; padding-right:5px;">$</td>
              <td><input type="text" class="form-control calcula" id="visa" value="" ></td>
            </tr>
            <!-- MasterCard -->
            <tr>
              <td style="width:60%; text-align: right;">MasterCard</td>
              <td style="width:1%; padding-left:5px; padding-right:5px;">$</td>
              <td><input type="text" class="form-control calcula" id="mastercard" value="" ></td>
            </tr>
            <!-- Nevada -->
            <tr>
              <td style="width:60%; text-align: right;">Naranja</td>
              <td style="width:1%; padding-left:5px; padding-right:5px;">$</td>
              <td><input type="text" class="form-control calcula" id="nevada" value="" ></td>
            </tr>
            <!-- Data -->
            <tr>
              <td style="width:60%; text-align: right;">Data</td>
              <td style="width:1%; padding-left:5px; padding-right:5px;">$</td>
              <td><input type="text" class="form-control calcula" id="data" value="" ></td>
            </tr>
            <!-- Cuenta Corriente -->
            <tr>
              <td style="width:60%; text-align: right;">Cuenta Corriente</td>
              <td style="width:1%; padding-left:5px; padding-right:5px;">$</td>
              <td><input type="text" class="form-control calcula" id="cuentacorriente" value="" ></td>
            </tr>
            <!-- Credito Argentino -->
            <tr>
              <td style="width:60%; text-align: right;">Crédito Argentino</td>
              <td style="width:1%; padding-left:5px; padding-right:5px;">$</td>
              <td><input type="text" class="form-control calcula" id="creditoargentino" value="" ></td>
            </tr>
          </table>
          <hr>
          <table style="width:100%; ">
            <!-- Total -->
            <tr>
              <td style="width:60%; text-align: right; padding-top: 7px;">Total</td>
              <td style="width:1%; padding-left:5px; padding-right:5px; padding-top: 7px;">$</td>
              <td style="text-align: right;"><strong class="text-green"><h1 style="margin-top:1px; margin-buttom: 1px;" id="totalSaleMedios">0,00</h1></strong></td>
            </tr>
            <!-- Sus Pagos -->
            <tr>
              <td style="width:60%; text-align: right; padding-top: 7px;">Sus Pagos (-)</td>
              <td style="width:1%; padding-left:5px; padding-right:5px; padding-top: 7px;">$</td>
              <td style="text-align: right;"><strong class="text-blue"><h1 style="margin-top:1px; margin-buttom: 1px;" id="totalPagosMedios">0,00</h1></strong></td>
            </tr>
            <!-- Descuento -->
            <tr>
              <td style="width:60%; text-align: right;">Descuento (-)</td>
              <td style="width:1%; padding-left:5px; padding-right:5px;">$</td>
              <td><input type="text" class="form-control calcula" id="descuento" value="" ></td>
            </tr>
            <!-- Saldo -->
            <tr>
              <td style="width:60%; text-align: right; padding-top: 7px;">Saldo</td>
              <td style="width:1%; padding-left:5px; padding-right:5px; padding-top: 7px;">$</td>
              <td style="text-align: right;"><strong class="text-red"><h1 style="margin-top:1px; margin-buttom: 1px;" id="totalSaldoMedios">0,00</h1></strong></td>
            </tr>
          </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnPago">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Cliente -->
<div class="modal fade" id="modalCli" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabelCli"><span id="modalActionCli"> </span> Cliente</h4>
      </div>
      <div class="modal-body" id="modalBodyCli">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSaveCustomer">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Confirmar Impresion -->
<div class="modal fade" id="modalConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><span> <i class="fa fa-fw fa-warning"></i> Importante </span> !!</h4>
      </div>
      <div class="modal-body" style="text-align: center">
          <p> ¿Desea imprimir el comprobante ? </p>
          <button type="button" class="btn btn-default" onClick="btnNo()">No</button>
          <button type="button" class="btn btn-primary" onClick="imprimirDirecto()">Si</button>
      </div>
    </div>
  </div>
</div>

<script>
$("#artMprecio").maskMoney({allowNegative: false, thousands:'', decimal:'.'});
//$("#artMcantidad").maskMoney({allowNegative: false, thousands:'', decimal:'.'});
//$("#prodCant").maskMoney({allowNegative: false, thousands:'', decimal:'.'});
$(".select2").select2();

setTimeout("$('#venId').select2('open');",800);
$('#venId').on("select2:select", function(e) {
   $('#lblProducto').focus();
});

Calcular();

function Calcular(){
	var table = $('#detailSale > tbody> tr');
	var total = 0;
	table.each(function(r) {
	  total += parseFloat(this.children[5].textContent);
	});

	$('#totalSale').html(parseFloat(total).toFixed(2));
}

var rowY = 8000;
var pagos = [];

$('#btnManualArt').click(function(){
  LoadIconAction('modalActionManual','Add');
  $('#artMdescripcion').val('');
  $('#artMprecio').val('');
  $('#artMcantidad').val('');
  $('#modalArtManual').modal('show');
  setTimeout("$('#artMdescripcion').focus();",800);
});

$('#btnAddManualArt').click(function(){
  var pVenta = parseFloat($('#artMprecio').val()).toFixed(2);
  html = '<tr id="'+rowY+'">';
  html+= '<td style="text-align: center; cursor: pointer;" onclick="delete_('+rowY+')"><i class="fa fa-fw fa-close" style="color: #dd4b39"></i></td>';
  html+= '<td>-</td>';
  html+= '<td>'+$('#artMdescripcion').val()+'</td>';
  html+= '<td style="text-align: right">'+$('#artMcantidad').val()+'</td>';
  html+= '<td style="text-align: right">'+parseFloat(pVenta).toFixed(2)+'</td>';
  html+= '<td style="text-align: right">'+parseFloat(pVenta * $('#artMcantidad').val()).toFixed(2)+'</td>';
  html+= '<td style="display: none">-</td>';
  html+= '<td style="display: none">'+pVenta+'</td>';
  html+= '<td style="display: none">0</td>';
  html+= '<td style="display: none">'+pVenta+'</td>';
  html+= '<td >';
  html+=     '<small style="cursor: pointer;" class="label pull-left bg-green" onclick="sumar('+rowY+')">+</small>';
  html+=     '<small style="cursor: pointer;" class="label pull-right bg-red" onclick="restar('+rowY+')">-</small>';
  html+= '</td>';
  html+= '</tr>';
  rowY++;
  $('#detailSale > tbody').append(html);
  setTimeout("$('#lblProducto').focus();",800);
  Calcular();
  $('#modalArtManual').modal('hide');
});

function delete_(id){
  $('#'+id).remove();
  Calcular();
  $('#lblProducto').focus();
}

$('#lblProducto').keyup(function(e){
  var code = e.which;
  if(code==13){
    e.preventDefault();
    if($('#lblProducto').val() != '' && $('#lblProducto').val().length >= 3){
      $('#lblProducto').prop('disabled', true);
      BuscarCompleto();
    }
  }
});

function BuscarCompleto(){
   buscadorArticlesPrice($('#lblProducto').val(), $('#prodId'), $('#lblProducto'), $('#prodCant'), $('#prodPrecio'));
}

$('#prodCant').keyup(function(e) {
  var code = e.which;
  if(code==13){
    if(parseFloat($('#prodCant').val()) > 0){
      $('#btnAddArticles').focus();
    }
  }
});

$('#btnAddArticles').click(function(){
  AgregaraOrden();
});

function AgregaraOrden(){
    if(
    $('#prodId').val() != '' &&
    parseFloat($('#prodCant').val()) > 0
    ) {
    WaitingOpen('Agregando producto');
    $.ajax({
          type: 'POST',
          data: {
                  id : $('#prodId').val()
                },
          url: 'index.php/article/getArticleJson',
          success: function(result){
                        var pVenta = calcularPrecioInterno(result.article).toFixed(2);
                        var selected = $('#lpId').find('option:selected');
                        var margin = parseFloat(selected.data('porcent'));
                        //calcular precio de venta
                        pVenta = parseFloat(pVenta);
                        var pVentaOriginal = pVenta;
                        if(margin > 0){
                          //console.debug(" =>>> %o * ( %o ) / 100: ",pVenta,margin,(pVenta * (margin / 100)));
                          pVenta += pVenta * (margin / 100);
                        }
                        html = '<tr id="'+rowY+'">';
                        html+= '<td style="text-align: center; cursor: pointer;" onclick="delete_('+rowY+')"><i class="fa fa-fw fa-close" style="color: #dd4b39"></i></td>';
                        html+= '<td>'+result.article.artBarCode+'</td>';
                        html+= '<td>'+result.article.artDescription+'</td>';
                        html+= '<td style="text-align: right">'+parseFloat($('#prodCant').val()).toFixed(2)+'</td>';
                        html+= '<td style="text-align: right">'+parseFloat(pVenta).toFixed(2)+'</td>';
                        html+= '<td style="text-align: right">'+parseFloat(pVenta * parseFloat($('#prodCant').val())).toFixed(2)+'</td>';
                        html+= '<td style="display: none">'+result.article.artId+'</td>';
                        html+= '<td style="display: none">'+(result.article.artCosteIsDolar == "1" ? result.article.artCoste * result.article.dolar : result.article.artCoste)+'</td>';
                        html+= '<td style="display: none">1</td>';
                        html+= '<td style="display: none">'+pVentaOriginal+'</td>';
                        html+= '<td >';
                        html+=     '<small style="cursor: pointer;" class="label pull-left bg-green" onclick="sumar('+rowY+')">+</small>';
                        html+=     '<small style="cursor: pointer;" class="label pull-right bg-red" onclick="restar('+rowY+')">-</small>';
                        html+= '</td>';
                        html+= '</tr>';
                        rowY++;
                        $('#detailSale > tbody').append(html);
                        $('#prodId').val('');
                        $('#prodCant').val('1');
                        $('#lblProducto').val('');
                        $('#lblProducto').focus();
                        Calcular();
                        WaitingClose();
                },
          error: function(result){
                WaitingClose();
                ProcesarError(result.responseText, 'modalNo');
              },
              dataType: 'json'
          });
  }
}

function sumar(row){
  var row_ = $('#'+row);
  row_[0].children[3].textContent = parseFloat(parseFloat(row_[0].children[3].textContent) + parseFloat(1)).toFixed(2);
  row_[0].children[5].textContent = parseFloat(parseFloat(row_[0].children[4].textContent) * parseFloat(row_[0].children[3].textContent)).toFixed(2);
  Calcular();
}

function restar(row){
  var row_ = $('#'+row);
  if(parseFloat(row_[0].children[3].textContent) > 1){
    row_[0].children[3].textContent = parseFloat(parseFloat(row_[0].children[3].textContent) - parseFloat(1)).toFixed(2);
    row_[0].children[5].textContent = parseFloat(parseFloat(row_[0].children[4].textContent) * parseFloat(row_[0].children[3].textContent)).toFixed(2);
    Calcular();
  }
}

/********************************* Cobrar Venta *******************************/
$('#btnServiceBuy').click(function(){
  if($('#venId').val() == 0 || $('#venId').val() == undefined || $('#venId').val() == -1)
    return false;
  var importeVenta = parseFloat($('#totalSale').html());
  if(importeVenta > 0){
    //Clean medios
    if($('#cliId').val() == '1'){
      //Consumidor final
      $('#cuentacorriente').prop("disabled", true);
    } else {
      $('#cuentacorriente').prop("disabled", false);
    }
    cobrarMedios(null, importeVenta, 1);
  }
});

// function SumarPagos(){
//   var efectivo = parseFloat($('#efectivo').val() == '' ? 0 : ($('#efectivo').val().replace('.','')).replace(',','.'));
//   var visa = parseFloat($('#visa').val() == '' ? 0 : ($('#visa').val().replace('.','')).replace(',','.'));
//   var mastercard = parseFloat($('#mastercard').val() == '' ? 0 : ($('#mastercard').val().replace('.','')).replace(',','.'));
//   var nevada = parseFloat($('#nevada').val() == '' ? 0 : ($('#nevada').val().replace('.','')).replace(',','.'));
//   var data = parseFloat($('#data').val() == '' ? 0 : ($('#data').val().replace('.','')).replace(',','.'));
//   var cuentacorriente = parseFloat($('#cuentacorriente').val() == '' ? 0 : ($('#cuentacorriente').val().replace('.','')).replace(',','.'));
//   var creditoargentino = parseFloat($('#creditoargentino').val() == '' ? 0 : ($('#creditoargentino').val().replace('.','')).replace(',','.'));

//   $('#totalPagosMedios').html(parseFloat(efectivo + visa + mastercard + nevada + data + cuentacorriente + creditoargentino).toFixed(2));
// }

// function CalcularMediosDePago(){
//   SumarPagos();
//   var total = parseFloat($('#totalSaleMedios').html());
//   var pagos = parseFloat($('#totalPagosMedios').html());
//   var descuento = parseFloat($('#descuento').val() == '' ? 0 : ($('#descuento').val().replace('.','')).replace(',','.'));

//   $('#totalSaldoMedios').html(parseFloat(parseFloat(total) - parseFloat(pagos) - parseFloat(descuento)).toFixed(2));
//   if(parseFloat(parseFloat(total - pagos).toFixed(2) - descuento) != 0){
//     $('#btnPago').prop("disabled", true);
//   } else {
//     $('#btnPago').prop("disabled", false);
//   }
// }

// $('.calcula').keyup(function() {
//   CalcularMediosDePago();
// });
/****************************** Fin Cobrar Venta ******************************/

  $(function(){
    $('#lpId').on('change',function(){
      //debugger;
      var selected = $('#lpId').find('option:selected');
      var margin = parseFloat(selected.data('porcent'));

      var table = $('#detailSale > tbody> tr');
      var detalle = [];
      table.each(function(r) {

          var srvdCant=       parseFloat(this.children[3].textContent);
          var artCosto=       parseFloat(this.children[7].textContent);
          var artventa=       parseFloat(this.children[9].textContent);
          //artventa:       parseFloat(this.children[4].textContent),
          if(margin > 0){
            artventa += artventa * (margin / 100);
          }

          if(margin <0){
            margin  *= -1;
            artventa -= artventa * (margin / 100);
          }

          this.children[4].textContent = parseFloat(artventa).toFixed(2);
          this.children[5].textContent = parseFloat(parseFloat(artventa).toFixed(2) * srvdCant).toFixed(2);
      });

      Calcular();
    });


    $("#lpId").trigger("change");

  });

  $('#cliSearch').keypress(function(e){
    var code = e.which;
      if(code==13){
        BuscarCliente();
      }
  });

  $('#buscador').click(function(){
    buscadorClientes($('#lblNombre'),$('#lblDocumento'), $('#cliId'), $('#saldoCtaCte'));
  });

  //Buscador de cliente
  function BuscarCliente(){
    if($('#cliSearch').val()) {
      //Buscar datos por dni
      WaitingOpen('Buscando Cliente');
      $.ajax({
            type: 'POST',
            data: { dni : $('#cliSearch').val() },
        url: 'index.php/customer/findCustomer',
        success: function(result){
                      WaitingClose();
                      if(!result){
                        $('#lblNombre').html('-');
                        $('#lblDocumento').html('-');
                        $('#cliId').val(-1);
                        $('#saldoCtaCte').html('$ 0.00');
                        CargarModalNuevoCliente($('#cliSearch').val());
                      } else {
                        $('#lblNombre').html(result.cliente.cliApellido +  ' ' + result.cliente.cliNombre);
                        $('#lblDocumento').html(result.cliente.cliDocumento);
                        $('#cliId').val(result.cliente.cliId);
                        $('#cliSearch').val('');
                        if(parseFloat(result.cliente.saldo) <0){
                          $('#saldoCtaCte').html('$ 0.00');
                        }else{
                          $('#saldoCtaCte').html('$ '+ parseFloat(result.cliente.saldo).toFixed(2));
                        }
                        setTimeout("$('#venId').select2('open');",800);
                      }
              },
        error: function(result){
              WaitingClose();
              ProcesarError(result.responseText, 'modalCli');
            },
            dataType: 'json'
        });
    }

  //setTimeout("$('#modalCli').modal('show');",1000);
  function CargarModalNuevoCliente(dni){
      LoadIconAction('modalActionCli','Add');
      WaitingOpen('Espere...');
      $.ajax({
            type: 'POST',
            data: {id : -1, act: 'Add'},
            url: 'index.php/customer/getCustomer',
            success: function(result){
                    WaitingClose();
                    $("#modalBodyCli").html(result.html);
                    setTimeout("$('#modalCli').modal('show');",800);
                    setTimeout("$('#cliDocumento').val('"+dni+"');", 1000);
                    setTimeout("$('#cliNombre').focus();", 2000);
                  },
            error: function(result){
                  WaitingClose();
                  ProcesarError(result.responseText, 'modalCli');
                },
                dataType: 'json'
        });
  }
}

$('#btnSaveCustomer').click(function(){

  var hayError = false;
  var error_message="";

  if($('#cliNombre').val() == '')
  {
    hayError = true;
    error_message += " * Por Favor, debe Ingresar un Nombre. <br> ";
  }

  if($('#cliApellido').val() == '')
  {
    hayError = true;
    error_message += " * Por Favor, debe Ingresar un Apellido. <br> ";
  }

  if($('#cliDocumento').val() == '')
  {
    hayError = true;
    error_message += " * Por Favor, debe Ingresar un Número de Documento. ";
  }

  if(hayError == true){
    $("#errorCust").find("p").html(error_message);
    $('#errorCust').fadeIn('slow');
    setTimeout("$('#errorCust').fadeOut('slow');",2000);
    return false;
  }

  WaitingOpen('Guardando cambios');
    $.ajax({
          type: 'POST',
          data: {
                  id : -1,
                  act: 'Add',
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
                    $('#modalCli').modal('hide');
                    $('#cliSearch').val($('#cliDocumento').val());
                    BuscarCliente();
            },
      error: function(result){
            WaitingClose();
            alert("error");
          },
          dataType: 'json'
      });
});

$('#btnServicePresupuesto').click(function(){
  if(parseFloat($('#totalSale').html()) > 0){
    Cobrar_(0);
  }
});

$('#btnPago').click(function(){
  if(parseFloat($('#totalSale').html()) > 0){
    Cobrar_(1);
  }
});

$('#btnServiceEfectivo').click(function(){
//   $('#efectivo').val($('#totalSale').html().replace('.',','));
  CobrarEfectivo();
 });

// function Cobrar_xx(esPresupuesto){
//   if($('#venId').val() == 0 || $('#venId').val() == undefined || $('#venId').val() == -1)
//     return false;
//   //Barrer Informacion
//   //Id de la operación
//   var opId = -1;
//   //Lista de Precio y su porcentaje-----------------------
//   var selected = $('#lpId').find('option:selected');
//   var lp = {
//             id:   $('#lpId').val(),
//             por:  parseFloat(selected.data('porcent'))
//           };
//   //Cliente-----------------------------------------------
//   var cli = {
//               id: $('#cliId').val()
//           };
//   //Vendedor----------------------------------------------
//   var ven = {
//               id:  $('#venId').val()
//             };
//   //Detalle de la compra-----------------------------------
//   var table = $('#detailSale > tbody> tr');
//   var detalle = [];
//   table.each(function(r) {
//     var object = {
//       artId:          (this.children[6].textContent == '-' ? '-' : parseInt(this.children[6].textContent)),
//       cant:           parseFloat(this.children[3].textContent),
//       artDescripcion: this.children[2].textContent,
//       artCosto:       parseFloat(this.children[7].textContent),
//       artventa:       parseFloat(this.children[4].textContent),
//       artventaSD:     parseFloat(this.children[9].textContent), //Venta sin descuentos
//       artCode:        this.children[1].textContent,
//       actualizaStock: parseInt(this.children[8].textContent)
//     };
//     detalle.push(object);
//   });
//   //Medios de Pago-----------------------------------------
//   var medios = [];
//   if(esPresupuesto == 0){
//     var med;
//     //Efectivo
//     if($('#efectivo').val() != ''){
//       med = {
//         id: 1,
//         imp: parseFloat(($('#efectivo').val().replace('.','')).replace(',','.'))
//       };
//       medios.push(med);
//     }
//     //Visa
//     if($('#visa').val() != ''){
//       med = {
//         id: 2,
//         imp: parseFloat(($('#visa').val().replace('.','')).replace(',','.'))
//       };
//       medios.push(med);
//     }
//     //MasterCard
//     if($('#mastercard').val() != ''){
//       med = {
//         id: 3,
//         imp: parseFloat(($('#mastercard').val().replace('.','')).replace(',','.'))
//       };
//       medios.push(med);
//     }
//     //Nevada
//     if($('#nevada').val() != ''){
//       med = {
//         id: 4,
//         imp: parseFloat(($('#nevada').val().replace('.','')).replace(',','.'))
//       };
//       medios.push(med);
//     }
//     //Data
//     if($('#data').val() != ''){
//       med = {
//         id: 5,
//         imp: parseFloat(($('#data').val().replace('.','')).replace(',','.'))
//       };
//       medios.push(med);
//     }
//     //CuentaCorriente
//     if($('#cuentacorriente').val() != ''){
//       med = {
//         id: 7,
//         imp: parseFloat(($('#cuentacorriente').val().replace('.','')).replace(',','.'))
//       };
//       medios.push(med);
//     }
//     //CreditoArgentino
//     if($('#creditoargentino').val() != ''){
//       med = {
//         id: 6,
//         imp: parseFloat(($('#creditoargentino').val().replace('.','')).replace(',','.'))
//       };
//       medios.push(med);
//     }
//     //Descuento--------------------------------------------
//     var desc = parseFloat($('#descuento').val() == '' ? 0 : ($('#descuento').val().replace('.','')).replace(',','.'));
//   } else {
//     var desc = 0;
//   }

//   WaitingOpen('Guardando venta');
//     $.ajax({
//           type: 'POST',
//           data: {
//                   lpr:      lp,
//                   clie:     cli,
//                   vend:     ven,
//                   medi:     medios,
//                   des:      desc,
//                   det:      detalle,
//                   esPre:    esPresupuesto,
//                   oId:      opId
//                 },
//       url: 'index.php/sale/setSaleMinorista',
//       success: function(result){
//                     WaitingClose();
//                     $('#modalMedios').modal('hide');
//                     $('#modalConfirm').modal('show');
//                     ImprimirDirectoVar = result;
//                     //setTimeout("cargarView('sale', 'minorista', '');",800);
//             },
//       error: function(result){
//             WaitingClose();
//             ProcesarError(result.responseText, 'modalNo');
//           },
//           dataType: 'json'
//       });
// };

function btnNo(){  
  $('#modalConfirm').modal('hide');
  $('#modalPrintDir').modal('hide');
  setTimeout("cargarView('sale', 'minorista', '');",300);
}

var ImprimirDirectoVar = 0;
function imprimirDirecto(){
  if(ImprimirDirectoVar != null && ImprimirDirectoVar > 0)
    {
      imprimirMinorista(ImprimirDirectoVar);
      $('#modalConfirm').modal('hide');
    }
}

function imprimirMinorista(id){
            WaitingOpen('Generando Comprobante');
            $.ajax({
                type: 'POST',
                data: { id : id, act: 'Print' },
                url: 'index.php/sale/printComprobante',
                success: function(result){
                    WaitingClose();
                    var url = "./assets/reports/orders_minorista/" + result;
                    $('#printDocDir').attr('src', url);
                    setTimeout("$('#modalPrintDir').modal('show')",800);
                },
                error: function(result){
                    WaitingClose();
                    ProcesarError(result.responseText, 'modalRubroDir');
                },
                dataType: 'json'
            });
            return false;
        }
</script>

<!-- Modal -->
<div class="modal fade" id="modalPrintDir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog" role="document" style="width: 50%">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabelDir__"><span id="modalActionDir__"> </span> Comprobante</h4>
      </div>
      <div class="modal-body" id="modalBodyPrintDir">
        <div>
          <iframe style="width: 100%; height: 600px;" id="printDocDir" src=""></iframe>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onClick="btnNo()">Cerrar</button>
      </div>
    </div>
  </div>
</div>