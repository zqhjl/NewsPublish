package com.newspublish.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newspublish.bean.AjaxResult;
import com.newspublish.bean.News;
import com.newspublish.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	private NewsService service;
	
	@RequestMapping("/toPublish")
	public String toPublish() {
		return "publishNews";
	}
	
	@RequestMapping("/toNewsList")
	public String toNewsList() {
		return "newsList";
	}
	
	@RequestMapping("/toEditNews")
	public String toEditNews(@RequestParam("newsId")Integer newsId,ModelMap map) {
		News news =service.queryNewsByID(newsId);
		map.put("news", news);
		return "editNews";
	}
	
	@ResponseBody
	@RequestMapping("/publish")
	public AjaxResult publish(@RequestParam("title")String title,
			@RequestParam("author")String author,
			@RequestParam("newsType")Integer newsType,
			@RequestParam("content")String content) {
		
		AjaxResult result = new AjaxResult();
		News news = new News(title,author,newsType,content);
		service.publish(result,news);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/updateNews")
	public AjaxResult updateNews(
			@RequestParam("newsId")Integer newsId,
			@RequestParam("title")String title,
			@RequestParam("author")String author,
			@RequestParam("newsType")Integer newsType,
			@RequestParam("content")String content) {
		
		AjaxResult result = new AjaxResult();
		if(newsId==null) {
			result.setFlag(false);
			result.setMessage("修改超时，请重新修改!");
			return result;
		}
		News news = new News(newsId,title,author,newsType,content);
		service.updateNews(result,news);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/queryAllNews")
	public AjaxResult queryAllNews() {
		
		AjaxResult result = new AjaxResult();
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<News> allNews = service.queryAllNews();
		map.put("allNews",allNews);
		
		//查询所有条数
		int total = service.queryNewsCount();
		map.put("total", total);
		result.setDatas(map);
		return result;
	}
	
	/*@ResponseBody
	@RequestMapping("/queryNewsByID")
	public AjaxResult queryNewsByID(@RequestParam("newsId") Integer newsId) {
		AjaxResult result = new AjaxResult();
		News news =service.queryNewsByID(newsId);
		result.setDatas(news);
		return result;
	}
	*/
	@ResponseBody
	@RequestMapping("/deleteNews")
	public AjaxResult deleteNews(@RequestParam("newsId") Integer newsId) {
		AjaxResult result = new AjaxResult();
		service.deleteNews(result,newsId);
		return result;
	}
	
	@RequestMapping("/webIndex")
	public String webIndex() {
		return "webIndex";
	}
}
