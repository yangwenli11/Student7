package dao;

import entity.TeacherEvaluate;
import entity.Vacation;

import java.util.List;

public interface IVacation
{
	// 添加
	public int add(Vacation vacation);

	// 删除
	public void delete(Vacation vacation);

	// 更新
	public void update(Vacation vacation);

	// 查询
	public List<Vacation> query(String type, String value);

	// 分页查询
	public List<Vacation> query(String type, String value, int currentPage);

	// 获取总页数
	public int getCountPage(String type, String value);

}
