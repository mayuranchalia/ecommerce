component  hint="This is persistance implementation to persist/retrieve category information from database" output="true"   {
		
		
	function saveCategory(categoryName,categoryDescription) returntype="ecommerce.model.category"   access="public"     {
		
		queryexecute("insert into category_table (category_name,category_description) values(?,?)",
			[categoryName,categoryDescription],{result="result"});
			
			category = createObject("component", "ecommerce.model.category" );
			category.category_name = categoryName;
			category.category_description = categoryDescription;
			category.category_id = result.generatedkey;
			
			return category;
	}		
	
		function getCategoryDetailsById(categoryIdArg) returntype="ecommerce.model.brand" access="public" {
		
		qparams = {brandid={value=categoryIdArg , cfsqltype ='cf_sql_integer'}};
		queryObj = queryexecute("select * from category_table where brand_id=:brandid",qparams);
		category = createObject("component", "ecommerce.model.category");
		category.category_description = queryObj["CATEGORY_DESCRIPTION"][1];
		category.category_name = queryObj["CATEGORY_NAME"][1];
		category.category_id = categoryIdArg;
		writeDump(category);
			return category;
		}
}