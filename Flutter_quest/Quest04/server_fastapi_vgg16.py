import uvicorn   # pip install uvicorn 
from fastapi import FastAPI, HTTPException   # pip install fastapi 
from fastapi.middleware.cors import CORSMiddleware
import vgg16_prediction_model
import logging
import PIL.Image
import gemini

# Create the FastAPI application
app = FastAPI()

# CORS configuration
origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Load the model once
try:
    # vgg16_model = vgg16_prediction_model.load_model()
    g_model = gemini.genai.GenerativeModel('gemini-1.5-flash')
    sample_img = PIL.Image.open(r'C:\Users\ligoan\OneDrive\바탕 화면\I\Programing\Python\fastAPI\sample_data\jellyfish.jpg')
except Exception as e:
    logger.error("Failed to load model: %s", e)
    raise

# A simple example of a GET request
@app.get("/")
async def read_root():
    logger.info("Root URL was requested")
    return "해파리를 구분해봅시다."

@app.get('/sample')
async def sample_prediction():
    try:
        # result = await vgg16_prediction_model.prediction_model(vgg16_model)
        # logger.info("Prediction was requested and done")
        
        # Generate content using gemini model
        # response = g_model.generate_content([f"The vgg16 model learned from Imagenet predicted that the probability of {result['predicted_label']} for the uploaded image is {result['prediction_score']}. Gemini what do you think? Please tell me why you think so. Please explain using the table. Details.", sample_img], stream=True)
        
        # Capture the generated text
        # generated_text = ""
        # for chunk in response:
        #     generated_text += chunk.text + "\n"
        #     print(generated_text)
        #     print("_"*80)
        
        
        response_1 = g_model.generate_content([f"What animals are in the uploaded image? Please sum it up in one word.", sample_img], stream=True)
        response_2 = g_model.generate_content([f"What is the probability that the animal in the uploaded image is {response_1}?", sample_img], stream=True)


        generated_text_1 = ""
        for chunk in response_1:
            generated_text_1 += chunk.text + "\n"
            print(generated_text_1)
            print("_"*80)

        generated_text_2 = ""
        for chunk in response_2:
            generated_text_2 += chunk.text + "\n"
            print(generated_text_2)
            print("_"*80)

        # Return the result and generated text
        return {
            "Prediction": generated_text_1,
            "Probability": generated_text_2
        }
    except Exception as e:
        logger.error("Prediction failed: %s", e)
        raise HTTPException(status_code=500, detail="Internal Server Error")


# Run the server
if __name__ == "__main__":
    uvicorn.run("server_fastapi_vgg16:app",
            reload= True,   # Reload the server when code changes
            host="127.0.0.1",   # Listen on localhost 
            port=5000,   # Listen on port 5000 
            log_level="info"   # Log level
            )
