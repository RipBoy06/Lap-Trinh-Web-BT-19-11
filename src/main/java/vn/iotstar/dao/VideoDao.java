package vn.iotstar.dao;

import vn.iotstar.model.Video;
import java.util.List;

public interface VideoDao {
    void insert(Video video);
    void update(Video video);
    void delete(String videoId);
    Video findById(String videoId);
    List<Video> findAll();
    List<Video> findTop10New();
    List<Video> findByUser(int userId, int page, int pageSize);
    long countByUser(int userId);
}
