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
		App.contract.options.address = "0xeeC91F3945A28B3a9E6Bc22424225B0c43804253";
		App.bindEvents();
		App.recentbid();
	}, //contract생성
	bindEvents: function() { //입찰합니다 버튼 이벤트 불러오기
		$(document).on('click', '#bidBtn', App.setBid);
	},
	recentbid: function() { //event
		App.contract.events.recentVoter({}, function(err, res) { //최고입찰자가 나타나면 contract의 highestVoter이벤트를 발생시킴
			console.log(res);
			if (err) {
				console.log(i);
				return;
			}

			var rName = decodeURIComponent(res.returnValues.rName);
			$('#rFname').html(rName);
			var rAmount = (res.returnValues.rAmount) / 1000000000000000000;
			console.log(rAmount);
			let str = ' ETH';
			$('#rFAmount').html(rAmount + str);
		})
	},
	setBid: function() { // 버튼 이벤트 핸들러

		event.preventDefault();

		var name = encodeURIComponent($('#name').val()); //데이터를 보내는 곳에서 인코딩
		var bidEth = parseInt($('#bid').val());
		bid = bidEth * (1000000000000000000);
		console.log(bid);
		var title = encodeURIComponent($('#title').val());

		web3.eth.getAccounts(function(error, accounts) {
			if (error) {
				console.log("계정을 가져오지 못했습니다.");
				return;
			}
			var account = accounts[0]; //첫번쨰 계정을 가져옴

			return App.contract.methods.bid1(title, name)
				.send({
					from: account,
					value: bid,
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
								alert("입찰되지 않았습니다 :(")
							}
						},
						error: function(e) {
							alert("입찰되지 않았습니다!");
						}
					}); //end of ajax
				}); //end of then
		}); //end of web3
	} //end of setBid
}; //end of App

$(function() {
	App.init();
})