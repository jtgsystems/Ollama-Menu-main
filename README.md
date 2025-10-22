![Banner](banner.png)

# AI Model Selector Batch Script 🚀

Welcome to the **AI Model Selection Menu v1.9!** 🎉  
This batch script makes it simple to browse, update, and run AI models from **Ollama** on your Windows machine. Whether you're a **coder** 💻, **researcher** 🔬, or just exploring AI, this tool has you covered with a clean, menu-driven interface.

**Developed by**: Joint Technology Group Inc. 🌐  
🔗 [JTGSYSTEMS.COM](https://jtgsystems.com)

---

## 🌟 Features

- **Interactive Menu 🖱️**  
  Choose from categories like General Purpose, Code-Specialized, and more with simple number inputs.

- **Model Categories 📚**  
  - General Purpose Models 🌍  
  - Code-Specialized Models 💻  
  - Math and Reasoning Models ➕  
  - Embedding Models 📊  
  - Uncensored Models 🔓  
  - Medical Models 🩺  
  - Specialized Models (e.g., Vision) 📸

- **Run Options ⚙️**  
  - Launch models directly with `ollama run` 🚀  
  - Use an INTERPRETER for advanced setups 🛠️

- **Model Management 🔄**  
  - List installed models with `ollama list` 📋  
  - Update all models with one command 🔍

- **English-Only Models 🇺🇸**  
  Optimized for English-language tasks.

- **User-Friendly 😊**  
  Clear prompts, error handling, and polished interface.

---

## 📋 Requirements

- **Windows OS 🖥️**  
  Compatible with Windows 7, 10, or 11.

- **Ollama Installed 🧠**  
  Download and install from [ollama.com](https://ollama.com). Ensure it is added to your system `PATH`.

- **Command Prompt Access ⌨️**  
  Run the script using Command Prompt (`cmd`).

- **Optional: INTERPRETER 🔧**  
  Required for advanced run options. Must support:  
  ```
  interpreter --model ollama/[modelname]
  ```

- **Hardware Requirements 💪**  
  - Minimum **8 GB RAM** for 7B models  
  - **16 GB RAM** for 13B models  
  - **32 GB RAM** for 33B and larger models  

---

## 🛠️ Installation

1. **Download the Script 📥**  
   Copy the batch script from the repository or save it as `model_selector.bat`.

2. **Place in a Directory 📂**  
   Save it in a folder (e.g., `C:\AI_Tools`).

3. **Ensure Ollama is Ready ✅**  
   Install Ollama and verify it works by running:
   ```
   ollama --version
   ```
   in Command Prompt.

---

## 🚀 How to Use

1. **Open Command Prompt 🖥️**  
   Press `Win + R`, type `cmd`, and hit Enter.

2. **Navigate to Script 📍**  
   Use:
   ```
   cd path	o\yourolder
   ```
   (e.g., `cd C:\AI_Tools`)

3. **Run the Script ▶️**  
   ```
   model_selector.bat
   ```

4. **Explore the Menu 🧭**  
   **Main Menu** – Enter a number (1–10) to select a category or action:
   ```
   1: General Purpose Models 🌟  
   2: Code-Specialized Models 💻  
   3: Math and Reasoning Models ➗  
   4: Embedding Models 📈  
   5: Uncensored Models 🔓  
   6: Medical Models 🩺  
   7: Specialized Models 📸  
   8: Update Models 🔄  
   9: List Installed Models 📋  
   10: Exit 🚪
   ```

   **Submenu** – Choose a model by number, then select:
   ```
   1: Run with Ollama (ollama run [modelname]) 🚀  
   2: Run with INTERPRETER (interpreter --model ollama/[modelname]) 🛠️  
   3: Back to previous menu ⬅️
   ```

   **Example 🌈**:
   ```
   Type 1 to enter General Purpose Models  
   Type 1 again to select llama3  
   Type 1 to run `ollama run llama3`  
   Watch the magic happen! ✨
   ```

---

## 🐛 Troubleshooting

- **Script Shows Weird Output (e.g., repeating 's's) 😕**  
  - Ensure you’re using the latest script version.  
  - Check for typos in the `.bat` file.

- **Ollama Command Not Found 🚫**  
  - Verify Ollama is installed and in your `PATH`  
  - Use:
    ```
    echo %PATH%
    ```
    to check  
  - Reinstall Ollama if needed.

- **Model Fails to Run ⚠️**  
  - Confirm your hardware meets the model’s requirements (RAM)  
  - Try updating models (option 8)

- **INTERPRETER Errors 🛑**  
  - Ensure INTERPRETER is installed and supports the syntax  
  - Use option 1 (Ollama) as a fallback

---

## 🙌 Credits

This awesome script was created by **Joint Technology Group Inc.** 🎉  
Visit us at: 🌐 [JTGSYSTEMS.COM](https://jtgsystems.com)  

We’d love to hear your feedback!  
Drop us a line or contribute to make this tool even better. 💬

---

## 📜 License

This project is **open-source** and free to use under the **MIT License**.  
Feel free to modify and share! 🗳️

---

## 🌈 Happy AI Exploring!

Dive into the world of AI with ease and style.  
Run those models, write some code, or explore new ideas — this script is your gateway to AI awesomeness! 🎇
