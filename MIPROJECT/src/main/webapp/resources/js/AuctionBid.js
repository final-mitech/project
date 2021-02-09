App = {
	web3Provider: null,
	contract: null,
	init: async function() {
		return await App.initWeb3();
	},
	initWeb3: async function() {
		if (window.ethereum) {
			App.web3Provider = window.ethereum;
			try {
				await window.ethereum.enable();
			} catch (error) {
				console.error("Used denied account access");
			}
		} else if (window.web3) {
			App.web3Provider = window.web3.currentProvider;
		} else {
			App.web3Provider = new Web3.providers.HttpProvider("http://127.0.0.1:7545");
		}
		web3 = new Web3(App.web3Provider);

		return App.initContract();
	},
	initContract: function() {
		App.contract = new web3.eth.Contract(abi);
		App.contract.options.address = "0xd9145CCE52D386f254917e481eB44e9943F39138";
		App.bindEvents();
	}, //contract생성
	bindEvents: function() { //입찰합니다 버튼 이벤트 불러오기
		$(document).on('click', '#bidBtn', App.setBid);
	},
	setBid: function() { // 버튼 이벤트 핸들러
		event.preventDefault();

		var immediateBid = parseInt($('#ImmediateBid').val());
		var id = encodeURIComponent($('#id').val()); //데이터를 보내는 곳에서 인코딩
		var bidEth = parseInt($('#bid').val());
		var auctionPay = parseInt($('#auctionPay').val());
		var auctionImmediateBid = parseInt($('#auctionImmediateBid').val());

		bid = bidEth * (1000000000000000000);
		imBid = immediateBid * (1000000000000000000);
		pay = auctionPay * (1000000000000000000);
		immediatePay = auctionImmediateBid * (1000000000000000000);

		web3.eth.getAccounts(function(error, accounts) {
			if (error) {
				console.log("계정을 가져오지 못했습니다.");
				return;
			}

			var account = accounts[0]; //첫번쨰 계정을 가져옴

			if (pay != immediatePay) {
				return App.contract.methods.addAuction(id)
					.send({
						from: account,
						value: pay,
						gasLimit: web3.utils.toHex(3000000)
					}) //end of send
					.then(function(result) {
						$.ajax({
							url: "/etoile/site/auctionBidJoin.do",
							type: 'POST',
							//dataType: 'json', //받아오는 타입
							data: $("#join").serialize(),
							success: function(data) {
								if (data == "1") {
									alert("입찰 성공 :) 마이페이지에서 확인가능합니다.");
									location.href = "auctionMain";
								} else {
									alert("입찰되지 않았습니다 :(");
								}
							},
							error: function(e) {
								alert("입찰되지 않았습니다!");
							}
						}); //end of ajax
					}); //end of then 
			} else {
				return App.contract.methods.addAuction(id)
					.send({
						from: account,
						value: pay,
						gasLimit: web3.utils.toHex(3000000)
					}) //end of send
					.then(function(result) {
						$.ajax({
							url: "/etoile/site/auctionImmediateBid.do",
							type: 'POST',
							//dataType: 'json', //받아오는 타입
							data: $("#join").serialize(),
							success: function(data) {
								if (data == "1") {
									alert("즉시낙찰 성공 :) 마이페이지에서 확인가능합니다.");
									location.href = "auctionMain";
								} else {
									alert("즉시낙찰되지 않았습니다 :(");
								}
							},
							error: function(e) {
								alert("즉시낙찰되지 않았습니다!");
							}
						}); //end of ajax
					}); //end of then
			} //end of else
		}); //end of web3
	} //end of setBid
}; //end of App

$(function() {
	App.init();
})