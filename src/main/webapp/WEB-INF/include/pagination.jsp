<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
	<c:if test="${totalPages>1 }">
			<div class="pagination">
				<c:choose>
					<c:when test="${isFirst==true }">
						<span class="firstPage">&nbsp;</span>
					</c:when>
					<c:otherwise>
						<a class="firstPage" href="javascript: $.pageSkip(${firstPageNumber});">&nbsp;</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${hasPrevious==true }">
						<a class="previousPage" href="javascript: $.pageSkip(${previousPageNumber});">&nbsp;</a>
					</c:when>
					<c:otherwise>
						<span class="previousPage">&nbsp;</span>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="segmentPageNumber" items="${segment}" varStatus="status">
					<c:if test="${status.index == 0 && segmentPageNumber > firstPageNumber + 1 }">
						<span class="pageBreak">...</span>
					</c:if>
					
					<c:choose>
						<c:when test="${ segmentPageNumber != pageNumber }">
							<a href="javascript: $.pageSkip(${segmentPageNumber});">${segmentPageNumber}</a>
						</c:when>
						<c:otherwise>
							<span class="currentPage">${segmentPageNumber}</span>
						</c:otherwise>
					</c:choose>
					<c:if test="${status.last && segmentPageNumber < lastPageNumber - 1 }">
						<span class="pageBreak">...</span>
					</c:if>
					
				</c:forEach>
				<c:choose>
					<c:when test="${hasNext==true }">
						<a class="nextPage" href="javascript: $.pageSkip(${nextPageNumber});">&nbsp;</a>
					</c:when>
					<c:otherwise>
						<span class="nextPage">&nbsp;</span>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${isLast==true }">
						<span class="lastPage">&nbsp;</span>
					</c:when>
					<c:otherwise>
						<a class="lastPage" href="javascript: $.pageSkip(${lastPageNumber});">&nbsp;</a>
					</c:otherwise>
				</c:choose>
			
				<span class="pageSkip">
					共${totalPages}页 到第<input onkeyup="value=this.value.replace(/\D+/g,'')" onpaste="return false;" maxlength="9" value="${pageNumber}" name="pageNumber" id="pageNumber">页<button  type="submit"></button>
				</span>
			</div>
		</c:if>