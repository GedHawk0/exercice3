<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="person" class="Web.Person" scope="request" />
<!DOCTYPE html>
<html>
<head>
    <title>Détails de la Personne</title>
</head>
<body>
    <h2>Détails de la personne ajoutée :</h2>
    Prénom: <jsp:getProperty name="person" property="firstName" /><br><br>
    Nom: <jsp:getProperty name="person" property="lastName" /><br><br>
    Âge: <jsp:getProperty name="person" property="age" /><br><br>
    Email: <jsp:getProperty name="person" property="email" /><br><br>
    
    <a href="index.jsp">Ajouter une autre personne</a>
</body>
</html>