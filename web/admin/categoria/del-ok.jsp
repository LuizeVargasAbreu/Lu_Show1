<%@include file="../cabecalho.jsp"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%
    String msg = "";
    if(request.getParameter("id")==null)
    {
        response.sendRedirect("list.jsp");
    }
    else
    {
        Integer id = Integer.parseInt(request.getParameter("id"));
        
        CategoriaDAO dao = new CategoriaDAO();

        Categoria cat = dao.buscarPorChavePrimaria(id);
        if(cat!=null)
        {
            dao.excluir(cat);
            msg = "Registro de Categoria excluído com sucesso";
        }
        else
        {
            msg = "Registro de Categoria não encontrado. Verifique.";
        }
        
    }
%>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <%=msg%><br />
            <a href="list.jsp"><i class="material-icons">Voltar</i></a>
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

