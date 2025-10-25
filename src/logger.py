import logging
import os
from datetime import datetime

LOG_FOLDER_NAME=f"{datetime.now().strftime('%m_%d_%Y_%H_%M_%S')}"
LOG_FILE_NAME=f"{LOG_FOLDER_NAME}.log"
logs_path=os.path.join(os.getcwd(),"logs",LOG_FOLDER_NAME)
os.makedirs(logs_path,exist_ok=True)

LOG_FILE_PATH=os.path.join(logs_path,LOG_FILE_NAME)

logging.basicConfig(
    filename=LOG_FILE_PATH,
    format="[%(asctime)s] %(name)s - %(levelname)s - %(message)s",
    level=logging.INFO
)