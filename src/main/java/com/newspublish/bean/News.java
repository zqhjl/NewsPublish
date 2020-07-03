package com.newspublish.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class News {
	private Integer newsId;
	private String title;
	private String author;
	private Integer newsType;
	private String content;
	private String publishTime;

	public News(String title, String author, Integer newsType, String content) {
		this.title = title;
		this.author = author;
		this.newsType = newsType;
		this.content = content;
	}
	public News(Integer newsId, String title, String author, Integer newsType, String content) {
		this.newsId = newsId;
		this.title = title;
		this.author = author;
		this.newsType = newsType;
		this.content = content;
	}

}
