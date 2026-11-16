package vn.iotstar.service;

import vn.iotstar.model.Video;
import java.util.List;

public interface VideoService {
    void insert(Video video);
    void update(Video video);
    void delete(String videoId);
    Video findById(String videoId);
    List<Video> findAll();
    List<Video> findTop10New();
    List<Video> findByUser(int userId, int page, int pageSize);
    long countByUser(int userId);
    Video findByIdAndIncrementView(String videoId);
}
