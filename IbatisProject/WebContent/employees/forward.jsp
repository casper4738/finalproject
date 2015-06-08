<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
function flyToForward(task, value) {
	document.forms[0].task.value = task;
	document.forms[0].message.value = value;
	document.forms[0].submit();
}
</script>
</head>
<body>

<html:form action="/employee">
	<html:hidden property="task" name="employeeForm"/>
	<html:hidden property="message" name="employeeForm"/>
</html:form>

<logic:equal name="employeeForm" property="task" value="insert">
	<script>flyToForward('success', '<bean:message key="label.message.insert"/>')</script>
</logic:equal>

<logic:equal name="employeeForm" property="task" value="update">
	<script>flyToForward('success', '<bean:message key="label.message.update"/>')</script>
</logic:equal>

<logic:equal name="employeeForm" property="task" value="delete">
	<script>flyToForward('success', '<bean:message key="label.message.delete"/>')</script>
</logic:equal>

</body>
</html>