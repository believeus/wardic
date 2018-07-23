package cn.believeus.PaginationUtil;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;


/**
 * 模板指令 - 分页
 * 
 * @author e3dmall Team
 * @version 1.0
 */
@Component("directivePagination")
public class PaginationUtil{



	/** "页码"变量名称 */
	private static final String PAGE_NUMBER_VARIABLE_NAME = "pageNumber";

	/** "总页数"变量名称 */
	private static final String PAGE_COUNT_VARIABLE_NAME = "totalPages";

	/** "中间段页码数"变量名称 */
	private static final String SEGMENT_COUNT_VARIABLE_NAME = "segmentCount";

	/** "是否存在上一页"变量名称 */
	private static final String HAS_PREVIOUS_VARIABLE_NAME = "hasPrevious";

	/** "是否存在下一页"变量名称 */
	private static final String HAS_NEXT_VARIABLE_NAME = "hasNext";

	/** "是否为首页"变量名称 */
	private static final String IS_FIRST_VARIABLE_NAME = "isFirst";

	/** "是否为末页"变量名称 */
	private static final String IS_LAST_VARIABLE_NAME = "isLast";

	/** "上一页页码"变量名称 */
	private static final String PREVIOUS_PAGE_NUMBER_VARIABLE_NAME = "previousPageNumber";

	/** "下一页页码"变量名称 */
	private static final String NEXT_PAGE_NUMBER_VARIABLE_NAME = "nextPageNumber";

	/** "首页页码"变量名称 */
	private static final String FIRST_PAGE_NUMBER_VARIABLE_NAME = "firstPageNumber";

	/** "末页页码"变量名称 */
	private static final String LAST_PAGE_NUMBER_VARIABLE_NAME = "lastPageNumber";

	/** "中间段页码"变量名称 */
	private static final String SEGMENT_VARIABLE_NAME = "segment";

	/**
	 * @author wuhuanrong
	 * @param pageNumber
	 * 			页码
	 * @param  totalPages
	 * 			数据总数
	 * @param  segmentCount
	 *  		中间段页码
	 * **/
	public static void pagination(HttpServletRequest request,Integer pageNumber,Integer totalPages,Integer segmentCount) {

		if (pageNumber == null || pageNumber < 1) {
			pageNumber = 1;
		}
		if (totalPages == null || totalPages < 1) {
			totalPages = 1;
		}
		if (segmentCount == null || segmentCount < 1) {
			segmentCount = 5;
		}
		boolean hasPrevious = pageNumber > 1;
		boolean hasNext = pageNumber < totalPages;
		boolean isFirst = pageNumber == 1;
		boolean isLast = pageNumber.equals(totalPages);
		int previousPageNumber = pageNumber - 1;
		int nextPageNumber = pageNumber + 1;
		int firstPageNumber = 1;
		int lastPageNumber = totalPages;
		int startSegmentPageNumber = pageNumber - (int) Math.floor((segmentCount - 1) / 2D);
		int endSegmentPageNumber = pageNumber + (int) Math.ceil((segmentCount - 1) / 2D);
		if (startSegmentPageNumber < 1) {
			startSegmentPageNumber = 1;
		}
		if (endSegmentPageNumber > totalPages) {
			endSegmentPageNumber = totalPages;
		}
		List<Integer> segment = new ArrayList<Integer>();
		for (int i = startSegmentPageNumber; i <= endSegmentPageNumber; i++) {
			segment.add(i);
		}

		request.setAttribute(PAGE_NUMBER_VARIABLE_NAME, pageNumber);
		request.setAttribute(PAGE_COUNT_VARIABLE_NAME, totalPages);
		request.setAttribute(SEGMENT_COUNT_VARIABLE_NAME, segmentCount);
		request.setAttribute(HAS_PREVIOUS_VARIABLE_NAME, hasPrevious);
		request.setAttribute(HAS_NEXT_VARIABLE_NAME, hasNext);
		request.setAttribute(IS_FIRST_VARIABLE_NAME, isFirst);
		request.setAttribute(IS_LAST_VARIABLE_NAME, isLast);
		request.setAttribute(PREVIOUS_PAGE_NUMBER_VARIABLE_NAME, previousPageNumber);
		request.setAttribute(NEXT_PAGE_NUMBER_VARIABLE_NAME, nextPageNumber);
		request.setAttribute(FIRST_PAGE_NUMBER_VARIABLE_NAME, firstPageNumber);
		request.setAttribute(LAST_PAGE_NUMBER_VARIABLE_NAME, lastPageNumber);
		request.setAttribute(SEGMENT_VARIABLE_NAME, segment);
		
	}

}