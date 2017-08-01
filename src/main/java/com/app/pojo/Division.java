package com.app.pojo;
// Generated 1 Aug, 2017 4:22:59 PM by Hibernate Tools 5.2.3.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Division generated by hbm2java
 */
@Entity
@Table(name = "division", catalog = "tutesmessanger")
public class Division implements java.io.Serializable {

	private int id;
	private Classes classes;
	private String name;

	public Division() {
	}

	public Division(int id) {
		this.id = id;
	}

	public Division(int id, Classes classes, String name) {
		this.id = id;
		this.classes = classes;
		this.name = name;
	}

	@Id

	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "classid")
	public Classes getClasses() {
		return this.classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
