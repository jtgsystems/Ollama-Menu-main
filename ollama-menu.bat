@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ==================================
echo    AI Model Selection Menu v3.0
echo  by Joint Technology Group Inc.
echo       JTGSYSTEMS.COM
echo ==================================
echo 1. General Purpose Models
echo 2. Code-Specialized Models
echo 3. Math and Reasoning Models
echo 4. Embedding Models
echo 5. Uncensored Models
echo 6. Medical Models
echo 7. Specialized Models
echo 8. Update Models
echo 9. List Installed Models
echo 10. Exit
echo.

set "choice="
set /p choice="Enter your choice (1-10): "

if "%choice%"=="" goto invalid_choice
if "%choice%"=="10" exit /b
if "%choice%"=="9" goto list_models
if "%choice%"=="8" goto update_models
if "%choice%"=="7" goto specialized
if "%choice%"=="6" goto medical
if "%choice%"=="5" goto uncensored
if "%choice%"=="4" goto embedding
if "%choice%"=="3" goto math
if "%choice%"=="2" goto code
if "%choice%"=="1" goto general
goto invalid_choice

:invalid_choice
echo Invalid choice. Press any key to try again.
pause >nul
goto menu

:list_models
cls
echo ==============================
echo     Installed Models
echo ==============================
echo.
ollama list
echo.
echo Press any key to return to the main menu...
pause >nul
goto menu

:update_models
cls
echo ==============================
echo     Updating Models
echo ==============================
echo.
echo Updating all models...
REM List of English models to update
for %%m in (
    llama3
    llama3.1
    llama3.2
    llama3.3
    gemma
    gemma2
    gemma3
    mistral
    mistral-small
    mistral-large
    mixtral
    phi3
    phi3.5
    phi4
    phi4-mini
    command-r
    command-r-plus
    command-a
    codestral
    codegemma
    codellama
    deepseek-coder
    deepseek-coder-v2
    starcoder
    starcoder2
    wizardcoder
    deepseek-v2
    deepseek-v2.5
    deepseek-r1
    deepscaler
    openthinker
    smallthinker
    r1-1776
    granite3.1-dense
    granite3.1-moe
    granite3.2
    granite3.2-vision
    falcon3
    granite-embedding
    snowflake-arctic-embed
    snowflake-arctic-embed2
    mxbai-embed-large
    all-minilm
    nomic-embed-text
    bge-large
    llama2-uncensored
    dolphin-mixtral
    dolphin-phi
    dolphin-llama3
    dolphincoder
    wizardlm-uncensored
    wizard-vicuna-uncensored
    medllama2
    meditron
    llava
    llava-phi3
    llava-llama3
    moondream
    bakllava
    nexusraven
    deepcoder
    cogito
    command-r7b
    olmo2
    qwen2.5-coder
    qwen2-math
    athene-v2
    opencoder
    smollm
    smollm2
    granite3-dense
    granite3-moe
    nemotron
    nemotron-mini
    solar-pro
    hermes3
    codegeex4
    firefunction-v2
    llama3-groq-tool-use
    mathstral
    nous-hermes2-mixtral
    stable-code
    tinydolphin
    qwen
    stablelm2
    neural-chat
    starling-lm
    dbrx
    alfred
    wizardlm2
    nous-hermes2
    notus
    notux
    openhermes
    tinyllama
    llama-pro
    megadolphin
    zephyr
    mistral-openorca
    codebooga
    mistrallite
    xwinlm
    yarn-llama2
    yarn-mistral
    yi
    openchat
    goliath
    deepseek-llm
    magicoder
    stablelm-zephyr
    orca2
    orca-mini
    open-orca-platypus2
    nous-hermes
    vicuna
    wizard-math
    wizard-vicuna
    phind-codellama
    falcon
    sqlcoder
    samantha-mistral
    dolphin-mistral
    everythinglm
    codeup
    stable-beluga
    qwen3
    qwen3-coder
    qwen2.5vl
    qwen3-next
    qwen3-vl
    mistral-nemo
    minicpm-v
    qwq
    deepseek-v3
    deepseek-v3.2
    dolphin3
    bge-m3
    llama2-chinese
    aya
    glm4
    glm-4.7-flash
    llama3-chatqa
    llama3-gradient
    llama4
    yi-coder
    solar
    internlm2
    wizardlm
    exaone3.5
    paraphrase-multilingual
    granite3.3
    phi4-reasoning
    phi4-mini-reasoning
    shieldgemma
    exaone-deep
    llama-guard3
    reader-lm
    duckdb-nsql
    falcon2
    command-r7b-arabic
    tulu3
    nuextract
    bespoke-minicheck
    granite3-guardian
    sailor2
    marco-o1
    gemini-3-pro-preview
    olmo3
    olmo3.1
    devstral-2
    devstral-small-2
    kimi-k2
    kimi-k2.5
    kimi-k2-thinking
    minimax-m2
    minimax-m2.1
    mistral-large-3
    translategemma
    functiongemma
    nemotron-3-nano
    deepseek-ocr
    rnj-1
    codegemma-3
    gemma3n
    granite3-code
    granite3-code-2b
    granite3-code-8b
) do (
    echo Updating %%m...
    ollama pull %%m
)
echo.
echo Models updated. Press any key to return to main menu.
pause >nul
goto menu

:general
call :display_submenu "General Purpose Models" ^
    "llama3|Meta's capable 8B and 70B model" ^
    "llama3.1|State-of-the-art model in 8B, 70B, 405B" ^
    "llama3.2|Compact 1B and 3B models" ^
    "llama3.3|High-performance 70B model" ^
    "llama4|Meta's latest multimodal models" ^
    "gemma|Google's lightweight 2B and 7B models" ^
    "gemma2|Efficient 2B, 9B, 27B models" ^
    "gemma3|Most capable single-GPU model" ^
    "gemma3n|Multimodal optimized for everyday devices" ^
    "mistral|7B model by Mistral AI" ^
    "mistral-small|Compact high-performing model" ^
    "mistral-large|Mistral's flagship 123B model" ^
    "mistral-large-3|Latest Mistral flagship 2025 model" ^
    "mistral-nemo|12B model with 128k context length" ^
    "mixtral|MoE model in 8x7B and 8x22B" ^
    "phi3|Lightweight 3.8B model by Microsoft" ^
    "phi3.5|Enhanced 3.8B model" ^
    "phi4|14B state-of-the-art model" ^
    "phi4-mini|3.8B with multilingual and reasoning" ^
    "command-r|35B conversational model" ^
    "command-r-plus|104B enterprise model" ^
    "command-a|111B for demanding enterprises" ^
    "command-r7b|Smallest Cohere R-series model" ^
    "command-r7b-arabic|Command R7B with advanced Arabic" ^
    "granite3.1-dense|IBM's 2B and 8B text models" ^
    "granite3.1-moe|Low-latency 1B and 3B models" ^
    "granite3.2|Long-context 2B and 8B models" ^
    "granite3.3|IBM Granite 2B/8B 128K context models" ^
    "granite3-dense|Tool-based 2B and 8B models" ^
    "granite3-moe|MoE 1B and 3B for low latency" ^
    "falcon3|Efficient models under 10B" ^
    "falcon2|11B causal decoder-only model" ^
    "olmo2|Open 7B and 13B models" ^
    "olmo3|Latest 3B and 7B open model" ^
    "olmo3.1|Improved 3B and 7B with reasoning" ^
    "nemotron|NVIDIA's 70B instruct model" ^
    "nemotron-mini|4B for roleplay and RAG" ^
    "nemotron-3-nano|Compact NVIDIA model for edge" ^
    "solar-pro|22B model for single GPU" ^
    "solar|Compact 10.7B large language model" ^
    "hermes3|Nous Research's 3B to 405B models" ^
    "wizardlm2|Microsoft's advanced model" ^
    "wizardlm|General use model based on Llama 2" ^
    "nous-hermes2|10.7B and 34B by Nous Research" ^
    "notus|7B chat model based on Zephyr" ^
    "notux|Top-performing MoE model" ^
    "openhermes|7B fine-tuned on Mistral" ^
    "tinyllama|Compact 1.1B model" ^
    "llama-pro|Expanded Llama 2 for programming" ^
    "megadolphin|120B interleaved Dolphin model" ^
    "zephyr|Fine-tuned Mistral and Mixtral" ^
    "mistral-openorca|7B fine-tuned on OpenOrca" ^
    "mistrallite|Long-context Mistral model" ^
    "xwinlm|Conversational Llama 2-based model" ^
    "neural-chat|Fine-tuned Mistral model" ^
    "openchat|High-performing open-source model" ^
    "yi|High-performing 6B, 9B, 34B model" ^
    "goliath|Combined Llama 2 70B model" ^
    "alfred|Robust conversational model" ^
    "dbrx|132B general-purpose by Databricks" ^
    "starling-lm|7B model for chatbot helpfulness" ^
    "stablelm2|1.6B and 12B multilingual model" ^
    "qwen3|Qwen3 series of dense and MoE models" ^
    "qwen3-next|Next generation Qwen models" ^
    "glm4|Strong multi-lingual general language model" ^
    "glm-4.7-flash|Fast efficient multilingual model" ^
    "aya|Cohere's multilingual models (23 languages)" ^
    "deepseek-v3|671B MoE language model" ^
    "deepseek-v3.2|Updated DeepSeek 671B model" ^
    "dolphin3|Dolphin 3.0 Llama 3.1 8B general purpose" ^
    "llama2-chinese|Llama 2 fine-tuned for Chinese" ^
    "internlm2|7B model for practical scenarios" ^
    "exaone3.5|LG AI's bilingual (English/Korean) models" ^
    "exaone-deep|LG AI's reasoning models (math/coding)" ^
    "tulu3|Allen AI's instruction following model" ^
    "sailor2|Multilingual models for South-East Asia" ^
    "gemini-3-pro-preview|Google's Gemini 3 Pro preview" ^
    "kimi-k2|Moonshot AI's K2 language model" ^
    "kimi-k2.5|Updated K2 with enhanced capabilities" ^
    "kimi-k2-thinking|K2 with reasoning specialization" ^
    "minimax-m2|MiniMax's efficient language model" ^
    "minimax-m2.1|Updated MiniMax M2 model" ^
    "rnj-1|RNJ open-source language model" ^
    "llama3-chatqa|NVIDIA's Llama 3 for conversational QA" ^
    "llama3-gradient|Llama-3 8B with extended context" ^
    "reader-lm|HTML to Markdown conversion models" ^
    "qwen|Alibaba's Qwen 0.5B to 110B series" ^
    "deepseek-llm|Advanced model with 2T bilingual tokens" ^
    "deepseek-v2|Strong economical MoE model" ^
    "falcon|TII's 7B to 180B models" ^
    "nous-hermes|General use 7B/13B models" ^
    "nous-hermes2-mixtral|Nous Research over Mixtral 8x7B" ^
    "orca2|Microsoft's Llama 2 for reasoning" ^
    "orca-mini|3B to 70B general purpose" ^
    "smollm|Small 135M to 1.7B models" ^
    "smollm2|Compact 135M/360M/1.7B models" ^
    "stable-beluga|Llama 2 fine-tuned on Orca" ^
    "stablelm-zephyr|Lightweight 3B chat model" ^
    "tinydolphin|Experimental 1.1B Dolphin" ^
    "vicuna|Llama-based 7B/13B/33B chat" ^
    "wizard-vicuna|13B based on Llama 2" ^
    "yarn-llama2|Llama 2 with 128K context" ^
    "yarn-mistral|Mistral with 64K/128K context" ^
    "samantha-mistral|Philosophy/psychology companion"
goto menu

:code
call :display_submenu "Code-Specialized Models" ^
    "codestral|Mistral's 22B code model" ^
    "codegemma|Google's 2B and 7B coding models" ^
    "codegemma-3|Google's latest Code Gemma 3 models" ^
    "codellama|7B to 70B for code generation" ^
    "deepseek-coder|1.3B to 33B code model" ^
    "deepseek-coder-v2|16B and 236B MoE model" ^
    "starcoder|1B to 15B for 80+ languages" ^
    "starcoder2|3B, 7B, 15B next-gen model" ^
    "wizardcoder|33B state-of-the-art code model" ^
    "qwen2.5-coder|0.5B to 32B code model" ^
    "qwen3-coder|Alibaba's latest 2025 coding model" ^
    "codegeex4|9B for software development" ^
    "granite-code|IBM's 3B to 34B code models" ^
    "granite3-code|IBM's Granite 3 code series" ^
    "granite3-code-2b|IBM's 2B code model" ^
    "granite3-code-8b|IBM's 8B code model" ^
    "phind-codellama|34B code generation model" ^
    "sqlcoder|7B and 15B for SQL generation" ^
    "duckdb-nsql|7B text-to-SQL model" ^
    "codebooga|34B merged code model" ^
    "stable-code|3B competitive coding model" ^
    "magicoder|7B trained on synthetic data" ^
    "opencoder|1.5B and 8B code models" ^
    "dolphincoder|7B and 15B uncensored coder" ^
    "codeqwen|7B pretrained on code data" ^
    "deepcoder|14B open-source coder" ^
    "athene-v2|72B excels at code completion" ^
    "devstral-2|24B model for coding agents" ^
    "devstral-small-2|Compact version of Devstral 2" ^
    "yi-coder|Code language models with <10B parameters" ^
    "firefunction-v2|Function calling specialist" ^
    "functiongemma|Google's function calling model" ^
    "llama3-groq-tool-use|Tool-use optimized Llama 3" ^
    "translategemma|Google's translation specialist model" ^
    "codeup|Great code generation based on Llama2" ^
    "open-orca-platypus2|Open Orca and Platypus 2 merge"
goto menu

:math
call :display_submenu "Math and Reasoning Models" ^
    "deepseek-r1|1.5B to 671B reasoning model" ^
    "deepscaler|1.5B fine-tuned reasoning model" ^
    "openthinker|7B and 32B reasoning models" ^
    "smallthinker|3B fine-tuned from Qwen" ^
    "r1-1776|70B and 671B unbiased model" ^
    "qwen2-math|1.5B to 72B math model" ^
    "qwq|Reasoning model of the Qwen series" ^
    "wizard-math|7B to 70B for math and logic" ^
    "mathstral|7B for math reasoning" ^
    "cogito|3B to 70B hybrid reasoning model" ^
    "phi4-reasoning|14B open-weight reasoning models" ^
    "phi4-mini-reasoning|Lightweight model for advanced reasoning" ^
    "marco-o1|Alibaba's open large reasoning model" ^
    "exaone-deep|LG AI's reasoning models (math/coding)"
goto menu

:embedding
call :display_submenu "Embedding Models" ^
    "granite-embedding|IBM's 30M and 278M models" ^
    "snowflake-arctic-embed|22M to 335M suite" ^
    "snowflake-arctic-embed2|568M embedding model" ^
    "mxbai-embed-large|335M state-of-the-art" ^
    "all-minilm|22M and 33M sentence embeddings" ^
    "nomic-embed-text|High-performing embeddings" ^
    "bge-large|335M text-to-vector model" ^
    "bge-m3|BAAI's versatile embedding model" ^
    "paraphrase-multilingual|Sentence-transformers for clustering"
goto menu

:uncensored
call :display_submenu "Uncensored Models" ^
    "llama2-uncensored|7B and 70B uncensored" ^
    "dolphin-mixtral|8x7B and 8x22B coder" ^
    "dolphin-phi|2.7B uncensored model" ^
    "dolphin-llama3|8B and 70B versatile model" ^
    "dolphincoder|7B and 15B coding model" ^
    "wizardlm-uncensored|13B uncensored model" ^
    "wizard-vicuna-uncensored|7B to 30B model" ^
    "dolphin-mistral|7B uncensored coder" ^
    "everythinglm|13B with 16K context"
goto menu

:medical
call :display_submenu "Medical Models" ^
    "medllama2|7B fine-tuned for medical queries" ^
    "meditron|7B and 70B medical LLM"
goto menu

:specialized
call :display_submenu "Specialized Models" ^
    "llava|7B to 34B multimodal model" ^
    "llava-phi3|3.8B vision model" ^
    "llava-llama3|8B vision benchmark model" ^
    "moondream|1.8B vision model for edge" ^
    "bakllava|7B multimodal Mistral model" ^
    "nexusraven|13B for function calling" ^
    "granite3.2-vision|2B for visual documents" ^
    "llama3.2-vision|11B and 90B image reasoning" ^
    "qwen2.5vl|Flagship vision-language model of Qwen" ^
    "qwen3-vl|Next gen Qwen vision-language model" ^
    "minicpm-v|Multimodal LLMs for vision-language" ^
    "mistral-small3.1|24B with vision capabilities" ^
    "deepseek-ocr|OCR specialist model" ^
    "llama-guard3|Content safety classification models" ^
    "granite3-guardian|IBM's risk detection for prompts/responses" ^
    "shieldgemma|Instruction tuned models for safety evaluation" ^
    "nuextract|3.8B information extraction based on Phi-3" ^
    "bespoke-minicheck|State-of-the-art fact-checking model"
goto menu

:display_submenu
setlocal
set "category=%~1"
shift
set /a option_count=0
:options_loop
if "%~1"=="" goto prepare_display
for /f "tokens=1,2 delims=|" %%a in ("%~1") do (
    set /a option_count+=1
    set "option!option_count!_name=%%a"
    set "option!option_count!_desc=%%b"
)
shift
goto options_loop

:prepare_display
set "max_length=0"
for /l %%i in (1,1,!option_count!) do (
    set "label=%%i. !option%%i_name!"
    call :strlen label
    if !strlen! gtr !max_length! set "max_length=!strlen!"
)
set /a "pad_length=max_length+4"

:display_menu
cls
echo ==============================
echo    %category%
echo ==============================
for /l %%i in (1,1,!option_count!) do (
    set "opt_label=%%i. !option%%i_name!"
    call :strlen opt_label
    set /a spaces_needed=pad_length - strlen
    if !spaces_needed! lss 0 set spaces_needed=0
    set "spaces="
    for /l %%s in (1,1,!spaces_needed!) do set "spaces=!spaces! "
    echo !opt_label!!spaces! !option%%i_desc!"
)
set /a back_index=option_count+1
echo !back_index!. Back to Main Menu
echo.
set "choice="
set /p choice="Enter your choice (1-!back_index!): "

if "!choice!"=="!back_index!" goto :eof
if !choice! geq 1 if !choice! leq !option_count! (
    call :run_model "!option%choice%_name!"
) else (
    echo Invalid choice. Press any key to try again.
    pause >nul
)
goto display_menu

:run_model
setlocal enabledelayedexpansion
set "model_name=%~1"
set "model_name=!model_name: =!"
:run_model_menu
cls
echo ==============================
echo       Run Options for !model_name!
echo ==============================
echo 1. Run with Ollama
echo 2. Run with INTERPRETER
echo 3. Back to Previous Menu
echo.
set "subchoice="
set /p subchoice="Enter your choice (1-3): "

if "!subchoice!"=="3" goto :eof
if "!subchoice!"=="2" (
    echo Running command: start cmd /k interpreter --model ollama/!model_name!
    start cmd /k interpreter --model ollama/!model_name!
)
if "!subchoice!"=="1" (
    echo Running command: start cmd /k ollama run !model_name!
    start cmd /k ollama run !model_name!
)
if "!subchoice!" neq "1" if "!subchoice!" neq "2" if "!subchoice!" neq "3" (
    echo Invalid choice. Press any key to try again.
    pause >nul
    goto run_model_menu
)
goto run_model_menu

:strlen
setlocal enabledelayedexpansion
set "s=!%1!"
set "len=0"
for %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
    if not "!s:~%%N,1!"=="" (
        set /a "len+=%%N"
        set "s=!s:~%%N!"
    )
)
endlocal & set strlen=%len%
goto :eof
