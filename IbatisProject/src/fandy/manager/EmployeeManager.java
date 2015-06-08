package fandy.manager;

import java.sql.SQLException;
import java.util.List;

import fandy.bean.EmployeeBean;
import fandy.bean.OptionBean;

public interface EmployeeManager {

	public void insert(EmployeeBean e) throws SQLException;
	
	public void update(EmployeeBean e) throws SQLException;
	
	public void delete(Integer id) throws SQLException;
	
	public EmployeeBean getEmployeeById(Integer id) throws SQLException;
	
	public List<EmployeeBean> getListByColumn(String column, String value, Integer pageBegin, Integer pageEnd) throws SQLException;
	
	public List<OptionBean> getListOptionEmployee(Integer id) throws SQLException;
	
	public Integer getCountByColumn(String column, String value) throws SQLException;
	
	public Integer getNewEmployeeId() throws SQLException;
}
