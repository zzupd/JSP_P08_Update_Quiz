<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Connection conn = null;
PreparedStatement pstmt = null;

String numParam = request.getParameter("numParam");
String priceParam = request.getParameter("priceParam");
// out.print("numParam : " + numParam + "<br>");
// out.print("priceParam : " + priceParam + "<br>");

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String url="jdbc:mysql://localhost:3306/sampleData?";
	url += "useSSL=false&";
	url += "useUnicode=true&";
	url += "characterEncoding=UTF8&";
	url += "serverTimezone=Asia/Seoul&";
	url += "allowPublicKeyRetrieval=true";
	
	String uid = "root";
	String upw = "1234";
	
	conn = DriverManager.getConnection(url, uid, upw);
	
	String sql = "update goodsList set price=? where num=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, priceParam);
	pstmt.setString(2, numParam);
	int rtnCnt = pstmt.executeUpdate();
%>

<script>
<% if (rtnCnt == 1) { %>
	alert('수정되었습니다.');
	location.href='list.jsp';
<% } else { %>
	alert('문제가 발생했습니다.');
	history.back();
<% } %>
</script>
	
<%	
} catch(ClassNotFoundException e) {
	out.print(e.getMessage());
} catch(SQLException e) {
	out.print(e.getMessage());
} 
%>        
		