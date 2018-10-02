package com.eagle.entity;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Article implements Serializable {

    private int id;
    private int pid;
    private int rootId;
    private String title;
    private String cont;
    private Date pdate;
    private int level;
    private boolean isLeaf;

    public Article() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getRootId() {
        return rootId;
    }

    public void setRootId(int rootId) {
        this.rootId = rootId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCont() {
        return cont;
    }

    public void setCont(String cont) {
        this.cont = cont;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public boolean isLeaf() {
        return isLeaf;
    }

    public void setLeaf(boolean leaf) {
        isLeaf = leaf;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", pid=" + pid +
                ", rootId=" + rootId +
                ", title='" + title + '\'' +
                ", cont='" + cont + '\'' +
                ", pdate=" + pdate +
                ", isLeaf=" + isLeaf +
                '}';
    }

    public void initFromRs(ResultSet resultSet){
        Article article = new Article();
        try {
            setId(resultSet.getInt("id"));
            setPid(resultSet.getInt("pid"));
            setRootId(resultSet.getInt("rootId"));
            setTitle(resultSet.getString("title"));
            setPdate(resultSet.getTimestamp("pdate"));
            setCont(resultSet.getString("cont"));
            setLeaf(resultSet.getInt("isleaf") != 0 ? true : false);
            setLevel(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
