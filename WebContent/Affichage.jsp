<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="metier.ArticleBean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Affichage des Articles</title>
</head>
<body>
    <h1>Liste des Articles</h1>
    <ul>
        <c:choose>
            <c:when test="${not empty articleList}">
                <c:forEach var="article" items="${articleList}">
                    <li>
                        ${article.nom}
                        <a href="ArticleServlet?action=delete&nom=${article.nom}">Supprimer</a>
                    </li>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <li>Aucun article trouvé</li>
            </c:otherwise>
        </c:choose>
    </ul>

    <a href="Articles.jsp">Ajouter un nouvel article</a>
</body>
</html>
