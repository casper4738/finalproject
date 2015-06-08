<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Region</title>
<link rel="stylesheet" href="resource/styles.css" type="text/css" media="screen" />
<script type="text/javascript" src="resource/jfunc.js" ></script>
</head>
<html:javascript formName="regionForm" dynamicJavascript="true"
	staticJavascript="true" method="validateForm" page="0" />
<body>

	<h1 style="text-align:center"><bean:message key="label.title.region.add"/></h1>

	<html:form action="/region" method="post" onsubmit="return validate()">
		<html:hidden property="task" name="regionForm" value="insert" />
		<html:hidden property="regionBean.regionId" name="regionForm" />
		<table align="center" border="1" cellpadding="10" cellspacing="0">
			<tr>
				<td><bean:message key="label.region.name"/></td>
				<td><html:text name="regionForm" property="regionBean.regionName" size="30"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<html:submit styleClass="myButton"><bean:message key="label.button.save"/></html:submit> 
					<html:button property="" onclick="location.href='region.do'" styleClass="myButton">
						<bean:message key="label.button.cancel"/>
					</html:button>
				</td>
			</tr>
		</table>
	</html:form>
</body>
</html>