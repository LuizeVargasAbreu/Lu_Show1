<%@page import="modelo.Categoria"%>
<%@include file="../cabecalho.jsp"%>
<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%
    if(request.getParameter("txtIdzinho") == null || request.getParameter("txtA")== null || request.getParameter("txtB")== null || request.getParameter("txtC")== null || request.getParameter("txtD")== null
            || request.getParameter("txtNivel")== null || request.getParameter("txtCerta")== null || request.getParameter("txtEnunciado")== null)
    {
        response.sendRedirect("list.jsp");
        return;
    }

    Integer idzinho = Integer.parseInt(request.getParameter("txtIdzinho"));     
    String a = request.getParameter("txtA");
    String b = request.getParameter("txtB");
    String c = request.getParameter("txtC");
    String d = request.getParameter("txtD");
    Integer nivel = Integer.parseInt(request.getParameter("txtNivel"));
    String certa = request.getParameter("txtCerta");
    String enunciado = request.getParameter("txtEnunciado");
    Integer id = Integer.parseInt(request.getParameter("selCategoria"));

    PerguntaDAO dao = new PerguntaDAO();
    Pergunta pergunta = dao.buscarPorChavePrimaria(idzinho);
    
    Categoria cat = new Categoria ();
    cat.setId(id);
        
    
    if (pergunta == null)
    {
        response.sendRedirect("list.jsp");
        return;
    }
     pergunta.setId(idzinho);
     pergunta.setA(a);
     pergunta.setB(b);
     pergunta.setC(c);
     pergunta.setD(d);
     pergunta.setNivel(nivel);
     pergunta.setCerta(certa);
     pergunta.setEnunciado(enunciado);
   

    dao.alterar(pergunta);



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

