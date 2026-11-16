package vn.iotstar.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.VideoDao;
import vn.iotstar.model.Video;

import java.util.List;

public class VideoDaoImpl implements VideoDao {

    @Override
    public void insert(Video video) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(video);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public void update(Video video) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(video);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public void delete(String videoId) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Video video = enma.find(Video.class, videoId);
            if (video != null) {
                enma.remove(video);
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public Video findById(String videoId) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            return enma.find(Video.class, videoId);
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Video> findAll() {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Video> findTop10New() {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<Video> query = enma.createQuery("SELECT v FROM Video v ORDER BY v.videoId DESC", Video.class);
            query.setMaxResults(10);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Video> findByUser(int userId, int page, int pageSize) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<Video> query = enma.createQuery("SELECT v FROM Video v WHERE v.user.id = :userId", Video.class);
            query.setParameter("userId", userId);
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public long countByUser(int userId) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<Long> query = enma.createQuery("SELECT COUNT(v) FROM Video v WHERE v.user.id = :userId", Long.class);
            query.setParameter("userId", userId);
            return query.getSingleResult();
        } finally {
            enma.close();
        }
    }
}
