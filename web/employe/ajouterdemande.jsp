<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Demande | Entreprise Java</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/conn.css" />
    </head>
    <body>
        <div class="banner" style="background-image:url(../img/pic6.jpg)"> 
             
        
        <h1>ajouter une demande</h1></div>
        <br/><br/>
        <form method="post" action="/Entreprise-war/AjouterDemande">
            <div class="item">
            <label for="titre">Titre</label>
            <input type="text" name="titre" id="titre" placeholder="Taper votre titre de demande ..." required/>
            </div>
           <div class="item">
            <label for="type">Type</label>
            <select id="type" name="type">
                <option value="Congé">Congé</option>
                <option value="Attestation de travail">Attestation de travail</option>
                <option value="Autre">Autre</option>
            </select>
            </div>
            <div class="item">
            <label for="contenu">Details</label>
            <textarea name="contenu" id="contenu" placeholder="Taper les details de la demande ..."></textarea>
            </div>
            
            <input type="submit" value="Envoyer une demande" />
        </form>
        <br/><br/>
        <p><a href="./profil.jsp">Retour au profil</a></p>
    </body>
</html>
