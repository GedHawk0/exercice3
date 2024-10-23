<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web.Calculatrice" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculatrice</title>
</head>
<body>
    <h1>Calculatrice</h1>

    <form action="calculatrice.jsp" method="get">
        <label for="a">Nombre A:</label>
        <input type="number" id="a" name="a" required><br>

        <label for="b">Nombre B:</label>
        <input type="number" id="b" name="b" required><br>

        <label for="operation">Opération:</label>
        <select name="operation" id="operation">
            <option value="somme">Somme</option>
            <option value="soustraction">Soustraction</option>
            <option value="multiplication">Multiplication</option>
            <option value="division">Division</option>
        </select><br>

        <button type="submit">Calculer</button>
    </form>

    <%
        String operation = request.getParameter("operation");
        String aStr = request.getParameter("a");
        String bStr = request.getParameter("b");

        if (operation != null && aStr != null && bStr != null) {
            int a = Integer.parseInt(aStr);
            int b = Integer.parseInt(bStr);

            Calculatrice calculatrice = new Calculatrice();

            int resultat = 0;
            String message = "";

            switch (operation) {
                case "somme":
                    resultat = calculatrice.somme(a, b);
                    message = "La somme de " + a + " et " + b + " est : " + resultat;
                    break;
                case "soustraction":
                    resultat = calculatrice.soustraction(a, b);
                    message = "La soustraction de " + a + " et " + b + " est : " + resultat;
                    break;
                case "multiplication":
                    resultat = calculatrice.multiplication(a, b);
                    message = "La multiplication de " + a + " et " + b + " est : " + resultat;
                    break;
                case "division":
                    try {
                        resultat = calculatrice.division(a, b);
                        message = "La division de " + a + " par " + b + " est : " + resultat;
                    } catch (IllegalArgumentException e) {
                        message = e.getMessage();
                    }
                    break;
                default:
                    message = "Opération invalide.";
            }

            out.println("<h2>Résultat:</h2>");
            out.println("<p>" + message + "</p>");
        }
    %>
</body>
</html>
