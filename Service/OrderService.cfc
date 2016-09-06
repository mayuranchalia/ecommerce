<cfcomponent rest="true" restpath="order">
	<cffunction name="getOrders" access="remote" produces="application/json" returntype="ecommerce.model.order[]" httpmethod="GET" restpath="{customerId}">
		<cfargument name="customerId" restargname="customerId" restargsource="Path" type="numeric" >
			<cfscript>
				orderPersistance = createObject("component", "ecommerce.persistance.orderpersistance");
				ordres = orderPersistance.getOrders(customerId);
			</cfscript>
			<cfreturn ordres>
	</cffunction>
	
	<cffunction name="deleteOrder" access="remote" httpmethod="DELETE" restpath="{customerId}/{orderId}" returntype="boolean" >
		<cfargument name="customerId" restargname="customerId" restargsource="Path" type="numeric" >
		<cfargument name="orderId" restargname="orderId" restargsource="Path" type="numeric" >
		<cfscript>
			orderPersistance = createObject("component", "ecommerce.persistance.orderpersistance");
			orderresponse = orderPersistance.deleteOrder(orderId,customerId);
		</cfscript>
		<cfreturn orderresponse>
	</cffunction>
	
	<cffunction name="placeOrder" access="remote" consumes="application/x-www-form-urlencoded" produces="application/json" httpmethod="POST"  returntype="ecommerce.model.order">
		<cfargument name="customerId" restargname="customerId" restargsource="Form" type="numeric" >
		<cfargument name="orderStatus" restargname="orderStatus" restargsource="Form" type="string" >
		<cfargument name="orderProducts" restargname="orderProducts" restargsource="Form" type="string" >
		<cfargument name="paymentGatewayId" restargname="paymentGatewayId" restargsource="Form" type="numeric" >
		<cfscript>
			orderPersistance = createObject("component", "ecommerce.persistance.orderpersistance");
			order = orderPersistance.createOrder(customerId,orderStatus,orderProducts,paymentGatewayId);
		</cfscript>
		<cfreturn order>
	</cffunction>
	
	<cffunction name="updateOrder" access="remote" restpath="{orderId}" consumes="application/x-www-form-urlencoded" returntype="boolean" httpmethod="PUT" >
		<cfargument name="orderId" restargsource="path" restargname="orderId" type="numeric" >
		<cfargument name="paymentGatewayId" restargsource="Form" restargname="paymentGatewayId" type="numeric" >
		<cfargument name="orderStatus" restargsource="Form" restargname="orderStatus" type="string" >
		<cfargument name="orderProducts" restargsource="Form" restargname="orderProducts" type="string" >
		<cfscript>
			orderPersistance = createObject("component", "ecommerce.persistance.orderpersistance");
			orderResponse = orderPersistance.updateOrder(1,orderId,paymentGatewayId,orderStatus,orderProducts);
		</cfscript>
		<cfreturn orderResponse>
	</cffunction>
</cfcomponent>