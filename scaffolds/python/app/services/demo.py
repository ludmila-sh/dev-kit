from app.logging_config import get_logger

logger = get_logger(__name__)


def run_demo() -> None:
    """Example of getting a logger and logging at different levels. Replace with real code."""
    logger.debug("Debug details, shown only when LOG_LEVEL=DEBUG")
    logger.info("Info message with an argument: %s", "value")
    # Inside an `except` block, this logs the message with the traceback:
    # logger.exception("Something failed")
