"""Tests for main module."""

from src import main


def test_add() -> None:
    """Unit test for sum method in main module."""
    assert main.add(5, 10) == 15
