package cn.believeus.taglib;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class DateTag extends TagSupport {
    private static final long serialVersionUID = -2312310581852395045L;
    private String value;
    private String pattern="yyyy-MM-dd HH:mm:ss";

    @Override
    public int doStartTag() throws JspException {
        String vv = "" + value;
        long time = Long.valueOf(vv);
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(time);
        SimpleDateFormat dateformat = new SimpleDateFormat(pattern);
        String s = dateformat.format(c.getTime());
        try {
            pageContext.getOut().write(s);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return super.doStartTag();
    }
    
    public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	public void setValue(String value) {
        this.value = value;
    }
}