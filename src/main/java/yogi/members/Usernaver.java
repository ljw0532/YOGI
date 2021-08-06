package yogi.members;

import java.util.Map;

public class Usernaver {
	private String resultcode;
	private String message;
	private Map<String,String> response;
	
	public Usernaver(){};

    public Usernaver(String resultcode, String message, Map<String, String> response) {
        this.resultcode = resultcode;
    	this.message = message;
    	this.response = response;
    }

    public Map<String, String> getResponse() {
        return response;
    }

    public void setResponse(Map<String, String> response) {
        this.response = response;
    }

	public String getResultcode() {
		return resultcode;
	}

	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
