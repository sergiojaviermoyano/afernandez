<!-- Modal -->
<div class="modal fade" id="buscadorArticlesPrice" tabindex="3000" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" ><!--style="width: 50%"-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"><i class="fa fa-search" style="color: #3c8dbc"></i> Buscar Artículo</h4>
      </div>
      <div class="modal-body" id="buscadorArticlesPriceBody">

        <div class="row">
          <div class="col-xs-10 col-xs-offset-1"><input type="text" class="form-control" id="txtArtPrice" value=""></div>
          <div class="col-xs-1"><img style="display: none" id="loadingArtPrice" src="<?php  echo base_url();?>assets/images/loading.gif" width="35px"></div>
            <!--
            <input type="text" id="type" />
            <span id="status"></span>
            -->
        </div><br>

        <div class="row" style="max-height:350px; overflow-x: auto;" id="tableArtPr">
          <div class="col-xs-10 col-xs-offset-1">
            <table id="tableArtPriceDetail" style="max-height:340px; display: table;" class="table table-bordered" width="100%">
              <tbody>

              </tbody>
            </table>
          </div>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

<script>
var id____, detail____, nextFocus____, price____;
var timer___, timeout___ = 1000;
var row___ = 0, rows___ = 0;
var move___ = 0;
var minLenght___ = 2;
function buscadorArticlesPriceMayorista(string, id, detail, nextFocus, price){
  id____ = id;
  detail____ = detail;
  nextFocus____ = nextFocus;
  price____ = price;
  $('#txtArtPrice').val(string);
  $('#tableArtPriceDetail > tbody').html('');
  //$('#buscadorArticlesPrice').modal('show');
  setTimeout(function () { $('#txtArtPrice').focus(); BuscarArticlePriceMayorista();}, 1000);
}

function BuscarArticlePriceMayorista(){
  if($('#txtArtPrice').val().length > minLenght___){
    //Buscar
    $("#loadingArtPrice").show();
    $('#tableArtPriceDetail > tbody').html('');
    row___ = 0;
    rows___ = 0;
    $.ajax({
          type: 'POST',
          data: { str: $('#txtArtPrice').val() },
          url: 'index.php/article/buscadorArticlesPriceMayorista',
          success: function(resultList){
                        if(resultList != false){
                          if(resultList.length == 1){
                              seleccionarArticlePriceMayorista(resultList[0].artId, resultList[0].artDescription, calcularPrecioInternoMayorista(resultList[0]));
                          } else {
                            $.each(resultList, function(index, result){
                                var row____ = '<tr>';
                                row____ += '<td width="1%"><i style="color: #00a65a; cursor: pointer;" class="fa fa-fw fa-check-square"';
                                row____ += 'onClick="seleccionarArticlePrice(' + result.artId + ', \'' + result.artDescription + '\', ' + calcularPrecioInternoMayorista(result) + ')"></i></td>';
                                row____ += '<td>'+result.artBarcode+'</td>';
                                row____ += '<td>'+result.artDescription+'</td>';
                                row____ += '<td style="text-align: right"> $ ' + calcularPrecioInternoMayorista(result).toFixed(2) + '</td>';
                                row____ += '<td style="display: none">'+result.artId+'</td>';
                                row____ += '</tr>';
                                $('#tableArtPriceDetail > tbody').prepend(row____);
                                rows___++;
                            });

                            if ($('#buscadorArticlesPrice').data('bs.modal') && $('#buscadorArticlesPrice').data('bs.modal').isShown){
                              $("#loadingArtPrice").hide();
                              $('#txtArtPrice').focus();
                            }else {
                              //Cerrado
                              $("#loadingArtPrice").hide();
                              $('#buscadorArticlesPrice').modal('show');
                              setTimeout(function () { $('#txtArtPrice').focus();}, 1000);
                            }


                          }
                        }
                },
          error: function(result){
                $("#loadingArtPrice").hide();
                ProcesarError(result.responseText, 'buscadorArticlesPrice');
              },
              dataType: 'json'
      });
  }
}

$('#buscadorArticlesPrice').on('hidden.bs.modal', function() {
  $('#lblProducto').prop('disabled', false);
  $('#lblProducto').focus().select();
})

  $('#txtArtPrice').keyup(function(e){
    var code = e.which;
    if(code != 40 && code != 38 && code != 13){
      if($('#txtArtPrice').val().length >= minLenght___){
        // Clear timer if it's set.
        if (typeof timer___ != undefined)
          clearTimeout(timer___);

        // Set status to show we're typing.
        //$("#status").html("Typing ...").css("color", "#009900");

        timer___ = setTimeout(function()
        {
          //$("#status").html("Stopped").css("color", "#990000");
          $("#loadingArtPrice").show();
          BuscarArticlePriceMayorista();
          row___ = 0;
        }, timeout___);
      }
    } else {
      var removeStyle = $("#tableArtPriceDetail > tbody tr:nth-child("+row___+")");
      if(code == 13){//Seleccionado
        removeStyle.css('background-color', 'white');
        seleccionarArticlePriceMayorista(
                          $('#tableArtPriceDetail tbody tr:nth-child('+row___+') td:nth-child(5)')[0].innerHTML,
                          $('#tableArtPriceDetail tbody tr:nth-child('+row___+') td:nth-child(3)')[0].innerHTML,
                          ($('#tableArtPriceDetail tbody tr:nth-child('+row___+') td:nth-child(4)')[0].innerHTML).replace('$', '').trim()
                        );
      }

      if(code == 40){//abajo
        if((row___ + 1) <= rows___){
          row___++;
          if(row___ > 5){
          }
          removeStyle.css('background-color', 'white');
        }
        var rowE = $("#tableArtPriceDetail > tbody tr:nth-child("+row___+")");
        rowE.css('background-color', '#D8D8D8');
        //animate();
      }
      if(code == 38) {//arriba
        if(row___ >= 2){
          row___--;
          removeStyle.css('background-color', 'white');
        }
        var rowE = $("#tableArtPriceDetail > tbody tr:nth-child("+row___+")");
        rowE.css('background-color', '#D8D8D8');
        //animate();
      }
    }
  });

function seleccionarArticlePriceMayorista(id, desc, price){
    id____.val(id);
    detail____.val(desc);
    price____.html('$'+parseFloat(price).toFixed(2));
    $('#buscadorArticlesPrice').modal('hide');
    $('#lblProducto').prop('disabled', false);
    setTimeout(function () { nextFocus____.focus(); nextFocus____.select()}, 800);
}

function calcularPrecioInternoMayorista(article){
  debugger;
  var precioCosto 				= article['artCoste'];
	var cotizacionDolar 		= article['dolar'];
  var margenMa      			= article['artMarginMayorista'];
  var margenMaEsPor 			= article['artMarginMayoristaIsPorcent'];

  var pventaMayorista = 0;

	//Precio en Dolar
	var precioCosto = precioCosto * cotizacionDolar;

  //Mayorista
  if(margenMaEsPor == true || margenMaEsPor == "1"){
    var importe = (parseFloat(margenMa) / 100) * parseFloat(precioCosto);
    pventaMayorista = parseFloat(parseFloat(importe) + parseFloat(precioCosto));
  } else {
    pventaMayorista = parseFloat(parseFloat(precioCosto) + parseFloat(margenMa));
  }

	return pventaMayorista;
}

</script>
