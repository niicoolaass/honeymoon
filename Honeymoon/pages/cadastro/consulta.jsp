<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta JSP</title>
    <style>
        table, th, td {
            border-collapse: collapse;
        }
      
        tr:nth-child(even) {
            background-color: lightgray;
        }
        tr:hover{
            background-color: #6495ED;
        }
    </style>
</head>
<body>
    <%
        //variaveis para o banco de dados
        String banco    = "honeymoon" ;
        String endereco = "jdbc:mysql://localhost:3307/"+banco;
        String usuario  = "root";
        String senha    = "" ;

        //Variavel para o Driver, ele esta na pasta lib do tomcat 
        String driver = "com.mysql.jdbc.Driver" ;

        //Carregar o driver na memória
        Class.forName( driver ) ;

        //Cria a variavel para conectar com o banco de dados
        Connection conexao ;

        //Abrir a conexao com o banco de dados
        conexao = DriverManager.getConnection(endereco, usuario, senha) ;

        String sql = "SELECT * FROM cadastro" ;

        //Cria o statement para executar o comando no banco
        PreparedStatement stm = conexao.prepareStatement(sql) ;

        //Armazenar informações da consulta do banco
        ResultSet  dados = stm.executeQuery() ;

		out.print("<h2>Bem-vindo(a) no banco de dados da Honeymoon</h2>");
        out.print("<table border=1 width='500'>");
        out.print("<tr>") ;
            out.print("<th>Codigo</th>") ;
            out.print("<th>Nome</th>") ;
            out.print("<th>Idade</th>") ;
            out.print("<th>Email</th>") ;
        out.print("</tr>") ;

        //Tudo dentro da variavel dados vai ser percorrido pelo loop até o fim dos dados com o next()
        while( dados.next() ) {
            out.print("<tr>") ;
                out.print("<td>") ;
                    out.print( dados.getString("codigo") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("nome") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("email") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("senha") ) ;
                out.print("</td>") ;                

            out.print("</tr>") ;

        }

        out.print("</table>") ;
    %>
</body>
</html>
