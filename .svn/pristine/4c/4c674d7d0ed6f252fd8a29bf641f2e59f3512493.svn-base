package com.samhk.ynashk.vo;

/**
 * @Author:swye
 * @Description:
 * @Date:Create in 14:23 2019/1/6
 */


/**
 * @author yuanshushu
 * @date 2018/8/29
 * @description 返回结果VO对象
 */

public class ResultVO<T> {

    private Integer code;

    private String msg;

    private T data;

    private long total;


    public enum Status{
        /**
         * success 200
         * fail 0
         */
        SUCCESS(200),FAIL(0);
        private final Integer status;
         Status(Integer status){
            this.status = status;
        }

        public Integer getStatus(){
            return status;
        }

    }

    public ResultVO(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public ResultVO(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public ResultVO(Integer code, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public ResultVO(Integer code, long total, T data) {
        this.code = code;
        this.total = total;
        this.data = data;
    }

    /**
     * 请求成功  状态码 200
     *
     * @param msg 返回信息
     * @return ResultVO
     */
    public static  ResultVO getSuccess(String msg) {
        return new ResultVO<Object>(Status.SUCCESS.getStatus(), msg);
    }

    /**
     * 请求成功  状态码 1
     *
     * @param msg  返回信息
     * @param data 返回对象
     * @param <T>  类型
     * @return ResultVO
     */
    public static <T> ResultVO getSuccess(String msg, T data) {
        return new ResultVO<T>(Status.SUCCESS.getStatus(), msg, data);
    }

    public static <T> ResultVO getSuccess(T data) {
        return new ResultVO<T>(Status.SUCCESS.getStatus(), data);
    }

    public static <T> ResultVO getSuccess( T data,long total) {
        return new ResultVO<T>(Status.SUCCESS.getStatus(),total, data);
    }

    /**
     * 请求失败   状态码 0
     *
     * @param msg 返回信息
     * @return ResultVO
     */
    public static  ResultVO getFailed(String msg) {
        return new ResultVO<Object>(Status.FAIL.getStatus(), msg);
    }

    /**
     * 请求失败  状态 0
     *
     * @param msg  返回信息
     * @param data 返回数据
     * @param <T>  类型
     * @return ResultVO
     */
    public static <T> ResultVO getFailed(String msg, T data) {
        return new ResultVO<T>(Status.FAIL.getStatus(), msg, data);
    }


    /**
     * 用户未登录
     *
     * @return ResultVO
     */
    public static  ResultVO getNoLogin() {
        return new ResultVO<Object>(2, "用户未登录，请重新登录");
    }


    /**
     * 用户没有操作权限
     *
     * @return ResultVO
     */
    public static ResultVO getNoAuthorization() {
        return new ResultVO(3, "用户没有操作权限，请重新登录");
    }


    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
