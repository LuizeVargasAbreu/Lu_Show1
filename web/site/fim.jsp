<%-- 
    Document   : fim
    Created on : 21/03/2016, 15:37:29
    Author     : marcelosiedler
--%>

<%@page import="java.util.Date"%>
<%@page import="modelo.Jogador"%>
<%@page import="modelo.Jogo"%>
<%@page import="modelo.Ranking"%>
<%@page import="java.util.List"%>
<%@page import="dao.RankingDAO"%>
<%
    Jogo jogo = (Jogo) session.getAttribute("jogo");
    
    Ranking r = new Ranking();
    Jogador jogador = (Jogador) session.getAttribute("jogador");
    Date d = new Date();
   
    r.setPontos(jogo.getPontuacao());
    r.setJogador(jogador);
    r.setData(d);
    
    RankingDAO dao = new RankingDAO();
    
    dao.incluir(r);
    List<Ranking> lista;
    lista = dao.listarTop();
    
    dao.fechaEmf();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="css/estilo.css"/>
    </head>
    <body>
        <h1>ACABOU!!!!!</h1>
        <a href="jogo.jsp">Jogar novamente</a>
        <hr />
        <h4>TOP 10</h4>
  
          <table>

            <% 
                  for (int i = 0; i < lista.size(); i++) {
            %>
            <tr>
                <th><%=i + 1%></th>
                <th><%=lista.get(i).getJogador()%></th>
                <th><%=lista.get(i).getPontos()%></th>
            </tr>

            <%
                }
            %>
        </table>
    </body>
</html>
