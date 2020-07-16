package com.pet.model.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.domain.Category;
import com.pet.exception.DMLException;

@Service
public class CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;
	
	public void regist(Category category) throws RuntimeException{
		categoryDAO.insert(category);
	}
	public List selectAll() {
		return categoryDAO.selectAll();
	}
	public void delete(int category_id) throws DMLException{
		categoryDAO.delete(category_id);
	}
}








