package com.teamtechsquad.email.helper;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.util.Map;

import com.teamtechsquad.util.EmailUtil;

public class EmailTemplate {
	
	private String templateId;
	private String template;
	private Map<String, String> replacementParams;

	public EmailTemplate(String templateId) {
		this.templateId = templateId;
		try {
			this.template = loadTemplate(templateId);
		} catch (Exception e) {
			this.template = null;
		}
	}

	public String loadTemplate(String templateId) throws Exception {
		URL url = Thread.currentThread().getContextClassLoader().getResource(templateId);
		File file  = new File(url.getFile());
		String content = null;
		try {
			content = new String(Files.readAllBytes(file.toPath()));
		} catch (IOException e) {
			throw new Exception("Could not read template with ID = " + templateId);
		}
		return content;

	}

	public String getTemplate(Map<String, String> replacements) {
		String cTemplate = this.getTemplate();

		if (!EmailUtil.isObjectEmpty(cTemplate)) {
			for (Map.Entry<String, String> entry : replacements.entrySet()) {
				cTemplate = cTemplate.replace("{{" + entry.getKey() + "}}",
						entry.getValue());
			}
		}

		return cTemplate;
	}

	public String getTemplateId() {
		return templateId;
	}

	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	public Map<String, String> getReplacementParams() {
		return replacementParams;
	}

	public void setReplacementParams(Map<String, String> replacementParams) {
		this.replacementParams = replacementParams;
	}

}
