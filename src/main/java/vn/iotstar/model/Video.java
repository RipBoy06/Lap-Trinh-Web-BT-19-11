package vn.iotstar.model;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Video")
@NamedQuery(name = "Video.findAll", query = "SELECT v FROM Video v")
public class Video implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "videoId", length = 50)
    private String videoId;

    @Column(name = "title", columnDefinition = "NVARCHAR(255) NOT NULL")
    private String title;

    @Column(name = "poster", columnDefinition = "NVARCHAR(255)")
    private String poster;

    @Column(name = "views")
    private int views;

    @Column(name = "description", columnDefinition = "NVARCHAR(MAX)")
    private String description;

    @Column(name = "active")
    private boolean active;

    // Quan hệ nhiều - một với User (Nhiều Video thuộc về một User)
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    public Video() {}

    public Video(String videoId, String title, String poster, int views, String description, boolean active, User user) {
        this.videoId = videoId;
        this.title = title;
        this.poster = poster;
        this.views = views;
        this.description = description;
        this.active = active;
        this.user = user;
    }

    public String getVideoId() { return videoId; }
    public void setVideoId(String videoId) { this.videoId = videoId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getPoster() { return poster; }
    public void setPoster(String poster) { this.poster = poster; }

    public int getViews() { return views; }
    public void setViews(int views) { this.views = views; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}
