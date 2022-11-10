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
        <link rel="stylesheet" href="../css/prof.css" />
       
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body style="display: flex;">
        <div class="container emp-profile">
            
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog" alt=""/>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="profile-head">
                                   
                                          <h1>Profil administrateur</h1>
                        
                        </div>
                    </div>
                   
                    <div class="row">
              <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <table >
                <%
                        Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3307/entreprise";
                       
                        Connection cn = DriverManager.getConnection(url,"root","");
                        System.out.print("connexion etablie \n");
                        Statement st = cn.createStatement();
                        Cookie[] cookies = request.getCookies();
                        ResultSet rs = null;
                        for(int i=0;i<cookies.length;i++){
                            if(cookies[i].getName().equals(new String ("current_employe"))){
                                 System.out.print("t");
                                rs = st.executeQuery("select * from employes where login = '"+cookies[i].getValue().toString()+"'");
                            }
                                if(cookies[i].getValue() == null){
                                    break;
                                }
                                
                                
                        } 
                        while(rs.next()){
                    
                %>
               
                    
                        <tr class="col-md-6">
                            <th>Nom</th>
                            <td><%=rs.getString(1)%></td>
                        </tr>
                        <tr class="col-md-6">
                            <th>Prénom</th>
                            <td><%=rs.getString(2)%></td>
                        </tr>
                        <tr class="col-md-6">
                            <th>Adresse</th>
                            <td><%=rs.getString(3)%></td>
                        </tr>
                        <tr class="col-md-6">
                            <th>Téléphone</th>
                            <td><%=rs.getString(5)%></td>
                        </tr>
                        <tr class="col-md-6">
                            <th>Email</th>
                            <td><%=rs.getString(6)%></td>
                        </tr>
                        <tr class="col-md-6">
                            <th>Service</th>
                            <td><%=rs.getString(7)%></td>
                        </tr>
                        <tr class="col-md-6">
                            <th>Login</th>
                            <td><%=rs.getString(8)%></td>
                        </tr>
                        <tr class="col-md-6">
                            <th>Date de naissance</th>
                            <td><%=rs.getString(4)%></td>
                        </tr>
                </div>
            </table>
                        <br><br>
                         </div>
                         </div>
        </div>
                        <%}%>
       
          
            <div class="col-md-4">
                        <div class="profile-work">
                         
                    
                            <a href='./modifiermonprofil.jsp'>Modifier mon profil</a><br><br>
                            <a href='./listEmploye.jsp'>Liste des employés</a><br><br>
                            <a href='./listEmployeNonConfirme.jsp'>Liste des employés non confirmés</a><br><br>
                            <a href='./listDemande.jsp'>Liste des demandes</a><br><br>
                            <a href='./listDemandeNonConfirme.jsp'>Liste des demandes non confirmées</a><br><br>
            </div>
                </div>
            
               
           <form action="/Entreprise-war/Logout" method="POST">
                                         <input type="submit" value="déconnection" />
                                     </form>
                 
                    </div>
        </div>
                </div>
        

                
    </body>
</html>
