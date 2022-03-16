package com.project.li.configuration;

import com.project.li.interceptor.CustomRequestInterceptor;
import com.project.li.interceptor.CustomUIAuthorizationInterceptor;
import com.project.li.provider.*;
import com.project.li.scripts.CustomFunction;
import com.project.li.scripts.CustomFunctionExtension;
import com.project.li.scripts.CustomModule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.ssssssss.magicapi.datasource.model.MagicDynamicDataSource;
import org.ssssssss.magicapi.modules.db.provider.PageProvider;

import javax.sql.DataSource;

/**
 * magic-api 配置类
 * 以下只配置了多数据源
 * 其它如果有需要可以自行放开 // @Bean 注释查看效果
 */
@Configuration
public class MagicAPIConfiguration {

	/**
	 * 配置多数据源
	 *
	 * @see MagicDynamicDataSource
	 */
	@Bean
	public MagicDynamicDataSource magicDynamicDataSource(DataSource dataSource) {
		MagicDynamicDataSource dynamicDataSource = new MagicDynamicDataSource();
		dynamicDataSource.setDefault(dataSource); // 设置默认数据源
		dynamicDataSource.add("slave", dataSource);
		return dynamicDataSource;
	}


	/**
	 * 配置自定义JSON结果
	 */
	// @Bean
	public CustomJsonValueProvider customJsonValueProvider() {
		return new CustomJsonValueProvider();
	}

	/**
	 * 配置分页获取方式
	 */
	 @Bean
	public PageProvider pageProvider() {
		return new CustomPageProvider();
	}

	/**
	 * 自定义UI界面鉴权
	 */
//	 @Bean
	public CustomUIAuthorizationInterceptor customUIAuthorizationInterceptor() {
		return new CustomUIAuthorizationInterceptor();
	}

	/**
	 * 自定义请求拦截器（鉴权）
	 */
	 @Bean
	public CustomRequestInterceptor customRequestInterceptor() {
		return new CustomRequestInterceptor();
	}

	/**
	 * 自定义SQL缓存
	 */
	// @Bean
	public CustomSqlCache customSqlCache() {
		return new CustomSqlCache();
	}

	/**
	 * 自定义函数
	 */
	// @Bean
	public CustomFunction customFunction() {
		return new CustomFunction();
	}

	/**
	 * 自定义方法扩展
	 */
	// @Bean
	public CustomFunctionExtension customFunctionExtension() {
		return new CustomFunctionExtension();
	}

	/**
	 * 自定义模块
	 */
	// @Bean
	public CustomModule customModule() {
		return new CustomModule();
	}

	/**
	 * 自定义脚本语言
	 */
	// @Bean
	public CustomLanguageProvider customLanguageProvider() {
		return new CustomLanguageProvider();
	}

	/**
	 * 自定义列名转换
	 */
	// @Bean
	public CustomMapperProvider customMapperProvider() {
		return new CustomMapperProvider();
	}

}
