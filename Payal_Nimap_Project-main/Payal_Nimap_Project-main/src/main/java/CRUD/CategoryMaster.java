package CRUD;
import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class CategoryMaster {
	@Id
	int CategoryId;
	String Categoryname;
	
	public int getCategoryId() {
		return CategoryId;
	}

	public void setCategoryId(int categoryId) {
		CategoryId = categoryId;
	}

	public String getCategoryname() {
		return Categoryname;
	}

	public void setCategoryname(String categoryname) {
		Categoryname = categoryname;
	}
}
