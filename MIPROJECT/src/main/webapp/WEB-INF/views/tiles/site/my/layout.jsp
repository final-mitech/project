<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>

#side {
	float: left;
	max-width: 190px;
	margin: 0;
	padding: 1em;
}

article {
	margin-left: 200px;
	padding: 1em;
	overflow: hidden;
	min-height: 400px;
}

</style>
</head>
<body>
	<div class="container">
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<nav id="side">
			<tiles:insertAttribute name="nav" />
		</nav>
		<article>
			<tiles:insertAttribute name="content" />
		</article>
		<footer> </footer>

	</div>
</body>
</html>