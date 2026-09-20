package com.jiejie.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jiejie.system.entity.Customer;
import org.apache.ibatis.annotations.Mapper;

/**
 * 客户表 Mapper
 * 
 * @author Jiejie
 * @date 2026-02-02
 */
@Mapper
public interface CustomerMapper extends BaseMapper<Customer> {

}
