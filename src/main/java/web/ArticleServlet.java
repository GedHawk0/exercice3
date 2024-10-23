package web;

import dao.ArticleDaoImpl;
import metier.entities.Article;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/articles")
public class ArticleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ArticleDaoImpl articleDAO;

    public void init() {
        articleDAO = new ArticleDaoImpl();
    }

    // Handle GET requests to display the list of articles
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Article> articles = articleDAO.getAllArticles(); // Retrieve all articles
        request.setAttribute("articles", articles); // Add to request scope
        request.getRequestDispatcher("/articles.jsp").forward(request, response); // Forward to JSP
    }

    // Handle POST requests to add new articles
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Article newArticle = new Article();
        newArticle.setTitle(title);
        newArticle.setContent(content);

        articleDAO.addArticle(newArticle); // Add new article

        response.sendRedirect("articles"); // Redirect to display updated list
    }
}
