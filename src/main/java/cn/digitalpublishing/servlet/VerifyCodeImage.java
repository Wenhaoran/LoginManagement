package cn.digitalpublishing.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.digitalpublishing.springmvc.controller.BaseController;

//import cn.com.daxtech.framework.security.UidPwdAuthenticationFilter;

@SuppressWarnings("serial")
public class VerifyCodeImage extends HttpServlet

{
	protected final Logger logger = LoggerFactory.getLogger(getClass()); 
	
	private static int WIDTH = 131;
	private static int HEIGHT = 50;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		logger.info("开始生成验证码.....");
		HttpSession session = request.getSession();
		response.setContentType("image/jpeg");
		ServletOutputStream sos = response.getOutputStream();
		// 设置浏览器不要缓存此图片 
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		// 创建内存图象并获得其图形上下文 
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();

		// 产生随机的认证码 
		char[] rands = generateCheckCode();
		// 产生图像 
		drawBackground(g);
		drawRands(g, rands);
		// 结束图像 的绘制 过程， 完成图像 
		g.dispose();
		// 将图像输出到客户端 
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ImageIO.write(image, "JPEG", bos);
		byte[] buf = bos.toByteArray();
		response.setContentLength(buf.length);
		// 下面的语句也可写成： bos.writeTo(sos); 
		sos.write(buf);
		bos.close();
		sos.close();
		// 将当前验证码存入到 Session 中 
		session.setAttribute(BaseController.VALIDATE_CODE, new String(rands));
		//session.setAttribute(UidPwdAuthenticationFilter.VALIDATE_CODE, new String(rands));
		// 直接使用下面的代码将有问题， Session 对象必须在提交响应前获得 
		//request.getSession().setAttribute("check_code",new String(rands)); 
	}

	private char[] generateCheckCode() {
		// 定义验证码的字符表 
		String chars = "2345678abcdefghjkmnprstuwxz";
		char[] rands = new char[4];
		for (int i = 0; i < 4; i++) {
			int rand = (int) (Math.random() * chars.length());
			rands[i] = chars.charAt(rand);
		}
		return rands;
	}

	private void drawRands(Graphics g, char[] rands) {
		g.setColor(Color.BLACK);
		g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 26));
		// 在不同的高度上输出验证码的每个字符          
		g.drawString("" + rands[0], 20, 37);
		g.drawString("" + rands[1], 40, 35);
		g.drawString("" + rands[2], 60, 38);
		g.drawString("" + rands[3], 80, 36);
	}

	private void drawBackground(Graphics g) {
		// 画背景 
		g.setColor(new Color(0xDCDCDC));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		// 随机产生 120 个干扰点 
		for (int i = 0; i < 120; i++) {
			int x = (int) (Math.random() * WIDTH);
			int y = (int) (Math.random() * HEIGHT);
			int red = (int) (Math.random() * 255);
			int green = (int) (Math.random() * 255);
			int blue = (int) (Math.random() * 255);
			g.setColor(new Color(red, green, blue));
			g.drawOval(x, y, 1, 0);
		}
	}
}
