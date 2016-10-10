<%@ page session="false"%> 
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.tamu.ctv.controller.UserRequestController"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/header.jsp" />
<head>
  <title>Request approval</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  
  <script type="text/javascript">

  window.onload = function () {
		var chart = new CanvasJS.Chart("chartContainer",
		{
			title:{
				text: "User details",
				fontFamily: "Impact",
				fontWeight: "normal"
			},

			legend:{
				verticalAlign: "bottom",
				horizontalAlign: "center"
			},
			data: [
			{
				//startAngle: 45,
				indexLabelFontSize: 20,
				indexLabelFontFamily: "Garamond",
				indexLabelFontColor: "darkgrey",
				indexLabelLineColor: "darkgrey",
				type: "doughnut",
				showInLegend: false,
				dataPoints: [
					{  y: 50, legendText:"Approved 50%", indexLabel: "Approved 50%" },
					{  y: 25.0, legendText:"Rejected 25%", indexLabel: "Rejected 25%" },
					{  y: 25.0, legendText:"Requested 25%", indexLabel: "Requested 25%" }
				]
			}
			]
		});

		chart.render();
	
}
  $(document).ready(function () {
	  $("#listUsers").on("click", function(){
		  $("#showListApproved").show();
		  $("#showRequests").hide();
		  $(this).prop('disabled', true);
		  $("#requestsUsers").prop('disabled', false);
		  //$("#listUsers").attr("disabled", true);
		  //$("#requestsUsers").attr("disabled", false);
		})
		$("#requestsUsers").on("click", function(){
		  $("#showRequests").show();
		  $("#showListApproved").hide();
		  $(this).prop('disabled', true);
		  $("#listUsers").prop('disabled', false);
		  //$("#listUsers").attr("disabled", false);
		  //$("#requestsUsers").attr("disabled", true);
		})
	});
 

</script>
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



<div class="container">
<br>
<fieldset>
<legend>Choose your option</legend>
</fieldset>


    <button id="listUsers" class="btn btn-primary" value="click" disabled="disabled">List of users</button>
    <button id="requestsUsers" class="btn btn-primary" value="click">User requests</button>
  
</div>
<div class="container-fluid" id="userResults">
<!-- 
<div class="input-placeholder">Search for users</div>
<label for="input-chatlist-search" class="cont-input-search">
<input type="text" class="input input-search" data-tab="2" title="Search for users"></label> -->
    
    <div class="col-sm-8 col-md-8 col-lg-8" id="showRequests" style="display: none">
    <H1 align="center">Access requests</H1>
      <div class="scrollDiv">
      <div class="row well span12 spacer">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Name</b></p>
      	</div>
      <div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Supervisor name</b></p>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Supervisor no</b></p>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Approve/Reject</b></p>
      	</div>
      	
      </div>
      <div class="row well span12">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	Mayukh Majumdar
      	</div>
      <div class = "col-sm-3 col-md-3 col-lg-3">
      	Ivan Rusyn
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	000-000-1234
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<button type="submit" class="btn btn-primary">Approve</button>
      	<button type="submit" class="btn btn-danger">Reject</button>
      	</div>
      	
      </div>
      <div class="row well span12">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	Sumit Singh
      	</div>
      <div class = "col-sm-3 col-md-3 col-lg-3">
      	Ivan Rusyn
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	000-000-1234
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<button type="submit" class="btn btn-primary">Approve</button>
      	<button type="submit" class="btn btn-danger">Reject</button>
      	</div>
      	</div>
      	<div class="row well span12">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	Duan Liu
      	</div>
      <div class = "col-sm-3 col-md-3 col-lg-3">
      	Ivan Rusyn
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	000-000-1234
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<button type="submit" class="btn btn-primary">Approve</button>
      	<button type="submit" class="btn btn-danger">Reject</button>
      	</div>
      	
      </div>
      </div>
   </div>
    
     <div class="col-sm-8 col-md-8 col-lg-8" id="showListApproved">
    <H1 align="center">Approved users</H1>
      <div class="scrollDiv">
      <div class="row well span12 spacer">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Last name</b></p>
      	</div>
      <div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>First name</b></p>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Phone no</b></p>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Status</b></p>
      	</div>
      	
      </div>
      <% 

java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;

con=null;
s=null;
pst=null;
rs=null;
String url= 
"jdbc:postgresql://localhost:5433/webtoxpi";
String id= "postgres";
String pass = "postgres";
try{

	Class.forName("org.postgresql.Driver").newInstance();
con = java.sql.DriverManager.getConnection(url, id, pass);

} catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}
String sql = "SELECT lastname, firstname, phone FROM users";
try{
s = con.createStatement();
rs = s.executeQuery(sql);
%>
<%
while( rs.next() ){
%>
      <div class="row well span12">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<%=rs.getString("lastname") %>
      	</div>
      <div class = "col-sm-3 col-md-3 col-lg-3">
      	<%=rs.getString("firstname") %>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<%=rs.getString("phone") %>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	Approved user
      	</div>
      	
      </div>
      <%
}
%>
<%

}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) 
	rs.close();
if(s!=null) 
	s.close();
if(con!=null) 
	con.close();
}

%>
      </div>
   </div>
    
    <div class="col-sm-4 col-md-4 col-lg-4">
      <H1 align="center">User statistics</H1>
      <div id="chartContainer" style="height: 300px;"></div>
      <div id="commentToAdmin" class="spacer">
      <div class="text-primary"><h5><b>You can approve the request 
      of the user by clicking approve.</b></h5></div><br>
      <div class="text-danger"><h5><b>You can reject the request of the user
       by clicking request.</b></h5></div><br>
      <div class="text-warning"><h5><b>Call the supervisor to verify the user.</b></h5></div>
      
      </div>
    </div>
   </div> 
  



  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/globalize/0.1.1/globalize.min.js"></script>
  <script type="text/javascript" src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>

</body>

<jsp:include page="../fragments/footer.jsp" />
</html>