package fandy.action;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import fandy.bean.EmployeeBean;
import fandy.form.EmployeeForm;
import fandy.manager.DepartmentsManager;
import fandy.manager.EmployeeManager;
import fandy.manager.JobManager;
import fandy.manager.impl.DepartmentsManagerImpl;
import fandy.manager.impl.EmployeeManagerImpl;
import fandy.manager.impl.JobManagerImpl;
import fandy.util.PagingUtility;

public class EmployeeAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(true);

		EmployeeManager empManager = new EmployeeManagerImpl();
		JobManager jobManager = new JobManagerImpl();
		DepartmentsManager deptManager = new DepartmentsManagerImpl();

		EmployeeForm rForm = (EmployeeForm) form;

		if ("add".equals(rForm.getTask())) {
			rForm.getEmployeeBean().setEmployeeId(empManager.getNewEmployeeId());
			request.setAttribute("listEmployees", empManager.getListOptionEmployee(0));
			request.setAttribute("listJobs", jobManager.getListOptionJob());
			request.setAttribute("listDepartments", deptManager.getListOptionDepartment());
			return mapping.findForward("add");
		} else if ("edit".equals(rForm.getTask())) {
			rForm.setEmployeeBean(empManager.getEmployeeById(rForm.getEmployeeId()));
			request.setAttribute("listEmployees", empManager.getListOptionEmployee(rForm.getEmployeeId()));
			request.setAttribute("listJobs", jobManager.getListOptionJob());
			request.setAttribute("listDepartments", deptManager.getListOptionDepartment());
			return mapping.findForward("edit");
		} else if ("insert".equals(rForm.getTask())) {
			empManager.insert(rForm.getEmployeeBean());
			return mapping.findForward("forward");
		} else if ("update".equals(rForm.getTask())) {
			empManager.update(rForm.getEmployeeBean());
			return mapping.findForward("forward");
		} else if ("delete".equals(rForm.getTask())) {
			empManager.delete(rForm.getEmployeeId());
			return mapping.findForward("forward");
		} else if ("bahasa".equals(rForm.getTask())) {
			Locale locale = new Locale("in");
			session.setAttribute(org.apache.struts.Globals.LOCALE_KEY, locale);
		} else if ("language".equals(rForm.getTask())) {
			Locale locale = new Locale("en");
			session.setAttribute(org.apache.struts.Globals.LOCALE_KEY, locale);
		}
		int page = rForm.getPage();
		int view = rForm.getViewData();
		int countRows = empManager.getCountByColumn(rForm.getColumnSearch(), rForm.getTextSearch());
		List<EmployeeBean> list = empManager.getListByColumn(rForm.getColumnSearch(), rForm.getTextSearch(), (page - 1) * view + 1, ((page - 1) * view) + view);
		setPaging(request, list, countRows, page, view);
		return mapping.findForward("success");
	}

	private void setPaging(HttpServletRequest request, List<EmployeeBean> list, int countRows, int page, int view)
			throws SQLException {
		PagingUtility pageUtil = new PagingUtility();
		pageUtil.setCountRows(countRows);
		pageUtil.setView(view);

		List<Integer> listPage = pageUtil.getListPaging(page);
		int pageNext = pageUtil.getPageNext();
		int pagePrev = pageUtil.getPagePrev();
		int sumOfPage = pageUtil.getSumOfPage();

		request.setAttribute("pageNow", page);
		request.setAttribute("listPage", listPage);
		request.setAttribute("pageFirst", 1);
		request.setAttribute("pageLast", sumOfPage);
		request.setAttribute("pagePrev", pagePrev);
		request.setAttribute("pageNext", pageNext);
		request.setAttribute("listOfEmployees", list);
	}

}
