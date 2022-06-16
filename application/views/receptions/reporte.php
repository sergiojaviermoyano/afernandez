<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <h3 class="box-title">Consulta Comprobantes de Compras</h3>
            <input type="text" class="btn btn-default" id="fromDate" value="" placeholder="dd-mm-aaaa" readonly="readonly" style="width: 110px">  
            <input type="text" class="btn btn-default" id="toDate" value="" placeholder="dd-mm-aaaa" readonly="readonly" style="width: 110px">
            <button type="button" class="btn btn-primary" id="btnConsultar">Consultar</button>
            <hr>
            <div id="estadoCuenta">

            </div>
        </div>
    </div>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

<script>
$('#fromDate').datepicker({maxDate: 0});
$('#toDate').datepicker({maxDate: 0});
$('#btnConsultar').click(function(){
  //estadoCuenta
  if($('#fromDate').val() == '' || $('#toDate').val() == ''){
    return;
  }  
  $("#estadoCuenta").html('');
  WaitingOpen('Consultando...');
  $.ajax({
        type: 'POST',
        data: { 
                from  : $('#fromDate').val(),
                to    : $('#toDate').val()
              },
        url: 'index.php/reception/getComprobantes', 
        success: function(result){
                      if(result != false){
                        var data = [];
                        data.push(['Recepción','Comprobante', 'Importe', 'Fecha']);
                        $.each(result,function(index,item){
                           data.push([item.recId, item.tcNumero, item.tcImporte, item.recFecha]);
                        });
                        var workbook = XLSX.utils.book_new(),
                        worksheet = XLSX.utils.aoa_to_sheet(data);
                        workbook.SheetNames.push("First");
                        workbook.Sheets["First"] = worksheet;

                        var xlsbin = XLSX.write(workbook, {
                        bookType: "xlsx",
                        type: "binary"
                        });
                        var buffer = new ArrayBuffer(xlsbin.length),
                        array = new Uint8Array(buffer);
                        for (var i=0; i<xlsbin.length; i++) {
                        array[i] = xlsbin.charCodeAt(i) & 0XFF;
                        }
                        var xlsblob = new Blob([buffer], {type:"application/octet-stream"});
                        delete array; delete buffer; delete xlsbin;

                        var url = window.URL.createObjectURL(xlsblob),
                        anchor = document.createElement("a");
                        anchor.href = url;
                        anchor.download = "archivo compras.xlsx";
                        anchor.click();
                        window.URL.revokeObjectURL(url);
                        delete anchor;
                      }
                        WaitingClose();
                    },
        error: function(result){
                    WaitingClose();
                    ProcesarError(result.responseText, 'modal');
                },
        dataType: 'json'
        });
});
</script>