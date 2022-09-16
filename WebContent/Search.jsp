<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./header.jsp"%>
<body>
	<div id="container">
		<div id="divposition">
			<div class="search-field" id="searchField">
				<form id="searchForm" method="post" action = "hfashionmallServlet?command=search_result">

					<div class="input-box">
						<input type="text" title="!!!" name="SearchWord" placeholder="검색어를 입력하세요">
					</div>
				</form>
				<button type="submit" class="btn-search" id="btnSearch"
					form="searchForm">
					<span>검색</span>
				</button>
			</div>
		</div>
	</div>



</body>

<%@ include file="./footer.jsp"%>
