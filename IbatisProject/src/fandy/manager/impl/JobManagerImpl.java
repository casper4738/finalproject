package fandy.manager.impl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import fandy.bean.OptionBean;
import fandy.manager.JobManager;
import fandy.util.IbatisHelper;

public class JobManagerImpl implements JobManager {

	private SqlMapClient mapper;

	public JobManagerImpl() {
		mapper = IbatisHelper.getSqlMapInstance();
	}

	public List<OptionBean> getListOptionJob() throws SQLException {
		return mapper.queryForList("job.getListOptionJob", null);
	}

}
