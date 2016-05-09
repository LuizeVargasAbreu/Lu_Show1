<%@include file="../cabecalho.jsp"%>
<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%
    String msg = "";
    if(request.getParameter("idzinho")==null)
    {
        response.sendRedirect("list.jsp");
    }
    else
    {
        Integer idzinho = Integer.parseInt(request.getParameter("idzinho"));
        
        PerguntaDAO dao = new PerguntaDAO();

        Pergunta pg = dao.buscarPorChavePrimaria(idzinho);
        if(pg!=null)
        {
            dao.excluir(pg);
            msg = "Registro de Pergunta excluído com sucesso";
        }
        else
        {
            msg = "Registro de Pergunta não encontrado. Verifique.";
        }
        
    }
%>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <%=msg%><br />
            <a href="list.jsp"><i class="material-icons">Voltar para Pergunta</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

