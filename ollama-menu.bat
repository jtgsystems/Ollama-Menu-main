@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ==================================
echo    AI Model Selection Menu v1.9
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
    devstral
    llama4
    qwen2.5vl
    mistral-nemo
    minicpm-v
    qwq
    deepseek-v3
    dolphin3
    bge-m3
    llama2-chinese
    aya
    glm4
    llama3-chatqa
    llama3-gradient
    yi-coder
    solar
    internlm2
    wizardlm
    exaone3.5
    paraphrase-multilingual
    granite3.3
    phi4-reasoning
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
    phi4-mini-reasoning
    sailor2
    marco-o1
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
    "gemma|Google's lightweight 2B and 7B models" ^
    "gemma2|Efficient 2B, 9B, 27B models" ^
    "gemma3|Most capable single-GPU model" ^
    "mistral|7B model by Mistral AI" ^
    "mistral-small|Compact high-performing model" ^
    "mistral-large|Mistral's flagship 123B model" ^
    "mixtral|MoE model in 8x7B and 8x22B" ^
    "phi3|Lightweight 3.8B model by Microsoft" ^
    "phi3.5|Enhanced 3.8B model" ^
    "phi4|14B state-of-the-art model" ^
    "phi4-mini|3.8B with multilingual and reasoning" ^
    "command-r|35B conversational model" ^
    "command-r-plus|104B enterprise model" ^
    "command-a|111B for demanding enterprises" ^
    "granite3.1-dense|IBM's 2B and 8B text models" ^
    "granite3.1-moe|Low-latency 1B and 3B models" ^
    "granite3.2|Long-context 2B and 8B models" ^
    "granite3-dense|Tool-based 2B and 8B models" ^
    "granite3-moe|MoE 1B and 3B for low latency" ^
    "falcon3|Efficient models under 10B" ^
    "olmo2|Open 7B and 13B models" ^
    "command-r7b|Smallest Cohere R-series model" ^
    "nemotron|NVIDIA's 70B instruct model" ^
    "nemotron-mini|4B for roleplay and RAG" ^
    "solar-pro|22B model for single GPU" ^
    "hermes3|Nous Research's 3B to 405B models" ^
    "wizardlm2|Microsoft's advanced model" ^
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
    "llama4|Meta's latest multimodal models" ^
    "mistral-nemo|12B model with 128k context length" ^
    "qwq|Reasoning model of the Qwen series" ^
    "deepseek-v3|671B MoE language model" ^
    "dolphin3|Dolphin 3.0 Llama 3.1 8B general purpose model" ^
    "llama2-chinese|Llama 2 fine-tuned for Chinese dialogue" ^
    "aya|Cohere's multilingual models (23 languages)" ^
    "glm4|Strong multi-lingual general language model" ^
    "llama3-chatqa|NVIDIA's Llama 3 for conversational QA and RAG" ^
    "llama3-gradient|Llama-3 8B with extended context length" ^
    "solar|Compact 10.7B large language model" ^
    "internlm2|7B model for practical scenarios with reasoning" ^
    "wizardlm|General use model based on Llama 2" ^
    "exaone3.5|LG AI's bilingual (English/Korean) models" ^
    "granite3.3|IBM Granite 2B/8B 128K context models" ^
    "shieldgemma|Instruction tuned models for safety evaluation" ^
    "exaone-deep|LG AI's reasoning models (math/coding)" ^
    "llama-guard3|Content safety classification models" ^
    "reader-lm|HTML to Markdown conversion models" ^
    "duckdb-nsql|7B text-to-SQL model" ^
    "falcon2|11B causal decoder-only model" ^
    "command-r7b-arabic|Command R7B with advanced Arabic capabilities" ^
    "tulu3|Allen AI's instruction following model family" ^
    "nuextract|3.8B information extraction model based on Phi-3" ^
    "bespoke-minicheck|State-of-the-art fact-checking model" ^
    "granite3-guardian|IBM's risk detection models for prompts/responses" ^
    "sailor2|Multilingual models for South-East Asia" ^
    "marco-o1|Alibaba's open large reasoning model"
goto menu

:code
call :display_submenu "Code-Specialized Models" ^
    "codestral|Mistral's 22B code model" ^
    "codegemma|Google's 2B and 7B coding models" ^
    "codellama|7B to 70B for code generation" ^
    "deepseek-coder|1.3B to 33B code model" ^
    "deepseek-coder-v2|16B and 236B MoE model" ^
    "starcoder|1B to 15B for 80+ languages" ^
    "starcoder2|3B, 7B, 15B next-gen model" ^
    "wizardcoder|33B state-of-the-art code model" ^
    "qwen2.5-coder|0.5B to 32B code model" ^
    "codegeex4|9B for software development" ^
    "granite-code|IBM's 3B to 34B code models" ^
    "phind-codellama|34B code generation model" ^
    "sqlcoder|7B and 15B for SQL generation" ^
    "codebooga|34B merged code model" ^
    "stable-code|3B competitive coding model" ^
    "magicoder|7B trained on synthetic data" ^
    "opencoder|1.5B and 8B code models" ^
    "dolphincoder|7B and 15B uncensored coder" ^
    "codeqwen|7B pretrained on code data" ^
    "deepcoder|14B open-source coder" ^
    "athene-v2|72B excels at code completion" ^
    "devstral|24B model for coding agents" ^
    "yi-coder|Code language models with <10B parameters"
goto menu

:math
call :display_submenu "Math and Reasoning Models" ^
    "deepseek-r1|1.5B to 671B reasoning model" ^
    "deepscaler|1.5B fine-tuned reasoning model" ^
    "openthinker|7B and 32B reasoning models" ^
    "smallthinker|3B fine-tuned from Qwen" ^
    "r1-1776|70B and 671B unbiased model" ^
    "qwen2-math|1.5B to 72B math model" ^
    "wizard-math|7B to 70B for math and logic" ^
    "mathstral|7B for math reasoning" ^
    "cogito|3B to 70B hybrid reasoning model" ^
    "phi4-reasoning|14B open-weight reasoning models" ^
    "phi4-mini-reasoning|Lightweight model for advanced reasoning"
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
    "paraphrase-multilingual|Sentence-transformers model for clustering/semantic search"
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
    "mistral-small3.1|24B with vision capabilities" ^
    "qwen2.5vl|Flagship vision-language model of Qwen" ^
    "minicpm-v|Multimodal LLMs for vision-language understanding"
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
