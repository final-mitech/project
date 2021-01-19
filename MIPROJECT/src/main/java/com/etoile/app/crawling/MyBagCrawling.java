package com.etoile.app.crawling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.etoile.app.vo.ProductVO;

public class MyBagCrawling {
	public static void main(String[] args) throws IOException {
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		ProductDAO dao = new ProductDAO();
		
		int i;
		
		String url = "http://www.mysecretbag.com/my-secret-bag/page/3/";
		Document doc = Jsoup.connect(url).get();
		
		Elements elem = doc.select("div.entry-product");
		Elements elem2 = doc.select("div.entry-featured");
		
		List<String> pName = new ArrayList<String>();
		List<String> pImg = new ArrayList<String>();
		List<String> pPay = new ArrayList<String>();

		for (Element e : elem.select("h3")) {
			if (e.tagName().equals("h3> a")) {
				continue;
			}
			pName.add(e.text());
			System.out.println(pName);
		}
		
		for (Element e : elem2.select("a")) {
			if (e.tagName().equals("a> img")) {
				continue;
			}
			pImg.add(e.getElementsByAttribute("src").attr("src"));
			System.out.println(pImg);
		}
		
		for (Element e : elem.select("span.woocommerce-Price-amount")) {
			if (e.tagName().equals("span> span")) {
				continue;
			}
			String preTemp = e.text().substring(1,e.text().length());
			String nextTemp = preTemp.replace(",", "");
			pPay.add(nextTemp);
			System.out.println(pPay);
		}
		
		for (i=0; i<12; i++) {
			ProductVO vo = new ProductVO();
			vo.setProductName(pName.get(i));
			vo.setProductImage(pImg.get(i));
			vo.setProductRental(Integer.parseInt(pPay.get(i)));
			vo.setProductType("가방");
			list.add(vo);
		}
		dao.insert(list);
	}

}
