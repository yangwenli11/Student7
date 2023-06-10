package entity;

import java.io.Serializable;
import java.sql.Date;

public class Vacation implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Teacher teacher;// 老师
	private Student student;// 学生
	private String isApprov;// 是否批准 0是1否
	private String start;// 开始时间
	private String end;// 结束时间

	public Vacation() {
		this.teacher = new Teacher();
		this.student = new Student();
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getIsApprov() {
		return isApprov;
	}

	public void setIsApprov(String isApprov) {
		this.isApprov = isApprov;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}
}
