package com.pet.model.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.domain.Cart;
import com.pet.domain.OrderDetail;
import com.pet.domain.OrderSummary;
import com.pet.domain.Product;
import com.pet.domain.Receiver;
import com.pet.exception.DMLException;
import com.pet.model.order.OrderDetailDAO;
import com.pet.model.order.OrderSummaryDAO;
import com.pet.model.receiver.ReceiverDAO;

@Service
public class ShoppingService {
	@Autowired
	private ReceiverDAO receiverDAO;
	
	@Autowired
	private OrderSummaryDAO orderSummaryDAO;
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	
	//배송자 정보 입력 후, pk을 가져와야 한다!
	public void insert(List<Cart> cartList , OrderSummary orderSummary) throws DMLException{
		Receiver receiver = orderSummary.getReceiver();
		
		//받는 사람 정보 입력 
		System.out.println("입력전의 receiver_id"+receiver.getReceiver_id());
		System.out.println("입력후의 receiver_id"+receiver.getReceiver_id());
		
		if(orderSummary.getSame().equals("yes")) {
			//받을 사람이 회원인 경우엔 receiver_id는 member_id로 대체하면 된다!!
			receiver.setReceiver_id(orderSummary.getMember().getMember_id());
		}else {
			//받을 사람이 회원이 아닌 경우엔 receiver_id에는 receiverDAO.insert
			//후에 반환되는 pk.를 대체하면 된다!!
			receiverDAO.insert(receiver);
		}
		//주문정보 입력
		orderSummaryDAO.insert(orderSummary);
		System.out.println("방금 들어간 주문코드는 "+orderSummary.getOrder_summary_id());
		
		//주문 상세 정보 입력!!
		for(int i=0;i<cartList.size();i++) {
			Cart cart = cartList.get(i);
			OrderDetail orderDetail=new OrderDetail();
			orderDetail.setOrderSummary(orderSummary);
			orderDetail.setProduct((Product)cart);
			orderDetail.setEa(cart.getEa());
			
			orderDetailDAO.insert(orderDetail);
		}
	}
	
}












