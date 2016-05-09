<%@include file="cabecalho-index.jsp"%>
<%
    String msg = "";
    if (request.getParameter("txtLogin")!=null &&
            request.getParameter("txtSenha")!=null)
    {
        msg = "Tentou fazer o login";
        String login = request.getParameter("txtLogin");
        String senha = request.getParameter("txtSenha");
        if(login.equals("Admin") && senha.equals("Admin"))
        {
           //Crio a Sessão do usuário Admin
           session.setAttribute("usuarioAdmin", login);
           //redirecionar para a página inicial
           response.sendRedirect("index.jsp");
        }
        else
        {
           msg = "Errou";
        }
    
    }
    if(request.getParameter("sair") != null)
    {
        session.setAttribute("usuarioAdmin", null);
    }
%>
    


<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Gerenciamento do Sistema</h4>
            <div>
                <%=msg%>
            </div>
        <form action="login.jsp" method="post">
            <div class="divformulario">

                    <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  name="txtLogin" />
                        <label class="mdl-textfield__label" for="txtLogin">Login</label>
                    </div>
                </div>
                    
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="password" required  name="txtSenha" />
                        <label class="mdl-textfield__label" for="txtSenha">Senha</label>
                    </div>
                </div>
                    
                    <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    Entrar
                    </button>
                </form>    
        </div>

    </div>

</section>


<%@include file="rodape-index.jsp"%>