package fandy.manager.impl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import fandy.bean.OptionBean;
import fandy.manager.DepartmentsDao;
import fandy.util.IbatisHelper;

public class DepartmentsDaoImpl implements DepartmentsDao {
	
	private SqlMapClient mapper;
	
	public DepartmentsDaoImpl() {
		mapper = IbatisHelper.getSqlMapInstance();
	}

	public List<OptionBean> getListOptionDepartment() throws SQLException {
		return mapper.queryForList("department.getListOptionDepartment", null);
	}
	
}
