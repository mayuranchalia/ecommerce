component  hint="This is persistance implementation to persist/retrieve merchant product information from database" {
	
	function addProduct(merchantId,productId,productPrice,productQuantity) returntype="boolean" access="public"     {
		queryexecute("insert into merchant_product_table (merchant_id,product_id,product_price,product_quantity) values(?,?,?,?)",
		[merchantId,productId,productPrice,productQuantity],{result="result"});
		return true;
	}
	
	function updateProductPrice(merchantIdArg,productIdArg,productPriceArg)returntype="boolean" access="public" {
		qparams = {merchantId={value=merchantIdArg , cfsqltype ='cf_sql_integer'},productId={value=productIdArg , cfsqltype ='cf_sql_integer'},
						productPrice={value=productPriceArg,cfsqltype ='cf_sql_double'}};
		queryexecute("update  merchant_product_table set product_price=:productPrice where product_id=:productId AND merchant_id=:merchantId",qparams);	
		return true;
	}
	
	function updateProductQuantity(merchantIdArg,productIdArg,productQuantityArg) returntype="boolean" access="public" {
		qparams = {merchantId={value=merchantIdArg , cfsqltype ='cf_sql_integer'},productId={value=productIdArg , cfsqltype ='cf_sql_integer'},
						productQuantity={value=productQuantityArg,cfsqltype ='cf_sql_integer'}};
		queryexecute("update  merchant_product_table set product_quantity=:productQuantity where product_id=:productId AND merchant_id=:merchantId",qparams);	
		return true;
	}
	
	function deleteProduct(merchantIdArg,productIdArg) access="remote" returntype="boolean"  {
		qparams = {merchantId={value=merchantIdArg , cfsqltype ='cf_sql_integer'},productId={value=productIdArg , cfsqltype ='cf_sql_integer'}};
		queryexecute("delete from merchant_product_table  where merchant_id=:merchantId AND product_id=:productId",qparams);
		return true;	
	}	
}