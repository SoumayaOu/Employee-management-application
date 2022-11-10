<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modeles.Employe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des employés | Entreprise Java</title>
        <link rel="stylesheet" href="../css/table.css" />
    </head>
    <body>
        <h1>Liste des employés</h1>
        <table class="table-fill" >
            <tr>
                <th class="text-left">Nom</th>
                <th class="text-left">Prénom</th>
                <th class="text-left">Adresse</th>
                <th class="text-left">Date de naissance</th>
                <th class="text-left">Téléphone</th>
                <th class="text-left">Email</th>
                <th class="text-left">Service</th>
                <th class="text-left">Login</th>
                <th class="text-left">Mot de passe</th>
                <th class="text-left">verifier</th>
                 <th class="text-left">Modifier</th>
                <th class="text-left">Supprimer</th>
               
            </tr>
           <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3307/entreprise";
                
                Connection cn = DriverManager.getConnection(url,"root","");
                System.out.print("connexion etablie \n");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from employes where role = 'user'"); 
                while(rs.next()){%>
                <tr>
                        <td class="text-left"><%=rs.getString(1)%></td>
                        <td class="text-left"><%=rs.getString(2)%></td>
                        <td class="text-left"><%=rs.getString(3)%></td>
                        <td class="text-left"><%=rs.getString(4)%></td>
                        <td class="text-left"><%=rs.getString(5)%></td>
                        <td class="text-left"><%=rs.getString(6)%></td>
                        <td class="text-left"><%=rs.getString(7)%></td>
                        <td class="text-left"><%=rs.getString(8)%></td>
                        <td class="text-left"><%=rs.getString(9)%></td>
                        <td class="text-left"><%=rs.getString(11)%></td>
                            <td>
                                <form action="./modifierprofilemploye.jsp" method="POST">
                                    <input type="text" name="login" id="login" value="<%=rs.getString(8)%>" style="visibility:hidden;width:1px;"/>
                                    <input type="submit" style="margin:0;width:100px;" value="Modifier"/>
                                </form>
                            </td>
                            <td>
                                <form action="/Entreprise-war/SupprimerEmploye" method="POST">
                                    <input type="text" name="login" id="login" value="<%=rs.getString(8)%>" style="visibility:hidden;width:1px;"/>
                                    <input type="submit" style="margin:0;width:100px;" value="Suppprimer"/>
                                </form>
                            </td>
                        </tr>
            <%}
            }
            catch(Exception exp){
                exp.printStackTrace();
            }
            %>
        </table>
        <br/><br/>
        <p><a href="./profil.jsp">Retour au profil</a></p>
    </body>
</html>
