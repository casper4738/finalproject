package fandy.form;

import org.apache.struts.action.ActionForm;

import fandy.bean.EmployeeBean;

public class EmployeeForm extends ActionForm {

	private EmployeeBean employeeBean = new EmployeeBean();
	private String task;
	private String taskTemp;
	private String columnSearch;
	private String textSearch;
	private String message;
	private Integer employeeId;
	private Integer page = 1;
	private Integer viewData = 10;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public EmployeeBean getEmployeeBean() {
		return employeeBean;
	}

	public void setEmployeeBean(EmployeeBean employeeBean) {
		this.employeeBean = employeeBean;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public String getTaskTemp() {
		return taskTemp;
	}

	public void setTaskTemp(String taskTemp) {
		this.taskTemp = taskTemp;
	}

	public String getColumnSearch() {
		return columnSearch;
	}

	public void setColumnSearch(String columnSearch) {
		this.columnSearch = columnSearch;
	}

	public String getTextSearch() {
		return textSearch;
	}

	public void setTextSearch(String textSearch) {
		this.textSearch = textSearch;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getViewData() {
		return viewData;
	}

	public void setViewData(Integer viewData) {
		this.viewData = viewData;
	}

}
