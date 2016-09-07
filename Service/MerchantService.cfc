<cfcomponent restpath="merchant" rest="true">
	
	<cffunction name="addProduct" access="remote" httpmethod="POST" consumes="application/x-www-form-urlencoded" restpath="product/{merchantId}" returntype="boolean" >
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfargument name="productId" restargname="productId" restargsource="Form" type="numeric" >
		<cfargument name="productPrice" restargname="productPrice" restargsource="Form" type="numeric" >
		<cfargument name="productQuantity" restargname="productQuantity" restargsource="Form" type="numeric" >
		<cfscript>
			merchantPersistance = createObject("component", "ecommerce.persistance.merchantpersistance" );	
			response = merchantPersistance.addProduct(merchantId,productId,productPrice,productQuantity);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
	<cffunction name="updateProductPrice"  access="remote" httpmethod="PUT" consumes="application/x-www-form-urlencoded" restpath="product/price/{merchantId}" returntype="boolean" >
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfargument name="productId" restargname="productId" restargsource="Form" type="numeric" >
		<cfargument name="productPrice" restargname="productPrice" restargsource="Form" type="numeric" >
		<cfscript>
			merchantPersistance = createObject("component", "ecommerce.persistance.merchantpersistance" );	
			response = merchantPersistance.updateProductPrice(merchantId,productId,productPrice);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
	<cffunction name="updateProductQuantity" access="remote" httpmethod="PUT" consumes="application/x-www-form-urlencoded" restpath="product/quantity/{merchantId}" returntype="boolean" >
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfargument name="productId" restargname="productId" restargsource="Form" type="numeric" >
		<cfargument name="productQuantity" restargname="productQuantity" restargsource="Form" type="numeric" >
		<cfscript>
			merchantPersistance = createObject("component", "ecommerce.persistance.merchantpersistance" );	
			response = merchantPersistance.updateProductQuantity(merchantId,productId,productQuantity);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
	<cffunction name="deleteProduct" access="remote" httpmethod="DELETE" restpath="product/{merchantId}" returntype="boolean" >
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfargument name="productId" restargname="productId" restargsource="Query " type="numeric" >
		<cfscript>
			merchantPersistance = createObject("component", "ecommerce.persistance.merchantpersistance" );	
			response = merchantPersistance.deleteProduct(merchantId,productId);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
	<cffunction name="getMerchantProducts" access="remote" httpmethod="GET" restpath="product/{merchantId}" returntype="array" produces="application/json">
		<cfargument name="merchantId" restargname="merchantId" restargsource="Path" type="numeric" >
		<cfscript>
			merchantPersistance = createObject("component", "ecommerce.persistance.merchantpersistance" );	
			response = merchantPersistance.getMerchantProduct(merchantId);
		</cfscript>
			<cfreturn response>
	</cffunction>
	
</cfcomponent>