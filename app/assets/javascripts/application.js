// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$('.delete_simulacao').bind('ajax:success', function() {  
    $(this).closest('tr').fadeOut();  
}); 

$(document).ready(function() {  
    
  $(".table").tablesorter();
}); 

$(function (){
		$.datepicker.setDefaults($.datepicker.regional['pt-BR']);

		 $('#data_inicial').datepicker({
		 	
		 	dateFormat: 'dd.mm.yy',
	onSelect: function (selectedDateTime){
		var start = $(this).datepicker('getDate');
		$('#data_final').datepicker('option', 'minDate', new Date(start.getTime()) );
	}
});
		 $('#data_final').datepicker({
		 	dateFormat: 'dd.mm.yy',
	onSelect: function (selectedDateTime){
		var end = $(this).datepicker('getDate');
		$('#data_inicial').datepicker('option', 'maxDate', new Date(end.getTime()) );
	}
});
});
 
