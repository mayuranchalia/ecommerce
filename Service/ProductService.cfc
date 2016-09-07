<cfcomponent restpath="products" rest="true" >
	
	<cffunction name="addProduct" access="remote" httpmethod="POST" consumes="application/x-www-form-urlencoded" 
													produces="application/json" returntype="ecommerce.model.product" >
		<cfargument name="productName" type="string" restargsource="Form" restargname="productName">
		<cfargument name="productDescription" type="string" restargsource="Form" restargname="productDescription">
		<cfargument name="productBrandId" type="numeric" restargsource="Form" restargname="productBrandId">
		<cfargument name="productCategoryId" type="numeric" restargsource="Form" restargname="productCategoryId">
		<cfargument name="productImageLinks" type="string" restargsource="Form" restargname="productImageLinks">
		<cfscript>
			productPersistance = createObject("component", "ecommerce.persistance.productpersistance" );
			product = productPersistance.saveProduct(productName,productDescription,productBrandId,productCategoryId,productImageLinks);
		</cfscript>
		<cfreturn product>
	</cffunction>
	
	<cffunction name="getProducts" access="remote" httpmethod="GET" produces="application/json" returntype="ecommerce.model.product[]" >
		<cfscript>
			productPersistance = createObject("component", "ecommerce.persistance.productpersistance" );
			products = productPersistance.getProducts();
		</cfscript>
		<cfreturn products>
	</cffunction>
	
	<cffunction name="getProductId"  access="remote" httpmethod="GET" produces="application/json" restpath="search" returntype="ecommerce.model.product[]" >
		<cfargument name="searchId"  restargsource="query " restargname="searchId" type="numeric" >
		<cfscript>
			productPersistance = createObject("component", "ecommerce.persistance.productpersistance" );
			products = productPersistance.getProductsByBrand(searchId);
		</cfscript>
		<cfreturn products>
	</cffunction>
	<!--- update product is pending --->
	
	<cffunction name="addBrand" access="remote" httpmethod="POST" produces="application/json" consumes="application/x-www-form-urlencoded" restpath="brand" returntype="ecommerce.model.brand" >
		<cfargument name="brandName" restargsource="Form" restargname="brandName" type="string" >
		<cfargument name="brandDescription" restargsource="Form" restargname="brandDescription" type="string" >
		<cfscript>
			brandPersistance = createObject("component", "ecommerce.persistance.brandpersistance" );
			brand = brandPersistance.saveBrand(brandName,brandDescription);
		</cfscript>
		<cfreturn brand>
	</cffunction>

	<cffunction name="getBrands" access="remote" httpmethod="GET" restpath="brand" returntype="ecommerce.model.brand[]" produces="application/json" >
		<cfscript>
			brandPersistance = createObject("component", "ecommerce.persistance.brandpersistance" );
			brands = brandPersistance.getBrands();
		</cfscript>
		<cfreturn brands>
	</cffunction>	
	
	<cffunction name="getCategories" access="remote" httpmethod="GET" restpath="category" returntype="ecommerce.model.category[]" produces="application/json" >
		<cfscript>
			categoryPersistance = createObject("component", "ecommerce.persistance.categorypersistance" );
			categories = categoryPersistance.getCategories();
		</cfscript>
		<cfreturn categories>
	</cffunction>
	
	<cffunction name="addCategory" access="remote" httpmethod="POST" restpath="category" returntype="ecommerce.model.category" produces="application/json" consumes="application/x-www-form-urlencoded">
		<cfargument name="categoryName" restargname="categoryName"  type="string" restargsource="Form" >
		<cfargument name="categoryDescription" restargname="categoryDescription"  type="string" restargsource="Form" >
		<cfscript>
			categoryPersistance = createObject("component", "ecommerce.persistance.categorypersistance" );
			category = categoryPersistance.saveCategory(categoryName,categoryDescription);
		</cfscript>
		<cfreturn category>
	</cffunction>
	
</cfcomponent>