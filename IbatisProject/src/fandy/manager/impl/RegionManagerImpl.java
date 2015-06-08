package fandy.manager.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import fandy.bean.RegionBean;
import fandy.manager.RegionManager;
import fandy.util.IbatisHelper;

public class RegionManagerImpl implements RegionManager {

	private SqlMapClient mapper;

	public RegionManagerImpl() {
		mapper = IbatisHelper.getSqlMapInstance();
	}

	public void insert(RegionBean e) throws SQLException {
		try {
			mapper.startTransaction();
			mapper.delete("region.insert", e);
			mapper.commitTransaction();
		} finally {
			mapper.endTransaction();
		}
	}

	public void update(RegionBean e) throws SQLException {
		try {
			mapper.startTransaction();
			mapper.delete("region.update", e);
			mapper.commitTransaction();
		} finally {
			mapper.endTransaction();
		}
	}

	public void delete(int id) throws SQLException {
		try {
			mapper.startTransaction();
			mapper.delete("region.delete", id);
			mapper.commitTransaction();
		} finally {
			mapper.endTransaction();
		}
	}

	@Override
	public RegionBean get(int id) throws SQLException {
		return (RegionBean) mapper.queryForObject("region.get", id);
	}

	public List<RegionBean> getListByColumn(String column, String value, int pageBegin, int pageEnd) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("value", value);
		map.put("pageBegin", pageBegin);
		map.put("pageEnd", pageEnd);
		return mapper.queryForList("region.getListByCol", map);
	}

	public Integer getNewRegionId() throws SQLException {
		return (Integer) mapper.queryForObject("region.getNewRegionId", null);
	}
	
	public Integer getCountByColumn(String column, String value) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("value", value);
		return (Integer) mapper.queryForObject("region.getCountListByCol", map);
	}
	
}
