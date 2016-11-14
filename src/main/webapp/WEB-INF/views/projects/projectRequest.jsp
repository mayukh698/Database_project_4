<%@ page session="false"%> 
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/header.jsp" />
<head>
  <title>Project Request Access</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.11.4/jquery-ui.min.js"></script> 
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/globalize/0.1.1/globalize.min.js"></script>
<script type="text/javascript" src="/database_project/scripts/js/projects.js"></script>
<link href="/database_project/scripts/external/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
 <style type="text/css">


.span12{
border:none;
background-color:silver;
margin-left: 5 px;
padding-left: 15 px;
margin-right: 20px;
 
}  
.spacer {
    margin-top: 40px; /* define margin as you see fit */
    
}
.scrollDiv{
	max-height:800px;
    overflow-y:scroll;
    overflow-x:hidden;
}
::-webkit-scrollbar {
    width: 8px;
}
 
::-webkit-scrollbar-track {
    -webkit-box-shadow:none;
    border-radius: 0px;
    background-color:#aaa;
}
 
::-webkit-scrollbar-thumb {
    border-radius: 0px;
    -webkit-box-shadow: inset 1px 1px 6px #333; 
    background-color:#666;
}

  </style>
  
 </head> 
<body>
 <script type="text/javascript">
 $(document).ready(function () {
	 $(".role").change(function () {

	     var val = $('.role:checked').val();
	     console.log(val);
	 });
	 });
 </script>
<div class="container-fluid" id="userRequestResults">

<div class="col-sm-8 col-md-8 col-lg-8" id="showRequests">
    <H1 align="center">Project access requests</H1>
      <div class="scrollDiv">
      <div class="row well span12 spacer">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Project name</b></p>
      	</div>
      <div class = "col-sm-2 col-md-2 col-lg-2">
      	<p style="color:blue;"><b>Project manager</b></p>
      	</div>
      	<div class = "col-sm-2 col-md-2 col-lg-2">
      	<p style="color:blue;"><b>Project member</b></p>
      	</div>
      	<div class = "col-sm-2 col-md-2 col-lg-2">
      	<p style="color:blue;"><b>Project member</b></p>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Submit</b></p>
      	</div>
      </div>
      
      <% 

java.sql.Connection con1;
java.sql.Statement s1;
java.sql.ResultSet rs1;
java.sql.PreparedStatement pst1;

con1=null;
s1=null;
pst1=null;
rs1=null;
String url1= 
"jdbc:postgresql://localhost:5433/webtoxpi";
String id1= "postgres";
String pass1 = "postgres";
try{
	

	Class.forName("org.postgresql.Driver").newInstance();
con1 = java.sql.DriverManager.getConnection(url1, id1, pass1);

} catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}
String sql1 = "select distinct name,project_id from projects";
int countRequest=0;
try{
s1 = con1.createStatement();
rs1 = s1.executeQuery(sql1);
%>
<%
if (!rs1.isBeforeFirst() ) { 
	countRequest=0;
%>
<div class="row well span12">
<h2 style="margin-left:30% "><b>No data to display</b></h2>	
<input type="hidden" id="countRequest" value="<%=countRequest%>" />
</div>

<%
}
else{
while( rs1.next() ){
%>
  <div class="row well span12">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<%=rs1.getString("name") %>
      	</div>
      <div class = "col-sm-2 col-md-2 col-lg-2">
      	<input type="radio" class="role" name=role value="PM" checked="checked"/>
      	</div>
      	<div class = "col-sm-2 col-md-2 col-lg-2">
      	<input type="radio" class="role" name=role value="TM"/>
      	</div>
      	
      	<div class = "col-sm-2 col-md-2 col-lg-2">
      	<input type="radio" class="role" name=role value="PR"/>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<a href="<%= request.getContextPath()%>/projectRequest/roleSubmit/<%=rs1.getLong("project_id")%>+input[name=role]:checked.value"><button type="submit" class="btn btn-primary" name="roleSubmit">Submit request</button></a>
      	</div>
      </div>
      
      <%
      countRequest++;
}
%>
<input type="hidden" id="countRequest" value="<%=countRequest%>"/>
<%

} 
}
catch(Exception e){e.printStackTrace();}
finally{
if(rs1!=null) 
	rs1.close();
if(s1!=null) 
	s1.close();
if(con1!=null) 
	con1.close();
}

%>
      </div>
      	
      	</div>

  
</div>
	
</body>

<jsp:include page="../fragments/footer.jsp" />
</html>