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
	<title>All Posts</title>
</head>
<body>
	<div class="container">
		<div class="row">
    		<h1>Our Travel Blog</h1>
    	</div>
    	<div class="row">
    		<img id="mainImage" src="http://placehold.it/1150x350" alt="mainImage">
    	</div>
		<div class="blogPost row">
			<h2>All Posts</h2>
				    			<%
					    String guestbookName = request.getParameter("guestbookName");
					    if(guestbookName == null){
					        guestbookName = "default";
					    }
					    pageContext.setAttribute("guestbookName", guestbookName);
					   
					    UserService userService = UserServiceFactory.getUserService();
					    User user = userService.getCurrentUser();
					    %>
					   
					    <%
					        ObjectifyService.register(blogUser.class);
					        List<blogUser> greetings = ObjectifyService.ofy().load().type(blogUser.class).list();
					        Collections.sort(greetings);
					        if(greetings.isEmpty()){
					        %>
					        <p>This blog is empty.</p>
					        <%
					        }
					        else{
					        for(blogUser greeting: greetings){
					            pageContext.setAttribute("greeting_content", greeting.getContent());
					            
					            pageContext.setAttribute("greeting_user", greeting.getUser());
					            
					            pageContext.setAttribute("greeting_title", greeting.getTitle());
					            
					            pageContext.setAttribute("greeting_date", greeting.getDate());
					               
					                 %>
				           			 <h3>${fn:escapeXml(greeting_title)}</h3>  
				           			 <blockquote>${fn:escapeXml(greeting_content)}</blockquote>
				           			 <h6>Posted by: <b>${fn:escapeXml(greeting_user.nickname)}</b> at ${fn:escapeXml(greeting_date)}</h6>
				            
				            <%
					            }
					            %>
					            
					            <blockquote>${fn:escapeXml(greeting_content)}</blockquote>
					            
					            <%
					        }
					        
							%>
	    		</div>
	    </div>
</body>

</html>