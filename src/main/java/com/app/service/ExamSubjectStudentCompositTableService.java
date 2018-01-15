package com.app.service;

import java.util.List;

import com.app.pojo.ExamSubjectStudentCompositTable;
import com.app.pojo.SubjectDivComposit;

public interface ExamSubjectStudentCompositTableService {

	public void create(ExamSubjectStudentCompositTable examSubjectStudentComp);
	public void update(ExamSubjectStudentCompositTable examSubjectStudentComp);
	public ExamSubjectStudentCompositTable edit(int id);
	public void delet(int id);
	public ExamSubjectStudentCompositTable find(int id);
	public List<ExamSubjectStudentCompositTable> getall();
	
	public List<SubjectDivComposit> findByExamId(int examId);
}
