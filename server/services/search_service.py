from config import Settings
from tavily import TavilyClient
import trafilatura

settings = Settings()
tavily = TavilyClient(api_key=settings.TAVILY_API_KEY)

class SearchService:
    def web_search(self, query: str):
        try:
            results =  []
            response = tavily.search(query, max_results=10)
            search_results = response.get("result", [])

            for result in search_results:
                downloaded = trafilatura.fetch_url(result.get("url"))
                content = trafilatura.extract(downloaded, include_comments=False)

                results.append(
                    {
                        "title" : result.get("title", ""),
                        "url" : result.get("url", ""),
                        "content" : content or "",
                    }
                )
            
            return results
        except Exception as e:
            print("Error Occured in Searh Service: ", e)
