<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@page import="dao.RankingDAO" %>
<%
  //Tentativa de Login
  String mensagem = "";
  if(request.getParameter("txtEntrarLogin") != null &&
          request.getParameter("txtEntrarSenha") != null)
  {
      JogadorDAO dao = new JogadorDAO();
      Jogador jogador;
      String login = request.getParameter("txtEntrarLogin");
      String senha = request.getParameter("txtEntrarSenha"); 
      
      jogador = dao.realizarLogin(login, senha);
      if(jogador !=null)
      {
        session.setAttribute("jogador", jogador);
        response.sendRedirect("jogo.jsp");
      }
      else
      {
          mensagem = "Login errado";
      }
      out.print(mensagem);
  }
  
  //Decimal para String
  BigDecimal bd = new BigDecimal("320.02");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><a href="admin/login.jsp">Administração</a><br/>
       </h1>
    </body>
</html>
