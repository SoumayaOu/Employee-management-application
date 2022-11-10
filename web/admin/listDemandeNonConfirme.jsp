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
        <title>Liste des demandes non confirmées | Entreprise Java</title>
        <link rel="stylesheet" href="../css/list.css" />
    </head>
    <body>
        <h1>Liste des demandes non confirmées</h1>
        <table id="customers">
            <tr>
                <th>Titre</th>
                <th>Type</th>
                <th>Contenu</th>
                <th>Date</th>
                <th>Employé</th>
                <th>Confimer</th>
                <th>Refuser</th>
            </tr>
           <%
            try {
                 Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3307/entreprise";
                String user = "root";
                String password = "0000";

                Connection cn = DriverManager.getConnection(url,"root","");
                System.out.print("connexion etablie \n");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select e.nom,e.prenom,d.* from demande d, employes e where e.login = d.employe and d.etat = 'sous'"); 
                while(rs.next()){%>
                <tr>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(2)+" "+rs.getString(1)%></td>
                            <td>
                                <form action="/Entreprise-war/ConfirmerDemande" method="POST">
                                    <input type="text" name="id" id="id" value="<%=rs.getString(3)%>" style="visibility:hidden;width:1px;"/>
                                    <input type="submit" style="margin:0;width:100px;" value="Confimer"/>
                                </form>
                            </td>
                            <td>
                                 <form action="/Entreprise-war/RefuserDemande" method="POST">
                                    <input type="text" name="id" id="id" value="<%=rs.getString(3)%>" style="visibility:hidden;width:1px;"/>
                                    <input type="submit" style="margin:0;width:100px;" value="Réfuser"/>
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
