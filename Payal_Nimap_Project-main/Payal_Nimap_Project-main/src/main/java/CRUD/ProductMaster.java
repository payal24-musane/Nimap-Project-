package CRUD;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
@Entity
public class ProductMaster {
	@Id
	int ProductId;
	String ProductName;
	@OneToOne
	CategoryMaster Cm;
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public CategoryMaster getCm() {
		return Cm;
	}
	public void setCm(CategoryMaster cm) {
		Cm = cm;
	}

}
