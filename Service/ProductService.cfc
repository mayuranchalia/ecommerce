<cfcomponent restpath="products" rest="true" >
	
	<cffunction name="addProduct" access="remote" httpmethod="POST" consumes="application/x-www-form-urlencoded" 
													produces="application/json" returntype="ecommerce.model.product"  description="Add a new product">
		<cfargument name="productName" type="string" restargsource="Form" restargname="productName" required="true" >
		<cfargument name="productDescription" type="string" restargsource="Form" restargname="productDescription" required="true" >
		<cfargument name="productBrandId" type="numeric" restargsource="Form" restargname="productBrandId" required="true" >
		<cfargument name="productCategoryId" type="numeric" restargsource="Form" restargname="productCategoryId" required="true" >
		<cfargument name="productImageLinks" type="string" restargsource="Form" restargname="productImageLinks" required="true" >
		<cfscript>
			productPersistence = createObject("component", "ecommerce.persistence.productpersistence" );
			product = productPersistence.saveProduct(productName,productDescription,productBrandId,productCategoryId,productImageLinks);
		</cfscript>
		<cfreturn product>
	</cffunction>
	
	<cffunction name="getProducts" access="remote" httpmethod="GET" produces="application/json" returntype="ecommerce.model.product[]" description="Get list of products" >
		<cfscript>
			productPersistence = createObject("component", "ecommerce.persistence.productpersistence" );
			products = productPersistence.getProducts();
		</cfscript>
		<cfreturn products>
	</cffunction>
	
	<cffunction name="getProductById"  access="remote" restpath="{productId}" returntype="ecommerce.model.product" description="Retrieve product details by product id" >
		<cfargument name="productId"  restargsource="path " restargname="productId" type="numeric" required="true" >
		<cfscript>
			productModel = createObject("component", "ecommerce.model.product" );
			productModel.product_id = productId;
		</cfscript>
		<cfreturn productModel>
	</cffunction>
	
	<cffunction name="searchProducts"  access="remote" httpmethod="GET" produces="application/json" restpath="search" returntype="ecommerce.model.product[]" description="Search list of products by brand id" >
		<cfargument name="searchId"  restargsource="query " restargname="searchId" type="numeric" required="true" >
		<cfscript>
			productPersistence = createObject("component", "ecommerce.persistence.productpersistence" );
			products = productPersistence.getProductsByBrand(searchId);
		</cfscript>
		<cfreturn products>
	</cffunction>
	
	<cffunction name="addBrand" access="remote" httpmethod="POST" produces="application/json" consumes="application/x-www-form-urlencoded" restpath="brand" returntype="ecommerce.model.brand" description="Add a new brand" >
		<cfargument name="brandName" restargsource="Form" restargname="brandName" type="string" required="true" >
		<cfargument name="brandDescription" restargsource="Form" restargname="brandDescription" type="string" >
		<cfscript>
			brandPersistence = createObject("component", "ecommerce.persistence.brandpersistence" );
			brand = brandPersistence.saveBrand(brandName,brandDescription);
		</cfscript>
		<cfreturn brand>
	</cffunction>

	<cffunction name="getBrands" access="remote" httpmethod="GET" restpath="brand" returntype="ecommerce.model.brand[]" produces="application/json"  description="Get all the brands">
		<cfscript>
			brandPersistence = createObject("component", "ecommerce.persistence.brandpersistence" );
			brands = brandPersistence.getBrands();
		</cfscript>
		<cfreturn brands>
	</cffunction>	
	
	<cffunction name="getCategories" access="remote" httpmethod="GET" restpath="category" returntype="ecommerce.model.category[]" produces="application/json" description="Get list of product categories" >
		<cfscript>
			categorypersistence = createObject("component", "ecommerce.persistence.categorypersistence" );
			categories = categorypersistence.getCategories();
		</cfscript>
		<cfreturn categories>
	</cffunction>
	
	<cffunction name="addCategory" access="remote" httpmethod="POST" restpath="category" returntype="ecommerce.model.category" produces="application/json" consumes="application/x-www-form-urlencoded" description="Add a new product category">
		<cfargument name="categoryName" restargname="categoryName"  type="string" restargsource="Form" required="true" >
		<cfargument name="categoryDescription" restargname="categoryDescription"  type="string" restargsource="Form" required="true" >
		<cfscript>
			categorypersistence = createObject("component", "ecommerce.persistence.categorypersistence" );
			category = categorypersistence.saveCategory(categoryName,categoryDescription);
		</cfscript>
		<cfreturn category>
	</cffunction>
	
</cfcomponent>