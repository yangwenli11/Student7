package dao;

import java.util.List;
import java.util.Map;

import entity.Score;

public interface IScore
{
	// 添加
	public void add(Score score);

	// 删除
	public void delete(Score score);

	// 更新
	public void update(Score score);

	// 普通查询
	public List<Score> query(String type, String value);

	// 分页查询
	public List<Score> query(String type, String value, int currentPage);

	// 获取总页数
	public int getCountPage(String type, String value);

	// 获取课程平均分
	public List<Map<String,Object>> getAvgScore();

	// 获取各分数段人数统计
	public List<Map<String,Object>> getScoreCount();

}
