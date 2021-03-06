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
 * Division generated by hbm2java
 */
@Entity
@Table(name = "division", catalog = "tutesmessanger")
public class Division implements java.io.Serializable {

	private Integer id;
	private Classes classes;
	private String name;
	private Set<Student> students = new HashSet<Student>(0);
	private Set<SubjectDivComposit> subjectDivComposits = new HashSet<SubjectDivComposit>(0);
	private Set<Schedule> schedules = new HashSet<Schedule>(0);
	private Set<SubjectDivComposit> subjectDivComposits_1 = new HashSet<SubjectDivComposit>(0);
	private Set<Student> students_1 = new HashSet<Student>(0);
	private Set<Schedule> schedules_1 = new HashSet<Schedule>(0);

	public Division() {
	}

	public Division(Classes classes, String name, Set<Student> students, Set<SubjectDivComposit> subjectDivComposits,
			Set<Schedule> schedules, Set<SubjectDivComposit> subjectDivComposits_1, Set<Student> students_1,
			Set<Schedule> schedules_1) {
		this.classes = classes;
		this.name = name;
		this.students = students;
		this.subjectDivComposits = subjectDivComposits;
		this.schedules = schedules;
		this.subjectDivComposits_1 = subjectDivComposits_1;
		this.students_1 = students_1;
		this.schedules_1 = schedules_1;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "division")
	public Set<Student> getStudents() {
		return this.students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "division")
	public Set<SubjectDivComposit> getSubjectDivComposits() {
		return this.subjectDivComposits;
	}

	public void setSubjectDivComposits(Set<SubjectDivComposit> subjectDivComposits) {
		this.subjectDivComposits = subjectDivComposits;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "division")
	public Set<Schedule> getSchedules() {
		return this.schedules;
	}

	public void setSchedules(Set<Schedule> schedules) {
		this.schedules = schedules;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "division")
	public Set<SubjectDivComposit> getSubjectDivComposits_1() {
		return this.subjectDivComposits_1;
	}

	public void setSubjectDivComposits_1(Set<SubjectDivComposit> subjectDivComposits_1) {
		this.subjectDivComposits_1 = subjectDivComposits_1;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "division")
	public Set<Student> getStudents_1() {
		return this.students_1;
	}

	public void setStudents_1(Set<Student> students_1) {
		this.students_1 = students_1;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "division")
	public Set<Schedule> getSchedules_1() {
		return this.schedules_1;
	}

	public void setSchedules_1(Set<Schedule> schedules_1) {
		this.schedules_1 = schedules_1;
	}

}
