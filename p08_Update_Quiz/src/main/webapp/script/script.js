$(function(){
	
	$("div#btnArea>button").click(()=>{
		
		// 수정할 상품번호 유효성 검사
		let numParam = $("#numParam").val().trim();
		// 수정할 상품가격 유효성 검사
		let priceParam = $("#priceParam").val().trim();
				
		if(numParam == '') {
			alert('상품번호를 입력해주세요.');
			$("#numParam").focus()
		} else if(isNaN(numParam)) {
			alert('숫자만 입력해주세요.');
			$("#numParam").focus()
		} else if(priceParam == '') {
			alert('상품가격을 입력해주세요.');
			$("#priceParam").focus()
		} else if(isNaN(priceParam)) {
			alert('숫자만 입력해주세요.');
			$("#priceParam").focus()
		} else {
			let url = "updateProc.jsp?numParam="+numParam;
			url += "&priceParam="+priceParam;
			location.href=url;
			
		}
	});
	
});