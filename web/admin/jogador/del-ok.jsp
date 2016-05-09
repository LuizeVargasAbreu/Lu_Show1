<%@include file="../cabecalho.jsp"%>
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%
    String msg = "";
    if(request.getParameter("login")==null)
    {
        response.sendRedirect("list.jsp");
    }
    else
    {
        String login = request.getParameter("login");
        
        JogadorDAO dao = new JogadorDAO();

        Jogador jogador = dao.buscarPorChavePrimaria(login);
        if(jogador!=null)
        {
            dao.excluir(jogador);
            msg = "Registro de Jogador excluído com sucesso";
        }
        else
        {
            msg = "Registro de Jogador não encontrado. Verifique.";
        }
        
    }
%>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <%=msg%><br />
            <a href="list.jsp"><i class="material-icons">Voltar para Jogador</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

