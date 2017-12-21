package com.app.pojo;
// Generated 21 Dec, 2017 11:23:34 AM by Hibernate Tools 5.2.3.Final

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
import javax.persistence.UniqueConstraint;

/**
 * ExamSubjectStudentCompositTable generated by hbm2java
 */
@Entity
@Table(name = "exam_subject_student_composit_table", catalog = "tutesmessanger", uniqueConstraints = @UniqueConstraint(columnNames = {
		"student_id", "subject_id", "exam_id" }))
public class ExamSubjectStudentCompositTable implements java.io.Serializable {

	private Integer id;
	private transient Exam exam;
	private transient Student student;
	private transient Subject subject;
	private transient Set<Result> results = new HashSet<Result>(0);

	public ExamSubjectStudentCompositTable() {
	}

	public ExamSubjectStudentCompositTable(Exam exam, Student student, Subject subject, Set<Result> results) {
		this.exam = exam;
		this.student = student;
		this.subject = subject;
		this.results = results;
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
	@JoinColumn(name = "exam_id")
	public Exam getExam() {
		return this.exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "student_id")
	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "subject_id")
	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "examSubjectStudentCompositTable")
	public Set<Result> getResults() {
		return this.results;
	}

	public void setResults(Set<Result> results) {
		this.results = results;
	}

}
