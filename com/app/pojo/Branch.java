package com.app.pojo;
// Generated 10 Jan, 2018 5:06:10 PM by Hibernate Tools 5.2.6.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Branch generated by hbm2java
 */
@Entity
@Table(name = "branch", catalog = "tutesmessanger")
public class Branch implements java.io.Serializable {

	private Integer id;
	private Institute institute;
	private String name;
	private Set<Classes> classeses = new HashSet<Classes>(0);
	private Set<Classes> classeses_1 = new HashSet<Classes>(0);

	public Branch() {
	}

	public Branch(Institute institute, String name, Set<Classes> classeses, Set<Classes> classeses_1) {
		this.institute = institute;
		this.name = name;
		this.classeses = classeses;
		this.classeses_1 = classeses_1;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "instituteid")
	public Institute getInstitute() {
		return this.institute;
	}

	public void setInstitute(Institute institute) {
		this.institute = institute;
	}

	@Column(name = "Name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "branch")
	public Set<Classes> getClasseses() {
		return this.classeses;
	}

	public void setClasseses(Set<Classes> classeses) {
		this.classeses = classeses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "branch")
	public Set<Classes> getClasseses_1() {
		return this.classeses_1;
	}

	public void setClasseses_1(Set<Classes> classeses_1) {
		this.classeses_1 = classeses_1;
	}

}