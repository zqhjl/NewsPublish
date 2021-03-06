package com.newspublish.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
    private Integer pageNewsNumber = 4;

    @RequestMapping("/toPublish")
    public String toPublish() {
        return "publishNews";
    }

    @RequestMapping("/test")
    public String test() {
        return "test";
    }

    @RequestMapping("/toNewsList")
    public String toNewsList() {
        return "newsList";
    }

    @RequestMapping("/toEditNews")
    public String toEditNews(Integer newsId, ModelMap map) {
        News news = service.queryNewsByID(newsId);
        map.put("news", news);
        return "editNews";
    }

    @ResponseBody
    @RequestMapping("/publish")
    public AjaxResult publish(String title, String author, Integer newsType, String content) {
        AjaxResult result = new AjaxResult();
        News news = new News(title, author, newsType, content);
        service.publish(result, news);
        return result;
    }

    @ResponseBody
    @RequestMapping("/updateNews")
    public AjaxResult updateNews(Integer newsId, String title, String author, Integer newsType, String content) {

        AjaxResult result = new AjaxResult();
        if (newsId == null) {
            result.setFlag(false);
            result.setMessage("修改超时，请重新修改!");
            return result;
        }
        News news = new News(newsId, title, author, newsType, content);
        service.updateNews(result, news);
        return result;
    }

    @ResponseBody
    @RequestMapping("/queryAllNews")
    public AjaxResult queryAllNews(HttpServletRequest request) {
        AjaxResult result = new AjaxResult();
        HashMap<String, Object> map = new HashMap<String, Object>();
        List<News> allNews = service.queryAllNews();
        //查询所有条数
        int total = service.queryNewsCount();
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        List<News> thisPageNews = newsCutting(page, allNews, limit, request);
        map.put("thisPageNews", thisPageNews);
        request.setAttribute("total", total);
        map.put("total", total);
        result.setDatas(map);
        return result;
    }

    @RequestMapping({"/index/{value}/{page}", "/index/{value}", "/index"})
    public String index(HttpServletRequest request,
                        @PathVariable(value = "value", required = false) Integer value,
                        @PathVariable(value = "page", required = false) Integer page) {
        List<News> allNews = service.queryAllNews();
        List<News> thisPageNews = newsCutting(page, allNews, pageNewsNumber, request);
        request.setAttribute("column", -1);
        request.setAttribute("controller", "index");
        return "index";
    }

    @RequestMapping({"/findByValue/{value}/{page}", "/findByValue/{value}"})
    public String findByValue(HttpServletRequest request,
                              @PathVariable(value = "value") Integer value,
                              @PathVariable(value = "page", required = false) Integer page) {

        List<News> allNews = service.findByValue(value);
        List<News> thisPageNews = newsCutting(page, allNews, pageNewsNumber, request);
        request.setAttribute("column", value);
        request.setAttribute("controller", "findByValue");
        return "index";
    }

    private List<News> newsCutting(Integer page, List<News> allNews, int limit, HttpServletRequest request) {
        List<News> thisPageNews;
        int pageCounts = (allNews.size() % limit == 0) ? (allNews.size() / limit) : (allNews.size() / limit + 1);
        if (page == null || page == 0) {
            page = 1;
        }
        if (page > pageCounts) {
            page = pageCounts;
        }
        if (page * limit > allNews.size()) {
            thisPageNews = allNews.subList(page * limit - limit, allNews.size());
        } else {
            thisPageNews = allNews.subList(page * limit - limit, page * limit);
        }
        request.setAttribute("thisPageNews", thisPageNews);
        request.setAttribute("pageNumber", page);
        request.setAttribute("pageCounts", pageCounts);
        return thisPageNews;
    }

    @RequestMapping("/queryNewsByID/{newsId}")
    public String queryNewsByID(HttpServletRequest request, @PathVariable(value = "newsId") Integer newsId) {
        News thisNews = service.queryNewsByID(newsId);
        request.setAttribute("thisNews", thisNews);
        request.setAttribute("column", thisNews.getNewsType());
        request.setAttribute("controller", "index");
        return "thisNewsIndex";
    }

    @ResponseBody
    @RequestMapping("/deleteNews")
    public AjaxResult deleteNews(@RequestParam("newsId") Integer newsId) {
        AjaxResult result = new AjaxResult();
        service.deleteNews(result, newsId);
        return result;
    }

    @RequestMapping("/webIndex")
    public String webIndex() {
        return "webIndex";
    }
}
