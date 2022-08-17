<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
String userid = request.getParameter("userid");
String passwd = request.getParameter("passwd");
request.setCharacterEncoding("utf-8");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url="jdbc:sqlserver://localhost:1433;databaseName=jsp_book;user=user;password=1234";
Connection con=DriverManager.getConnection(url);
PreparedStatement pstmt=null;
ResultSet rs = null;
 
  String sql = "";
  try {
   // 1단계 드라이버로더
   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   // 2단계 디비연결
   con = DriverManager.getConnection(url, userid, passwd);
   // 3단계 : id에 해당하는 passwd를 가져오는 sql(sql 생성)
   sql = "select passwd from members where userid=?";
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1, userid);
   // 4단계 실행 => rs저장
   rs = pstmt.executeQuery();
   // 5단계 rs 데이터있으면 id있음
   //   폼비밀번호 rs비밀번호 비교 맞으면 => 수정
   //                     틀리면 => 비밀번호틀림
   //            없으면 id없음
   if(rs.next()){
    //id있음
//     rs.getString(1);
    String dbPass=rs.getString("passwd");
    if(passwd.equals(dbPass)){
     //비밀번호 맞음 수정
     sql = "delete from members where userid=?";
     pstmt=con.prepareStatement(sql);
     pstmt.setString(1, userid);
     
     // 4단계 실행
     pstmt.executeUpdate(); //insert,update,delete
     out.println("회원 탈퇴");
    }else{
     out.println("비밀번호 잘못 기입되었습니다.");
    }    
   }else{
    out.println("id가 존재하지 않습니다");//id없음
   }
   
  } catch (Exception e) {
   e.printStackTrace();
  }finally{
   //rs!=null : 기억장소가 확보되어 있다는 뜻
   if(rs!=null)try{rs.close();}catch(SQLException ex){}
   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
   if(con!=null)try{con.close();}catch(SQLException ex){}
  }
 %>