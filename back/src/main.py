from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
async def root():
    return {"message":"Hello world, FastAPI! Backend"}


def main():
    print("Hello World")
    uvicorn.run(app, host="0.0.0.0", port=80)

if __name__ == "__main__":
    main()
