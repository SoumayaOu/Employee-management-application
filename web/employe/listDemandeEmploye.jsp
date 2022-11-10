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
        <title>La liste de mes demandes | Entreprise Java</title>
        <link rel="stylesheet" href="../css/table.css" />
    </head>
    <body>
        <h1>La liste de mes demandes</h1>
        <table class="table-fill">
            <tr>
                <th class="text-left">Id Demande</th>
                <th class="text-left">Titre</th>
                <th class="text-left">Type</th>
                <th class="text-left">Contenu</th>
                <th class="text-left">Date</th>
                <th class="text-left">Etat</th>
                <th class="text-left">Annuler</th>
            </tr>
           <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3307/entreprise";
               
                Connection cn =DriverManager.getConnection(url,"root","");
                System.out.print("connexion etablie \n");
                Statement st = cn.createStatement();
                Cookie[] cookies = request.getCookies();
                ResultSet rs = null;
                for(int i=0;i<cookies.length;i++){
                    if(cookies[i].getName().equals(new String ("current_employe"))){
                        rs = st.executeQuery("select * from demande d where employe = '"+cookies[i].getValue().toString()+"'"); 
                    }
                }
                while(rs.next()){%>
                <tr>
                        <td class="text-left"><%=rs.getString(1)%></td>
                        <td class="text-left"><%=rs.getString(2)%></td>
                        <td class="text-left"><%=rs.getString(3)%></td>
                        <td class="text-left"><%=rs.getString(4)%></td>
                        <td class="text-left"><%=rs.getString(5)%></td>
                        <%
                            if(rs.getString(3).equals("sous")){
                            %>
                            <td>Demande Sous traitement</td>
                            <%
                            }else if(rs.getString(3).equals("accept")){
                            %>
                            <td>Demande acceptée</td>
                            <%
                            }else{
                            %>
                            <td>Demande réfusé</td>
                        
            <%}%>
                            <td class="text-left">
                                <form action="/Entreprise-war/AnnulerDemande" method="POST">
                                    <input type="text" name="id" id="id" value="<%=rs.getString(1)%>" style="visibility:hidden;width:1px;"/>
                                    <input type="submit" style="margin:0;width:100px;" value="Annuler"/>
                                </form>
                            </td>
                </tr>
            <%         
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
