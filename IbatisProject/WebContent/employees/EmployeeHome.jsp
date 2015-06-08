<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resource/styles.css" type="text/css" media="screen" />
<script type="text/javascript" src="resource/jfunc.js" ></script>
<title>Employee</title>
<script type="text/javascript">
	function flyToEditDelete(task, value) {
		document.forms[0].task.value = task;
		document.forms[0].employeeId.value = value;
		document.forms[0].submit();
	}
	
	function search(value) {
		if(value == "SHOW_ALL") {
			document.getElementById('textSearch').style.display = 'block';
	    	document.getElementById('dateChooser').style.display = 'none';						
		} else {
			document.getElementById('textSearch').style.display = 'none';
	    	document.getElementById('dateChooser').style.display = 'block';
		}
	}
</script>
</head>

<body>
	<jsp:include page="/header/header.jsp"></jsp:include>
	
	<br /> <br /> <br /><br/>
	<center>
	<p class="message"><bean:write name="employeeForm" property="message" /></p>
	<input type="image" src="resource/add.png" width="80px" onclick="javascript:flyToPage('add')" />
	<br /> <br /> 
	
	<div id="search_au">
	<html:form action="/employee" >
		<html:hidden property="task" name="employeeForm" value="search"/>
		<html:hidden property="taskTemp" name="employeeForm"/>
		<html:hidden property="employeeId" name="employeeForm" />
		<html:hidden property="page" name="employeeForm"/>
		<html:hidden property="viewData" name="employeeForm"/>
		
		<html:select name="employeeForm" property="columnSearch" styleClass="columnSearch" styleId="columnSearch" onchange="javascript:search(this.value)">
			<html:option value="SHOW_ALL"><bean:message key="label.show.all"/></html:option>
			<html:option value="E.EMPLOYEE_ID"><bean:message key="label.employee.id" /></html:option>
			<html:option value="E.FIRST_NAME"><bean:message key="label.first.name" /></html:option>
			<html:option value="E.LAST_NAME"><bean:message key="label.last.name" /></html:option>
			<html:option value="E.EMAIL"><bean:message key="label.email" /></html:option>
			<html:option value="E.SALARY"><bean:message key="label.salary" /></html:option>
			<html:option value="E.COMMISSION_PCT"><bean:message key="label.commision.pct" /></html:option>
			<html:option value="E.MANAGER_ID"><bean:message key="label.manager.id" /></html:option>
			<html:option value="DEPARTMENT_NAME"><bean:message key="label.department.name" /></html:option>
		</html:select>
		<html:text name="employeeForm" property="textSearch" styleId="textSearch" styleClass="textSearch"/>
		<div id="dateChooser" style="display: none;float:left;">
			<html:text name="employeeForm" property="textSearch" size="5"/>/	
			<html:text name="employeeForm" property="textSearch" size="5"/>/ 	
			<html:text name="employeeForm" property="textSearch" size="5"/>
			sampai
			<html:text name="employeeForm" property="textSearch" size="5"/>/	
			<html:text name="employeeForm" property="textSearch" size="5"/>/ 	
			<html:text name="employeeForm" property="textSearch" size="5"/>
		</div>
		<input type="submit" onclick="javascript:flyToPage('search')" class="buttonSearch myButton" value='<bean:message key="label.button.search" />'>
	</html:form>
	</div>
	
	<br/>
	<div class="table_css">
		<table border="1">
			<tr>
				<th style="width: 100px"><bean:message key="label.employee.id" /></th>
				<th><bean:message key="label.first.name" /></th>
				<th><bean:message key="label.last.name" /></th>
				<th><bean:message key="label.email" /></th>
				<th><bean:message key="label.salary" /></th>
				<th><bean:message key="label.commision.pct" /></th>
				<th><bean:message key="label.manager.name" /></th>
				<th><bean:message key="label.department.name" /></th>
				<th style="width: 180px; text-align:center;"><bean:message key="label.actions" /></th>
				<logic:notEmpty name="listOfEmployees">
					<logic:iterate id="emp" name="listOfEmployees">
						<tr>
							<td style="text-align:center;"><bean:write name="emp" property="employeeId"/></td>
							<td><bean:write name="emp" property="firstName"/></td>
							<td><bean:write name="emp" property="lastName"/></td>
							<td><bean:write name="emp" property="email"/></td>
							<td style="text-align:center"><bean:write name="emp" property="salary"/></td>
							<td style="text-align:center"><bean:write name="emp" property="commissionPCT"/></td>
							<td style="text-align:center"><bean:write name="emp" property="managerName"/></td>
							<td style="text-align:center"><bean:write name="emp" property="departmentName"/></td>
							<td style="text-align:center">
								<input type="button" class="myButton" value='<bean:message key="label.button.edit"/>'  onclick="javascript:flyToEditDelete('edit', '<bean:write name="emp" property="employeeId"/>')" width="24" height="24">
								<input type="button" class="myButton" value='<bean:message key="label.button.delete"/>' onclick="javascript:flyToEditDelete('delete', '<bean:write name="emp" property="employeeId"/>')" width="24" height="24">
							</td>
						</tr>
					</logic:iterate>
				</logic:notEmpty>
				<logic:empty name="listOfEmployees">
					<tr>
						<td colspan="8" style="text-align: center;">DATA KOSONG</td>
					</tr>
				</logic:empty>
			</tr>
		</table>
	
		<html:select property="viewData" name="employeeForm" styleId="view_data" onchange="javascript:page('${employeeForm.taskTemp}','${pageNow}')">
			<html:option value="5">5</html:option>
			<html:option value="10">10</html:option>
			<html:option value="25">25</html:option>
			<html:option value="50">50</html:option>
			<html:option value="all"><bean:message key="label.paging.all" /></html:option>
		</html:select>
	</div>
		
	<div id="paging">
		<html:link styleClass="paging" href="javascript:page('${employeeForm.taskTemp}','${pageFirst}')"><bean:message key="label.paging.first"/></html:link> 
		<html:link styleClass="paging" href="javascript:page('${employeeForm.taskTemp}','${pagePrev}')"><<</html:link> 
		<logic:iterate id="p" name="listPage">
			<logic:equal name="p" value="${pageNow}">
				<html:link styleClass="paging_active" href="#">${p}</html:link>
			</logic:equal>
			<logic:notEqual name="p" value="${pageNow}">
				<html:link styleClass="paging" href="javascript:page('${employeeForm.taskTemp}','${p}')">${p}</html:link>
			</logic:notEqual>
		</logic:iterate>
		<html:link styleClass="paging" href="javascript:page('${employeeForm.taskTemp}','${pageNext}')">>></html:link> 
		<html:link styleClass="paging" href="javascript:page('${employeeForm.taskTemp}','${pageLast}')"><bean:message key="label.paging.last"/></html:link>
	</div>
	
	</center>
</body>
</html>