component hint="This is persistance implementation to persist/retrieve order information from database" output="true"{
	
	function createOrder(customerId,orderStatus,orderProducts,paymentId) access="public" returntype="ecommerce.model.order"     {
		orderDate = now();
		queryexecute("insert into order_table (order_customer_id, order_status, order_products, order_payment_gatewayid, order_date) values(?,?,?,?,?)",
		[customerId,orderStatus,orderProducts,paymentId,orderDate],{result="result"});	
		
		order = createObject("component", "ecommerce.model.order");
		order.customerId = customerId;
		order.orderStatus = orderStatus;
		order.orderProducts = orderProducts;
		order.orderDate = orderDate;
		order.paymentId = paymentId;
		order.orderId = result.generatedkey;
		
		return order;
	}
	
	function getOrders(customerIdArg) access="public" returntype="ecommerce.model.order[]"     {
		
		qparams = {customerId={value=customerIdArg , cfsqltype ='cf_sql_integer'}};
		queryResultObj = queryexecute("select * from order_table where order_customer_id=:customerId",qparams);
		var orderList = arraynew(1);
		cfloop(query="queryResultObj")
		{
			order = createObject("component", "ecommerce.model.order");
			order.customerId = queryResultObj.order_customer_id;
			order.orderId = queryResultObj.order_id;
			order.orderDate = queryResultObj.order_date;
			order.orderStatus = queryResultObj.order_status;
			order.orderProducts = queryResultObj.order_products;
			order.paymentId = queryResultObj.order_payment_gatewayid;
			arrayAppend(orderList,order);
		}
		return orderList;
	}
	
	function updateOrder(customerIdArg,orderIdArg,paymentIdArg,orderStatusArg,orderProductsArg) access="public" returntype="ecommerce.model.order"   {
		qparams = {customerId={value=customerIdArg , cfsqltype ='cf_sql_integer'}, orderId={value=orderIdArg , cfsqltype ='cf_sql_integer'}, 
				paymentId={value=paymentIdArg , cfsqltype ='cf_sql_integer'}, orderStatus={value=orderStatusArg,cfsqltype ='cf_sql_varchar'}, 
				 orderProducts={value=orderProductsArg,cfsqltype ='cf_sql_longvarchar'}};
		queryexecute("update  order_table set order_payment_gatewayid=:paymentId, order_status=:orderStatus, order_products=:orderProducts where brand_id=:brandId",qparams);
		return true;	
	}
	
	function deleteOrder(orderIdArg,customerIdArg) access="public" returntype="boolean" {
		qparams = {orderId={value=orderIdArg , cfsqltype ='cf_sql_integer'},customerId={value=customerIdArg , cfsqltype ='cf_sql_integer'}};
		queryexecute("delete from order_table  where order_id=:orderId AND order_customer_id=:customerId",qparams);	
		return true;
	}    
}