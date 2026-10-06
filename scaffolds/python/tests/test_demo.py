import logging

import pytest

from app.services.demo import run_demo


def test_run_demo_logs_info(caplog: pytest.LogCaptureFixture) -> None:
    with caplog.at_level(logging.INFO):
        run_demo()
    assert "Info message" in caplog.text
