package com.projection.dao;

import java.util.ArrayList;
import java.util.List;

import com.projection.dao.Base.SuperDao;
import com.projection.domain.Dishes;

public class DishesDao extends SuperDao<Dishes> {

	@SuppressWarnings("unchecked")
	public List<Dishes> getListGroupBy(Integer type) {
		List<Dishes> list = new ArrayList<Dishes>();
		String hql = null;
		if(type == 1){
			System.out.println(type);
			hql = "from Dishes d where d.valid =1 group by d.recommended having sum(d.recommended) > 0";
		}else if(type == 2){
			System.out.println(type);
			hql = "from Dishes d where d.valid =1 order by d.updateTime desc";
		}else if(type == 3){
			System.out.println(type);
			hql = "from Dishes d where d.valid =1 and (d.description like '%好%' or d.description like '%美味%')";
		}else if(type == 4){
			System.out.println(type);
			hql = "from Dishes d where d.valid =1 and d.price < 100";
		}
		list = this.getSession().createQuery(hql).list();
		System.out.println(list.size());
		return list;
	}
}
