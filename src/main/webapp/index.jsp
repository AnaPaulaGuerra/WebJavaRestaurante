<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*" %> <!-- Importar bibliotecas -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Restaurante</title>
	<link rel="icon" href="imagens/faviconrest.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
	<div align="center">
	<h1>Restaurante Paga Pouco</h1>
	
	<%
		Calendar C=Calendar.getInstance();
		int ds=C.get(Calendar.DAY_OF_WEEK); // retorna o dia da semana
		if(ds==0){ //Sabado
			out.println("<h3>Hoje é Sábado.<br>O prato do dia é bacalhau</h3>");
			out.println("<img src='imagens/Bacalhau.jpg'>");
		}
		else if(ds==1){
			out.println("<h3>Hoje é Domingo. Estamos encerrados</h3>");
		}
		else if(ds==2){
			out.println("<h3>Hoje é Segunda-Feira<br>O prato do dia é bitoque</h3>");
			out.println("<img src='imagens/bitoque.jpg'>");
		}
		else if(ds==3){
			out.println("<h3>Hoje é Terça-Feira<br>O prato do dia é cozido</h3>");
			out.println("<img src='imagens/cozido.jpg'>");
		}else if(ds==4){
			out.println("<h3>Hoje é Quarta-Feira<br>O prato do dia é lulas</h3>");
			out.println("<img src='imagens/lulas.jpg'>");
		}else if(ds==5){
			out.println("<h3>Hoje é Quinta-Feira<br>O prato do dia é picanha</h3>");
			out.println("<img src='imagens/picanha.jpg'>");
		}else {
			out.println("<h3>Hoje é Sexta-Feira<br>O prato do dia é Polvo</h3>");
			out.println("<img src='imagens/polvo.jpg'>");
		}
	%>
	<br>
	<form method="POST" action="reservar.jsp">
		<label>Data da reserva</label><br>
		<input type="date" name="data" required><br> 
		<label>Email</label><br>
		<input type="email" name="email" required><br>
		
		<label>Nº Pessoas</label><br>
		<input type="number" name="pessoas" min="1" max="10" step="1" required><br>
		<label>Refeição</label><br>
		<select name="refeicao" required>
			<option value="A">Almoço</option>
			<option value="J">Jantar</option>
		</select>
		<br><br>
		<input type="submit" value="Reservar">
		<input type="reset" value="Cancelar">
	</form>
	</div>
</body>
</html>