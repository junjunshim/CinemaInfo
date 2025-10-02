package app.model;

public class Review {
    private long id;
    private String movieId, userId, nickname, content;
    private double rating;
    private java.sql.Timestamp createdAt;

    public long getId() { return id; }                 public void setId(long v){ id=v; }
    public String getMovieId(){ return movieId; }      public void setMovieId(String v){ movieId=v; }
    public String getUserId(){ return userId; }        public void setUserId(String v){ userId=v; }
    public String getNickname(){ return nickname; }    public void setNickname(String v){ nickname=v; }
    public String getContent(){ return content; }      public void setContent(String v){ content=v; }
    public double getRating(){ return rating; }        public void setRating(double v){ rating=v; }
    public java.sql.Timestamp getCreatedAt(){ return createdAt; } public void setCreatedAt(java.sql.Timestamp v){ createdAt=v; }
}
