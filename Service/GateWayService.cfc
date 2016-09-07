<cfcomponent restpath="gateways" rest="true" >
	
	<cffunction name="listGateways" access="remote" httpmethod="GET" returntype="ecommerce.model.gateway[]" consumes="application/json" produces="application/json" description="List all the Payment Gateways">
		<cfscript>
			getwayPersistance = createObject("component", "ecommerce.persistance.gatewaypersistance" );	
			gateways = getwayPersistance.getgateWays();
		</cfscript>
		<cfreturn gateways>
	</cffunction>
	
	<cffunction name="enableGateway" access="remote" httpmethod="GET" returntype="boolean" restpath="enable/{gatewayId}" description="Enable a Payment Gateway" >
		<cfargument name="gatewayId" restargname="gatewayId" restargsource="Path" type="numeric" >
		<cfscript>
			getwayPersistance = createObject("component", "ecommerce.persistance.gatewaypersistance" );	
			status = getwayPersistance.editGatewayStatus(gatewayId,"active");
		</cfscript>
		<cfreturn status>
	</cffunction>
	
	<cffunction name="disableGateway" access="remote" httpmethod="GET" returntype="boolean" restpath="disable/{gatewayId}" description="Disable a Payment Gateway">
		<cfargument name="gatewayId" restargname="gatewayId" restargsource="Path" type="numeric" >
		<cfscript>
			getwayPersistance = createObject("component", "ecommerce.persistance.gatewaypersistance" );	
			status = getwayPersistance.editGatewayStatus(gatewayId,"inactive");
		</cfscript>
		<cfreturn status>
	</cffunction>
	
</cfcomponent>