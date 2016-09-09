<!--- Please insert your code here --->

<!---<cfset queryexecute(
			"insert into brand_table (brand_name,brand_description) values(?,?)",
			["Motorola","Motorla brand is owned by Lenovo" ],
			{result="result"}
		)>


<cfset NewPrimaryKey = result.generatedkey>
<cfdump var="#result#" />--->

<!---<cfscript>
	brandPersistence = createObject("component", "persistence.brandpersistence");
	//brand = brandPersistence.saveBrand("Motorola","Motorla brand is owned by Lenovo");
	//brand_serialized = serializeJSON(brand);
	//cfdump (var="#brand_serialized#" );
	//brandPersistence.getBrandDetailsById(1);
	//brandPersistence.updateBrandDescription(1,"Motorla brand is owned by Lenovo");
	//brandPersistence.deleteBrandbyId(1);
	brands = brandPersistence.getBrands();
	writeOutput(serializeJSON(brands));
</cfscript>--->

<!---<cfscript>
	categoryPersistence = createObject("component", "persistence.categorypersistence");
	category = categoryPersistence.saveCategory("Electronics","These are electronic products");
	cfdump (var="#category#" );
</cfscript>--->

<!---<cfscript>
	productPersistence = createObject("component", "persistence.productpersistence" );
	//product = productPersistence.saveProduct("Iphone6c","Latest phone by Apple",2,1,"www.cdn.com/iphone6s,www.cdn.com/small/iphone6s");
	//product = productPersistence.saveProduct("Nexus6p","Latest phone by Google",2,1,"www.cdn.com/nexus6p,www.cdn.com/small/nexus6p");
	//cfdump (var="#product#" );
	productList = productPersistence.getProducts();
	//productList = productPersistence.getProductsByBrand(2);
	//productList = productPersistence.getProductsByCategory(1);
	
	/*productStruct = structnew();
	productStruct.product_descrition = "Latest phone by Google";
	productStruct.product_name = "Nexus6p";
	productStruct.product_id = 1;
	productStruct.product_brand_id = 2;
	productStruct.product_category_id = 1;
	imageLinks = arrayNew(1);
	imageLinks.append("www.cdn.com/nexus6p");
	imageLinks.append("www.cdn.com/small/nexus6p");
	productStruct.product_image_links = imageLinks;
	//writeOutput(serializeJSON(productStruct));
	writeOutput(productStruct["product_image_links"].size());
	writeOutput(productPersistence.updateProductDetails(productStruct));*/
	writeOutput(serializeJSON(productList));
	//writeOutput(serializeJSON(product));
</cfscript>--->

<!---<cfscript>
	promotionPersistence = createObject("component", "promotionService.promotionpersistence" );
/*	promotion = promotionPersistence.addPromotion("Buy_One_Get_One_free","This promotion is applicable to xyz jeans brand","active","product_brand_id");
	writeDump(serializeJSON(promotion));*/
	//writeDump(promotionPersistence.generateDiscountCode(1));
	promotions = promotionPersistence.getPromotions();
	writeOutput(serializeJSON(promotions));
	//writeOutput(promotionPersistence.invalidateDiscountCode("5F9A2787-F11B-9314-1D5A11931BABB948","active"));
	//discountCode = promotionPersistence.getDiscountCode(2);
	//writeOutput(discountCode);
</cfscript>--->
<!---
<cfscript>
	merchantPersistence = createObject("component", "ecommerce.persistence.merchantpersistence" );
	//response = merchantPersistence.addProduct(1,1,600,10);
	//writeOutput(response);
	//response = merchantPersistence.updateProductPrice(1,1,800);
	//writeOutput(response);
	response = merchantPersistence.updateProductQuantity(1,1,15);
	writeOutput(response);
</cfscript>--->

<cfscript>
	orderPersistence = createObject("component", "ecommerce.persistence.orderpersistence");
	/*products = arraynew(1);
	productStruct = structnew();
	productStruct.product_id = 2;
	productStruct.product_merchant_id = 1;
	productStruct.quantity = 3 ;
	arrayAppend(products,productStruct);
	//writeOutput(serializeJSON(products));
	productString = serializeJSON(products);
	order = orderPersistence.createOrder(1,"cart",productString,"1");
	writeOutput(serializeJSON(order));*/
	
	order = orderPersistence.getOrders("FA290252-A1F3-8697-CDC9EDB372E746ED");
	writeOutput(serializeJSON(order));
/*	productString = serializeJSON(products);
	order = orderPersistence.updateOrder(1,1,1,"cart",productString);
	writeOutput(serializeJSON(order));*/
</cfscript>
<!---<cfoutput >
	#createuUID()#
</cfoutput>--->