package dao;

import metier.entities.Article;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleDaoImpl {
    private Connection connection;

    public ArticleDaoImpl() {
        this.connection = SingletonConnection.getConnection();
    }

    // Method to add a new article
    public boolean addArticle(Article article) {
        String sql = "INSERT INTO articles (title, content) VALUES (?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, article.getTitle());
            ps.setString(2, article.getContent());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Return true if insertion was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to retrieve all articles
    public List<Article> getAllArticles() {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT * FROM articles"; // Query to select all articles

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Article article = new Article();
                article.setId(rs.getInt("id"));
                article.setTitle(rs.getString("title"));
                article.setContent(rs.getString("content"));
                articles.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

    // Method to verify if an article exists by title
    public Article verifyArticleByTitle(String title) {
        String sql = "SELECT * FROM articles WHERE title = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, title);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Article article = new Article();
                    article.setId(rs.getInt("id"));
                    article.setTitle(rs.getString("title"));
                    article.setContent(rs.getString("content"));
                    return article; // Return the article if it exists
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if no article was found
    }
}
