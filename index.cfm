<!--- Please insert your code here --->

<!---<cfset queryexecute(
			"insert into brand_table (brand_name,brand_description) values(?,?)",
			["Motorola","Motorla brand is owned by Lenovo" ],
			{result="result"}
		)>


<cfset NewPrimaryKey = result.generatedkey>
<cfdump var="#result#" />--->

<!---<cfscript>
	brandPersistance = createObject("component", "persistance.brandpersistance");
	//brand = brandPersistance.saveBrand("Motorola","Motorla brand is owned by Lenovo");
	//brand_serialized = serializeJSON(brand);
	//cfdump (var="#brand_serialized#" );
	//brandPersistance.getBrandDetailsById(1);
	//brandPersistance.updateBrandDescription(1,"Motorla brand is owned by Lenovo");
	//brandPersistance.deleteBrandbyId(1);
	brands = brandPersistance.getBrands();
	writeOutput(serializeJSON(brands));
</cfscript>--->

<!---<cfscript>
	categoryPersistance = createObject("component", "persistance.categorypersistance");
	category = categoryPersistance.saveCategory("Electronics","These are electronic products");
	cfdump (var="#category#" );
</cfscript>--->

<!---<cfscript>
	productPersistance = createObject("component", "persistance.productpersistance" );
	//product = productPersistance.saveProduct("Iphone6c","Latest phone by Apple",2,1,"www.cdn.com/iphone6s,www.cdn.com/small/iphone6s");
	//product = productPersistance.saveProduct("Nexus6p","Latest phone by Google",2,1,"www.cdn.com/nexus6p,www.cdn.com/small/nexus6p");
	//cfdump (var="#product#" );
	productList = productPersistance.getProducts();
	//productList = productPersistance.getProductsByBrand(2);
	//productList = productPersistance.getProductsByCategory(1);
	
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
	writeOutput(productPersistance.updateProductDetails(productStruct));*/
	writeOutput(serializeJSON(productList));
	//writeOutput(serializeJSON(product));
</cfscript>--->

<!---<cfscript>
	promotionPersistance = createObject("component", "promotionService.promotionpersistance" );
/*	promotion = promotionPersistance.addPromotion("Buy_One_Get_One_free","This promotion is applicable to xyz jeans brand","active","product_brand_id");
	writeDump(serializeJSON(promotion));*/
	//writeDump(promotionPersistance.generateDiscountCode(1));
	promotions = promotionPersistance.getPromotions();
	writeOutput(serializeJSON(promotions));
	//writeOutput(promotionPersistance.invalidateDiscountCode("5F9A2787-F11B-9314-1D5A11931BABB948","active"));
	//discountCode = promotionPersistance.getDiscountCode(2);
	//writeOutput(discountCode);
</cfscript>--->
<!---
<cfscript>
	merchantPersistance = createObject("component", "ecommerce.persistance.merchantpersistance" );
	//response = merchantPersistance.addProduct(1,1,600,10);
	//writeOutput(response);
	//response = merchantPersistance.updateProductPrice(1,1,800);
	//writeOutput(response);
	response = merchantPersistance.updateProductQuantity(1,1,15);
	writeOutput(response);
</cfscript>--->

<cfscript>
	orderPersistance = createObject("component", "ecommerce.persistance.orderpersistance");
	/*products = arraynew(1);
	productStruct = structnew();
	productStruct.product_id = 2;
	productStruct.product_merchant_id = 1;
	productStruct.quantity = 3 ;
	arrayAppend(products,productStruct);
	//writeOutput(serializeJSON(products));
	productString = serializeJSON(products);
	order = orderPersistance.createOrder(1,"cart",productString,"1");
	writeOutput(serializeJSON(order));*/
	
	order = orderPersistance.getOrders("FA290252-A1F3-8697-CDC9EDB372E746ED");
	writeOutput(serializeJSON(order));
/*	productString = serializeJSON(products);
	order = orderPersistance.updateOrder(1,1,1,"cart",productString);
	writeOutput(serializeJSON(order));*/
</cfscript>
<!---<cfoutput >
	#createuUID()#
</cfoutput>--->