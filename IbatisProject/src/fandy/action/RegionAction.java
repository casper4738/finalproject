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

import fandy.bean.RegionBean;
import fandy.form.RegionForm;
import fandy.manager.RegionManager;
import fandy.manager.impl.RegionManagerImpl;
import fandy.util.PagingUtility;

public class RegionAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		RegionManager manager = new RegionManagerImpl();
		RegionForm rForm = (RegionForm) form;

		HttpSession session = request.getSession(true);

		if ("add".equals(rForm.getTask())) {
			rForm.getRegionBean().setRegionId(manager.getNewRegionId());
			return mapping.findForward("add");
		} else if ("edit".equals(rForm.getTask())) {
			rForm.setRegionBean(manager.get(rForm.getRegionId()));
			return mapping.findForward("edit");
		} else if ("insert".equals(rForm.getTask())) {
			manager.insert(rForm.getRegionBean());
			return mapping.findForward("forward");
		} else if ("update".equals(rForm.getTask())) {
			manager.update(rForm.getRegionBean());
			return mapping.findForward("forward");
		} else if ("delete".equals(rForm.getTask())) {
			manager.delete(rForm.getRegionId());
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
		int countRows = manager.getCountByColumn(rForm.getColumnSearch(), rForm.getTextSearch());
		List<RegionBean> list = manager.getListByColumn(rForm.getColumnSearch(), rForm.getTextSearch(), (page - 1) * view+ 1, ((page - 1) * view) + view);
		setPaging(request, list, countRows, page, view);
		return mapping.findForward("success");
	}

	private void setPaging(HttpServletRequest request, List<RegionBean> list, int countRows, int page, int view)
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
		request.setAttribute("listOfRegions", list);
	}

}
