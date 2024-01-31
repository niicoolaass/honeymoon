<%@page language="java" import="java.sql.*" %> //para realizar operações com bancos de dados em Java. Importar esse pacote permite o uso dessas classes na página JSP. - language: define qual a ling da pagina - import: importa o pacote java.sql

<%
    //Cria as variaveis e armazena as informações digitadas pelo usuário

    String vnome  = request.getParameter("nome");
	String vemail = request.getParameter("email");
    String vsenha = request.getParameter("senha");

    //Criar variaveis contendo informações do banco de dados
    
    String banco     = "honeymoon"; //nome do meu banco de dados(do MySQL)
    String endereco  = "jdbc:mysql://localhost:3307/" + banco; //jdbc: protocolo JDBC para MySQL - localhost: o endereço do BD, nesse caso é na máquina local - 3306: o número da porta, essa é a padrão do MySQL - web: concatenando com o BD.
    String usuario   = "root"; //Usuário padrão do MySQL
    String senha     = "" ; //sem senha, padrão do MySQL

    //Variavel para o driver

    String driver  = "com.mysql.jdbc.Driver" ; //caminho para chegar no driver  

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o BD
    Connection conexao ;

    //Abrir a conexão com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql com o comando INSERT
    String sql = "INSERT INTO cadastro (nome, email, senha) values (?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement( sql ) ;
    stm.setString( 1 , vnome ) ; 
    stm.setString( 2 , vemail ) ;
    stm.setString( 3 , vsenha ) ;

    stm.execute() ;
    stm.close() ;

    response.sendRedirect("consulta.jsp");
%>