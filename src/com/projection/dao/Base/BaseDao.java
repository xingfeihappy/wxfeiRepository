package com.projection.dao.Base;

import java.util.List;

/**
 * 是所有Dao的接口
 * @author d
 * 2013-7-28
 * @param <Entity>
 */
public interface BaseDao<Entity> {
	/**
	 * 根据ID查找实体
	 * @param id
	 * @return
	 */
	Entity get(int id);
	
	/**
	 * 全部列表
	 * @return
	 */
	List<Entity> getAll();

	/**
	 * 插入实体
	 * @param e
	 * @return
	 */
	int save(Entity e);

	/**
	 * 删除实体
	 * @param e
	 * @return
	 */
	void delete(Entity e);

	/**
	 * 根据ID删除实体
	 * @param id
	 * @return
	 */
	void delete(int id);
	

	

	/**
	 * 更新
	 * @param e
	 * @return
	 */
	void update(Entity e);




	
}
