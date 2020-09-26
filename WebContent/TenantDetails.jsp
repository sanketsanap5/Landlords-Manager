
<%@page import="src.Methods"%>
<%@page import="src.TenantTableData"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="java.sql.*"%>
<head>
<title>Owner Home Page</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<meta name="viewport" content="width=device-width=, inital-scale=1.0">

</head>
<body>
	
	<%! Methods m = new Methods();
		ResultSet rs = null;
		int tenant_id=0;
		int room_no=0;
	%>
	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("index.html");
		}
	%>

		<!-- navigation Bar START-->

			<nav class="navbar navbar-inverse" style="background-color: olive;">
				<div class="container">

					<div class="navbar-header ">
						<div class="navbar-brand">
							<h1 style="color: white;">${username}
								<small style="color: inactivecaption;">(Owner)</small>
							</h1>
						</div>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#xyz">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>

					<div class="collapse navbar-collapse" id="xyz">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">Home</a></li>

							<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown">Help <span class="caret"></span></a>
								<div class="dropdown-menu">
									<div class="well text-info text-center">
										<p>Hi this is sample text for an idea</p>
										<p>This is second line for more idea</p>
									</div>

								</div>
							</li>

							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">LogOut</a>
								<div class="dropdown-menu">
									<div class="well  text-info">
										<p>Do You Confirm to LogOut?</p>
										<a class=" text-center text-danger"
											style="padding-right: 1cm;" href="LogOut"><b>Yes</b></a> 
											<a class=" text-center text-success" href="#"><b>No</b></a>
									</div>
								</div>
							</li>
						</ul>
					</div>

				</div>
			</nav>

		<!-- navigation Bar END -->


	<div class="container-fluid">											<!--  Container 2 start -->
		<div class="row">													<!--  Row 2 start -->
			<div class="col-md-2 col-xs-4">									<!-- COL 1 -->
			<div class="input-group">
				<div class="list-group">
					<a href="landingPage.jsp" class="list-group-item list-group-item-warning list-group-item-action "> Update / Remove </a> 
					<a href="TenantRegistration.jsp" class="list-group-item list-group-item-warning list-group-item-action">Register</a> 
					<a href="rentDue.jsp" class="list-group-item list-group-item-warning list-group-item-action">Rent / Payment</a>
					<a href="OwnerMeterDetails.jsp" class="list-group-item list-group-item-warning list-group-item-action ">Meter Details</a>
					<a href="TenantDetails.jsp" class="list-group-item list-group-item-warning list-group-item-action active">Tenant Details</a>
				</div>
			</div>
			</div>
			<div class="col-xs-0"></div>
			<div class="col-md-8 col-xs-12">
				
				
				<table class="table table-bordered table-hover table-condensed">
					<tr class="success">
						<div class="list-group-item list-group-item-success text-center">
							Tenant Details
						</div>
					</tr>
					<tr class="text-center info ">
						<td>Room No</td>
						<td>Tenant id</td>
						<td>First Name </td>
						<td>Last Name </td>
						<td>Email Id</td>
						
						<td>Is Active</td>
						<td>Rent</td>
						<td>Deposit</td>
					</tr>
					<%
						
						rs = m.TenantDetails();
						while (rs.next()) {
					%>
					<tr class="text-center  ">
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
							<%
						String ans=rs.getString(8);
							if(ans.equalsIgnoreCase("yes"))
							{
						%>
						<td class="text success"><%=rs.getString(8) %></td>
						<%
							}
							else
							{
						%>
						<td class="text danger "><%=rs.getString(8) %></td>
						<% 	
							}
						%>
						
						<td><%=rs.getInt(9)%></td>
						<td><%=rs.getInt(10)%></td>

					</tr>
					<%
						}
					%>

				</table>
			</div>
			
			</div>
			
		</div>														<!-- ROW 2 End -->
		<div class="row">
			
		</div>														<!-- ROW 2 End -->
	</div>															<!-- Container 2 End -->
	

	

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>