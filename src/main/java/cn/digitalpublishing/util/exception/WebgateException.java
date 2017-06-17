package cn.digitalpublishing.util.exception;

public class WebgateException extends Exception {
	
	private static final long serialVersionUID = -81469461416709765L;
	
	private String prompt;

	public WebgateException() {
	}

	public WebgateException(String prompt) {
		this.prompt = prompt;
	}

	public WebgateException(String prompt, Throwable cause) {
		super(cause);
		this.prompt = prompt;
	}

	public String getPrompt() {
		return this.prompt;
	}
}