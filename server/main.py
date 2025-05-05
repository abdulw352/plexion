import asyncio
from fastapi import FastAPI, WebSocket

from models.chat_body import Chatbody
from services.llm_service import LLMService
from services.sort_source_service import SortSourceService
from services.search_service import SearchService


app = FastAPI()

search_service = SearchService()
sort_source = SortSourceService()
llm_service = LLMService()


# Chat Web Socket 
@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try: 
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        query = data.get("data")
        search_results = search_service.web_search(query)
        sorted_results = sort_source.sort_sources(query, search_results)
        await asyncio.sleep(0.1)
        await websocket.send_json({"type": "search_result", "data" : sorted_results})
        for chunk in llm_service.generative_response(query, sorted_results):
            await asyncio.sleep(0.1)
            await websocket.send_json({"type":"content", "data": chunk})

    except Exception as e:
        print("Unexpected error Occured: ", e)

    finally:
        await websocket.close()


# Chat 
@app.post("/chat")
def chat_endpoint(body: Chatbody):
    search_results = search_service.web_search(body.query)

    sorted_results = sort_source.sort_sources(body.query, search_results)

    response = llm_service.generative_response(body.query, sorted_results)

    return response
