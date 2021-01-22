$(function() {
	App.init();

});

App = {
	web3: null,
	web3provider: null,
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
	initContract: async function() {
		App.contract = new web3.eth.Contract([
			{
				"inputs": [
					{
						"internalType": "string",
						"name": "_productId",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "_status",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "_date",
						"type": "string"
					}
				],
				"name": "setProductStatus",
				"outputs": [],
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"inputs": [
					{
						"internalType": "string",
						"name": "_productId",
						"type": "string"
					}
				],
				"name": "getProductStatus",
				"outputs": [
					{
						"components": [
							{
								"internalType": "string",
								"name": "status",
								"type": "string"
							},
							{
								"internalType": "string",
								"name": "date",
								"type": "string"
							}
						],
						"internalType": "struct ProdcutHistory.ProductStatus[]",
						"name": "pHistory",
						"type": "tuple[]"
					}
				],
				"stateMutability": "view",
				"type": "function"
			}
		]);
		App.contract.options.address = "0xc8A67962b14c8f00D3dc2240198CeD80354ef41B";
		getHistory();
	},
	setStatus: function(productId, status, date) {
		console.log(productId, status, date);
		web3.eth.getAccounts(function(error, accounts) {
			let account = accounts[0];
			App.contract.methods.setProductStatus(productId, status, date)
				.send({ from: account, value: 0 })
				.then(function(result) {
					console.log(result);
				});

		})


	},
	getStatus: async function(productId) {
		App.contract.methods.getProductStatus(productId)
			.call()
			.then(function(data) {

				for (let i = 0; i < data.length; i++) {
					let status = data[i].status;
					let date = data[i].date;

					let trTag = $('<tr/>');
					let record;
					if (status == 'waiting') {
						record = '완료';
					} else if (status == 'rental') {
						record = '대여';
					} else if (status == 'wash') {
						record = '세탁';
					} else if (status == 'repair') {
						record = '수선';
					}
					$(trTag).append($('<td/>').text(record));
					$(trTag).append($('<td/>').text(date));

					$('tbody').append(trTag);
				}

			});


	}
}

function getHistory() {
	let productId = $('#id').val();
	console.log(productId);
	App.getStatus(productId);

}