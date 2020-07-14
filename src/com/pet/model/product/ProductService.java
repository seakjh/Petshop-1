package com.pet.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.exception.DMLException;
import com.pet.exception.FileException;
import com.pet.model.common.file.FileManager;

@Service
public class ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public void regist(Product product,MultipartFile myFile, String realPath) throws DMLException, FileException{
		String filename=FileManager.saveFile(myFile, realPath);
		product.setFilename(filename);
		productDAO.insert(product);
	}
	
	public List selectAll() {
		return productDAO.selectAll();
	}
	public Product select(int product_id) {
		return productDAO.select(product_id);
	}
	public void delete(int product_id) throws DMLException{
		productDAO.delete(product_id);
	}
	public void update(Product product,String realPath) throws DMLException, FileException{
		MultipartFile multi=product.getMyFile();
		System.out.println("multi is "+multi.isEmpty());
		
		if(multi.isEmpty()) {//업로드를 안할 경우는 DB만 업데이트 
			productDAO.update(product);
		}else {//업로드할 경우엔 DB + 파일도 처리
			//기존 파일은 삭제하자!!
			FileManager.removeFile(realPath+product.getFilename());
			
			String filename=FileManager.saveFile(multi, realPath);
			product.setFilename(filename);
			productDAO.update(product);
			
		}
	}
}









