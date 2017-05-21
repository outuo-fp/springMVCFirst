	//删除操作
	    function del(id){
	    	if(confirm("是否删除")){
	    		$.get("<%=basePath%>deleteUser.shtml?id="+id,function(data){
		    		 if("删除成功" == data){  
		               
		                 window.location.reload();  
		             }else{  
		                $.each(data,function(index,item){
		                	alert(data[index].port);
		                });
		             }  
		    	});
	    	}
	    }
	  