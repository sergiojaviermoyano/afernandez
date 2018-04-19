<!-- Modal -->
<div class="modal fade" id="print_order_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Comprobante Venta Minoristas </h4>
      </div>
      <div class="modal-body" >
        <iframe id="iframe_pdf" style="width:100%;min-height:600px"></iframe>  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



<script>
    $(function(){
        var customer_table=$('table#customers');
        $(document).on('click','.fa-print',function(){
            var id=$(this).data('id');
            console.log("====> table#customers  PRINT: "+id+"");
            

            WaitingOpen('Generando Comprobante');
            $.ajax({
                type: 'POST',
                data: { id : id, act: 'Print' },
                url: 'index.php/sale/printComprobante',
                success: function(result){
                    console.log(result);
                        WaitingClose();
                        $("#iframe_pdf").attr('src',result.filename_url);
                        $('#print_order_modal').modal('show');
                },
                error: function(result){
                    WaitingClose();
                    ProcesarError(result.responseText, 'modalRubro');
                },
                dataType: 'json'
            });

            //$("#print_order_modal").modal("show");
            return false;
        });
        function Print(id){
            console.log("TEST");
            return false;
        }
    })
</script>