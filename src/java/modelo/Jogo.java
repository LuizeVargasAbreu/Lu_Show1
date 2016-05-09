package modelo;

import dao.PerguntaDAO;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Jogo {
        private List<Pergunta> perguntas;
        private Integer pontuacao;
        private Integer pulos;
        
        public Jogo()
        {
            this.pulos = 3;
            this.pontuacao = 0;
        }

    public List<Pergunta> getPerguntas() {
        return perguntas;
    }

    public void setPerguntas(List<Pergunta> perguntas) {
        this.perguntas = perguntas;
    }

    public Integer getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(Integer pontuacao) {
        this.pontuacao = pontuacao;
    }

    public Integer getPulos() {
        return pulos;
    }

    public void setPulos(Integer pulos) {
        this.pulos = pulos;
    }
    
    public Integer getAcerto()
    {
        Integer acerto = 0;
        if(this.pontuacao == 0){
        acerto = 1000;
        }
        else if(this.pontuacao >= 1000)
        {
            acerto = pontuacao  + 1000;
            if(this.pontuacao  >= 50000)
            {
              acerto = this.pontuacao * 2;          
            }
        }
        return acerto;
    }
    
    public Integer getErro()
    {
        Integer erro = 0;
        if(pontuacao == 0 || pontuacao == 1000000){
            return erro;
        }
        else if(pontuacao != 0)
        {
            erro = pontuacao / 2;
            
    }
        return erro;
    }
    public void iniciar()
    {
            try {
                //Carrega as perguntas
                PerguntaDAO dao = new PerguntaDAO();
                this.setPerguntas(dao.listar());
            } catch (Exception ex) {
                Logger.getLogger(Jogo.class.getName()).log(Level.SEVERE, null, ex);
            }
        
    }
    
    public boolean confirmar(String opcaomarcada)
    {
        if(opcaomarcada.equals(this.getPerguntas().get(0).getCerta()))
        {
            //Excluo a pergunta atual
            this.getPerguntas().remove(0);
            this.setPontuacao(this.getAcerto());
            
            return true;
        }
        else
        {
            this.setPontuacao(this.getErro());
            return false;
        }
    }
    
    public boolean pular()
    {
        if(this.pulos!=0)
        {
            this.pulos--;
            this.getPerguntas().remove(0);
            return true;
        }
        else
        {
            return false;
        }
    }
        
}
