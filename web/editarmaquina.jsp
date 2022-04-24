<%-- 
    Document   : editarmaquina
    Created on : 23 abr. 2022, 16:58:26
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
        
        <form method="post" name="editar" action="actualizaralumno.jsp" >
            
            
        
                
            
        <%
            //aqui ya puedo incorporar java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String username, url, password, driver;
            
            url = "jdbc:mysql://localhost/alumnos";
            username= "root";
            password = "Adri0406";
            
            driver = "com.mysql.jdbc.Driver";
            
            try{
                //conectarnos
                Class.forName(driver);
                con = DriverManager.getConnection(url, username, password);
                
                try{
                    int id = Integer.parseInt(request.getParameter("id"));
                    
                    String q = "select * from alumnobatiz "
                            + " where boleta ="+id;
                    
                    set = con.createStatement();
                    
                    rs = set.executeQuery(q);
                    
                    while(rs.next()){
                    
                    
                    
                    %>
                    <label>ID Maquina</label>
                    <br>
                    <input type="hidden" name="noempleado2" 
                           value="<%=rs.getInt("noempleado")%>" >
                    <br>
                    <label>ID Monitor</label>
                    <br>
                    <input type="text" name="idmaq2" 
                           value="<%=rs.getString("idmaq")%>" >
                    <br>
                    <label>ID Accesorio</label>
                    <br>
                    <input type="text" name="idmoni2" 
                           value="<%=rs.getString("idmoni")%>" >
                    <br>
                    <label>ID Configuración</label>
                    <br>
                    <input type="text" name="idacce2" 
                           value="<%=rs.getString("idacce")%>" >
                    <br>
                    <label>Problema</label>
                    <br>
                    <input type="text" name="problem" 
                           value="<%=rs.getString("problem")%>" >
                    <br>
                    <label>Laboratorio</label>
                    <input type="text" name="lab2" 
                           value="<%=rs.getString("lab")%>" >
                    <br>
                    <input type="submit" value="Actualizar Datos" >
                    <br>
                    <input type="reset" value="Borrar Datos" >
                    
                    <%
                        }
                }catch(SQLException es){
                    System.out.println("No se pudo registrar la tabla");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se puede consultar la tabla</h1>
                    <%
                
                }
            }catch(Exception e){
                System.out.println("Error al conectar la Base de Datos");
                System.out.println(e.getMessage());
                %>
                <h1>No se pudo conectar la Base de Datos}</h1>
                <%
            
            }
            
            %>
            </form>
            <a href="index.html">Regresar a Principal</a>
            <br>
            <a href="registroprofesor.jsp" >Registrar Profesor</a> 
    </body>
</html>