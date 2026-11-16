package vn.iotstar.service.impl;

import vn.iotstar.dao.VideoDao;
import vn.iotstar.dao.impl.VideoDaoImpl;
import vn.iotstar.model.Video;
import vn.iotstar.service.VideoService;

import java.util.List;

public class VideoServiceImpl implements VideoService {
    VideoDao videoDao = new VideoDaoImpl();

    @Override
    public void insert(Video video) {
        videoDao.insert(video);
    }

    @Override
    public void update(Video video) {
        videoDao.update(video);
    }

    @Override
    public void delete(String videoId) {
        videoDao.delete(videoId);
    }

    @Override
    public Video findById(String videoId) {
        return videoDao.findById(videoId);
    }

    @Override
    public List<Video> findAll() {
        return videoDao.findAll();
    }

    @Override
    public List<Video> findTop10New() {
        return videoDao.findTop10New();
    }

    @Override
    public List<Video> findByUser(int userId, int page, int pageSize) {
        return videoDao.findByUser(userId, page, pageSize);
    }

    @Override
    public long countByUser(int userId) {
        return videoDao.countByUser(userId);
    }

    @Override
    public Video findByIdAndIncrementView(String videoId) {
        Video v = videoDao.findById(videoId);
        if (v != null) {
            v.setViews(v.getViews() + 1);
            videoDao.update(v);
        }
        return v;
    }
}
