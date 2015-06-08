<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<div style="float: left">
	<html:link href="javascript:flyToPage('bahasa')">
		<html:img src="resource/in.png" width="24px"/> <strong>Indonesia</strong>
	</html:link> |
	<html:link href="javascript:flyToPage('language')">
		<html:img src="resource/en.png" width="24px"/> <strong>English</strong>
	</html:link>
</div>

<div style="float: right; width:180px">
	<div style="position:absolute;width:80px;">
		<input style="margin-left:1px;" type="image" src="resource/map.png" width="48" onclick="javascript:location.href='region.do'">
		<br/><strong>REGION</strong>
	</div>
	<div style="position:absolute;width:80px; margin-left:80px;">
		<input style="margin-left:8px;" type="image" src="resource/emp.png" width="48" onclick="javascript:location.href='employee.do'">
		<br/><strong>EMPLOYEE</strong>
	</div>
</div>
