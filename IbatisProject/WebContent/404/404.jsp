<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<!DOCTYPE HTML>
<html>
<head>
<title>404</title>
<meta name="keywords" />
<link href="resource/style-404.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="logo"><h1>WebApp</h1></div>
		</div>
		<div class="content">
			<img src="resource/error-img.png" title="error" />
			<p><span>Ohh.....</span>Your Page Not Found</p>
			<html:link action="region.do">REGION</html:link>
		</div>
	</div>
</body>
</html>

