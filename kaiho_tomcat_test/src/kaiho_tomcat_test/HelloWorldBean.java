package kaiho_tomcat_test;
import java.io.Serializable;

public class HelloWorldBean implements Serializable {

	/*
	 * �ϐ���`
	 */
	private String id;
	private String sname;

	/*
	 *
	 */
	public HelloWorldBean() {}

	public HelloWorldBean(String id, String sname) {
		this.id = id;
		this.sname = sname;
	}

	/*
	 * �Z�b�^�[
	 */
	public void setId(String id) {
		this.id = id;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	/*
	 * �Q�b�^�[
	 */
	public String getId() {
		return this.id;
	}

	public String getSname() {
		return this.sname;
	}

}
