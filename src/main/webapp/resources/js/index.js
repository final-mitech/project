App = {
	web3Provider: null,

	contract: null,

	init: async function() { //화면

		return App.initWeb3();
	},

	initWeb3: async function() {
		//메타마스크 프로바이더 연결
		if (window.ethereum) { // infura
			App.web3Provider = window.ethereum;
			try {
				await window.ethereum.enable();
			} catch (error) {
				console.error("Used denied account access");
			}
		} else if (window.web3) { // 브라우저에 주입된 Mist 나 MetaMask 프로바이더 사용여부 확인
			App.web3Provider = window.web3.currentProvider;
		} else {
			//App.web3Provider = new Web3.providers.HttpProvider("http://192.168.0.36:7545");
			App.web3Provider = new Web3.providers.HttpProvider("http://127.0.0.1:7545");
		}

		web3 = new Web3(App.web3Provider);

		return await App.initContract();
	},

	initContract: function() { //abi 
		//컨트랙트 생성
		App.contract = new web3.eth.Contract(abi);
		App.contract.options.address = "0xA055578632813e1ea79D24a6d464da512eb9911a";

		App.joinButtonEvents(); //펀딩 참여 버튼 누르는 이벤트

	}, //컨트랙트 연결

	joinButtonEvents: function() { //펀딩 참여 버튼 누르는 이벤트
		$("#joinbutton").on('click', App.setFund);
	},

	setFund: function() {
		//login체크
		if (memberid == '') {
			location.href = "/etoile/site/loginForm";
			return;
		}

		console.log('setFund');

		var price = $('#blockPrice').val();

		var fundingId = $('#fundingId').val();
		var fundingPrice = $('#blockPrice').val();
		var fundingGift = $('#fundingGift').val();

		var fundingTotalprice = parseInt($('#fundingTotalprice').html()) + parseInt(price); //fundingSelect의 name값 속성

		web3.eth.getAccounts(function(error, accounts) {
			console.log(accounts);
			if (error) {
				consolt.log(error);
				return;
			}
			var account = accounts[0]; //메타마스크 첫번째 계정 계좌 찾아옴

			App.contract.methods
				.fund()
				.send({
					from: account,
					value: web3.utils.toWei(price, "ether")
				}) //send로 호출할때는 account
				.then(function(result) {
					alert('펀딩에 참여되었습니다');
				})
				.then(function(result) {
					$.ajax({
						url: "fundingJoinInsert.do",
						data: { //파라미터 이름: 실제값
							fundingId: fundingId,
							fundingPrice: fundingPrice,
							fundingGift: fundingGift,
							fundingTotalprice: fundingTotalprice
						},
						success: function(result) { //전송에 성공하면 실행할 콜백 함수 
							location.href = "/etoile/site/fundingSelect?fundingId=" + fundingId;

						}
					});
				})

		})
	},

	refundButtonEvents: function() {

		var fundingId = $('#fundingId').val();

		web3.eth.getAccounts(function(error, accounts) {
			console.log(accounts);
			if (error) {
				consolt.log(error);
				return;
			}
			var account = accounts[0]; //메타마스크 첫번째 계정 계좌 찾아옴

			App.contract.methods
				.checkGoalReached()
				.send({
					from: account
					//value: web3.utils.toWei(price, "ether")
				}) //send로 호출할때는 account
				.then(function(result) {
					$.ajax({
						url: "conditionUpdate.a",
						data: { //파라미터 이름: 실제값
							fundingId: fundingId,
							fundingCondition: '환불완료'
						},
						success: function(result) { //성공하면 실행할 콜백 함수 
							if (data == "SUCCESS") {
								//alert('펀딩 실패 시 환불이 완료되었습니다.');
								alert("환불완료로 상태가 변경되었습니다.");
							}
							else {
								location.href = "/etoile/admin/funding/fundingUpdateFail";
							}
						},
						error: function(data) {
							location.href = "/etoile/admin/funding/fundingUpdateFail";
						}
					});
				})
		})
	}

}


$(function() {
	App.init();
});