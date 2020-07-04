package com.newspublish.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newspublish.bean.AjaxResult;
import com.newspublish.bean.News;
import com.newspublish.service.NewsService;

import javax.servlet.http.HttpServletRequest;

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
	public String toEditNews(Integer newsId,ModelMap map) {
		News news =service.queryNewsByID(newsId);
		map.put("news", news);
		return "editNews";
	}
	
	@ResponseBody
	@RequestMapping("/publish")
	public AjaxResult publish(String title,String author,Integer newsType,String content) {
		AjaxResult result = new AjaxResult();
		News news = new News(title,author,newsType,content);
		service.publish(result,news);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/updateNews")
	public AjaxResult updateNews(Integer newsId,String title,String author,
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
	public AjaxResult queryAllNews(HttpServletRequest request) {

		AjaxResult result = new AjaxResult();
		HashMap<String,Object> map = new HashMap<String,Object>();
        List<News> allNews = service.queryAllNews();
		map.put("allNews",allNews);
		//查询所有条数
		int total = service.queryNewsCount();
		request.setAttribute("total",total);
		map.put("total", total);
		result.setDatas(map);
		return result;
	}

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<News> allNews = service.queryAllNews();
        request.setAttribute("allNews",allNews);
        return "index";
    }

	@RequestMapping("/findByValue")
	public String findByValue(HttpServletRequest request,Integer Value) {
        List<News> allNews = service.findByValue(Value);
		request.setAttribute("allNews",allNews);
		return "index";
	}

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
