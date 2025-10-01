package app.model;

public class Movie {
    private String id, titleKo, titleEn, genre, country, rating, director, posterUrl, overview, trailerUrl, photos;
    private java.sql.Date releaseDate;
    private Integer runtimeMin;

    public String getId() { return id; }                 public void setId(String v){ id=v; }
    public String getTitleKo(){ return titleKo; }        public void setTitleKo(String v){ titleKo=v; }
    public String getTitleEn(){ return titleEn; }        public void setTitleEn(String v){ titleEn=v; }
    public java.sql.Date getReleaseDate(){ return releaseDate; } public void setReleaseDate(java.sql.Date v){ releaseDate=v; }
    public Integer getRuntimeMin(){ return runtimeMin; } public void setRuntimeMin(Integer v){ runtimeMin=v; }
    public String getGenre(){ return genre; }            public void setGenre(String v){ genre=v; }
    public String getCountry(){ return country; }        public void setCountry(String v){ country=v; }
    public String getRating(){ return rating; }          public void setRating(String v){ rating=v; }
    public String getDirector(){ return director; }      public void setDirector(String v){ director=v; }
    public String getPosterUrl(){ return posterUrl; }    public void setPosterUrl(String v){ posterUrl=v; }
    public String getOverview(){ return overview; }      public void setOverview(String v){ overview=v; }
    public String getTrailerUrl(){ return trailerUrl; }  public void setTrailerUrl(String v){ trailerUrl=v; }
    public String getPhotos(){ return photos; }          public void setPhotos(String v){ photos=v; }
}
