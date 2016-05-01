import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.projection.dao.DishesDao;
import com.projection.dao.OrderDao;
import com.projection.domain.Dishes;
import com.projection.domain.Order;

public class TestClass {
	public static void main(String[] args) {
		OrderDao or = new OrderDao();
		Order o = new Order();
		o.setCodes("aabbcc");
		o.setDinnerTime(new Date());
		o.setFoodNum(5);
		Dishes di = new DishesDao().get(4);
		Set<Dishes> s = new HashSet<Dishes>();
		s.add(di);
		o.setDishesSet(s);
		or.save(o);
	}
}
