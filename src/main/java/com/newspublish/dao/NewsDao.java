package com.newspublish.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.newspublish.bean.News;

@Repository
public interface NewsDao {
	
	void insertNews(News news);

	List<News> queryAllNews();

	int queryNewsCount();

	News queryNewsByID(Integer newsId);

	void updateNews(News news);

	void deleteNews(Integer newsId);
}
