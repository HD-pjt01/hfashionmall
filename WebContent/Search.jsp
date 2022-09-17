<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./header.jsp"%>

<body>
	<div id="container">
		<div id="divposition">
			<div class="search-field" id="searchField">
				<form id="searchForm" method="post"
					action="hfashionmallServlet?command=search_result">

					<div class="input-box">
						<input type="text" title="검색어 입력" name="SearchWord"
							id= "Searchwindow" placeholder="검색어를 입력하세요">
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
<script>
	let sf = document.getElementById("searchForm");
	sf.addEventListener("submit", function(e) {
		let msgEle = document.getElementById("Searchwindow");
		if (msgEle.value.length == 0) {
			alert('검색어를 입력해주세요');
			e.preventDefault();
		}
	});
</script>

<%@ include file="./footer.jsp"%>
