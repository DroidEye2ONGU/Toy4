package com.toy.pojo;

public class Manager {
    private Integer id;
    private String managerName;
    private String managerPassword;

    public Manager() {
    }

    public Manager(Integer id, String managerName, String managerPassword) {
        this.id = id;
        this.managerName = managerName;
        this.managerPassword = managerPassword;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getManagerPassword() {
        return managerPassword;
    }

    public void setManagerPassword(String managerPassword) {
        this.managerPassword = managerPassword;
    }


}
