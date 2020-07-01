package com.newspublish.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newspublish.bean.AjaxResult;
import com.newspublish.bean.News;
import com.newspublish.dao.NewsDao;
import com.newspublish.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsDao newsDao;
	
	@Override
	public void publish(AjaxResult result, News news) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date =new Date();
		String createTime = format.format(date);
		news.setPublishTime(createTime);
		try {
			newsDao.insertNews(news);
		}catch (Exception e) {
			result.setFlag(false);
			result.setMessage("NewsServiceImpl-》publish 插入数据时失败！");
			e.printStackTrace();
		}
		
	}

	@Override
	public List<News> queryAllNews() {
		return newsDao.queryAllNews();
	}

	@Override
	public int queryNewsCount() {
		return newsDao.queryNewsCount();
	}

	@Override
	public News queryNewsByID(Integer newsId) {
		return newsDao.queryNewsByID(newsId);
	}

	@Override
	public void updateNews(AjaxResult result, News news) {
		try {
			newsDao.updateNews(news);
		}catch (Exception e) {
			result.setFlag(false);
			result.setMessage("NewsServiceImpl-》updateNews 插入数据时失败！");
			e.printStackTrace();
		}
	}

	@Override
	public void deleteNews(AjaxResult result,Integer newsId) {
		try {
			newsDao.deleteNews(newsId);
		}catch (Exception e) {
			result.setFlag(false);
			result.setMessage("NewsServiceImpl-》deleteNews 删除数据时失败！");
			e.printStackTrace();
		}
	}

}
