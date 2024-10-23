<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un article</title>
</head>
<body>
    <h1>Ajouter un nouvel article</h1>
    <form action="articles" method="post">
        <label for="title">Titre :</label>
        <input type="text" name="title" id="title" required>
        <br><br>
        <label for="content">Contenu :</label>
        <textarea name="content" id="content" rows="5" cols="30" required></textarea>
        <br><br>
        <button type="submit">Ajouter l'article</button>
    </form>
    <br>
    <a href="articles">Voir tous les articles</a>
</body>
</html>
