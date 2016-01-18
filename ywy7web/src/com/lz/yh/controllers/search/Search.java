package com.lz.yh.controllers.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrRequest.METHOD;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.request.FieldAnalysisRequest;
import org.apache.solr.client.solrj.response.AnalysisResponseBase.AnalysisPhase;
import org.apache.solr.client.solrj.response.AnalysisResponseBase.TokenInfo;
import org.apache.solr.client.solrj.response.FieldAnalysisResponse;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lz.yh.system.util.ToolUtil;

@Controller
public class Search {
	
	@RequestMapping("/search")
	public void search(HttpServletRequest request,HttpServletResponse response) throws SolrServerException, ServletException, IOException{
		Map<String,Object> param = ToolUtil.convertParmeterMap(request.getParameterMap());
		String searchKey = param.get("key").toString();
		Integer pageIndex = param.get("pageIndex")==null?  1: Integer.valueOf(param.get("pageIndex").toString());
		
		String urlString = "http://192.168.0.174:38080/solr/collection1";
		SolrServer solr = new HttpSolrServer(urlString);
		SolrQuery sq = new SolrQuery();
		sq.set("q", "title:" + searchKey +" OR content:"+searchKey);
		
		sq.setStart ((pageIndex-1)*10 );
		sq.setRows( 10 );
		sq.addFilterQuery("+(content:*)");
		sq.setHighlight(true);  
        sq.setParam("hl.fl", "title,content");  
		sq.setHighlightSimplePre("<font color=\'red\'>");
        sq.setHighlightSimplePost("</font>"); 
        
        sq.setHighlightFragsize(800);  
		QueryResponse qr = solr.query(sq,METHOD.POST);
		SolrDocumentList list = qr.getResults();
		Map<String,Object> result = new HashMap<String,Object>();
		List<String> analysis = this.getAnalysis(searchKey, solr);
		for(SolrDocument o : list){
			for(String key : o.keySet()){
				if(key.equals("content")||key.equals("title")){
					String content = o.get(key).toString();
					content = content.replaceAll("<[^>]+>", "");
					if(content.length() >200){
						content = content.substring(0, 150);
					}
					for(String regex : analysis ){
						content =content.replaceAll(regex, "<font style='color:red'>" + regex + "</font>");
					}
					o.put(key, content);
				}
			}
		}
		result.put("curPage",pageIndex);
		result.put("result",list);
		result.put("countNum", list.getNumFound());
		result.put("hightlight", qr.getHighlighting());
		request.setAttribute("msg", result);
		request.getRequestDispatcher("webviews/common/search.jsp").forward(request, response);
		//return "/ywy7web/webviews/common/search.jsp";

        //fail("query result nums: " + list.getNumFound());
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println(qr.toString());
//        }
//		SolrInputDocument document = new SolrInputDocument();
//		document.addField("id", "552198");
//		document.addField("name", "huawei");
//		document.addField("price", "49.99");
//		UpdateResponse response = solr.add(document);
		//最后记得 commit 使索引生效</div>
//		solr.commit();
		
	}
	public List<String> getAnalysis(String sentence,SolrServer solrServer){
		 FieldAnalysisRequest request = new FieldAnalysisRequest(
	                "/analysis/field");
	        request.addFieldName("title");// 字段名，随便指定一个支持中文分词的字段
	        request.setFieldValue("");// 字段值，可以为空字符串，但是需要显式指定此参数
	        request.setQuery(sentence);
	       
	        FieldAnalysisResponse response = null;
	        try {
	            response = request.process(solrServer);
	        } catch (Exception e) {
	            System.err.println(e);
	        }

	        List<String> results = new ArrayList<String>();
	        Iterator<AnalysisPhase> it = response.getFieldNameAnalysis("title")
	                .getQueryPhases().iterator();
	        while(it.hasNext()) {
	          AnalysisPhase pharse = (AnalysisPhase)it.next();
	          List<TokenInfo> list = pharse.getTokens();
	          for (TokenInfo info : list) {
	              results.add(info.getText());
	          }

	        }
	        
	        return results;
	}
	
}
