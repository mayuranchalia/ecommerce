<cfcomponent restpath="gateways" rest="true" >
	
	<cffunction name="listGateways" access="remote" httpmethod="GET" returntype="ecommerce.model.gateway[]" consumes="application/json" produces="application/json" description="List all the Payment Gateways">
		<cfscript>
			getwayPersistence = createObject("component", "ecommerce.persistence.gatewaypersistence" );	
			gateways = getwayPersistence.getgateWays();
		</cfscript>
		<cfreturn gateways>
	</cffunction>
	
	<cffunction name="enableGateway" access="remote" httpmethod="PUT" returntype="boolean" restpath="enable/{gatewayId}" description="Enable a Payment Gateway" >
		<cfargument name="gatewayId" restargname="gatewayId" restargsource="Path" type="numeric" required="true" >
		<cfscript>
			getwayPersistence = createObject("component", "ecommerce.persistence.gatewaypersistence" );	
			status = getwayPersistence.editGatewayStatus(gatewayId,"active");
		</cfscript>
		<cfreturn status>
	</cffunction>
	
	<cffunction name="disableGateway" access="remote" httpmethod="PUT" returntype="boolean" restpath="disable/{gatewayId}" description="Disable a Payment Gateway">
		<cfargument name="gatewayId" restargname="gatewayId" restargsource="Path" type="numeric" required="true" >
		<cfscript>
			getwayPersistence = createObject("component", "ecommerce.persistence.gatewaypersistence" );	
			status = getwayPersistence.editGatewayStatus(gatewayId,"inactive");
		</cfscript>
		<cfreturn status>
	</cffunction>
	
</cfcomponent>