<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.text.*" %> <!-- Importar bibliotecas -->
<%@page import="java.sql.*" %>
<%@page import="ligarbd.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Reservar</title>
	<link rel="icon" href="imagens/favicon.png">
	<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
	<div align="center">
	<h1>Confirmação reserva</h1>
	
	<%
		//Obter dados do post
		String data=request.getParameter("data");
		String email=request.getParameter("email");
		String pessoas=request.getParameter("pessoas");
		String refeicao=request.getParameter("refeicao");
	
		if(refeicao.equals("A")) refeicao="Almoço";
		else refeicao="Jantar";
		
		out.println("Data da reserva: "+data);
		out.println("<br>Email do cliente: "+email);
		out.println("<br>Nº de pessoas: "+pessoas);
		out.println("<br>Refeição: "+refeicao);
		
		//Guardar na base de dados
		try{
			Connection cn=ligacaomysql.criarligacao();
			Statement st=cn.createStatement();
			st.executeUpdate("insert into reservas (data,contacto,pessoas,refeicao)"+
					"values('"+data+"', '"+email+"', '"+pessoas+"', '"+refeicao+"')");
			out.println("<br><h1>Reserva efectuada.</br>");
			cn.close();
		}
		catch(SQLException e) {
			out.println("<br><h1>Erro ao registar a reserva.</br>");
		}
	%>
	
	<a href="index.jsp">Voltar</a>
	<a href="listagem.jsp">Listagem de reservas</a>
	</div>
</body>
</html>