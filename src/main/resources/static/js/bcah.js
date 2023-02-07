let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
	},

	save: function() {
		//호스트의 아이디 넘겨야함
		//카테고리 선택해서 데이터 넘기기
		let c = document.querySelectorAll('.category');
		let cate;
		c.forEach(function(item) {
			if (item.dataset.cate == 'true') {
				cate = item.value;
			}
		});
		//숙소 유형 선택해서 데이터 넘기기
		let t = document.querySelectorAll('.type');
		let tp;
		t.forEach(function(item) {
			if (item.dataset.type == 'true') {
				tp = item.value;
			}
		});
		//편의시설 데이터 넘기기
		let a = document.querySelectorAll('.amenities_btn');
		let amenity = "";
		a.forEach(function(item){
			if(item.classList.contains('clicked')) {
				amenity += item.value;
			}
		});
		
		let data = {
			addr: $("#addr").val(),
			addr2: $("#addr2").val(),
			category: cate,
			type: tp,
			guestMax: $("#guest").val(),
			bedroom: $("#bedroom").val(),
			bed: $("#bed").val(),
			bathroom: $("#bathroom").val(),
			amenities: amenity,
			title: $("#title").val(),
			explain: $("#explain").val(),
			fare: fare,
		};
		$.ajax({
			type: "POST",
			url: "/api/house",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("완료");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},








}

//category
let category = document.querySelectorAll('.category');

category.forEach(function(item) {
	item.addEventListener('click', function() {
		category.forEach(function(e) {
			e.dataset.cate = false
		});
		item.dataset.cate = true
	});
});

//숙소 유형
let type = document.querySelectorAll('.type');

type.forEach(function(item) {
	item.addEventListener('click', function() {
		type.forEach(function(e) {
			e.dataset.type = false
		});
		item.dataset.type = true
	});
});

//+, - 버튼
function plusMinusBtn(type, ths){
	let input = $(ths).parents("div.sub-group2").find("input[name='guest']");
	let input2 = $(ths).parents("div.sub-group2").find("input[name='bedroom']");
	let input3 = $(ths).parents("div.sub-group2").find("input[name='bed']");
	let input4 = $(ths).parents("div.sub-group2").find("input[name='bathroom']");
	
	let cnt = Number(input.val());
	let cnt2 = Number(input2.val());
	let cnt3 = Number(input3.val());
	let cnt4 = Number(input4.val());
	
	if(type=='p') {
		input.val(Number(cnt)+1);
		input2.val(Number(cnt2)+1);
		input3.val(Number(cnt3)+1);
		input4.val(Number(cnt4)+1);
	}
	else {
		input.val(Number(cnt)-1);
		input2.val(Number(cnt2)-1);
		input3.val(Number(cnt3)-1);
		input4.val(Number(cnt4)-1);
	}
}
let fare = "";
//요금
//숫자만 입력 자릿수 표시
$(document).on("keyup", "input:text[numberOnlyMinComma]", function()	{
	$(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
	$(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
});
//'원' 붙이기
$(document).on("focusout", "input:text[koreanCurrency]", function()	{
	$(this).val( $(this).val().replace(",","") );
	$(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
	$(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
	if($(this).val() != '' ) {
		$(this).val( $(this).val()+'원');
	}		
	fare = $(this).val().replace(',',"").replace('원',"");
});
//'원' 제거
$(document).on("focus", "input:text[koreanCurrency]", function()	{	
	$(this).val( $(this).val().replace("원", ""));
});








index.init();