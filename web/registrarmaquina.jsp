<%-- 
    Document   : registrarmaquina
    Created on : 24 abr. 2022, 17:50:27
    Author     : radib
--%>

<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String username, url, password, driver;
            
            url = "jdbc:mysql://localhost/Examen";
            username= "root";
            password = "Adri0406";
            
            driver = "com.mysql.jdbc.Driver";
            
            try{
                //conectarnos
                Class.forName(driver);
                con = DriverManager.getConnection(url, username, password);
                
                try{
                    String idacce, idconfig, problem, lab, rol;
                    int idmaq;
                    

                    idmaq = Integer.parseInt(request.getParameter("idmaq"));
                    idacce = request.getParameter("idacce");
                    idconfig = request.getParameter("idconfig");
                    problem = request.getParameter("problem");
                    lab = request.getParameter("lab");
                    
                    set = con.createStatement();
                    
                    String q = "insert into alumnobatiz "
                            + "values ("+idmaq+", '"+idacce+"', '"+idconfig+"', '"+problem+"', '"+lab+")";
                    
                    int registro = set.executeUpdate(q);
                    
                    %>
                    <h1>Registro Exitoso</h1>
                    <%
                
                }catch(SQLException es){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se pudo registrar en la tabla</h1>
                    <%
                
                }
            }catch(Exception e){
                System.out.println("Error al conecta la BD");
                System.out.println(e.getMessage());
                %>
                <h1>No se conecto la Base de Datos</h1>
                <%
            
            }
            
            %>
        
            <a href="index.html">Regresar a Principal</a>
    </body>
</html>