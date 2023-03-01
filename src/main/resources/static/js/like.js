function unlike(id){
	

	
		
		$.ajax({
			url:"/auth/liketounlike/"+id,
			type:"DELETE",
		}).done(function(resp){
			location.reload();
		}).fail(function(error){
			alert(JSON.stringify(error))
		});
	}
	
function like(id){
	

		
		$.ajax({
			url:"/auth/unliketolike/"+id,
			type:"POST"
		}).done(function(resp){
			location.reload();
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
	
	

function loginproc(){
	if(confirm("로그인후 이용하실수있습니다. \n로그인 페이지로 이동하시겠습니까?")){
		location.href="/auth/loginForm";			
	}
}