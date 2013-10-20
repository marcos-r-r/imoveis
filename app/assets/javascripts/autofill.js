$(function(){
$(".field")
.keyup(function(){
var espaco_area = $('#espaco_area_total').val();
var valor_m2 = $('#espaco_valor_m2').val();
var valor_total = espaco_area * valor_m2;

$('#espaco_valor_total').val(valor_total);// completando os campos
});
});

$(function(){
$(".simulador_field")
.change(function(){
var valor_total = parseFloat($('#historico_de_contato_simulacao_attributes_valor_total').val()) ||0;
var entrada = parseFloat($('#historico_de_contato_simulacao_attributes_entrada').val()) ||0;
var valor_entrada = valor_total * entrada/100;

$('#historico_de_contato_simulacao_attributes_valor_entrada').val(valor_entrada);// completando os campos
var saldo = valor_total - valor_entrada;
var cub = parseFloat($('#historico_de_contato_simulacao_attributes_cub').val());
$('#historico_de_contato_simulacao_attributes_saldo').val(saldo);
$('#historico_de_contato_simulacao_attributes_parcelas_12').val(saldo/12);
$('#historico_de_contato_simulacao_attributes_parcelas_24').val(saldo/24);
$('#historico_de_contato_simulacao_attributes_parcelas_50').val(saldo/50);
$('#historico_de_contato_simulacao_attributes_parcelas_30').val(saldo/30);
$('#historico_de_contato_simulacao_attributes_parcelas_36').val(saldo/36);
$('#historico_de_contato_simulacao_attributes_parcelas_48').val(saldo/48);
$('#historico_de_contato_simulacao_attributes_parcelas_48_juros').val((((12*saldo)*1.12)*1.05/12)/48);
$('#historico_de_contato_simulacao_attributes_parcelas_60').val(saldo/60);
$('#historico_de_contato_simulacao_attributes_parcelas_60_juros').val((((24*saldo)*1.12)*1.07/24)/60);
$('#valor_total_cub').val(valor_total/cub) ||0;
$('#valor_entrada_cub').val(valor_entrada/cub) ||0;
$('#saldo_cub').val(saldo/cub) ||0;
$('#parcelas_30_cub').val($('#historico_de_contato_simulacao_attributes_parcelas_30').val()/cub) ||0;
$('#parcelas_36_cub').val($('#historico_de_contato_simulacao_attributes_parcelas_36').val()/cub) ||0;
$('#parcelas_48_cub').val($('#historico_de_contato_simulacao_attributes_parcelas_48').val()/cub) ||0;
$('#parcelas_48_juros_cub').val($('#historico_de_contato_simulacao_attributes_parcelas_48_juros').val()/cub) ||0;
$('#parcelas_60_cub').val($('#historico_de_contato_simulacao_attributes_parcelas_60').val()/cub) ||0;
$('#parcelas_60_juros_cub').val($('#historico_de_contato_simulacao_attributes_parcelas_60_juros').val()/cub) ||0;

});
});

$(function(){ // FUNÇÃO PARA EXIBIR A DIV
$(".simulador")
.click(function(){
$("#pegardados_simulador").show(700);
return false;
});
});

$(function(){
$("#load_autofill")
.click(function(){
var id = $('#id_autofill').val();
if(id == ""){
alert("Campo em branco, coloque o id.")
}
$.getJSON("http://localhost:3000/cadastros/" + id + ".json", function(data){ //pegando dados via JSON

$('#cadastro_nome').val(data.cadastro.nome);// completando os campos
$('#cadastro_telefone').val(data.cadastro.local);
$('#cadastro_email').val(data.cadastro.preco);

$("#msg_autofill").html("Dados carregados com sucesso..");

$("#msg_autofill").show(1100);
$("#msg_autofill").fadeOut(1800);

});
});
})



