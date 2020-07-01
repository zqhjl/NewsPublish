package com.newspublish.service;

import java.util.List;

import com.newspublish.bean.AjaxResult;
import com.newspublish.bean.News;

public interface NewsService {

	void publish(AjaxResult result, News news);
	List<News> queryAllNews();
	int queryNewsCount();
	News queryNewsByID(Integer newsId);
	void updateNews(AjaxResult result, News news);
	void deleteNews(AjaxResult result,Integer newsId);
}
