package fr.eni.ecole.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.ecole.bll.CategoriesManager;
import fr.eni.ecole.util.Constantes;




/**
 * 
 * @author romai
 *
 */
@WebServlet( urlPatterns = {"/Accueil"} )
public class AccueilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccueilServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoriesManager categoriesManager = new CategoriesManager();
		request.setAttribute("listeCategories", categoriesManager.getListeCategories());
		
		Cookie ck = new Cookie("idUtilisateur", "1");
		response.addCookie(ck);
		RequestDispatcher dispatcher = request.getRequestDispatcher(Constantes.PAGE_INDEX);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
