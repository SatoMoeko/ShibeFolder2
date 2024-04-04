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
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
@MultipartConfig
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShibeDAO dao=new ShibeDAO();
		List<Shibe> list=dao.findAll();
		request.setAttribute("list", list);
		RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/admin/main.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
//		Date date = new Date();//実行日時の情報を持つdateインスタンスを作成
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//クエリパラメータにあわせたフォーマットを作成
//		String td =sdf.format(date);//フォーマットされた文字列を得る
//		
//		String today=request.getParameter("today");
		
		String title=request.getParameter("title");
		Part part=request.getPart("imgname");
		String imgname=part.getSubmittedFileName();
		String path=getServletContext().getRealPath("/upload");
		part.write(path+File.separator+imgname);
		String memo=request.getParameter("memo");
		ShibeDAO dao=new ShibeDAO();
		dao.insertOne(new Shibe(title,imgname,memo));
		request.setAttribute("msg", "1件追加しました");
		doGet(request,response);
	}

}
