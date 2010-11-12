/*
 * This file is part of the WA Harvester.
 *
 * Licensed to the WebArchiv (WA) by Adam Brokes
 *
 * The IA licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * 2010
 */

package cz.webarchiv.linkextractor;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlAnchor;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.util.UrlUtils;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author xrosecky
 * @author Adam Brokes
 */
public class LinkExtractor {

    static String[][] tagsToExtract = {
            {"a", "href"},
            {"img", "src"}
    };

    public Set<String> extractLinks(String url) throws Exception {
        Set<String> links = new HashSet<String>();
        BrowserVersion ourCrawler = BrowserVersion.FIREFOX_3;
        // set language
        ourCrawler.setBrowserLanguage("cs");
        ourCrawler.setSystemLanguage("cs");
        WebClient webClient = new WebClient(ourCrawler);
        HtmlPage page = webClient.getPage(url);
        String baseHref = url;
        List<HtmlAnchor> elements = page.getAnchors();
        for (String[] tag : tagsToExtract) {
            String elementName = tag[0];
            String attrName = tag[1];
            for (HtmlElement element : page.getElementsByTagName(elementName)) {
                String link = UrlUtils.resolveUrl(baseHref, element.getAttribute(attrName));
                links.add(link);
                try {
                    if (element.hasAttribute("onClick")) {
                        Page newPage = element.click();
                        if (newPage instanceof HtmlPage) {
                            HtmlPage htmlPage = (HtmlPage) newPage;
                            String newLink = htmlPage.getFullyQualifiedUrl("").toString();
                            links.add(newLink);
                        }
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
        List<HtmlElement> e = page.getElementsByTagName("td");
        for (HtmlElement el : e) {
            System.err.println(el.getOnClickAttribute());
        }

        // links.addAll(wrapper.getDownloadedURLs());
        return links;
    }

    public Set<String> extractOnClick(String url) {
        Set<String> links = new HashSet<String>();
        return links;
    }
}
