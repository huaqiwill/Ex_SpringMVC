package org.example.pojo;

import jakarta.validation.constraints.*;

import java.util.Date;

public class Goods {
    private Long id;
    private String name;
    private Double price;
    private Integer quantity;
    private String createTime;

    @NotBlank(message = "商品名称不能为空")
    private String gname;

    @NotBlank(message = "商品详情不能为空")
    private String gdescription;

    @DecimalMin(value = "0", message = "价格不能小于0")
    @DecimalMax(value = "100", message = "价格不能大于100")
    private double gprice;

    @PastOrPresent(message = "创建日期必须是过去或现在的日期")
    private Date gdate;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    // getters and setters
    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGdescription() {
        return gdescription;
    }

    public void setGdescription(String gdescription) {
        this.gdescription = gdescription;
    }

    public double getGprice() {
        return gprice;
    }

    public void setGprice(double gprice) {
        this.gprice = gprice;
    }

    public Date getGdate() {
        return gdate;
    }

    public void setGdate(Date gdate) {
        this.gdate = gdate;
    }
}