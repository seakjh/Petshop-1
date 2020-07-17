package com.pet.domain;

public class EventProduct {
	private int event_product_id;
	private Event event; //has a
	private Product product;//has a
	
	public int getEvent_product_id() {
		return event_product_id;
	}
	public void setEvent_product_id(int event_product_id) {
		this.event_product_id = event_product_id;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}
