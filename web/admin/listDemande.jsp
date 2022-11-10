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
        <title>Liste des demandes| Entreprise Java</title>
        <link rel="stylesheet" href="../css/table.css" />
    </head>
    <body>
        <h1>Liste des demandes</h1>
        <table class="table-fill">
            <tr>
                <th class="text-left">Titre</th>
                <th class="text-left">Type</th>
                <th class="text-left">Contenu</th>
                <th class="text-left">Date</th>
                <th class="text-left">Employé</th>
                <th class="text-left">Etat</th>
            </tr>
           <%
            try {
                 Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3307/entreprise";
               

                Connection cn = DriverManager.getConnection(url,"root","");
                System.out.print("connexion etablie \n");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select e.nom,e.prenom,d.* from demande d, employes e where e.login = d.employe"); 
                while(rs.next()){%>
                <tr>
                        <td class="text-left"><%=rs.getString(4)%></td>
                        <td class="text-left"><%=rs.getString(5)%></td>
                        <td class="text-left"><%=rs.getString(6)%></td>
                        <td class="text-left"><%=rs.getString(7)%></td>
                        <td class="text-left"><%=rs.getString(2)+" "+rs.getString(1)%></td>
                        <%
                            if(rs.getString(9).equals("sous")){
                            %><td>Demande Sous traitement</td>
                            <%
                            }else if(rs.getString(9).equals("accept")){
                            %>
                            <td>Demande acceptée</td>
                            <%
                            }else{
                            %>
                            <td>Demande réfusé</td>
                        </tr>
            <%}
                }
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
