<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee</title>
<link rel="stylesheet" href="resource/styles.css" type="text/css" media="screen" />
<script type="text/javascript" src="resource/jfunc.js" ></script>
</head>
<html:javascript formName="employeeForm" dynamicJavascript="true"
	staticJavascript="true" method="validateForm" page="1" />
<body>
	<h1 style="text-align:center"><bean:message key="label.title.employee.edit"/></h1>

	<html:form action="/employee"  onsubmit="return validate()"  method="post" >
		<html:hidden property="task" name="employeeForm" value="update" />
		<html:hidden property="employeeBean.employeeId" name="employeeForm" />
		<table align="center" border="1" cellpadding="10" cellspacing="0">
			<tr>
				<td><bean:message key="label.employee.id" /></td>
				<td><html:text name="employeeForm" property="employeeBean.employeeId" disabled="true"/></td>
			</tr>
			<tr>
				<td><bean:message key="label.first.name" /></td>
				<td><html:text name="employeeForm"  property="employeeBean.firstName" size="30"/></td>
			</tr>
			<tr>
				<td><bean:message key="label.last.name" /></td>
				<td><html:text name="employeeForm" property="employeeBean.lastName" size="30"/></td>
			</tr>
			<tr>
				<td><bean:message key="label.email" /></td>
				<td><html:text name="employeeForm" property="employeeBean.email"/></td>
			</tr>
			<tr>
				<td><bean:message key="label.phone.number" /></td>
				<td><html:text name="employeeForm" property="employeeBean.phoneNumber"/></td>
			</tr>
			<tr>
				<td><bean:message key="label.hire.date" /></td>
				<td><html:text name="employeeForm" property="employeeBean.hireDate"/></td>
			</tr>
			<tr>
				<td><bean:message key="label.job.title" /></td>
				<td><html:select name="employeeForm" property="employeeBean.jobId">
						<html:option value="">-- None --</html:option>
						<html:options collection="listJobs" property="key" labelProperty="value"/>
					</html:select>
				</td>
			</tr>
			<tr>
				<td><bean:message key="label.salary" /></td>
				<td><html:text name="employeeForm" property="employeeBean.salary"/></td>
			</tr>
			<tr>
				<td><bean:message key="label.commision.pct" /></td>
				<td><html:text name="employeeForm" property="employeeBean.commissionPCT" /></td>
			</tr>
			<tr>
				<td><bean:message key="label.manager.name" /></td>
				<td>
				<html:select name="employeeForm" property="employeeBean.managerId">
					<html:option value="">-- None --</html:option>
					<html:options collection="listEmployees" property="key" labelProperty="value"/>
				</html:select>
				</td>
			</tr>
			<tr>
				<td><bean:message key="label.department.name" /></td>
				<td>
				<html:select name="employeeForm" property="employeeBean.departmentId">
					<html:option value="">-- None --</html:option>
					<html:options collection="listDepartments" property="key" labelProperty="value"/>
				</html:select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<html:submit styleClass="myButton"><bean:message key="label.button.save"/></html:submit>
					<html:button property="" onclick="location.href='employee.do'" styleClass="myButton">
						<bean:message key="label.button.cancel"/>
					</html:button>
					</td>
			</tr>
		</table>
	</html:form>
</body>
</html>