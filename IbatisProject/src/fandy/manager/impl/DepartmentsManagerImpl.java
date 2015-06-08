package fandy.manager.impl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import fandy.bean.OptionBean;
import fandy.manager.DepartmentsManager;
import fandy.util.IbatisHelper;

public class DepartmentsManagerImpl implements DepartmentsManager {
	
	private SqlMapClient mapper;
	
	public DepartmentsManagerImpl() {
		mapper = IbatisHelper.getSqlMapInstance();
	}

	public List<OptionBean> getListOptionDepartment() throws SQLException {
		return mapper.queryForList("department.getListOptionDepartment", null);
	}
	
}
