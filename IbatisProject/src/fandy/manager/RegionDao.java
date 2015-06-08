package fandy.manager;

import java.sql.SQLException;
import java.util.List;

import fandy.bean.RegionBean;

public interface RegionDao {

	public void insert(RegionBean e) throws SQLException;

	public void update(RegionBean e) throws SQLException;

	public void delete(int id) throws SQLException;

	public RegionBean get(int id) throws SQLException;

	public List<RegionBean> getListByColumn(String column, String value, int pageBegin, int pageEnd) throws SQLException;
	
	public Integer getCountByColumn(String column, String value) throws SQLException;
	
	public Integer getNewRegionId() throws SQLException;
}
