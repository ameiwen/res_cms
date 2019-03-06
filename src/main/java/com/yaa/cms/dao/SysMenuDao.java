package com.yaa.cms.dao;

import com.yaa.cms.model.SysMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SysMenuDao {

    List<String> selectUsersPerms(Integer id);

    List<SysMenu> selectMenuTreeByID(Integer id);

    List<SysMenu> selectMenu(Map<String, Object> params);

    SysMenu selectMenuByID(Integer id);

    int insertMenu(SysMenu menu);

    int updateMenuByID(SysMenu menu);

    int removeMenuByID(Integer id);

}
