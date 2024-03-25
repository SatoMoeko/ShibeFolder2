package model;

import java.io.Serializable;

public class Shibe implements Serializable{
	private int id;
	private String title;
	private String imgname;
	private String memo;
	
	public Shibe() {}
	public Shibe(int id, String title, String imgname, String memo) {
		super();
		this.id = id;
		this.title = title;
		this.imgname = imgname;
		this.memo = memo;
	}
	
	public Shibe(String title, String imgname, String memo) {
		super();
		this.title = title;
		this.imgname = imgname;
		this.memo = memo;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setColor(String title) {
		this.title = title;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
}
