<%-- 
    Document   : editarprofesor
    Created on : 22 abr. 2022, 11:46:50
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
                    <label>N° de Empleado</label>
                    <br>
                    <input type="hidden" name="noempleado2" 
                           value="<%=rs.getInt("noempleado")%>" >
                    <br>
                    <label>Nombre</label>
                    <br>
                    <input type="text" name="nombre2" 
                           value="<%=rs.getString("nombre")%>" >
                    <br>
                    <label>Apellido Paterno</label>
                    <br>
                    <input type="text" name="appat2" 
                           value="<%=rs.getString("appat")%>" >
                    <br>
                    <label>Apellido Materno</label>
                    <br>
                    <input type="text" name="apmat2" 
                           value="<%=rs.getString("apmat")%>" >
                    <br>
                    <label>Sexo</label>
                    <br>
                    <input type="text" name="sexo2" 
                           value="<%=rs.getString("sexo")%>" >
                    <br>
                    <label>Sexo</label>
                    <br>
                    <input type="text" name="rol2" 
                           value="<%=rs.getString("rol")%>" >
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