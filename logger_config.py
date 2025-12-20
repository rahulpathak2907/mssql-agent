import logging
import sys

# ANSI escape codes for colors
COLORS = {
    "DEBUG": "\033[94m",    # Blue
    "INFO": "\033[92m",     # Green
    "WARNING": "\033[93m",  # Yellow
    "ERROR": "\033[91m",    # Red
    "CRITICAL": "\033[95m", # Magenta
    "RESET": "\033[0m"      # Reset
}

class ColoredFormatter(logging.Formatter):
    """Custom logging formatter with colors based on log level"""
    
    def format(self, record):
        color = COLORS.get(record.levelname, COLORS["RESET"])
        message = super().format(record)
        return f"{color}{message}{COLORS['RESET']}"

def get_logger(name: str, level: int = logging.INFO) -> logging.Logger:
    """
    Returns a configured logger with colored console output.
    
    Args:
        name (str): Logger name
        level (int): Logging level (default: INFO)
        
    Returns:
        logging.Logger: Configured logger instance
    """
    logger = logging.getLogger(name)
    logger.setLevel(level)

    if not logger.handlers:
        # Console handler
        console_handler = logging.StreamHandler(sys.stdout)
        console_handler.setLevel(level)

        # Colored formatter
        formatter = ColoredFormatter(
            fmt="%(asctime)s | %(name)s | %(levelname)s | %(message)s",
            datefmt="%Y-%m-%d %H:%M:%S"
        )
        console_handler.setFormatter(formatter)
        logger.addHandler(console_handler)

    return logger
