package com.uca.ncapas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.uca.ncapas.models.dtos.CartDTO;
import com.uca.ncapas.models.dtos.DonationsDTO;
import com.uca.ncapas.models.dtos.OrdersDTO;
import com.uca.ncapas.models.dtos.ProductDTO;
import com.uca.ncapas.models.dtos.UserDTO;
import com.uca.ncapas.models.dtos.WishListDTO;
import com.uca.ncapas.models.entities.Category;
import com.uca.ncapas.models.entities.Newsletter;
import com.uca.ncapas.models.entities.Roles;
import com.uca.ncapas.models.entities.Suppliers;
import com.uca.ncapas.models.entities.User;
import com.uca.ncapas.repositories.CartDTORepository;
import com.uca.ncapas.repositories.DonationsDTORepository;
import com.uca.ncapas.repositories.OrdersDTORepository;
import com.uca.ncapas.repositories.ProductsDTORepository;
import com.uca.ncapas.repositories.UserDTORepository;
import com.uca.ncapas.repositories.WishListDTORepository;
import com.uca.ncapas.services.CategoryService;
import com.uca.ncapas.services.NewsletterService;
import com.uca.ncapas.services.RolesService;
import com.uca.ncapas.services.SuppliersService;

@RestController
@RequestMapping("/")
public class AppRestController {
	
	@Autowired
	private RolesService service;
	@Autowired
	private CategoryService CatService;
	@Autowired
	private SuppliersService SupService;
	@Autowired
	private NewsletterService NewService;
	@Autowired
	private UserDTORepository Urepository;
	@Autowired
	private DonationsDTORepository Drepository;
	@Autowired
	private WishListDTORepository Wrepository;
	@Autowired
	private ProductsDTORepository Prepository;
	@Autowired
	private OrdersDTORepository Orepository;
	@Autowired
	private CartDTORepository CartDtorepo;
	
	@RequestMapping(value = {"/listaRolesG"}, method = RequestMethod.GET)
    public List<Roles> listaRoles() {
		List<Roles> listaRoles = service.getRoles();
        return listaRoles;
    }
	
	@RequestMapping(value = {"/listaCategoriasG"}, method = RequestMethod.GET)
    public List<Category> listaCategorias() {
		List<Category> listaCategorias = CatService.getCategories();
        return listaCategorias;
    }
	
	@RequestMapping(value = {"/listaProveedoresG"}, method = RequestMethod.GET)
    public List<Suppliers> listaProveedores() {
		List<Suppliers> listaProveedores = SupService.getSuppliers();
        return listaProveedores;
    }
	
	@RequestMapping(value = {"/listaCartasG"}, method = RequestMethod.GET)
    public List<Newsletter> listaCartas() {
		List<Newsletter> listaCartas = NewService.getNewsletters();
        return listaCartas;
    }
	
	@RequestMapping(value = {"/listaUsuariosG"}, method = RequestMethod.GET)
    public List<UserDTO> listaUsuarios() {
		List<UserDTO> listaUsuarios = Urepository.getUsersDTO();
        return listaUsuarios;
    }
	
	@RequestMapping(value = "/loginUser", method = RequestMethod.POST)
    public @ResponseBody UserDTO loginUser(@RequestBody User user) {
         
         String nombre = user.getNombre(); 
         String contrasena = user.getContrasena();
         
         UserDTO userlogged = Urepository.getUserDTOByNameAndPass(nombre, contrasena);
         System.out.print(userlogged);
         
         return userlogged;
     }
	
	@RequestMapping(value = {"/listaDonacionesG"}, method = RequestMethod.GET)
    public List<DonationsDTO> listaDonaciones() {
		List<DonationsDTO> listaDonaciones = Drepository.getDonationsDTO();
        return listaDonaciones;
    }
	
	@RequestMapping(value = {"/listaDeseosG"}, method = RequestMethod.GET)
    public List<WishListDTO> listaDeseos() {
		List<WishListDTO> listaDeseos = Wrepository.getWishListsDTO();
        return listaDeseos;
    }
	
	@RequestMapping(value = {"/listaProductosG"}, method = RequestMethod.GET)
    public List<ProductDTO> listaProductos() {
		List<ProductDTO> listaProductos = Prepository.getProductsDTO();
        return listaProductos;
    }
	
	@RequestMapping(value = {"/listaOrdenesG"}, method = RequestMethod.GET)
    public List<OrdersDTO> listaOrdenes() {
		List<OrdersDTO> listaOrdenes = Orepository.getOrdersDTO();
        return listaOrdenes;
    }
	
	@RequestMapping(value = "/listaCarritoC", method = RequestMethod.POST)
    public @ResponseBody List<CartDTO> listaCarritoC(@RequestBody User user) {
         
		List<CartDTO> cartList = CartDtorepo.getCartsDTOByUserID(user.getId());
         
         return cartList;
     }
}
