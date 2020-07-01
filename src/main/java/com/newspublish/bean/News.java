package com.newspublish.bean;

public class News {
	private Integer newsId;
	private String title;
	private String author;
	private Integer newsType;
	private String content;
	private String publishTime;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getNewsType() {
		return newsType;
	}
	public void setNewsType(Integer newsType) {
		this.newsType = newsType;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	
	@Override
	public String toString() {
		return "News [newsId=" + newsId + ", title=" + title + ", author=" + author + ", newsType=" + newsType
				+ ", content=" + content + ", publishTime=" + publishTime + "]";
	}
	public News() {}
	
	public News(String title, String author, Integer newsType, String content) {
		this.title = title;
		this.author = author;
		this.newsType = newsType;
		this.content = content;
	}
	
	public News(Integer newsId, String title, String author, Integer newsType, String content, String publishTime) {
		this.newsId = newsId;
		this.title = title;
		this.author = author;
		this.newsType = newsType;
		this.content = content;
		this.publishTime = publishTime;
	}
	
	public News(Integer newsId, String title, String author, Integer newsType, String content) {
		this.newsId = newsId;
		this.title = title;
		this.author = author;
		this.newsType = newsType;
		this.content = content;
	}
	
	
	
}
