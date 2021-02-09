<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 리뷰 상세페이지 & 댓글</title>
<script>
   // 리뷰 좋아요
   $(function() {
      $("#like").click(function(){
  
         var sId = document.getElementById("styleId").value;
         $.ajax({
            url: "reviewRecommend.do",	// 컨트롤러 경로
            type: "POST",
            data: {
               styleId: sId
            },
            dataType: "json",
            success: function(map) { 
                document.getElementById("searchRecommend").innerHTML = map.totalCount;
                if (map.count != 1) {
                   $("#like").attr("src", "../images/like1.png");
                } else {
                   $("#like").attr("src", "../images/like2.png");
                }
             }
         })
      })
   })
</script>
</head>
<body>
   <br/>
   <div id="main-wrapper">
      <div class="content-body">
         <div class="container" style="max-width: 1400px;">
            <div class="row">
               <div class="col-lg-5 col-xl-4">
                  <div class="card">
                     <div class="card-body">
                        <div class="media align-items-center mb-4">
                        <img class="img-fluid" style="width:100%" src="/etoile/images/${list.styleImage }">
                        </div>
                           <div class="row mb-5">
                              <div class="col-12 text-center">
                                 <a href="stylingSearchProduct?styleTag=${list.styleTag }">#${list.styleTag }</a>
                                 <p class="text-muted mb-0" style="font-size:20px;">작성자 : ${list.memberId }</p>
                                 <!-- 좋아요 기능 -->
                 				 <form id="frm">
                                 	<div class="likebtn">
                                 	<c:if test="${like eq 0}">
                                 		<img id="like" src="/etoile/images/like1.png" style="height: 15%; width: 15%;">
                                 	</c:if>
                                 	<c:if test="${like eq 1}">
                                    	<img id="like" src="/etoile/images/like2.png" style="height: 15%; width: 15%;">
                                    </c:if>
                                    	<input type="hidden" value="${list.styleId }" id="styleId">
                                    	<p class="text-muted mb-0" id="searchRecommend">${list.styleRecommend }</p>
                                 	</div>
			                 	 </form>
			                  </div>
                           </div> 
                        <p class="text-muted">${list.styleContent }<br/></p>
                     </div>
                  
                  </div>
               </div>
               <!--  댓글창 -->
                  <div class="col-lg-7 col-xl-8">
                     <div class="card">                  
                        <div class="card-body">
                           <form action="commentsInsert.do">
                              <div class="form-group">
                                 <textarea class="form-control" name="commentContent" id="textarea" cols="20" rows="4"
                                         placeholder="댓글을 입력하세요"></textarea>
                              </div>
                              <div class="d-flex align-items-center">
                                 <input type="hidden" name="styleId" value="${list.styleId }">
                                 <button type="submit" class="btn btn-primary px-3 ml-4">등록</button>
                              </div>
                           </form>
                        </div>
                     </div>
                     <br />
                     <div class="card">
                        <c:forEach var="vo" items="${comments }">
                           <div class="card-body">
                              <div class="media media-reply">
                                 <div class="media-body">
                                    <div class="d-sm-flex justify-content-between mb-2">
                                       <h5 class="mb-sm-0">${vo.memberId }<small class="text-muted ml-3">
                                             <fmt:formatDate value="${vo.commentDate }" pattern="yyyy-MM-dd" /></small>
                                       </h5>
                                       <div class="media-reply__link">
                                          <button class="btn btn-transparent p-0 mr-3">
                                             <i class="fa fa-thumbs-up"></i>
                                          </button>
                                          <button class="btn btn-transparent p-0 mr-3">
                                             <i class="fa fa-thumbs-down"></i>
                                          </button>
                                          <button onclick='location.href="commentsDelete.do?commentId=${vo.commentId}&styleId=${vo.styleId }"'
                                                class="btn btn-transparent text-dark font-weight-bold p-0 ml-2">삭제</button>
                                       </div>
                                    </div>
                                    <p>${vo.commentContent }</p>
                                 </div>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
               <!--</form>-->
               <!-- 댓글창 끝 -->
            </div>
         </div>
      </div>
   </div>

<!-- <script src="plugins/common/common.min.js"></script>
     <script src="js/custom.min.js"></script>
     <script src="js/settings.js"></script>
     <script src="js/gleek.js"></script>
     <script src="js/styleSwitcher.js"></script> -->
</body>
</html>