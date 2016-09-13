<cfcomponent rest="true" restpath="order">
	<cffunction name="getOrders" access="remote" produces="application/json" returntype="ecommerce.model.order[]" httpmethod="GET" restpath="{customerId}" description="API to retrieve the list order for a customer">
		<cfargument name="customerId" restargname="customerId" restargsource="Path" type="string" required="true" >
			<cfscript>
				orderPersistence = createObject("component", "ecommerce.persistence.orderpersistence");
				ordres = orderPersistence.getOrders(customerId);
			</cfscript>
			<cfreturn ordres>
	</cffunction>
	
	<cffunction name="deleteOrder" access="remote" httpmethod="DELETE" restpath="{customerId}/{orderId}" returntype="boolean" description="Delete the order">
		<cfargument name="customerId" restargname="customerId" restargsource="Path" type="string" required="true" >
		<cfargument name="orderId" restargname="orderId" restargsource="Path" type="numeric" required="true" >
		<cfscript>
			orderPersistence = createObject("component", "ecommerce.persistence.orderpersistence");
			orderresponse = orderPersistence.deleteOrder(orderId,customerId);
		</cfscript>
		<cfreturn orderresponse>
	</cffunction>
	
	<cffunction name="placeOrder" access="remote" consumes="application/x-www-form-urlencoded" produces="application/json" httpmethod="POST"  returntype="ecommerce.model.order" description="API to place order">
		<cfargument name="customerId" restargname="customerId" restargsource="Form" type="string" required="true" >
		<cfargument name="orderStatus" restargname="orderStatus" restargsource="Form" type="string" required="true" >
		<cfargument name="orderProducts" restargname="orderProducts" restargsource="Form" type="string" required="true" >
		<cfargument name="paymentGatewayId" restargname="paymentGatewayId" restargsource="Form" type="numeric" required="true" >
		<cfscript>
			orderPersistence = createObject("component", "ecommerce.persistence.orderpersistence");
			order = orderPersistence.createOrder(customerId,orderStatus,orderProducts,paymentGatewayId);
		</cfscript>
		<cfreturn order>
	</cffunction>
	
	<cffunction name="updateOrder" access="remote" restpath="{orderId}" consumes="application/x-www-form-urlencoded" returntype="boolean" httpmethod="PUT" description="Update an existing order" >
		<cfargument name="orderId" restargsource="path" restargname="orderId" type="string" required="true" >
		<cfargument name="paymentGatewayId" restargsource="Form" restargname="paymentGatewayId" type="numeric" required="true" >
		<cfargument name="orderStatus" restargsource="Form" restargname="orderStatus" type="string" required="true" >
		<cfargument name="orderProducts" restargsource="Form" restargname="orderProducts" type="string" required="true" >
		<cfscript>
			orderPersistence = createObject("component", "ecommerce.persistence.orderpersistence");
			orderResponse = orderPersistence.updateOrder(1,orderId,paymentGatewayId,orderStatus,orderProducts);
		</cfscript>
		<cfreturn orderResponse>
	</cffunction>
</cfcomponent>