$(function(){ // FUNÇÃO PARA EXIBIR A DIV
$("#autofill")
.click(function(){
$("#pegardados_autofill").show(1300);

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

