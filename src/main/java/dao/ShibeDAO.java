package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.Shibe;

public class ShibeDAO {

	private Connection db;
	private PreparedStatement ps;
	private ResultSet rs;

	private void connect() throws NamingException, SQLException {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/mariadb");
		this.db = ds.getConnection();
	}

	private void disconnect()  {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (db != null) {
				db.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void ConnectCheck() {
		try {
			this.connect();
			System.out.println("OK");
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}finally {
			this.disconnect();
		}
	}
	
	public void insertOne(Shibe shibe) {
		try {
			this.connect();
			ps = db.prepareStatement("INSERT INTO shibes(title,imgname,memo) VALUES(?,?,?)");
			ps.setString(1, shibe.getTitle());
			ps.setString(2, shibe.getImgname());
			ps.setString(3, shibe.getMemo());
			ps.execute();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} finally {
			this.disconnect();
		}
	}

	public List<Shibe> findAll() {
		List<Shibe> list = new ArrayList<>();
		try {
			this.connect();
			ps = db.prepareStatement("SELECT * FROM shibes");
			rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String imgname = rs.getString("imgname");
				String memo = rs.getString("memo");
				list.add(new Shibe(id, title, imgname,memo));
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} finally {
			this.disconnect();
		}
		return list;
	}
	
	public Shibe findOne(int id) {
		Shibe shibe = null;
		try {
			this.connect();
			ps=db.prepareStatement("SELECT * FROM shibes WHERE id=?");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String imgname=rs.getString("imgname");
				String memo=rs.getString("memo");
				shibe=new Shibe(id,title,imgname,memo);
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} finally {
			this.disconnect();
		}
		return shibe;
	}
	
	public void updateOne(Shibe shibe) {
		try {
			this.connect();
			ps=db.prepareStatement("UPDATE shibes SET title=?,imgname=?,memo=? WHERE id =?");
			ps.setString(1,shibe.getTitle());
			ps.setString(2, shibe.getImgname());
			ps.setString(3, shibe.getMemo());
			ps.setInt(4, shibe.getId());
			ps.executeUpdate();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}finally {
			this.disconnect();
		}
	}
	
	public void deleteOne(int id) {
		try {
			this.connect();
			ps=db.prepareStatement("DELETE FROM shibes WHERE id=?");
			ps.setInt(1, id);
			ps.execute();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}finally {
			this.disconnect();
		}
	}
}
