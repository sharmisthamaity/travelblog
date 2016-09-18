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
    </div>
    
    <%
    	
    %>
    
    </body>
    
 </html>