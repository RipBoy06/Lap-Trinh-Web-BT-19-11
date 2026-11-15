package vn.iotstar.configs;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import vn.iotstar.model.Category;

public class TestJPA {
    public static void main(String[] args) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Category cate = new Category();
            cate.setCatename("Test JPA Category");
            cate.setIcon("avatar.png");
            enma.persist(cate);
            trans.commit();
            System.out.println("Test JPA thành công! Đã thêm Category ID: " + cate.getCateid());
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }
}