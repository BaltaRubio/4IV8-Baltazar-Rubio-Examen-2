<%-- 
    Document   : consultarprofesor
    Created on : 21 abr. 2022, 17:56:24
    Author     : radib
--%>

<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Profesor</title>
    </head>
    <body>
        
        <table border="2">
            <thead>
                <tr>
                    <th>N° de empleado</th>
                    <th>Nombre</th>
                    <th>Apellido Paterno</th>
                    <th>Apellido Materno</th>
                    <th>Sexo</th>
                    <th>Rol</th>
                    <th>Editar</th>
                    <th>Borrar</th>
                </tr>        
            </thead>
            <tbody>
                
            
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
                    String q = "select * from alumnobatiz order by boleta asc";
                    
                    set = con.createStatement();
                    
                    rs = set.executeQuery(q);
                    
                    while(rs.next()){
                    
                    
                    
                    %>
                    <tr>
                        <td><%=rs.getInt("noempleado")%></td>
                        <td><%=rs.getString("nombre")%></td>
                        <td><%=rs.getString("appat")%></td>
                        <td><%=rs.getString("apmat")%></td>
                        <td><%=rs.getString("sexo")%></td>
                        <td><a href="editaralumno.jsp?id=<%=rs.getInt("noempleado")%>" >Editar</a></td>
                        <td><a href="borrarprofesor.jsp?id=<%=rs.getInt("noempleado")%>" >Borrar</a></td>
                    </tr>
                    <%
                        }
                }catch(SQLException es){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se puede consultar la tabla</h1>
                    <%
                
                }
            }catch(Exception e){
                System.out.println("Error al conectar la Base de Datos");
                System.out.println(e.getMessage());
                %>
                <h1>No se conecto con la Base de Datos</h1>
                <%
            
            }
            
            %>
            </tbody>
        </table>
            <a href="index.html">Regresar al Inicio</a>
            <br>
            <a href="registrarprofesor.jsp" >Registrar Profesor</a> 
    </body>
</html>
