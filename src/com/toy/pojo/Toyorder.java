package com.toy.pojo;

import javax.xml.crypto.Data;
import java.util.Date;

public class Toyorder {
    private String orderId;
    private String username;
    private String payment;
    private String paymentType;
    private String status;
    private Date createTime;
    private Date paymentTime;
    private Date consignTime;
    private String shippingName;
    private String shippingCode;
    private String image;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Date getConsignTime() {
        return consignTime;
    }

    public void setConsignTime(Date consignTime) {
        this.consignTime = consignTime;
    }

    public String getShippingName() {
        return shippingName;
    }

    public void setShippingName(String shippingName) {
        this.shippingName = shippingName;
    }

    public String getShippingCode() {
        return shippingCode;
    }

    public void setShippingCode(String shippingCode) {
        this.shippingCode = shippingCode;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Toyorder{" +
                "orderId='" + orderId + '\'' +
                ", username='" + username + '\'' +
                ", payment='" + payment + '\'' +
                ", paymentType='" + paymentType + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", paymentTime=" + paymentTime +
                ", consignTime=" + consignTime +
                ", shippingName='" + shippingName + '\'' +
                ", shippingCode='" + shippingCode + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
