<%@page import="java.sql.Date"%>
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
        <title></title>
        <link rel="stylesheet" href="../css/conn.css" />
    </head>
    <body>
                <%
                        String login = request.getParameter("login");
                           Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3307/entreprise";
                        
                        Connection cn = DriverManager.getConnection(url,"root","");
                        System.out.print("connexion etablie \n");
                        Statement st = cn.createStatement();
                        Cookie[] cookies = request.getCookies();
                        ResultSet rs = null;
                        rs = st.executeQuery("select * from employes where login = '"+login+"'");
                        
                        if(rs.next()){
                            String datnais = rs.getString(11);
                %>
                
       
       
                
        <br/><br/>
        <div class="banner" style="background-image:url(../img/pic6.jpg)"> 
              <h1>Modifier le profil de l'employé <%=rs.getString(2)%> <%=rs.getString(1)%></h1></div>
        <form method="post" action="/Entreprise-war/ModifierProfilEmployes">
           <div class="item">
         
            <label for="nom">Nom</label>
            <input type="text" name="nom" id="nom" value="<%=rs.getString(1)%>" required/>
             </div>
             <div class="item">
         
            <label for="prenom">Prenom</label>
            <input type="text" name="prenom" id="prenom" value="<%=rs.getString(2)%>" required/>
             </div>
             <div class="item">
         
            <label for="adresse">Adresse</label>
            <input type="text" name="adresse" id="adresse" value="<%=rs.getString(3)%>" required/>
             </div>
             <div class="item">
         
            <label for="datenais">Date de Naissance</label>
            <input type="date" name="datenais" id="datenais" value="<%=datnais%>" required/>
             </div>
             <div class="item">
         
            <label for="telephone">Téléphone</label>
            <input type="text" name="telephone" id="telephone" value="<%=rs.getString(5)%>" required/>
             </div>
             <div class="item">
         
            <label for="email">Email</label>
            <input type="email" name="email" id="email" value="<%=rs.getString(6)%>" required/>
             </div>
             <div class="item">
         
            <label for="service">Service d'attachement</label>
            <input type="text" name="service" id="service" value="<%=rs.getString(7)%>" required/>
             </div>
             <div class="item">
         
            <label for="login">Login</label>
            <input type="text" name="login" id="login" value="<%=rs.getString(8)%>" required/>
             </div>
             <div class="item">
         
            <label for="motdepasse">Mot de passe</label>
            <input type="text" name="motdepasse" id="motdepasse" value="<%=rs.getString(9)%>" required/>
             </div>
             
         
        <div class="btn-block">
            
                <button type="submit" href="/">modifier</button>
                
             </div>
        </form>
               <br/><br/>
        <p><a href="./listEmploye.jsp">Retour à la liste des employés</a></p>
        <br/>
        <p><a href="./profil.jsp">Retour au profil</a></p>
        <%}%>
    </body>
</html>

