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
<title>RegionHome</title>
<script type="text/javascript">
	function flyToEditDelete(task, value) {
		document.forms[0].task.value = task;
		document.forms[0].regionId.value = value;
		document.forms[0].submit();
	}
</script>
</head>

<body>

	<jsp:include page="/header/header.jsp"></jsp:include>

	<br /> <br /> <br /><br/>
	<center>
	<p class="message"><bean:write name="regionForm" property="message" /></p>
	<input type="image" src="resource/add.png" width="80px"  onclick="javascript:flyToPage('add')"/>
	<br /> <br /> 
	
	<html:form action="/region">
		<html:hidden property="task" name="regionForm" value="search"/>
		<html:hidden property="taskTemp" name="regionForm"/>
		<html:hidden property="regionId" name="regionForm" />
		<html:hidden property="page" name="regionForm"/>
		<html:hidden property="viewData" name="regionForm"/>
		
		<html:select name="regionForm" property="columnSearch" styleClass="columnSearch">
			<html:option value="SHOW_ALL"><bean:message key="label.show.all" /></html:option>
			<html:option value="REGION_ID"><bean:message key="label.region.id" /></html:option>
			<html:option value="REGION_NAME"><bean:message key="label.region.name" /></html:option>
		</html:select>
		<html:text name="regionForm" property="textSearch" styleClass="textSearch"/>
		<input type="submit"  onclick="javascript:flyToPage('search')"  class="buttonSearch myButton" value='<bean:message key="label.button.search" />'>
	</html:form>

	<div class="table_css">
		<table border="1">
			<tr>
				<th style="width: 100px"><bean:message key="label.region.id" /></th>
				<th><bean:message key="label.region.name" /></th>
				<th style="width: 180px"><bean:message key="label.actions" /></th>
				<logic:notEmpty name="listOfRegions">
					<logic:iterate id="reg" name="listOfRegions">
						<tr>
							<td style="text-align: center;"><bean:write name="reg" property="regionId" /></td>
							<td><bean:write name="reg" property="regionName" /></td>
							<td style="text-align: center;">
								<input type="button" class="myButton" value='<bean:message key="label.button.edit"/>' onclick="javascript:flyToEditDelete('edit', '<bean:write name="reg" property="regionId"/>')">
								<input type="button" class="myButton" value='<bean:message key="label.button.delete"/>' onclick="javascript:flyToEditDelete('delete', '<bean:write name="reg" property="regionId"/>')">
							</td>
						</tr>
					</logic:iterate>
				</logic:notEmpty>
				<logic:empty name="listOfRegions">
					<tr>
						<td colspan="3" style="text-align: center;"><bean:message key="label.empty.list"/></td>
					</tr>
				</logic:empty>
			</tr>
		</table>
		
		<html:select property="viewData" name="regionForm" styleId="view_data" onchange="javascript:page('${regionForm.taskTemp}','${pageNow}')">
			<html:option value="5">5</html:option>
			<html:option value="10">10</html:option>
			<html:option value="25">25</html:option>
			<html:option value="50">50</html:option>
			<html:option value="all"><bean:message key="label.paging.all" /></html:option>
		</html:select>
			
	</div>
	
	<div id="paging">
		<html:link styleClass="paging" href="javascript:page('${regionForm.taskTemp}','${pageFirst}')"><bean:message key="label.paging.first"/></html:link> 
		<html:link styleClass="paging" href="javascript:page('${regionForm.taskTemp}','${pagePrev}')"><<</html:link> 
		<logic:iterate id="p" name="listPage">
			<logic:equal name="p" value="${pageNow}">
				<html:link styleClass="paging_active" href="#">${p}</html:link>
			</logic:equal>
			<logic:notEqual name="p" value="${pageNow}">
				<html:link styleClass="paging" href="javascript:page('${regionForm.taskTemp}','${p}')">${p}</html:link>
			</logic:notEqual>
		</logic:iterate>
		<html:link styleClass="paging" href="javascript:page('${regionForm.taskTemp}','${pageNext}')">>></html:link> 
		<html:link styleClass="paging" href="javascript:page('${regionForm.taskTemp}','${pageLast}')"><bean:message key="label.paging.last"/></html:link>
	</div>
	
	</center>
</body>
</html>