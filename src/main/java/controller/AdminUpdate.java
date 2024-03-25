package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ShibeDAO;
import model.Shibe;

/**
 * Servlet implementation class AdminUpdate
 */
@WebServlet("/Admin/Update")
@MultipartConfig
public class AdminUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		if(id == null) {
			response.sendRedirect("/ShibeFolder2/Admin");
			return;
		}
		ShibeDAO dao=new ShibeDAO();
		Shibe shibe=dao.findOne(Integer.parseInt(id));
		request.setAttribute("shibe", shibe);
		RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/admin/update.jsp");
		rd.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String memo=request.getParameter("memo");
		String orgname=request.getParameter("orgname");
		Part part=request.getPart("imgname");
		String imgname;
		if(part.getSize()==0) {
			imgname=orgname;
		}else {
			imgname=part.getSubmittedFileName();
			String path=getServletContext().getRealPath("/upload");
			part.write(path+File.separator+imgname);
		}
		ShibeDAO dao=new ShibeDAO();
		dao.updateOne(new Shibe(Integer.parseInt(id),title,imgname,memo));
		List<Shibe> list=dao.findAll();
		request.setAttribute("list", list);
		request.setAttribute("msg", "1件更新しました");
		RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/admin/main.jsp");
		rd.forward(request, response);
	}

}
