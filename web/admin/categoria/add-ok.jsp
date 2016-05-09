<%@include file="../cabecalho.jsp"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%
    String msg="";
    
    if(request.getParameter("txtNome") == null)// || request.getParameter("txtID")== null)
    {
        response.sendRedirect("list.jsp");
    }
    else
    {
             
        String nome = request.getParameter("txtNome");
     //   Integer id = Integer.parseInt(request.getParameter("txtID"));
        
        CategoriaDAO dao = new CategoriaDAO();
        Categoria cat = new Categoria();

        cat.setNome(nome);
     //   cat.setId(id);
        
       try
        {
            dao.incluir(cat);
            msg = "Categoria cadastrada com sucesso";
            
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar categoria";
        }
        
    }
    String nome = request.getParameter("txtNome");
   // String id = request.getParameter("txtID");

%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
             <%=msg%>.<br />
             Nome: <%=nome%><br />
<!--             ID da Categoria: <%//=id%><br />-->
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

