package com.samhk.ynashk.config;

import com.samhk.ynashk.shiro.filter.Sessionfilter;
import com.samhk.ynashk.shiro.filter.Urlfilter;
import com.samhk.ynashk.shiro.realm.MyRealm;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.apache.shiro.mgt.SecurityManager;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Author:swye
 * @Description:
 * @Date:Create in 21:49 2019/5/23
 */
@Configuration
public class ShiroConfig  {


    /**
     * 设置session过期时间为两小时，单位毫秒
     */
    private static final Long SESSION_TIME_OUTO = 7200000L;


    /**
     * 注入自定义的realm，告诉shiro如何获取用户信息来做登录认证和授权
     */
    @Bean
    public Realm realm() {
        MyRealm myRealm = new MyRealm();

        return myRealm;
    }

    /**
     *
     * @param securityManager
     * @return
     */
    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //自定义拦截器
        Map<String, Filter> filtersMap = new LinkedHashMap<String, Filter>();
        filtersMap.put("urlFilter", new Urlfilter());
        filtersMap.put("sessionFilter", new Sessionfilter());

        shiroFilterFactoryBean.setFilters(filtersMap);
        //这个map必须是有序的，不能为无序hashMap，无序的话拦截顺序会乱
        Map<String,String> map = new LinkedHashMap<String, String>();
        //
        map.put("/","sessionFilter");
        map.put("/js/**","sessionFilter");
        map.put("/remoteLogin.do","sessionFilter");
        map.put("/css/**","sessionFilter");
        map.put("/img/**","sessionFilter");
        map.put("/jedate/**","sessionFilter");
        map.put("/js_plugins/**","sessionFilter");
        map.put("/login.do","sessionFilter");
        map.put("/welcome.do","sessionFilter");
        map.put("/changeLanguage.do","sessionFilter");
        map.put("/favicon.ico","sessionFilter");
        map.put("/static/**","sessionFilter");
        //对所有用户认证
        map.put("/**","urlFilter");
        //登录
        shiroFilterFactoryBean.setLoginUrl("/");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(map);
        return shiroFilterFactoryBean;
    }

    /**
     * Shiro生命周期处理器
     * @return
     */
    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor(){
        return new LifecycleBeanPostProcessor();
    }
    @DependsOn({"lifecycleBeanPostProcessor"})
    @Bean
    public static DefaultAdvisorAutoProxyCreator getDefaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator creator = new DefaultAdvisorAutoProxyCreator();
        /**
         * setUsePrefix(false)用于解决一个奇怪的bug。在引入spring aop的情况下。
         * 在@Controller注解的类的方法中加入@RequiresRole注解，会导致该方法无法映射请求，导致返回404。
         * 加入这项配置能解决这个bug
         */
        creator.setUsePrefix(true);
        return creator;
    }

    /**
     * 配置管理层。即安全控制层
     * @return
     */
    @Bean
    public SecurityManager securityManager(){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setSessionManager(sessionManager());

        securityManager.setRealm(realm());
        return  securityManager;
    }

  /*  @Bean
    public RedisSessionDAO redisSessionDAO() {
        RedisSessionDAO redisSessionDAO = new RedisSessionDAO(SESSION_TIME_OUTO);
        return redisSessionDAO;
    }*/


    @Bean
    public DefaultWebSessionManager sessionManager(){
         DefaultWebSessionManager manager = new DefaultWebSessionManager();
        // 删除过期的session
        manager.setDeleteInvalidSessions(true);
        // 是否定时检查session
        manager.setSessionValidationSchedulerEnabled(true);
        //设置该属性 就不需要设置 ExecutorServiceSessionValidationScheduler 底层也是默认自动调用ExecutorServiceSessionValidationScheduler
        manager.setSessionValidationInterval(3600000);
        //设置session过期时间
        manager.setGlobalSessionTimeout(SESSION_TIME_OUTO);
        manager.setSessionIdCookie(sessionIdCookie());
        manager.setSessionIdCookieEnabled(true);
        // 去掉shiro登录时url里的JSESSIONID
        manager.setSessionIdUrlRewritingEnabled(true);
        return manager;
    }
    /**
     * 指定本系统sessionid, 问题: 与servlet容器名冲突, 如jetty, tomcat 等默认jsessionid,
     * 当跳出shiro servlet时如error-page容器会为jsessionid重新分配值导致登录会话丢失!
     *
     * @return
     */
    @Bean
    public SimpleCookie sessionIdCookie() {
        SimpleCookie simpleCookie = new SimpleCookie();
        simpleCookie.setName("shiro.session");
        return simpleCookie;
    }


    //加入注解的使用，不加入这个注解不生效
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }
}