package vo;

public class DeptVO {
	// VO : value object - DB에서 조회된 raw(행)들을 각각 저장하여 관리하기 위한 클래스
	private int deptno;
	private String loc, dname;
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
}
