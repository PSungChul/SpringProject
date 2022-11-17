package util;

public interface Common {
	public String PATH = "/WEB-INF/views/board/";
	
	// 한 페이지에 보여줄 게시물 수
	public static int BLOCKLIST = 5;
	
	// 한 화면에 보여질 페이지 메뉴의 수
	// < 1 2 3 >
	// ">"이 버튼을 클릭하면 다음 < 4 5 6> 이런식으로 번호가 이어서 나오게 된다.
	public static int BLOCKPAGE = 3;
	
}
