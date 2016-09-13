package org.zerock.domain;

import java.util.Date;

public class EmpVO {
	private Integer bno;
	private int empno;
	private String job;
	private String ename;
	private int mgr;
	private String hiredate;
	private double sal;
	private double comm;
	private int deptno;

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public double getSal() {
		return sal;
	}

	public void setSal(double sal) {
		this.sal = sal;
	}

	public double getComm() {
		return comm;
	}

	public void setComm(double comm) {
		this.comm = comm;
	}

	public int getDeptno() {
		return deptno;
	}

	public int getMgr() {
		return mgr;
	}

	public void setMgr(int mgr) {
		this.mgr = mgr;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	@Override
	public String toString() {
		return "EmpVO [bno=" + bno + ", ename=" + ename + ", job=" + job + ", empno=" + empno + ", mgr=" + mgr
				+ ", hiredate=" + hiredate + ", sal=" + sal + "comm=" + comm + "deptno=" + deptno + "]";
	}

}
