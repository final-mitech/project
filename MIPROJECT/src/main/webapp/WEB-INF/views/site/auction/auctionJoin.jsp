<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>auctionJoin.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="./resources/json.min.js"></script>
    <style>
        .form1 {
            border-color: rgb(156, 151, 147);
            border-style: solid;
            padding: 5% 10% 5% 20%;
        }

        span {
            display: inline-block;
            width: 100%;
            padding-top: 2%;
            background-color: rgb(114, 110, 107);
            color: aliceblue;
            font-size: medium;
        }

        .form1 input[readonly] {
            background-color: #f5f5f5;
            border-color: #f5f5f5;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;
        }

        #auctionImage {
            display: inline-block;
            padding: .5em .75em;
            /* label의 패딩값과 일치 */
            font-size: inherit;
            font-family: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #f5f5f5;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;
            -webkit-appearance: none;
            /* 네이티브 외형 감추기 */
            -moz-appearance: none;
            appearance: none;
        }

        .filebox input[type="file"] {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        .filebox label {
            display: inline-block;
            padding: .5em .75em;
            color: white;
            font-size: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: rgb(153, 147, 143);
            cursor: pointer;
            border: 1px solid rgb(153, 147, 143);
            border-bottom-color: rgb(153, 147, 143);
            border-radius: .25em;
            margin: 0px;
        }

        /* imaged preview */
        .filebox .upload-display {
            /* 이미지가 표시될 지역 */
            margin-bottom: 5px;
        }

        @media(min-width: 768px) {
            .filebox .upload-display {
                display: inline-block;
                margin-right: 5px;
                margin-bottom: 0;
            }
        }

        .filebox .upload-thumb-wrap {
            /* 추가될 이미지를 감싸는 요소 */
            display: inline-block;
            width: 54px;
            padding: 2px;
            vertical-align: middle;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        .filebox .upload-display img {
            /* 추가될 이미지 */
            display: block;
            max-width: 100%;
            width: 100% \9;
            height: auto;
        }

        .joinBtn {
            background-color: #ca371d;
            border-color: #ca371d;
            color: #FFF;
        }

        .joinBtn:hover {
            background-color: #ca371d;
            border-color: #ca371d;
            color: #FFF;

        }

        .joinBtn:focus {
            background-color: #ca371d;
            border-color: #ca371d;
            color: #FFF;
            outline: #ca371d;
            box-shadow: none;
        }


        .btnMain {
            background-color: rgb(114, 110, 107);
            border-color: rgb(114, 110, 107);
            color: #FFF;
        }

        .btnMain:hover {
            background-color: rgb(114, 110, 107);
            border-color: rgb(114, 110, 107);
            color: #FFF;
        }

        .btnMain:focus {
            background-color: rgb(114, 110, 107);
            border-color: rgb(114, 110, 107);
            color: #FFF;
            outline: rgb(114, 110, 107);
            box-shadow: none;
        }

        .h2 {
            color: rgb(70, 65, 61);
            font-weight: 400;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <br />
                <div>
                    <h3 class="h2" align="center">Auction Request Info</h3>
                    <br />
                    <span class="rounded" align="center">
                        <p>고객님의 상품을 경매에 올릴 수 있습니다. 아래의 정보를 모두 기입해 주세요!</p>
                    </span>
                    <br />
                    <br />
                    <form id="frm" name="frm" action="" class="">
                        <div class="form1">
                            <div class="form-group">
                                <label for="">아이디</label> <input type="text" class="form-control" id="memberId"
                                    name="memberId" style="width: 30%" value="${loginId }" readonly>
                            </div>
                            <div class="form-group">
                                <label for="">상품사진</label>
                                <div class="filebox preview-image">
                                    <input class="form-control" readonly id="auctionImage" name="auctionImage"
                                        style="width: 50%">&nbsp;&nbsp;&nbsp;
                                    <label for="input-file">파일업로드</label> <input type="file" id="input-file"
                                        class="upload-hidden">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">상품명</label> <input type="text" class="form-control" id="auctionName"
                                    name="auctionName" style="width: 70%">
                            </div>
                            <div class="form-group">
                                <label for="">브랜드</label>
                                <select class="form-control" id="auctionBrand" name="auctionBrand" style="width: 40%">
                                    <option>CHANEL</option>
                                    <option>HERMES</option>
                                    <option>LV</option>
                                    <option>DIOR</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="">상품유형</label>
                                <select class="form-control" id="auctionCategory" name="auctionCategory"
                                    style="width: 40%">
                                    <option>의류</option>
                                    <option>가방</option>
                                    <option>잡화</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="">모델번호</label> <input type="text" class="form-control" id="auctionSerial"
                                    name="auctionSerial" style="width: 70%">
                            </div>
                            <div class="form-group">
                                <label for="">상세내용</label> <textarea type="text" class="form-control"
                                    id="auctionContent" name="auctionContent" placeholder="상품에 대한 내용을 입력해 주세요." rows="3"
                                    cols="8" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="">경매시작가</label>
                                <input type="text" class="form-control" placeholder="금액만 입력해 주세요." id="auctionBestPrice"
                                    name="auctionBestPrice" style="width: 40%" required>
                            </div>
                            <div class="form-group">
                                <label for="">즉시 낙찰가</label>
                                <input type="text" class="form-control" placeholder="금액만 입력해 주세요."
                                    id="auctionImmediateBid" name="auctionImmediateBid" style="width: 40%" required>
                            </div>
                        </div>
                        <br />
                        <div align="center">
                            <button type="button" class="btn joinBtn btn-lg"
                                id="joinBtn">경매요청합니다!</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btnMain" onclick="location.href='/site/auctionMain'">목록</button>
                        </div>
                    </form>
                    <br />
                    <br />
                </div>
            </div>
            <div class="col-2"></div>
        </div>
    </div>
</body>
<script>
    //요청버튼을 누르고 상품을 배송해 주시면, 마이페이지에서 상품의 검수 확인이 가능합니다.
    $(function () {

        $('#joinBtn').click(function () {

            $.ajax({
                url: "/etoile/site/auctionJoin.do",
                type: 'POST',
                //dataType: 'json', //받아오는 타입
                data: $("#frm").serialize(),
                success: function (data) {
                    if (data == "1") {
                        alert("정상적으로 등록되었습니다 :)");
                        location.href = "/etoile/site/auctionMain.do";
                    } else {
                        alert("등록되지 않았습니다 :(")
                    }
                },
                error: function (e) {
                    alert("등록되지 않았습니다!");
                }
            });
        });
    });

    //사진파일 이름 띄우기
    $(document).ready(function () {
        var fileTarget = $('.filebox .upload-hidden');
        fileTarget.on('change', function () {
            // 값이 변경되면 
            if (window.FileReader) { // modern browser 
                var filename = $(this)[0].files[0].name;
            } else { // old IE 
                var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
            }
            // 추출한 파일명 삽입 
            $(this).siblings('#auctionImage').val(filename);
        });
    });

    //preview image 
    var imgTarget = $('.preview-image .upload-hidden');
    imgTarget.on('change', function () {
        var parent = $(this).parent();
        parent.children('.upload-display').remove();
        if (window
            .FileReader
        ) { //image 파일만 
            if (!$(this)[0].files[0].type.match(/image\//)) return;
            var reader = new FileReader();
            reader.onload = function (e) {
                var src = e.target.result;
                parent.prepend(
                    '<div class="upload-display"><div class="upload-thumb-wrap"><img src="' +
                    src + '" class="upload-thumb"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend(
                '<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'
            );
            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter =
                "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" +
                imgSrc + "\")";
        }
    });
</script>

</html>