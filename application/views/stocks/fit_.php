<div class="row">
	<div class="col-xs-12">
		<div class="alert alert-danger alert-dismissable" id="error_" style="display: none">
	        <h4><i class="icon fa fa-ban"></i> Error!</h4>
	        Revise que todos los campos esten completos
      </div>
	</div>
</div>
<br>
<div class="row">
  <div class="col-xs-1">
    <label style="margin-top: 7px;">Artículo: </label></td>
  </div>
  <div class="col-xs-6">
    <select class="form-control select2" id="artId_" style="width: 100%;">
      <?php 
          echo '<option value="-1" selected></option>';
        foreach ($articles as $a) {
          echo '<option value="'.$a['artId'].'" data-stock="'.$a['stock'].'">'.$a['artDescription'].' ('.$a['artBarCode'].')</option>';
        }
      ?>
    </select>
  </div>
  <div class="col-xs-1">
    <label style="margin-top: 7px;">Cantidad: </label></td>
  </div>
  <div class="col-xs-2">
    <input type="number" class="form-control" id="fitCant" value="1" min="1" style="width: 110px;">
  </div>
  <div class="col-xs-2 float-right">
        <label id="stock_actual" style="margin-top:5px">--</label>
  </div>
</div>
<br>
<script>
$(function(){
    $('#artId_').change(function(){
       var selected = $(this).find('option:selected');
       var stock = selected.data('stock'); 
       if(stock == ''){
        $('#stock_actual').html('0.00');
       } else {
        $('#stock_actual').html(stock);
       }
    });
});
</script>