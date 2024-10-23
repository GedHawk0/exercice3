<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des articles</title>
</head>
<body>
    <h1>Liste des articles</h1>
    <a href="addArticle.jsp">Ajouter un nouvel article</a>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Titre</th>
                <th>Contenu</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="article" items="${articles}">
                <tr>
                    <td>${article.id}</td>
                    <td>${article.title}</td>
                    <td>${article.content}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
