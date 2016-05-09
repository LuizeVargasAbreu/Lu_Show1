<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@page import="java.util.List"%>
<%@include file="../cabecalho.jsp"%>
<%
    PerguntaDAO dao = new PerguntaDAO();

    List<Pergunta> lista;

    if (request.getParameter("txtFiltro") != null && request.getParameter("txtFiltro") != "")
    {
        String txtFiltro = request.getParameter("txtFiltro");
        lista = dao.listar(txtFiltro);
    }
    else
    {
        lista = dao.listar();
    }

%>
<!-- gambiarra pra alinhar o botão a esquerda-->
<style>
    .direita
            {
                text-align: right;
                padding-right: 10%;
                
            }
</style>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Pergunta</h4>
            <!-- Colored mini FAB button -->
            <div class="direita">
                <a href="add.jsp">
                    <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                         <i class="material-icons">add</i>
                    </button>  
                </a>
            </div>

            <table class="mdl-data-table mdl-js-data-table">
                <thead>
                    <tr>

                    <!--<th>ID</th>
                        <th>A</th>
                        <th>B</th>
                        <th>C</th>
                        <th>D</th> -->
                        <th>Nível</th>    
                        <th>Enunciado</th>   
                    <!--    <th>Certa</th>   -->
                        <th>Categoria</th>                        
                        
                        <th>Ações</th>
                    </tr>
                </thead>
                <%
                   for (Pergunta item : lista) {
                %>
                <tbody>
                    <tr>
            <!--        <td><//%=item.getId()%></td>
                        <td><//%=item.getA()%></td>
                        <td><//%=item.getB()%></td>
                        <td><//%=item.getC()%></td>
                        <td><//%=item.getD()%></td>     -->
                        <td><%=item.getNivel()%></td>
                        <td><%=item.getEnunciado()%></td>
            <!--            <td><//%=item.getCerta()%></td>   -->
                        <td><%=item.getCategoria()%></td>
                        <td>
                            <!-- 
                                Atualizar 
                            -->
                            <div id="ttupd" class="icon material-icons">
                                <i class="material-icons"><a href="upd.jsp?idzinho=<%=item.getId()%>">update</a></i>
                            </div>
                            <div class="mdl-tooltip" for="ttupd">
                                Atualizar
                            </div>
                            <!-- 
                                Excluir 
                            -->
                            <div id="ttdel" class="icon material-icons">
                                <i class="material-icons"><a href="del-ok.jsp?idzinho=<%=item.getId()%>">delete</a></i>
                            </div>
                            <div class="mdl-tooltip" for="ttdel">
                                Excluir
                            </div>
                            
                        </td>
                
                    </tr>
                  
                </tbody>
                <%
                    }
                %>
            </table>   
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

