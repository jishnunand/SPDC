package com.sunil;
import java.io.*;
public class Student implements Serializable 
{
	private long id;
	private String stuid;
	private String sturegno;
	private String stuname;
	private String stumark1;
	private String stumark2;
	private String degree;
	private String mobileno;
	private String mailid;

	public long getId() {
		return id;
	}

	public String getStuid() {
		return stuid;
	}
	public String getSturegno() {
		return sturegno;
	}
	public String getStuname() {
		return stuname;
	}
	public String getStumark1() {
		return stumark1;
	}
	public String getStumark2() {
		return stumark2;
	}

	public String getDegree() {
		return degree;
	}

	public String getMobileno() {
		return mobileno;
	}
	public String getMailid() {
		return mailid;
	}
	public void setId(long string) {
		id = string;
	}

	public void setStuid(String string) {
		stuid = string;
	}
	public void setSturegno(String string) {
		sturegno = string;
	}
	public void setStuname(String string) {
		stuname = string;
	}
	public void setStumark1(String string) {
		stumark1 = string;
	}
	public void setStumark2(String string) {
		stumark2 = string;
	}
	public void setDegree(String string) {
		degree = string;
	}

	public void setMobileno(String string) {
		mobileno = string;
	}
	public void setMailid(String string) {
		mailid = string;
	}
	
}
