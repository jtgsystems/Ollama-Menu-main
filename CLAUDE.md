# Ollama Menu - Claude Code System Reference

This file contains comprehensive documentation for the Ollama Menu project, optimized for Claude Code development and automation.

---

## Project Overview

**Ollama Menu** is an interactive Windows batch script for managing, selecting, and running AI models through Ollama. It provides a user-friendly command-line interface for browsing, updating, and executing AI models across multiple specialized categories.

### Quick Facts
- **Name**: AI Model Selection Menu
- **Version**: v1.9
- **Platform**: Windows (7, 10, 11)
- **Developer**: Joint Technology Group Inc. (JTGSYSTEMS.COM)
- **License**: MIT License (Open Source)
- **Primary File**: `ollama-menu.bat`
- **GitHub**: https://github.com/jtgsystems/Ollama-Menu-main

---

## Repository Structure

```
Ollama-Menu-main/
├── banner.png                  # Repository banner image (534 KB)
├── ollama-menu.bat             # Main batch script (14.2 KB)
├── README.md                   # User documentation (4.7 KB)
├── CLAUDE.md                   # This file - system reference
└── .git/                       # Git repository data
```

### File Details

#### ollama-menu.bat
- **Purpose**: Main interactive menu system
- **Size**: 14,216 bytes
- **Lines**: 505 lines of batch script code
- **Language**: Windows Batch (CMD)
- **Features**: Menu navigation, model selection, execution control

#### README.md
- **Purpose**: User-facing documentation
- **Size**: 4,676 bytes
- **Content**: Installation guide, usage instructions, troubleshooting
- **Style**: Markdown with emoji decorations

#### banner.png
- **Purpose**: Visual branding for README/GitHub
- **Size**: 534,376 bytes (534 KB)
- **Format**: PNG image
- **Location**: Referenced in README header

---

## Git Repository Information

### Remote Configuration
- **Origin**: `git@github.com:jtgsystems/Ollama-Menu-main.git`
- **Protocol**: SSH (requires GitHub SSH key authentication)
- **Branch**: master (default)

### Commit History
```
0c80ded - Add banner to README
fd3ba95 - Add repository banner
4552235 - Initial commit
```

### Repository Status
- **Total Commits**: 3
- **Contributors**: 1 (JTGSYSTEMS)
- **Created**: Recent (based on commit history)
- **Active Development**: Yes

---

## Core Features

### 1. Model Categories (7 Categories)

#### General Purpose Models (Category 1)
Includes 60+ models for general conversation and text generation:
- **LLaMA Series**: llama3, llama3.1, llama3.2, llama3.3, llama4
- **Gemma Series**: gemma, gemma2, gemma3
- **Mistral Series**: mistral, mistral-small, mistral-large, mistral-nemo, mixtral
- **Phi Series**: phi3, phi3.5, phi4, phi4-mini
- **Command Series**: command-r, command-r-plus, command-a, command-r7b
- **Granite Series**: granite3.1-dense, granite3.1-moe, granite3.2, granite3.3
- **Other Notable**: deepseek-v3, qwq, dolphin3, nemotron, solar-pro

#### Code-Specialized Models (Category 2)
23 models optimized for code generation and software development:
- **Primary**: codestral, codegemma, codellama, deepseek-coder, deepseek-coder-v2
- **StarCoder**: starcoder, starcoder2
- **Specialized**: qwen2.5-coder, codegeex4, opencoder, devstral, yi-coder
- **Tools**: sqlcoder, phind-codellama, magicoder, dolphincoder, athene-v2

#### Math and Reasoning Models (Category 3)
11 models for mathematical and logical reasoning:
- **Reasoning**: deepseek-r1, openthinker, smallthinker, r1-1776
- **Math**: qwen2-math, wizard-math, mathstral
- **Hybrid**: cogito, deepscaler
- **Advanced**: phi4-reasoning, phi4-mini-reasoning

#### Embedding Models (Category 4)
9 models for text embeddings and vector representations:
- **Snowflake**: snowflake-arctic-embed, snowflake-arctic-embed2
- **IBM**: granite-embedding
- **Popular**: mxbai-embed-large, nomic-embed-text, all-minilm
- **Multi-language**: bge-large, bge-m3, paraphrase-multilingual

#### Uncensored Models (Category 5)
9 models with reduced content filtering:
- **Dolphin Series**: dolphin-mixtral, dolphin-phi, dolphin-llama3, dolphin-mistral, dolphincoder
- **Wizard**: wizardlm-uncensored, wizard-vicuna-uncensored
- **Other**: llama2-uncensored, everythinglm

#### Medical Models (Category 6)
2 specialized medical/healthcare models:
- medllama2 (7B fine-tuned for medical queries)
- meditron (7B and 70B medical LLM)

#### Specialized Models (Category 7)
11 vision and multimodal models:
- **qwen3-vl Series**: qwen3-vl, qwen3-vl-phi3, qwen3-vl-llama3, qwen3-vl
- **Vision**: qwen3-vl, bakqwen3-vl, granite3.2-vision, qwen3-vl
- **Advanced**: qwen3-vl, mistral-small3.1
- **Function Calling**: nexusraven

### 2. Management Functions

#### List Installed Models (Option 9)
- Executes: `ollama list`
- Displays all locally installed Ollama models
- Shows model names, sizes, and modification dates

#### Update Models (Option 8)
- Updates 230+ models automatically
- Executes: `ollama pull [modelname]` for each model
- Comprehensive update list covering all categories
- **Total Models in Update List**: 230 models

### 3. Execution Options

For each selected model, users can choose:

#### Option 1: Run with Ollama (Standard)
- **Command**: `start cmd /k ollama run [modelname]`
- **Opens**: New Command Prompt window
- **Behavior**: Direct Ollama CLI interface
- **Use Case**: Standard model interaction

#### Option 2: Run with INTERPRETER (Advanced)
- **Command**: `start cmd /k interpreter --model ollama/[modelname]`
- **Requires**: INTERPRETER tool installed
- **Behavior**: Advanced integration with Open Interpreter
- **Use Case**: Code execution, function calling, advanced automation

---

## Technical Implementation

### Batch Script Architecture

#### Main Components

1. **Menu System** (`:menu`)
   - Entry point for user interaction
   - Displays 10 numbered options
   - Input validation and routing

2. **Category Submenus** (`:general`, `:code`, `:math`, etc.)
   - Call `:display_submenu` with model lists
   - Each model defined as `"name|description"` pair
   - Dynamic menu generation

3. **Display Submenu Function** (`:display_submenu`)
   - Parses model lists from category calls
   - Calculates column alignment dynamically
   - Formats model names and descriptions
   - Handles user selection

4. **Model Execution** (`:run_model`)
   - Presents Ollama vs INTERPRETER choice
   - Executes selected run command in new window
   - Remains open for multiple executions

5. **Utility Functions**
   - `:strlen` - String length calculator for alignment
   - `:list_models` - Display installed models
   - `:update_models` - Batch update all models

#### Key Technical Features

**Delayed Expansion**
```batch
setlocal enabledelayedexpansion
```
- Required for dynamic variable manipulation
- Used throughout for menu construction

**Dynamic Menu Generation**
```batch
for /f "tokens=1,2 delims=|" %%a in ("%~1") do (
    set /a option_count+=1
    set "option!option_count!_name=%%a"
    set "option!option_count!_desc=%%b"
)
```
- Splits model definitions on pipe character
- Builds indexed arrays of names and descriptions

**Column Alignment**
```batch
call :strlen opt_label
set /a spaces_needed=pad_length - strlen
for /l %%s in (1,1,!spaces_needed!) do set "spaces=!spaces! "
```
- Calculates string lengths
- Adds padding spaces for alignment
- Creates professional-looking menus

**Process Spawning**
```batch
start cmd /k [command]
```
- Opens new terminal window
- `/k` flag keeps window open after command
- Allows multiple simultaneous model sessions

---

## Hardware Requirements

### Minimum Requirements
- **RAM**: 8 GB (for 7B models)
- **Disk**: 10 GB free (per model, varies)
- **OS**: Windows 7 or later
- **CPU**: Modern multi-core processor

### Recommended Requirements
- **RAM**: 16 GB (for 13B models)
- **RAM**: 32 GB+ (for 33B+ models)
- **GPU**: NVIDIA GPU with 8GB+ VRAM (optional, accelerates inference)
- **Disk**: SSD with 100+ GB free space

### Model Size Guidelines
- **1B-3B models**: 4-8 GB RAM
- **7B models**: 8-16 GB RAM
- **13B models**: 16-24 GB RAM
- **33B models**: 32-48 GB RAM
- **70B models**: 64+ GB RAM
- **405B models**: 256+ GB RAM (or quantized versions with less)

---

## Dependencies

### Required Software

#### Ollama
- **Website**: https://ollama.com
- **Purpose**: Local LLM runtime and model manager
- **Installation**: Download installer from website
- **PATH**: Must be added to system PATH
- **Verification**: `ollama --version` in Command Prompt
- **Commands Used**:
  - `ollama list` - List installed models
  - `ollama pull [model]` - Download/update model
  - `ollama run [model]` - Execute model interactively

#### Windows Command Prompt
- **Built-in**: Yes (part of Windows OS)
- **Access**: Win + R → `cmd` → Enter
- **Alternative**: PowerShell (not recommended for this script)

### Optional Software

#### INTERPRETER (Open Interpreter)
- **GitHub**: https://github.com/KillianLucas/open-interpreter
- **Purpose**: Code-executing AI assistant
- **Installation**: `pip install open-interpreter`
- **Usage**: `interpreter --model ollama/[modelname]`
- **Features**: Code execution, file manipulation, system control
- **Note**: Required for Option 2 (Run with INTERPRETER)

---

## Usage Workflow

### Standard Workflow

1. **Launch Script**
   ```
   cd C:\Path\To\Ollama-Menu-main
   ollama-menu.bat
   ```

2. **Select Category**
   - View main menu (options 1-10)
   - Enter number for desired category
   - Example: `1` for General Purpose Models

3. **Choose Model**
   - View category submenu with model list
   - Read model descriptions
   - Enter model number
   - Example: `1` for llama3

4. **Select Execution Method**
   - Option 1: Standard Ollama CLI
   - Option 2: INTERPRETER integration
   - Option 3: Go back
   - Example: `1` for Ollama

5. **Interact with Model**
   - New terminal window opens
   - Model loads and presents prompt
   - Type queries and receive responses
   - Close window or Ctrl+C to exit

### Management Workflow

**List Installed Models**
```
Main Menu → 9
View list of installed models
Press any key to return
```

**Update All Models**
```
Main Menu → 8
Script pulls updates for 230+ models
Wait for completion (may take time)
Press any key to return
```

---

## Model Categories Detail

### General Purpose Models (60+ models)

**Use Cases**:
- General conversation and chat
- Text summarization and rewriting
- Creative writing and brainstorming
- Question answering
- Translation and language tasks

**Recommended Models**:
- **llama3.1** - Best overall performance (8B, 70B, 405B)
- **gemma3** - Single-GPU powerhouse
- **mistral-large** - 123B flagship model
- **phi4** - 14B state-of-the-art (compact)
- **command-r-plus** - 104B enterprise grade

**Model Families**:
- **LLaMA** (Meta): 8 versions (llama3-llama4)
- **Gemma** (Google): 3 versions
- **Mistral** (Mistral AI): 4 versions + mixtral MoE
- **Phi** (Microsoft): 4 versions
- **Granite** (IBM): 6 versions
- **Others**: 35+ additional models

### Code-Specialized Models (23 models)

**Use Cases**:
- Code generation and completion
- Code explanation and documentation
- Debugging and error analysis
- SQL query generation
- Multi-language programming support

**Recommended Models**:
- **codestral** - Mistral's 22B code specialist
- **deepseek-coder-v2** - 16B and 236B MoE powerhouse
- **qwen2.5-coder** - 0.5B to 32B range (highly efficient)
- **starcoder2** - Next-gen code model (3B, 7B, 15B)
- **sqlcoder** - SQL generation specialist

**Language Support**:
- Python, JavaScript, TypeScript, Java, C++, C#, Go, Rust
- 80+ programming languages (StarCoder models)
- SQL (specialized models)
- Shell scripting

### Math and Reasoning Models (11 models)

**Use Cases**:
- Mathematical problem solving
- Logical reasoning and chain-of-thought
- Step-by-step explanations
- Complex calculations
- Theorem proving

**Recommended Models**:
- **deepseek-r1** - 1.5B to 671B reasoning powerhouse
- **openthinker** - 7B and 32B reasoning specialists
- **qwen2-math** - 1.5B to 72B math expert
- **phi4-reasoning** - 14B with advanced reasoning

**Capabilities**:
- Multi-step reasoning
- Mathematical proofs
- Logic puzzles
- Quantitative analysis

### Embedding Models (9 models)

**Use Cases**:
- Semantic search
- Document similarity
- Clustering and classification
- RAG (Retrieval Augmented Generation) systems
- Vector database population

**Recommended Models**:
- **snowflake-arctic-embed2** - 568M state-of-the-art
- **mxbai-embed-large** - 335M high-performance
- **nomic-embed-text** - Excellent general embeddings
- **bge-m3** - Versatile multilingual

**Output**:
- Vector representations of text
- Typical dimensions: 384, 768, 1024
- Used with vector databases (Chroma, Pinecone, Weaviate)

### Uncensored Models (9 models)

**Use Cases**:
- Unrestricted creative writing
- Roleplaying and storytelling
- Uncensored research and analysis
- Freedom from safety guardrails

**Recommended Models**:
- **dolphin-mixtral** - 8x7B and 8x22B powerful coder
- **dolphin-llama3** - 8B and 70B versatile
- **wizardlm-uncensored** - 13B capable model

**Note**: Use responsibly. These models have reduced content filtering.

### Medical Models (2 models)

**Use Cases**:
- Medical query answering
- Healthcare information
- Clinical documentation assistance
- Medical literature analysis

**Available Models**:
- **medllama2** - 7B fine-tuned for medical domain
- **meditron** - 7B and 70B medical specialist

**Note**: Not a replacement for professional medical advice.

### Specialized Models (11 models)

**Use Cases**:
- Image understanding and description
- Visual question answering
- Document analysis (OCR-free)
- Multimodal AI applications
- Function calling and tool use

**Vision Models**:
- **qwen3-vl-llama3** - 8B vision benchmark leader
- **qwen3-vl** - 11B and 90B image reasoning
- **qwen3-vl** - Flagship vision-language model
- **qwen3-vl** - 1.8B efficient edge vision

**Function Calling**:
- **nexusraven** - 13B function calling specialist

---

## Troubleshooting Guide

### Common Issues

#### 1. "Ollama command not found"
**Cause**: Ollama not installed or not in PATH

**Solutions**:
```batch
REM Check if Ollama is installed
where ollama

REM Expected output: C:\Users\...\ollama.exe
REM If not found, install from https://ollama.com

REM Verify PATH
echo %PATH%

REM Look for Ollama directory in output
```

**Fix**: Add Ollama to system PATH
1. Right-click "This PC" → Properties
2. Advanced System Settings → Environment Variables
3. Edit PATH → Add Ollama installation directory
4. Restart Command Prompt

#### 2. "Repeating 's' characters in output"
**Cause**: Script encoding or delayed expansion issue

**Solutions**:
- Ensure script saved with Windows line endings (CRLF)
- Verify script downloaded correctly
- Re-download from GitHub repository
- Check for corruption during file transfer

#### 3. Model fails to run / Out of memory
**Cause**: Insufficient RAM for selected model

**Solutions**:
- Check model size: `ollama list`
- Use smaller models (7B instead of 70B)
- Close other applications to free RAM
- Consider quantized model versions
- Upgrade system RAM

#### 4. INTERPRETER not found
**Cause**: Open Interpreter not installed

**Solutions**:
```bash
# Install Open Interpreter
pip install open-interpreter

# Verify installation
interpreter --version

# Alternative: Use Option 1 (Ollama) instead
```

#### 5. Slow model loading
**Cause**: Model downloading for first time, or slow disk

**Solutions**:
- Wait for initial download to complete
- Check internet connection
- Move Ollama model directory to SSD
- Pre-download models: `ollama pull [modelname]`

#### 6. Script freezes during update
**Cause**: Network issues or large model downloads

**Solutions**:
- Wait patiently (some models are 40+ GB)
- Check network stability
- Update models individually instead of batch
- Use `ollama pull [specific-model]` manually

---

## Advanced Usage

### Batch Model Installation

Pre-download models before using menu:
```batch
REM Download multiple models at once
ollama pull llama3
ollama pull codestral
ollama pull deepseek-coder-v2
ollama pull mistral-large
```

### Custom Model Categories

To add custom models to the script:

1. Locate the appropriate category section (e.g., `:general`)
2. Add model to the `call :display_submenu` list
3. Format: `"modelname|Model description"`
4. Example:
```batch
:general
call :display_submenu "General Purpose Models" ^
    "llama3|Meta's capable 8B and 70B model" ^
    "my-custom-model|My custom fine-tuned model" ^
    ...
```

### Automating Model Updates

Create scheduled task to update models weekly:
```batch
REM Create update-only batch file
@echo off
ollama pull llama3
ollama pull codestral
REM ... add other critical models
echo Update complete!
pause
```

Schedule with Windows Task Scheduler for automatic updates.

### Integration with Other Tools

**Using with LangChain**:
```python
from langchain_community.llms import Ollama
llm = Ollama(model="llama3")
response = llm("Explain quantum computing")
```

**Using with LiteLLM**:
```python
import litellm
response = litellm.completion(
    model="ollama/codestral",
    messages=[{"role": "user", "content": "Write a Python function"}]
)
```

**Using with CrewAI**:
```python
from crewai import Agent, Task, Crew
agent = Agent(
    role="Coder",
    goal="Write clean code",
    llm="ollama/codestral"
)
```

---

## Development Notes

### For Claude Code Development

**Working Directory**: `/home/ultron/Desktop/Ollama-Menu-main/`

**Key Files to Modify**:
- `ollama-menu.bat` - Main script logic
- `README.md` - User documentation
- `CLAUDE.md` - System reference (this file)

**Testing Changes**:
- Cannot test directly on Linux (Windows batch script)
- Review code logic and syntax
- Test on Windows VM or system
- Verify menu structure and flow

**Git Operations**:
```bash
# From repository directory
cd ~/Desktop/Ollama-Menu-main

# Check status
git status

# Stage changes
git add ollama-menu.bat README.md CLAUDE.md

# Commit with attribution
git commit -m "Description of changes

🤖 Generated with Claude Code (https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>"

# Push to GitHub
git push origin master
```

### Code Style Guidelines

**Batch Script Conventions**:
- Use `setlocal enabledelayedexpansion` for dynamic variables
- Prefix labels with `:` (e.g., `:menu`, `:general`)
- Use `goto` for navigation between sections
- Comment complex logic with `REM`
- Keep lines under 255 characters
- Use descriptive variable names

**Menu Structure Pattern**:
```batch
:category_name
call :display_submenu "Category Title" ^
    "model1|Description 1" ^
    "model2|Description 2" ^
    "modelN|Description N"
goto menu
```

**Error Handling**:
```batch
if "%choice%"=="" goto invalid_choice
if "%choice%"=="value" (
    REM action
) else (
    echo Invalid choice
    pause >nul
    goto menu
)
```

### Future Enhancement Ideas

**Potential Features**:
1. Model search/filter functionality
2. Favorite models quick-access
3. Model performance benchmarking
4. Resource usage monitoring
5. Configuration file for custom models
6. Logging of model interactions
7. Multiple Ollama server support
8. Model comparison mode
9. Batch query execution
10. Export conversation history

**Code Improvements**:
- Add input sanitization
- Implement better error messages
- Add model availability checking before execution
- Progress indicators for long operations
- Configuration wizard for first-time setup

---

## Model Update List

The script maintains a comprehensive update list of **230 models** across all categories. When "Update Models" (option 8) is selected, the script executes `ollama pull` for each model in sequence.

### Update List (230 models)

**General Purpose** (60 models):
llama3, llama3.1, llama3.2, llama3.3, llama4, gemma, gemma2, gemma3, mistral, mistral-small, mistral-large, mistral-nemo, mixtral, phi3, phi3.5, phi4, phi4-mini, command-r, command-r-plus, command-a, command-r7b, command-r7b-arabic, granite3.1-dense, granite3.1-moe, granite3.2, granite3.3, granite3-dense, granite3-moe, granite3-guardian, falcon3, falcon2, olmo2, nemotron, nemotron-mini, solar-pro, solar, hermes3, wizardlm2, wizardlm, nous-hermes2, nous-hermes, notus, notux, openhermes, tinyllama, llama-pro, megadolphin, zephyr, mistral-openorca, mistrallite, xwinlm, neural-chat, openchat, yi, goliath, alfred, dbrx, starling-lm, stablelm2, stablelm-zephyr, qwen, qwen3, qwq

**Code Models** (23 models):
codestral, codegemma, codellama, deepseek-coder, deepseek-coder-v2, deepseek-llm, starcoder, starcoder2, wizardcoder, qwen2.5-coder, codegeex4, opencoder, smollm, smollm2, phind-codellama, sqlcoder, codebooga, stable-code, magicoder, dolphincoder, deepcoder, athene-v2, devstral, yi-coder

**Math/Reasoning** (11 models):
deepseek-r1, deepseek-v2, deepseek-v2.5, deepseek-v3, deepscaler, openthinker, smallthinker, r1-1776, qwen2-math, wizard-math, mathstral, cogito, phi4-reasoning, phi4-mini-reasoning

**Embedding** (9 models):
granite-embedding, snowflake-arctic-embed, snowflake-arctic-embed2, mxbai-embed-large, all-minilm, nomic-embed-text, bge-large, bge-m3, paraphrase-multilingual

**Uncensored** (9 models):
llama2-uncensored, dolphin-mixtral, dolphin-phi, dolphin-llama3, dolphin3, dolphincoder, wizardlm-uncensored, wizard-vicuna-uncensored, wizard-vicuna, dolphin-mistral, everythinglm, tinydolphin, samantha-mistral

**Medical** (2 models):
medllama2, meditron

**Specialized** (11 models):
qwen3-vl, qwen3-vl-phi3, qwen3-vl-llama3, qwen3-vl, bakqwen3-vl, nexusraven, granite3.2-vision, qwen3-vl, qwen3-vl, qwen3-vl, mistral-small

**Additional** (30+ models):
yarn-llama2, yarn-mistral, orca2, orca-mini, open-orca-platypus2, vicuna, firefunction-v2, llama3-groq-tool-use, nous-hermes2-mixtral, llama2-chinese, aya, glm4, llama3-chatqa, llama3-gradient, internlm2, exaone3.5, exaone-deep, shieldgemma, llama-guard3, reader-lm, duckdb-nsql, tulu3, nuextract, bespoke-minicheck, sailor2, marco-o1, codeup, stable-beluga, codeqwen

**Total**: 230 models

---

## Performance Optimization

### Disk Space Management

**Model Storage Location** (Windows):
```
C:\Users\[YourUsername]\.ollama\models
```

**Check Disk Usage**:
```batch
dir /s C:\Users\%USERNAME%\.ollama\models
```

**Remove Unused Models**:
```batch
ollama rm [modelname]
```

**Example Cleanup**:
```batch
REM Remove large models you don't use
ollama rm llama3.1:405b
ollama rm mixtral:8x22b
ollama rm deepseek-v3
```

### Memory Optimization

**Model Quantization**:
- Q4_0: 4-bit quantization (smaller, faster, lower quality)
- Q5_0: 5-bit quantization (balanced)
- Q8_0: 8-bit quantization (higher quality, larger)
- F16: Full 16-bit (highest quality, largest)

**Select Quantized Versions**:
```batch
ollama pull llama3:8b-q4_0
ollama pull codestral:22b-q5_0
```

**Concurrent Model Limits**:
- Run only 1-2 models simultaneously on 16GB RAM
- Run 3-4 models simultaneously on 32GB+ RAM
- Monitor with Task Manager (Ctrl+Shift+Esc)

### Network Optimization

**Parallel Downloads**:
```batch
REM Open multiple Command Prompts and run:
start cmd /c ollama pull llama3
start cmd /c ollama pull codestral
start cmd /c ollama pull mistral-large
```

**Resume Interrupted Downloads**:
- Ollama automatically resumes incomplete downloads
- Re-run `ollama pull [model]` to continue

---

## Security Considerations

### Uncensored Models Warning

Models in the "Uncensored Models" category have **reduced or removed safety guardrails**:
- May generate harmful, offensive, or inappropriate content
- No built-in content filtering
- Use only for legitimate research or creative purposes
- Not suitable for production applications serving end-users
- User assumes full responsibility for outputs

**Recommended Use Cases**:
- Creative writing without restrictions
- Research into AI safety and alignment
- Testing content moderation systems
- Unrestricted roleplay scenarios

**Recommended Safeguards**:
- Review outputs before sharing
- Implement your own content filtering
- Use in controlled environments only
- Do not expose to minors or untrained users

### Medical Models Disclaimer

Models in the "Medical Models" category are **not medical devices**:
- Not approved by FDA or other regulatory bodies
- Not a replacement for professional medical advice
- May produce inaccurate or harmful medical information
- Should only be used for educational or research purposes
- Always consult qualified healthcare professionals for medical decisions

### Data Privacy

**Local Execution**:
- All models run locally via Ollama
- No data sent to external servers (unless model explicitly configured)
- Conversations stay on your machine
- No telemetry or logging to third parties

**Model Sources**:
- Models downloaded from Ollama registry
- Verify model sources before installation
- Review model cards and documentation
- Be cautious with community-contributed models

---

## Integration with JTGSYSTEMS Ecosystem

### Company Information
- **Developer**: Joint Technology Group Inc.
- **Website**: https://jtgsystems.com
- **Purpose**: Simplify AI model management for Windows users

### Related Projects

While this is a standalone project, it may integrate with other JTGSYSTEMS tools:
- AI automation scripts
- Custom model fine-tuning workflows
- Enterprise AI deployment solutions

### Support and Contact
- **Website**: https://jtgsystems.com
- **GitHub**: https://github.com/jtgsystems
- **Issues**: https://github.com/jtgsystems/Ollama-Menu-main/issues

---

## Contributing

### How to Contribute

1. **Fork the Repository**
   ```bash
   gh repo fork jtgsystems/Ollama-Menu-main
   ```

2. **Create Feature Branch**
   ```bash
   git checkout -b feature/new-model-category
   ```

3. **Make Changes**
   - Edit `ollama-menu.bat`
   - Update `README.md` if user-facing
   - Update `CLAUDE.md` if technical details changed

4. **Test Thoroughly**
   - Test on Windows 10/11
   - Verify menu navigation
   - Test model execution (Ollama and INTERPRETER)
   - Check error handling

5. **Commit with Attribution**
   ```bash
   git commit -m "Add new model category: Image Generation

   - Added 5 new image generation models
   - Updated README with usage instructions
   - Tested on Windows 11"
   ```

6. **Push and Create PR**
   ```bash
   git push origin feature/new-model-category
   gh pr create --title "Add Image Generation Category" --body "Adds support for DALL-E, Stable Diffusion, and other image models"
   ```

### Contribution Guidelines

**Code Style**:
- Follow existing batch script conventions
- Maintain menu structure consistency
- Add comments for complex logic
- Test on clean Windows installation

**Documentation**:
- Update README for user-facing changes
- Update CLAUDE.md for technical changes
- Include usage examples
- Document new dependencies

**Model Additions**:
- Verify model exists in Ollama registry
- Include accurate description
- Categorize appropriately
- Test model execution

---

## Changelog

### Version 1.9 (Current)
- 230+ models supported
- 7 model categories
- Enhanced menu formatting
- Improved error handling
- INTERPRETER integration
- Comprehensive update functionality

### Version History
```
v1.9 - Current release with 230+ models
v1.x - Earlier versions (details in git history)
v1.0 - Initial release
```

---

## License

**MIT License**

Copyright (c) 2024 Joint Technology Group Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

## Quick Reference Commands

### Ollama Commands
```batch
ollama list                    # List installed models
ollama pull [model]            # Download/update model
ollama run [model]             # Run model interactively
ollama rm [model]              # Remove model
ollama --version               # Check Ollama version
ollama serve                   # Start Ollama server (if not auto-started)
```

### INTERPRETER Commands
```batch
interpreter                              # Launch interactive mode
interpreter --model ollama/[model]       # Use specific Ollama model
interpreter --help                       # View all options
```

### Script Navigation
```
Main Menu Options:
1 - General Purpose Models
2 - Code-Specialized Models
3 - Math and Reasoning Models
4 - Embedding Models
5 - Uncensored Models
6 - Medical Models
7 - Specialized Models
8 - Update Models
9 - List Installed Models
10 - Exit

Model Execution Options:
1 - Run with Ollama
2 - Run with INTERPRETER
3 - Back to Previous Menu
```

---

## Additional Resources

### Official Documentation
- **Ollama**: https://ollama.com/library
- **Ollama GitHub**: https://github.com/ollama/ollama
- **Open Interpreter**: https://github.com/KillianLucas/open-interpreter

### Model Information
- **Model Cards**: https://ollama.com/library/[modelname]
- **LLaMA**: https://ai.meta.com/llama/
- **Mistral**: https://mistral.ai/
- **Gemma**: https://ai.google.dev/gemma
- **Phi**: https://azure.microsoft.com/en-us/products/phi-3

### Community
- **Ollama Discord**: https://discord.gg/ollama
- **Reddit r/LocalLLaMA**: https://reddit.com/r/LocalLLaMA

---

## Technical Specifications

### Batch Script Details
- **Language**: Windows Batch (CMD)
- **Version**: 1.9
- **Lines of Code**: 505
- **Functions**: 6 (menu, display_submenu, run_model, strlen, list_models, update_models)
- **Supported Models**: 230+
- **Categories**: 7

### File Encoding
- **Line Endings**: CRLF (Windows)
- **Character Set**: ASCII/ANSI
- **Format**: Plain text (.bat)

### Compatibility
- **Windows 7**: Compatible
- **Windows 8/8.1**: Compatible
- **Windows 10**: Compatible
- **Windows 11**: Compatible
- **Windows Server**: Compatible (2012 R2+)

### Limitations
- **Platform**: Windows only (batch script)
- **Shell**: Command Prompt (CMD) only
- **Dependencies**: Requires Ollama installed and in PATH
- **Network**: Internet required for model downloads/updates
- **Disk**: Requires sufficient space for models (varies by model)

---

## Glossary

**Batch Script**: Windows command script file (.bat) executed by Command Prompt

**Delayed Expansion**: CMD feature allowing variable modification within loops/blocks

**Embedding Model**: AI model that converts text to numerical vectors for similarity comparison

**MoE (Mixture of Experts)**: Model architecture using multiple specialized sub-models

**Ollama**: Local LLM runtime for running AI models on your own hardware

**Quantization**: Process of reducing model precision to decrease size and increase speed

**RAG (Retrieval Augmented Generation)**: AI technique combining retrieval with generation

**Uncensored Model**: AI model with reduced or removed content filtering

**Vector Database**: Database optimized for storing and querying high-dimensional vectors

---

---

## Summary of Key Differences vs Ollama-Menu

This repository (Ollama-Menu-main) is the enhanced version with:
- **230+ models** (vs 100+ in Ollama-Menu)
- **227 models** in update list (vs 189 in Ollama-Menu)
- Same 7 category structure
- More recent model additions (2025 models)

Recent model additions in this version include:
- **Latest LLMs**: llama4, qwen3, qwq, deepseek-v3, dolphin3
- **Reasoning Models**: phi4-reasoning, phi4-mini-reasoning, marco-o1
- **Specialized**: granite3.3, exaone-deep, exaone3.5, sailor2
- **Multilingual**: aya, glm4, command-r7b-arabic
- **Vision**: qwen2.5vl, minicpm-v
- **Tools**: reader-lm, duckdb-nsql, nuextract, bespoke-minicheck
- **Safety**: shieldgemma, llama-guard3, granite3-guardian

This is the more comprehensive and up-to-date repository for users wanting access to the latest Ollama models.

---

*Last Updated: 2025-12-26*
*Documentation Version: 1.1*
*Project Version: 1.9*
*Repository: https://github.com/jtgsystems/Ollama-Menu-main*
*Branch: master*
*Remote: git@github.com:jtgsystems/Ollama-Menu-main.git*
*Created with: Claude Code (https://claude.com/claude-code)*

## Framework Versions

- **Windows Batch Script**: Native CMD interpreter
- **Ollama**: Latest version (user-installed)
- **Optional INTERPRETER**: Open Interpreter (user-installed)
- No additional frameworks required

