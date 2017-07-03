package project.shopping.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import project.shopping.pojo.PageConfig;

/**
 * 分页
 * 
 * @author zhouyuyou
 * @date 2017年4月28日上午10:07:45
 * @param <T>
 */
@Repository
public class PaginationDao<T> implements IPaginationDao<T> {

	private SqlSessionTemplate sqlSessionTemplate;

	@Resource
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public SqlSessionTemplate getSqlSessionTemplate() {
		return this.sqlSessionTemplate;
	}

	@SuppressWarnings("unchecked")
	@Override
	public PageConfig<T> findPage(String listSql, String countSql, Map<String, Object> map) {
		Integer curPage = 1;
		if (map.containsKey("pageNum") && StringUtils.isNoneBlank(String.valueOf("pageNum"))) {
			curPage = Integer.valueOf(String.valueOf(map.get("pageNum")));
		}

		Integer numPerPage = 10;
		if (map.containsKey("numPerPage") && StringUtils.isNoneBlank(String.valueOf(map.get("numPerPage")))) {
			numPerPage = Integer.valueOf(String.valueOf(map.get("numPerPage")));
		}

		// 得到数据记录总数
		Integer totalRecord = this.getSqlSessionTemplate()
				.selectOne("project.shopping.dao." + map.get("nameSpace") + "Dao." + countSql, map);
		PageConfig<T> pageConfig = new PageConfig<T>(totalRecord, numPerPage, curPage);
		if (pageConfig.getTotalResultSize() > 0) {
			pageConfig.setItems((List<T>) getSqlSessionTemplate().selectList(
					"project.shopping.dao." + map.get("nameSpace") + "Dao." + listSql, map,
					new PageBounds(curPage, numPerPage, null, false)));
		}
		return pageConfig;

	}

	/*
	 * @Override public PageConfig getMyPage(String listId, String countId,
	 * HashMap map, String type) { String nameSpace = ""; if
	 * (map.containsKey(Constant.NAME_SPACE)) { if
	 * (StringUtils.isNotBlank(type)) { nameSpace = "com.info.web.dao.I" +
	 * map.get(Constant.NAME_SPACE) + "Dao."; } else { nameSpace =
	 * "com.info.back.dao.I" + map.get(Constant.NAME_SPACE) + "Dao."; } }
	 * Integer curPage = 1; if (map.containsKey(Constant.CURRENT_PAGE) &&
	 * StringUtils.isNoneBlank(String.valueOf(map.get(Constant.CURRENT_PAGE))))
	 * { curPage =
	 * Integer.valueOf(String.valueOf(map.get(Constant.CURRENT_PAGE))); }
	 * 
	 * Integer numPerPage = 10; if (map.containsKey(Constant.PAGE_SIZE) &&
	 * StringUtils.isNoneBlank(String.valueOf(map.get(Constant.PAGE_SIZE)))) {
	 * numPerPage =
	 * Integer.valueOf(String.valueOf(map.get(Constant.PAGE_SIZE))); }
	 * 
	 * map.put(Constant.CURRENT_PAGE, (curPage - 1) * numPerPage);
	 * map.put(Constant.PAGE_SIZE, numPerPage); // 得到数据记录总数 Integer totalRecord
	 * = (Integer) getSqlSessionTemplate().selectOne(nameSpace + countId, map);
	 * PageConfig pageConfig = new PageConfig(totalRecord, numPerPage, curPage);
	 * pageConfig.setTotalResultSize(totalRecord); if
	 * (pageConfig.getTotalPageNum() > 0) { //
	 * fyc注释，pagebounds中后两个参数不传，到这里会默认在list方法外包裹一层select count(1)，在查询一次
	 * pageConfig.setItems(getSqlSessionTemplate().selectList(nameSpace +
	 * listId, map)); } return pageConfig; }
	 */
}
