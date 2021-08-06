package yogi.members;

import java.util.Map;

public class UserkakaoVo {
	private String id;
    private Map<String,String> properties;

    public UserkakaoVo(){};

    public UserkakaoVo(String id, Map<String, String> properties) {
        this.id = id;
        this.properties = properties;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Map<String, String> getProperties() {
        return properties;
    }

    public void setProperties(Map<String, String> properties) {
        this.properties = properties;
    }
}
