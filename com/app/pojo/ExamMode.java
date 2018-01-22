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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * ExamMode generated by hbm2java
 */
@Entity
@Table(name = "exam_mode", catalog = "tutesmessanger")
public class ExamMode implements java.io.Serializable {

	private Integer id;
	private String modeName;
	private Set<Exam> exams = new HashSet<Exam>(0);
	private Set<Exam> exams_1 = new HashSet<Exam>(0);

	public ExamMode() {
	}

	public ExamMode(String modeName, Set<Exam> exams, Set<Exam> exams_1) {
		this.modeName = modeName;
		this.exams = exams;
		this.exams_1 = exams_1;
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

	@Column(name = "Mode_name", length = 300)
	public String getModeName() {
		return this.modeName;
	}

	public void setModeName(String modeName) {
		this.modeName = modeName;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "examMode")
	public Set<Exam> getExams() {
		return this.exams;
	}

	public void setExams(Set<Exam> exams) {
		this.exams = exams;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "examMode")
	public Set<Exam> getExams_1() {
		return this.exams_1;
	}

	public void setExams_1(Set<Exam> exams_1) {
		this.exams_1 = exams_1;
	}

}