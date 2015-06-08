package fandy.manager.impl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import fandy.bean.OptionBean;
import fandy.manager.JobDao;
import fandy.util.IbatisHelper;

public class JobDaoImpl implements JobDao {

	private SqlMapClient mapper;

	public JobDaoImpl() {
		mapper = IbatisHelper.getSqlMapInstance();
	}

	public List<OptionBean> getListOptionJob() throws SQLException {
		return mapper.queryForList("job.getListOptionJob", null);
	}

}
