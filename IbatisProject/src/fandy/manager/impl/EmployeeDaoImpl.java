package fandy.manager.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import fandy.bean.EmployeeBean;
import fandy.bean.OptionBean;
import fandy.manager.EmployeeDao;
import fandy.util.IbatisHelper;

public class EmployeeDaoImpl implements EmployeeDao {

	private SqlMapClient mapper;
	
	public EmployeeDaoImpl() {
		mapper = IbatisHelper.getSqlMapInstance();
	}

	public void insert(EmployeeBean e) throws SQLException {
		try {
			mapper.startTransaction();
			mapper.delete("employee.insert", e);
			mapper.commitTransaction();
		} finally {
			mapper.endTransaction();
		}
	}

	public void update(EmployeeBean e) throws SQLException {
		try {
			mapper.startTransaction();
			mapper.update("employee.update", e);
			mapper.commitTransaction();
		} finally {
			mapper.endTransaction();
		}
	}

	public void delete(Integer id) throws SQLException {
		try {
			mapper.startTransaction();
			mapper.delete("employee.delete", id);
			mapper.commitTransaction();
		} finally {
			mapper.endTransaction();
		}
	}

	public EmployeeBean getEmployeeById(Integer id) throws SQLException {
		return (EmployeeBean) mapper.queryForObject("employee.get", id);
	}

	public List<EmployeeBean> getListByColumn(String column, String value, Integer pageBegin, Integer pageEnd) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("value", value);
		map.put("pageBegin", pageBegin);
		map.put("pageEnd", pageEnd);
		return mapper.queryForList("employee.getListByCol", map);
	}

	public Integer getNewEmployeeId() throws SQLException {
		return (Integer) mapper.queryForObject("employee.getNewEmployeeId", null);
	}

	public List<OptionBean> getListOptionEmployee(Integer id) throws SQLException {
		return mapper.queryForList("employee.getListOptionEmployee", id);
	}

	public Integer getCountByColumn(String column, String value) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("value", value);
		return (Integer) mapper.queryForObject("employee.getCountListByCol", map);
	}

}
