from setuptools import setup, find_packages

setup(
    name="ollama-menu",
    version="4.0.0",
    description="Cross-Platform AI Model Selector & Interactive Launcher for Ollama LLMs",
    author="JTG Systems",
    author_email="jtgsystems@gmail.com",
    url="https://jtgsystems.com",
    packages=find_packages(),
    install_requires=[
        "rich>=13.0.0"
    ],
    entry_points={
        "console_scripts": [
            "ollama-menu=ollama_menu.cli:main",
            "om=ollama_menu.cli:main",
        ],
    },
)
