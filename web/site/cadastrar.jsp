<%-- 
    Document   : cadastrar
    Created on : 12/04/2016, 13:52:12
    Author     : Aluno
--%>
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%
    String mensagem = "";
    if(request.getParameter("txtCadastrarLogin") != null ||
            request.getParameter("txtCadastrarSenha")!= null ||
               request.getParameter("txtCadastrarEmail")!= null)
    {
         response.sendRedirect("index.jsp");
    }
    else {    
        String login = request.getParameter("txtCadastrarLogin");
        String senha = request.getParameter("txtCadastrarSenha");
        String email = request.getParameter("txtCadastrarEmail");
                
        JogadorDAO dao = new JogadorDAO();
        Jogador jogador = new Jogador();

        jogador.setLogin(login);
        jogador.setSenha(senha);
        jogador.setEmail(email);
                
       try
        {
            dao.incluir(jogador);
            mensagem = "Jogador cadastrado com sucesso";
            
        }
        catch(Exception ex)
        {
            mensagem = "Erro ao cadastrar jogador";
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
            <h4>Cadastre-se</h4>
            
            <form action="index.jsp" method="post">
                <label>Login:</label>
                <input type="text" name="txtCadastrarLogin"
                       /><br/>
                <label>Senha</label>
                <input type="text" name="txtCadastrarSenha"
                       /><br/>
                <label>Email</label>
                <input type="text" name="txtCadastrarEmail"
                       /><br/>
                <input type="submit" value="Cadastrar" />
                
            </form>
        </div>
        </body>
</html>
