<%-- 
    Document   : index
    Created on : 21/03/2016, 15:33:51
    Author     : marcelosiedler
--%>
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%
    //Tentativa de login
    String mensagem = "";
    if(request.getParameter("txtEntrarLogin")!=null &&
            request.getParameter("txtEntrarSenha")!=null)
    {
        JogadorDAO dao = new JogadorDAO();
        Jogador jogador; //variável com o usuário logado
        String login = request.getParameter("txtEntrarLogin");
        String senha = request.getParameter("txtEntrarSenha");
        
        jogador = dao.realizarLogin(login, senha);
        dao.fechaEmf();
        
        if(jogador !=null)
        {
            //criar uma Sessão para o jogador
            //vou pra tela inicial do jogo
            session.setAttribute("jogador", jogador);
            //vou para tela de jogo
            response.sendRedirect("jogo.jsp");
        }
        else
        {
            mensagem = "Login errado";
        }
       
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show do Milhão</title>
        <link rel="stylesheet" href="css/estilo.css"/>
    </head>
    <body>
        <div class="centralizar">
            <img src="img/show.png" alt=""/>
        </div>
        <div class="inicialformulario">
            <h4>Entrar</h4>
            <form action="index.jsp" method="post">
                <label>Login:</label>
                <input type="text" name="txtEntrarLogin"
                       /><br/>
                <label>Senha</label>
                <input type="text" name="txtEntrarSenha"
                       /><br/>
                <input type="submit" value="Entrar" />
                <a href="jogo.jsp?jogador=Anônimo">Pular login</a>
            </form>
            <div class="centralizar">
                <hr/>
                ou
                <hr/>
            </div>
            <a href="cadastrar.jsp"><h4>Cadastre-se</h4></a>
            
            </div>
    </body>
</html>
