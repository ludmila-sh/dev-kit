from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """
    Application configuration using Pydantic BaseSettings.
    Automatically loads from environment variables and .env file.
    """

    model_config = SettingsConfigDict(env_file=".env", env_file_encoding="utf-8", extra="ignore")

    debug: bool = False
    log_level: str = "INFO"

    openrouter_api_key: str = ""
    openai_api_key: str = ""
    language_model: str = "openai/gpt-4o-mini"

    # for web services
    host: str = "127.0.0.1"  # in Docker, bind 0.0.0.0 via the uvicorn --host flag
    port: int = 8000


settings = Settings()
