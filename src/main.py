"""Main module."""

import sys


def add(op1: int, op2: int) -> int:
    """Add two integers and return their sum."""
    return op1 + op2


def main(*args: str) -> None:
    """Entrypoint method when this module is run as script."""
    print(f"Commandline args: {args}")


if __name__ == "__main__":
    main(*sys.argv)
