package kr.or.kosa.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpFilter;


@WebFilter(
		    description = "어노테이션 활용 필터 적용하기",
		    urlPatterns = {"/*"},
		    initParams = {@WebInitParam(name="encoding" , value="UTF-8")}
		  )
public class Encoding extends HttpFilter implements Filter {
       
	private String encoding;
	
    public Encoding() {
        super();
       
    }
    
    public void init(FilterConfig fConfig) throws ServletException {
		//최초 요청시 컴파일되고 한번만 실행
    	this.encoding = fConfig.getInitParameter("encoding"); //@WebInitParam 에서 read
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		if(request.getCharacterEncoding() == null) {
			request.setCharacterEncoding(this.encoding);
		}
			response.setCharacterEncoding("UTF-8");
		
		chain.doFilter(request, response);
	}

	

}