<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="travelblog.blogUser" %>
<%@ page import ="com.google.appengine.api.users.User" %>
<%@ page import ="com.google.appengine.api.users.UserService" %>
<%@ page import ="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import ="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import ="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import ="com.google.appengine.api.datastore.Query" %>
<%@ page import ="com.google.appengine.api.datastore.Entity" %>
<%@ page import ="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import ="com.google.appengine.api.datastore.Key" %>
<%@ page import ="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import ="com.googlecode.objectify.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
 
 
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="stylesheets/bootstrap.min.css">
    <link type="text/css"rel="stylesheet" href="/stylesheets/main.css" />
	<title>Our Travel Blog</title>
</head>
 
    <body>
    <div class="container">
    	<div class="row">
    		<h1>Our Travel Blog</h1>
    	</div>
    	<div class="row">
    		<img id="mainImage" src="http://placehold.it/1150x350" alt="mainImage">
    	</div>
    	<div class="row">
    		<div class="blogPost col-md-9">
    			<div>
    				<h1>Blog Posts</h1>
    			</div>
			    			<%
				    String guestbookName = request.getParameter("guestbookName");
				    if(guestbookName == null){
				        guestbookName = "default";
				    }
				    pageContext.setAttribute("guestbookName", guestbookName);
				   
				    UserService userService = UserServiceFactory.getUserService();
				    User user = userService.getCurrentUser();
				    
				    
				        ObjectifyService.register(blogUser.class);
				        List<blogUser> greetings = ObjectifyService.ofy().load().type(blogUser.class).list();
				       
				        Collections.sort(greetings);
				        if(greetings.isEmpty()){
				        %>
				        <p>This blog is empty.</p>
				        <%
				        }
				        else{
				        for(int i = greetings.size()-1; i>=greetings.size()-3; i--){
				            pageContext.setAttribute("greeting_content", greetings.get(i).getContent());

				            
				            pageContext.setAttribute("greeting_user", greetings.get(i).getUser());
				            
				            pageContext.setAttribute("greeting_title", greetings.get(i).getTitle());
				            
				            pageContext.setAttribute("greeting_date", greetings.get(i).getDate());
				               
				                %>
				            <h3>${fn:escapeXml(greeting_title)}</h3>  
				            <blockquote>${fn:escapeXml(greeting_content)}</blockquote>
				            <h6>Posted by: <b>${fn:escapeXml(greeting_user.nickname)}</b> at ${fn:escapeXml(greeting_date)}</h6>
				            
				            <%
				            }
				        }
			        if(user != null){
				        pageContext.setAttribute("user",user);
				    %>
				    <h4> Hello, ${fn:escapeXml(user.nickname)}! (You can
				    <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</h4>
				    <form action= "/ofysign" method= "post">
				    	<h5>Title:</h5>
				    	<div><textarea name="title" rows="1" cols="60"></textarea></div>
				    	<h5>Content</h5>
					    <div><textarea name="content" rows="3" cols="60"></textarea></div>
					    <div><input type="submit" value="Post Greeting" /></div>
					    <input type="hidden" name="guestbookName" value="${fn:escapeXml(guestbookName)}"/>
					</form>
				    <%
				    } else {
				    %>
				    <p> Hello!
				   
				    <a href="<%=userService.createLoginURL(request.getRequestURI()) %>">Sign In</a>
				   
				    to post. </p>
				   
				    <%
				        }
					%>
					
    		</div>
    		<div class="col-md-3">
    			<h2>Other Blog links</h2>
    			<a href="allblogposts.jsp">See More Posts</a>
    			<a href="subscription.jsp">Subscribe</a>
    		</div>
    	</div>
    </div>
    </body>
 
</html>