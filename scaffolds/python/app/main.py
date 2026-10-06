from app.config import settings
from app.logging_config import get_logger, setup_logging
from app.services.demo import run_demo

setup_logging(level=settings.log_level)  # configure logging here, not in config
logger = get_logger(__name__)


def main() -> None:
    logger.info("Starting, debug=%s", settings.debug)
    run_demo()


if __name__ == "__main__":
    main()

# FastAPI instead of a script:
# from fastapi import FastAPI
# app = FastAPI()
# run: uvicorn app.main:app
