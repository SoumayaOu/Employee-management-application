package modeles;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Demande {
    private Integer id;
    private String titre;
    private String contenu;
    private String etat;
    private Date date;
    private String type;
    private String employe;

    public Demande(Integer id, String titre, String contenu, String etat, Date date, String type, String employe) {
        this.id = id;
        this.titre = titre;
        this.contenu = contenu;
        this.etat = etat;
        this.date = date;
        this.type = type;
        this.employe = employe;
    }

    public Demande(String type, String contenu, String titre,String employe) {
        this.titre = titre;
        this.contenu = contenu;
        this.type = type;
        this.employe = employe;
    }

    public Demande() {
    }

    public String getEmploye() {
        return employe;
    }

    public void setEmploye(String employe) {
        this.employe = employe;
    }

    public Demande(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Boolean ajouter() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        Connection cn;
        boolean res = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3307/entreprise";
            
            
            cn = DriverManager.getConnection(url,"root","");
            System.out.print("connexion etablie \n");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from employes");
            String id = "dem" + Integer.toString((int)(Math.random()*Math.random()*Math.random()*100000000)); // généré un id
            String query = "INSERT INTO demande(id,type,etat,contenu,titre,employe) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(query);
            ps.setString(1,id);
            ps.setString(5,this.titre);
            ps.setString(4,this.contenu);
            ps.setString(3,"sous");
            ps.setString(2,this.type);
            ps.setString(6,this.employe);
            res = ps.execute();
        } catch (SQLException e) {
            System.out.print("erreur de connexion : "+e.getMessage());
        }
        return res;
    }
    
    public static Boolean confimer(String id,String etat) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        Connection cn;
        Boolean res = false;
        try {
           Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3307/entreprise";
            String user = "root";
            String password = "0000";
            
            cn = DriverManager.getConnection(url,"root","");
            System.out.println("connexion etablie \n");
            String query = "update demande set etat = '"+etat+"' where id = '"+id+"'";
            PreparedStatement ps = cn.prepareStatement(query);
            res = ps.execute();
        } catch (SQLException e) {
            System.out.print("erreur de connexion : "+e.getMessage());
        }
        return res;
    }
    
    public static Boolean supprimer(String id) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        Connection cn;
        Boolean res = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3307/entreprise";
            String user = "root";
            String password = "0000";
            
            cn =  DriverManager.getConnection(url,"root","");
            System.out.print("connexion etablie \n");
            String query = "delete from demande where id = '"+id+"'";
            Statement st = cn.createStatement();
            res = st.execute(query);
        } catch (SQLException e) {
            System.out.print("erreur de connexion : "+e.getMessage());
        }
        return res;
    }
    
}
