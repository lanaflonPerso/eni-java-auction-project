package fr.eni.ecole.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.ecole.beans.Utilisateur;
import fr.eni.ecole.bll.BLLException;
import fr.eni.ecole.bll.UtilisateursManager;
import fr.eni.ecole.util.Constantes;

/**
 * Servlet implementation class Profil
 */
@WebServlet("/Profil")
public class Profil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profil() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Boolean isLogged = request.getSession().getAttribute(Constantes.SESS_NUM_UTILISATEUR) != null;
		if (!isLogged) {
			request.getRequestDispatcher(Constantes.PAGE_INDEX).forward(request, response);
			return;
		}
		Integer no_utilisateur = (Integer)request.getSession().getAttribute(Constantes.SESS_NUM_UTILISATEUR);
		String SpecifyUserId = request.getParameter("userId");
		request.setAttribute("editable", true);
		
		if (SpecifyUserId != null && no_utilisateur != Integer.parseInt(SpecifyUserId)) {
			request.setAttribute("editable", false);
			no_utilisateur = Integer.parseInt(SpecifyUserId);
		}
		UtilisateursManager usersManager = new UtilisateursManager();
		Utilisateur user;
		try {
			user = usersManager.getUtilisateur(no_utilisateur);
			request.setAttribute("pseudo_label", user.getPseudo());
			request.setAttribute(Constantes.ATT_UTILISATEUR, user);
			
			request.getRequestDispatcher(Constantes.PAGE_PROFIL).forward(request, response);
		} catch (BLLException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
