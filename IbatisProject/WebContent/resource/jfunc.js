function page(task, page) {
	if(task == "" || task == null) 
		task = "success";
	
	document.forms[0].task.value = task;
	document.forms[0].page.value = page;
	document.forms[0].viewData.value = document.getElementById('view_data').value;
	document.forms[0].submit();
}

function flyToPage(task) {
	if(task == "success" || task == "search") 
		document.forms[0].taskTemp.value = task;			
	
	if(task == "language" || task == "bahasa") {
	} else {
		document.forms[0].page.value = 1;		
	}
	
	document.forms[0].task.value = task;
	document.forms[0].submit();
}

function validate() {
	return validateForm(document.forms[0]);
}