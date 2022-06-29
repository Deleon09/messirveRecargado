package com.uca.ncapas.controller;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uca.ncapas.models.dtos.CartDTO;
import com.uca.ncapas.models.dtos.Details_OrderDTO;
import com.uca.ncapas.models.entities.Details_Order;
import com.uca.ncapas.models.entities.Donations;
import com.uca.ncapas.models.entities.Harea;
import com.uca.ncapas.models.entities.OrderDetail;
import com.uca.ncapas.models.entities.Orders;
import com.uca.ncapas.models.entities.Products;
import com.uca.ncapas.repositories.CartDTORepository;
import com.uca.ncapas.repositories.Details_OrderDTORepository;
import com.uca.ncapas.repositories.OrdersDTORepository;
import com.uca.ncapas.services.CartService;
import com.uca.ncapas.services.Details_OrderService;
import com.uca.ncapas.services.DonationsService;
import com.uca.ncapas.services.HareaService;
import com.uca.ncapas.services.OrdersService;
import com.uca.ncapas.services.ProductsService;

@Controller
@RequestMapping("/")
public class OrdersController {

	@Autowired
	private OrdersService service;
	@Autowired
	private OrdersDTORepository Orepository;
	
	@Autowired
	private Details_OrderDTORepository DOrepository;
	
	@Autowired
	private Details_OrderService dservice;
	
	@Autowired
	private CartDTORepository Crepository;
	
	@Autowired
	private ProductsService pservice;
	
	@Autowired
	private Details_OrderService doservice;
	
	@Autowired
	private HareaService haservice;		
	
	@Autowired
	private DonationsService donationservice;
	
	@Autowired
	private CartService cartservice;	
	
	@RequestMapping(value = {"/listaOrdenes"}, method = RequestMethod.GET)
    public String ordersPage(ModelMap model) {
        return "ordersTemplate";
    }
	
	@RequestMapping(value = "/guardarOrden", method = RequestMethod.POST)
    public @ResponseBody String guardarOrden(@ModelAttribute("Orders") Orders orders) {
    			 
         Orders recent = service.saveOrder(orders);         
         System.out.println(recent.getId());                 

         List<CartDTO> od = Crepository.getCartsDTOByUserID(orders.getUser().getId());               
         
         for(CartDTO detail : od) {        	 
        	Products products = pservice.getProductsById(detail.getProducto_id());        	 
        	Details_Order order_detail = new Details_Order(orders, products, detail.getCantidad());      
        	doservice.saveDetails_Order(order_detail);
         }    
         
         double percent = orders.getPrecio_total_orden() * 0.2;
         
         List<Harea> harea = haservice.getHareas();                       
         Donations dono = new Donations(orders.getUser(), percent, "Se ha donado el 20% según las orden con el id: " + recent.getId(), harea.get(0));                 
         donationservice.saveDonations(dono);
         
         for(CartDTO delete: od) {
        	 cartservice.deleteCart(delete.getId());
         }
         
         return null;
     }
	
	@RequestMapping(value = "/eliminarOrden/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String eliminarOrden(@PathVariable int id) {
		service.deleteOrder(id);
		return null;
	}
	
	@RequestMapping(value = "/detallesOrden/{id}", method = RequestMethod.GET)
	public String detalleOrden(ModelMap model, @PathVariable int id) {
		model.addAttribute("order", Orepository.getOrderByIdDTO(id));
		model.addAttribute("orderDetails", DOrepository.getDetails_OrderDTOByOrderId(id));
		
		return "orderDetailSeeTemplate";
	}
	
	@RequestMapping(value = "/detallesMyOrders/{id}", method = RequestMethod.GET)
	public String detallesMyOrders(ModelMap model, @PathVariable int id) {
		model.addAttribute("order", Orepository.getOrderByIdDTO(id));
		model.addAttribute("orderDetails", DOrepository.getDetails_OrderDTOByOrderId(id));
		
		return "myOrdersSeeDetails";
	}
	
}
