package com.itbulls.learnit.onlinestore.persistence.dto.converter;

import java.util.ArrayList;
import java.util.List;

import com.itbulls.learnit.onlinestore.persistence.dto.PurchaseDto;
import com.itbulls.learnit.onlinestore.persistence.enteties.Purchase;
import com.itbulls.learnit.onlinestore.persistence.enteties.impl.DefaultPurchase;

public class PurchaseDtoToPurchaseConverter {
	
	private ProductDtoToProductConverter productConverter = new ProductDtoToProductConverter();
	private UserDtoToUserConverter userConverter = new UserDtoToUserConverter();
	private PurchaseStatusDtoToPurchaseStatusConverter purchaseStatusConverter = new PurchaseStatusDtoToPurchaseStatusConverter();

	// DTO -> Entity : credit card, customer, products, id, purchase status 
	public Purchase convertPurchaseDtoToPurchase(PurchaseDto purchaseDto) {
		Purchase purchase = new DefaultPurchase();
		if(purchaseDto.getUserDto() != null){
			purchase.setCreditCardNumber(purchaseDto.getUserDto().getCreditCard());
		}
		purchase.setCustomer(userConverter.convertUserDtoToUser(purchaseDto.getUserDto()));
		purchase.setProducts(productConverter.convertProductDtosToProducts(purchaseDto.getProductDtos()));
		purchase.setId(purchaseDto.getId());
		purchase.setPurchaseStatus(purchaseStatusConverter.convertPurchaseStatusDtoToPurchaseStatus(purchaseDto.getPurchaseStatusDto()));
		return purchase;
	}
	
	// Entity -> DTO
	public PurchaseDto convertPurchaseToPurchaseDto(Purchase purchase) {
		PurchaseDto purchaseDto = new PurchaseDto();

		if(purchase.getId() != null){
			purchaseDto.setId(purchase.getId());
		}
		purchaseDto.setProductDtos(productConverter.convertProductsToProductDtos(purchase.getProducts()));
		purchaseDto.setUserDto(userConverter.convertUserToUserDto(purchase.getCustomer()));
		purchaseDto.setPurchaseStatusDto(purchaseStatusConverter.convertPurchaseStatusToPurchaseStatusDto(purchase.getPurchaseStatus()));

		return purchaseDto;
	}

	public List<Purchase> convertPurchaseDtosToPurchases(List<PurchaseDto> purchasesDtos) {
		List<Purchase> purchases = new ArrayList<>();
		if (purchasesDtos != null) {
			for (PurchaseDto purchaseDto : purchasesDtos) {
				purchases.add(convertPurchaseDtoToPurchase(purchaseDto));
			}
		}
		return purchases;
	}

}