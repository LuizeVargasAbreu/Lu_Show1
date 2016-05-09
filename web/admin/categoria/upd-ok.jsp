<%@include file="../cabecalho.jsp"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%
    if (request.getParameter("txtNome") == null || request.getParameter("txtID") == null)
    {
        response.sendRedirect("list.jsp");
        return;
    }

    String nome = request.getParameter("txtNome");
    Integer id = Integer.parseInt(request.getParameter("txtID"));

    CategoriaDAO dao = new CategoriaDAO();
    Categoria cat = dao.buscarPorChavePrimaria(id);

    if (cat == null)
    {
        response.sendRedirect("list.jsp");
        return;
    }
    cat.setNome(nome);
    cat.setId(id);
   

    dao.alterar(cat);



%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Atualizar</h4>
            <p>Registro atualizado com sucesso.</p>
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

