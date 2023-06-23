package vn.com.vti.bus.frontend.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class SearchController {
	
	@RequestMapping("search-result")
	public String searchResult() {
		return "search/result";
	}
	
//	@Autowired
//	private BookMapper bookMapper;
//	
//	@RequestMapping(value="search",produces= MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public List<Book> search(@RequestParam("bookName") String bookName) {
//		BookExample bookExample = new BookExample();
//		bookExample.createCriteria().andBookNameLike("%"+bookName+"%");
//		List<Book> bookList = bookMapper.selectByExample(bookExample);
//
//		return bookList;
//	}
//	
//	@RequestMapping("search-result")
//	public String searchResult() {
//		return "search/result";
//	}
}
