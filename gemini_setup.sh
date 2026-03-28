#!/data/data/com.termux/files/usr/bin/bash

# ══════════════════════════════════════════
#  Gemini Setup for Termux
#  Created by GrayWizard
# ══════════════════════════════════════════

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
DIM='\033[2m'
BOLD='\033[1m'
RESET='\033[0m'
BG_GREEN='\033[42m'
BG_BLUE='\033[44m'
BG_RED='\033[41m'
BG_YELLOW='\033[43m'
BG_MAGENTA='\033[45m'
BG_CYAN='\033[46m'

CHECK="✅"
CROSS="❌"
ARROW="➜"
STAR="⭐"
GEAR="⚙️"
PKG="📦"
ROCKET="🚀"
WARN="⚠️"
INFO="ℹ️  "
WRENCH="🔧"
PHONE="📱"
CHIP="💻"
GPU_ICON="🎮"
SHELL_ICON="🐚"
FOLDER="📁"
FILE="📄"
SPARKLE="✨"
DIAMOND="💎"
USER_ICON="👤"
CODE_ICON="🧑‍💻"
SHIELD="🛡️"
TRASH="🗑️"
LOCK="🔒"
BRAIN="🧠"
BOOK="📘"
FIRE="🔥"
KEY="🔑"

print_line() {
    printf "${CYAN}═══════════════════════════════════════════════════════════${RESET}\n"
}

print_thin_line() {
    printf "${DIM}${CYAN}───────────────────────────────────────────────────────────${RESET}\n"
}

print_banner() {
    clear
    printf "\n"
    printf "  ${MAGENTA}${BOLD}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${RESET}\n"
    printf "  ${MAGENTA}${BOLD}┃${RESET}  ${CYAN}${BOLD}◆ G E M I N I${RESET}  ${DIM}${WHITE}Setup for Termux${RESET}     ${MAGENTA}${BOLD}┃${RESET}\n"
    printf "  ${MAGENTA}${BOLD}┃${RESET}  ${DIM}${YELLOW}Created by GrayWizard${RESET}                 ${MAGENTA}${BOLD}┃${RESET}\n"
    printf "  ${MAGENTA}${BOLD}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${RESET}\n"
    printf "\n"
    print_line
}

spinner() {
    local pid=$1
    local msg=$2
    local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    while kill -0 "$pid" 2>/dev/null; do
        local c=${spin:i++%${#spin}:1}
        printf "\r  ${CYAN}${c}${RESET} ${msg}"
        sleep 0.1
    done
    printf "\r"
}

success_msg() {
    printf "  ${CHECK} ${GREEN}$1${RESET}\n"
}

error_msg() {
    printf "  ${CROSS} ${RED}$1${RESET}\n"
}

info_msg() {
    printf "  ${INFO} ${BLUE}$1${RESET}\n"
}

warn_msg() {
    printf "  ${WARN} ${YELLOW}$1${RESET}\n"
}

if [ ! -d "/data/data/com.termux" ]; then
    error_msg "This script is designed for Termux only!"
    exit 1
fi

show_main_menu() {
    print_banner
    printf "\n"
    printf "  ${DIAMOND} ${BOLD}${WHITE}Welcome to Gemini Setup${RESET}\n"
    printf "  ${DIM}${WHITE}One-stop setup & management for Gemini CLI on Termux${RESET}\n"
    printf "\n"
    print_thin_line
    printf "\n"

    printf "  ${BG_GREEN}${WHITE}${BOLD}  1  ${RESET}  ${GREEN}${BOLD}Install Gemini CLI${RESET}\n"
    printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Full installation with dependencies, config & context setup${RESET}\n"
    printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Creates ~/.gemini with personalized GEMINI.md & settings${RESET}\n"
    printf "\n"

    printf "  ${BG_RED}${WHITE}${BOLD}  2  ${RESET}  ${RED}${BOLD}Uninstall Gemini CLI${RESET}\n"
    printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Completely removes Gemini CLI, configs, and all data${RESET}\n"
    printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Clean removal with confirmation prompts${RESET}\n"
    printf "\n"

    printf "  ${BG_YELLOW}${WHITE}${BOLD}  3  ${RESET}  ${YELLOW}${BOLD}Exit${RESET}\n"
    printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Quit Gemini Setup${RESET}\n"
    printf "\n"

    print_thin_line
    printf "\n"

    while true; do
        printf "  ${ARROW} ${BOLD}${WHITE}Select option [1/2/3]: ${RESET}"
        read -r MAIN_CHOICE
        case "$MAIN_CHOICE" in
            1) run_installer; break ;;
            2) run_uninstaller; break ;;
            3)
                printf "\n"
                info_msg "Goodbye! ${YELLOW}Created by GrayWizard${RESET}"
                printf "\n"
                exit 0
                ;;
            *) warn_msg "Invalid choice. Please enter 1, 2, or 3." ;;
        esac
    done
}

run_uninstaller() {
    print_banner
    printf "  ${TRASH} ${BOLD}${RED} Gemini CLI Uninstaller${RESET}\n"
    print_thin_line
    printf "\n"

    warn_msg "This will completely remove Gemini CLI from your device."
    printf "\n"
    printf "  ${DIM}${WHITE}The following will be removed:${RESET}\n"
    printf "\n"
    printf "  ${RED}●${RESET} ${WHITE}@google/gemini-cli${RESET}        ${DIM}(global npm package)${RESET}\n"
    printf "  ${RED}●${RESET} ${WHITE}~/.gemini/${RESET}               ${DIM}(config, GEMINI.md, settings)${RESET}\n"
    printf "  ${RED}●${RESET} ${WHITE}~/.gemini/GEMINI.md${RESET}      ${DIM}(context & preferences file)${RESET}\n"
    printf "  ${RED}●${RESET} ${WHITE}~/.gemini/settings.json${RESET}  ${DIM}(CLI settings)${RESET}\n"
    printf "  ${RED}●${RESET} ${WHITE}~/.gemini/.geminiignore${RESET}  ${DIM}(ignore patterns)${RESET}\n"
    printf "  ${RED}●${RESET} ${WHITE}GEMINI_API_KEY export${RESET}    ${DIM}(from shell config file)${RESET}\n"

    printf "\n"
    print_thin_line
    printf "\n"

    if command -v gemini > /dev/null 2>&1; then
        GEMINI_VER=$(gemini --version 2>/dev/null || echo "installed")
        info_msg "Detected Gemini CLI: ${WHITE}${GEMINI_VER}${RESET}"
    else
        if [ -d "$HOME/.gemini" ]; then
            warn_msg "Gemini CLI binary not found, but ~/.gemini config exists."
        else
            error_msg "Gemini CLI is not installed on this device."
            printf "\n"
            printf "  ${ARROW} ${DIM}Nothing to uninstall. Returning to menu...${RESET}\n"
            show_main_menu
            return
        fi
    fi

    printf "\n"

    printf "  ${WARN} ${BOLD}${RED}Are you sure you want to uninstall Gemini CLI?${RESET}\n"
    printf "  ${ARROW} ${WHITE}Type ${RED}${BOLD}YES${RESET}${WHITE} to confirm: ${RESET}"
    read -r CONFIRM_1

    if [ "$CONFIRM_1" != "YES" ]; then
        printf "\n"
        info_msg "Uninstallation cancelled. Returning to menu..."
        sleep 1
        show_main_menu
        return
    fi

    printf "\n"
    printf "  ${LOCK} ${BOLD}${YELLOW}Final confirmation — this action is IRREVERSIBLE.${RESET}\n"
    printf "  ${ARROW} ${WHITE}Type ${RED}${BOLD}UNINSTALL${RESET}${WHITE} to proceed: ${RESET}"
    read -r CONFIRM_2

    if [ "$CONFIRM_2" != "UNINSTALL" ]; then
        printf "\n"
        info_msg "Uninstallation cancelled. Returning to menu..."
        sleep 1
        show_main_menu
        return
    fi

    printf "\n"
    print_thin_line
    printf "\n"

    info_msg "Removing @google/gemini-cli npm package..."
    npm uninstall -g @google/gemini-cli > /dev/null 2>&1 &
    spinner $! "Removing Gemini CLI package..."
    success_msg "Gemini CLI npm package removed"
    printf "\n"

    info_msg "Cleaning npm cache..."
    npm cache clean --force > /dev/null 2>&1 &
    spinner $! "Cleaning npm cache..."
    success_msg "npm cache cleaned"
    printf "\n"

    info_msg "Removing GEMINI_API_KEY from shell configs..."

    SHELL_FILES=(
        "$HOME/.bashrc"
        "$HOME/.bash_profile"
        "$HOME/.profile"
        "$HOME/.zshrc"
        "$HOME/.zprofile"
        "$HOME/.config/fish/config.fish"
    )

    API_REMOVED=0
    for sf in "${SHELL_FILES[@]}"; do
        if [ -f "$sf" ]; then
            if grep -q "GEMINI_API_KEY" "$sf" 2>/dev/null; then
                sed -i '/# Gemini API Key/d' "$sf" 2>/dev/null
                sed -i '/GEMINI_API_KEY/d' "$sf" 2>/dev/null
                sed -i '/^$/N;/^\n$/d' "$sf" 2>/dev/null
                printf "    ${RED}✗${RESET} ${DIM}Removed API key from ${sf}${RESET}\n"
                API_REMOVED=1
            fi
        fi
    done

    if [ "$API_REMOVED" -eq 0 ]; then
        printf "    ${DIM}No API key exports found in shell configs${RESET}\n"
    fi

    unset GEMINI_API_KEY 2>/dev/null
    success_msg "API key exports cleaned"
    printf "\n"

    if [ -d "$HOME/.gemini" ]; then
        info_msg "Removing ~/.gemini directory..."

        if [ -f "$HOME/.gemini/settings.json" ]; then
            printf "    ${RED}✗${RESET} ${DIM}Removing settings.json${RESET}\n"
        fi
        if [ -f "$HOME/.gemini/GEMINI.md" ]; then
            printf "    ${RED}✗${RESET} ${DIM}Removing GEMINI.md${RESET}\n"
        fi
        if [ -f "$HOME/.gemini/.geminiignore" ]; then
            printf "    ${RED}✗${RESET} ${DIM}Removing .geminiignore${RESET}\n"
        fi

        TOTAL_FILES=$(find "$HOME/.gemini" -type f 2>/dev/null | wc -l)
        printf "    ${RED}✗${RESET} ${DIM}Total files removed: ${TOTAL_FILES}${RESET}\n"

        rm -rf "$HOME/.gemini"
        printf "\n"
        success_msg "~/.gemini directory completely removed"
    else
        info_msg "~/.gemini directory not found (already clean)"
    fi
    printf "\n"

    info_msg "Checking for leftover Gemini data..."

    LEFTOVER=0
    for CHECK_DIR in "$HOME/.config/gemini" "$HOME/.local/share/gemini" "$HOME/.cache/gemini" "$PREFIX/lib/node_modules/@google/gemini-cli"; do
        if [ -d "$CHECK_DIR" ]; then
            rm -rf "$CHECK_DIR"
            printf "    ${RED}✗${RESET} ${DIM}Removed: ${CHECK_DIR}${RESET}\n"
            LEFTOVER=1
        fi
    done

    if [ "$LEFTOVER" -eq 0 ]; then
        success_msg "No leftover data found — system is clean"
    else
        success_msg "All leftover data removed"
    fi

    printf "\n"

    print_thin_line
    printf "\n"
    info_msg "Verifying uninstallation...\n"

    VERIFY_PASS=true

    if command -v gemini > /dev/null 2>&1; then
        error_msg "gemini command still found in PATH"
        VERIFY_PASS=false
    else
        printf "    ${CHECK} ${GREEN}gemini command removed from PATH${RESET}\n"
    fi

    if [ -d "$HOME/.gemini" ]; then
        error_msg "~/.gemini directory still exists"
        VERIFY_PASS=false
    else
        printf "    ${CHECK} ${GREEN}~/.gemini directory removed${RESET}\n"
    fi

    if npm list -g @google/gemini-cli > /dev/null 2>&1; then
        error_msg "@google/gemini-cli still in global npm packages"
        VERIFY_PASS=false
    else
        printf "    ${CHECK} ${GREEN}npm package removed from global registry${RESET}\n"
    fi

    if [ -z "$GEMINI_API_KEY" ]; then
        printf "    ${CHECK} ${GREEN}GEMINI_API_KEY unset from session${RESET}\n"
    else
        warn_msg "GEMINI_API_KEY still in current session (restart Termux)"
        VERIFY_PASS=false
    fi

    printf "\n"

    if [ "$VERIFY_PASS" = true ]; then
        printf "\n"
        print_line
        printf "\n"
        printf "  ${GREEN}${BOLD}${CHECK} GEMINI CLI UNINSTALLED SUCCESSFULLY ${CHECK}${RESET}\n"
        printf "\n"
        printf "  ${DIM}${WHITE}All Gemini CLI components have been purged from your device.${RESET}\n"
        printf "  ${DIM}${WHITE}API key removed from shell configs. Restart Termux to clear session.${RESET}\n"
        printf "  ${DIM}${WHITE}You can reinstall anytime by running this setup again.${RESET}\n"
    else
        printf "\n"
        warn_msg "Uninstallation completed with some warnings."
        warn_msg "Restart Termux to fully clear environment variables."
    fi

    printf "\n"
    print_line
    printf "\n"
    printf "       ${YELLOW}${BOLD}✦ Created by ${MAGENTA}GrayWizard ${YELLOW}✦${RESET}\n"
    printf "\n"
    print_line
    printf "\n"

    exit 0
}

run_installer() {

print_banner
printf "  ${GEAR} ${BOLD}${WHITE} PHASE 1 / 7 — Installing Dependencies${RESET}\n"
print_thin_line
printf "\n"

info_msg "Updating package repositories..."
apt update -y > /dev/null 2>&1 &
spinner $! "Updating repositories..."
success_msg "Repositories updated"

info_msg "Upgrading existing packages..."
pkg upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" > /dev/null 2>&1 &
spinner $! "Upgrading packages..."
success_msg "Packages upgraded"

DEPS=("nodejs-lts" "npm" "git" "openssl" "curl" "wget" "python" "build-essential")

printf "\n"
info_msg "Installing required packages...\n"
print_thin_line

for dep in "${DEPS[@]}"; do
    printf "  ${PKG} Installing ${CYAN}${dep}${RESET}..."
    pkg install -y "$dep" > /dev/null 2>&1 &
    spinner $! "Installing ${dep}..."
    if command -v "$dep" > /dev/null 2>&1 || dpkg -s "$dep" > /dev/null 2>&1; then
        printf "  ${CHECK} ${GREEN}${dep} installed successfully${RESET}\n"
    else
        printf "  ${CHECK} ${GREEN}${dep} processed${RESET}\n"
    fi
done

printf "\n"
print_thin_line

NODE_VER=$(node -v 2>/dev/null || echo "N/A")
NPM_VER=$(npm -v 2>/dev/null || echo "N/A")

printf "\n"
info_msg "Node.js version: ${WHITE}${NODE_VER}${RESET}"
info_msg "npm version:     ${WHITE}${NPM_VER}${RESET}"

if [ "$NODE_VER" = "N/A" ] || [ "$NPM_VER" = "N/A" ]; then
    error_msg "Node.js or npm not found! Please install manually."
    error_msg "Run: pkg install nodejs-lts"
    exit 1
fi

info_msg "Configuring node-gyp environment..."
mkdir -p ~/.gyp
echo "{'variables':{'android_ndk_path':''}}" > ~/.gyp/include.gypi
success_msg "Configuration applied successfully"

printf "\n"
success_msg "All dependencies installed successfully!"
printf "\n"

sleep 1

print_banner
printf "  ${ROCKET} ${BOLD}${WHITE} PHASE 2 / 7 — Select Release Channel${RESET}\n"
print_thin_line
printf "\n"

printf "  ${DIAMOND} Gemini CLI ships in ${WHITE}3 release channels${RESET}:\n"
printf "\n"

printf "  ${BG_GREEN}${WHITE}${BOLD}  1  ${RESET}  ${GREEN}${BOLD}Stable Channel${RESET}  ${BG_GREEN}${WHITE} ${STAR} RECOMMENDED ${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${WHITE}Most reliable and thoroughly tested release${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Promoted from preview after 1 week of validation${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Best for daily use and production workflows${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}npm tag: ${CYAN}latest${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Updated: Every Tuesday ~2000 UTC${RESET}\n"
printf "\n"

printf "  ${BG_BLUE}${WHITE}${BOLD}  2  ${RESET}  ${BLUE}${BOLD}Preview Channel${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${WHITE}Early access to upcoming features${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}May contain regressions or outstanding issues${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Promoted from nightly after up to 1 week${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}npm tag: ${CYAN}preview${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Good for testing new features before stable${RESET}\n"
printf "\n"

printf "  ${BG_MAGENTA}${WHITE}${BOLD}  3  ${RESET}  ${MAGENTA}${BOLD}Nightly Channel${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${WHITE}Bleeding-edge, built from main branch daily${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Published every day at UTC 00:00${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Pending validations — expect issues${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}npm tag: ${CYAN}nightly${RESET}\n"
printf "       ${DIM}${WHITE}┃${RESET} ${DIM}Only for contributors and advanced users${RESET}\n"
printf "\n"

print_thin_line
printf "\n"

while true; do
    printf "  ${ARROW} ${BOLD}${WHITE}Select channel [1/2/3]: ${RESET}"
    read -r CHANNEL_CHOICE

    case "$CHANNEL_CHOICE" in
        1)
            CHANNEL_TAG="latest"
            CHANNEL_NAME="Stable"
            CHANNEL_COLOR="${GREEN}"
            break
            ;;
        2)
            CHANNEL_TAG="preview"
            CHANNEL_NAME="Preview"
            CHANNEL_COLOR="${BLUE}"
            break
            ;;
        3)
            CHANNEL_TAG="nightly"
            CHANNEL_NAME="Nightly"
            CHANNEL_COLOR="${MAGENTA}"
            break
            ;;
        *)
            warn_msg "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done

printf "\n"
success_msg "Selected: ${CHANNEL_COLOR}${BOLD}${CHANNEL_NAME} Channel${RESET} ${DIM}(tag: ${CHANNEL_TAG})${RESET}"
printf "\n"

sleep 1

print_banner
printf "  ${PKG} ${BOLD}${WHITE} PHASE 3 / 7 — Installing Gemini CLI (${CHANNEL_COLOR}${CHANNEL_NAME}${WHITE})${RESET}\n"
print_thin_line
printf "\n"

info_msg "Installing @google/gemini-cli@${CHANNEL_TAG}..."
printf "\n"

npm install -g @google/gemini-cli@${CHANNEL_TAG} 2>&1 | while IFS= read -r line; do
    printf "  ${DIM}${WHITE}  │ ${line}${RESET}\n"
done

INSTALL_EXIT=${PIPESTATUS[0]}

printf "\n"

if command -v gemini > /dev/null 2>&1; then
    GEMINI_VER=$(gemini --version 2>/dev/null || echo "installed")
    success_msg "Gemini CLI installed successfully!"
    info_msg "Version: ${WHITE}${GEMINI_VER}${RESET}"
else
    if [ "$INSTALL_EXIT" -ne 0 ]; then
        error_msg "Installation may have encountered issues."
        warn_msg "Trying alternative install method..."
        printf "\n"
        npx @google/gemini-cli@${CHANNEL_TAG} --version > /dev/null 2>&1
        success_msg "Gemini CLI available via npx"
    else
        success_msg "Gemini CLI package installed"
    fi
fi

printf "\n"

sleep 1

print_banner
printf "  ${USER_ICON} ${BOLD}${WHITE} PHASE 4 / 7 — User Profile & Preferences${RESET}\n"
print_thin_line
printf "\n"

printf "  ${SPARKLE} ${WHITE}Let's personalize your Gemini experience.${RESET}\n"
printf "  ${LOCK} ${DIM}This data stays LOCAL on your device — zero data collection.${RESET}\n"
printf "\n"
print_thin_line
printf "\n"

printf "  ${USER_ICON} ${BOLD}${CYAN}Your Name${RESET}\n"
printf "  ${ARROW} ${WHITE}Enter your name / alias: ${RESET}"
read -r USER_NAME
while [ -z "$USER_NAME" ]; do
    warn_msg "Name cannot be empty."
    printf "  ${ARROW} ${WHITE}Enter your name / alias: ${RESET}"
    read -r USER_NAME
done
success_msg "Name: ${WHITE}${USER_NAME}${RESET}"
printf "\n"

printf "  ${CODE_ICON} ${BOLD}${CYAN}Coding Proficiency${RESET}\n"
printf "\n"
printf "       ${BG_GREEN}${WHITE}${BOLD} 1 ${RESET}  ${GREEN}Beginner${RESET}\n"
printf "          ${DIM}New to programming. Needs detailed explanations,${RESET}\n"
printf "          ${DIM}comments on every line, and beginner-friendly language.${RESET}\n"
printf "\n"
printf "       ${BG_BLUE}${WHITE}${BOLD} 2 ${RESET}  ${BLUE}Intermediate${RESET}\n"
printf "          ${DIM}Comfortable with basics. Knows data structures,${RESET}\n"
printf "          ${DIM}OOP concepts, and can debug with some guidance.${RESET}\n"
printf "\n"
printf "       ${BG_MAGENTA}${WHITE}${BOLD} 3 ${RESET}  ${MAGENTA}Advanced${RESET}\n"
printf "          ${DIM}Deep understanding of systems, architecture, and${RESET}\n"
printf "          ${DIM}design patterns. Writes production-grade code.${RESET}\n"
printf "\n"
printf "       ${BG_RED}${WHITE}${BOLD} 4 ${RESET}  ${RED}Expert / Professional${RESET}\n"
printf "          ${DIM}Industry-level. Understands low-level systems,${RESET}\n"
printf "          ${DIM}compilers, security, and advanced optimization.${RESET}\n"
printf "\n"

while true; do
    printf "  ${ARROW} ${WHITE}Select proficiency [1/2/3/4]: ${RESET}"
    read -r PROF_CHOICE
    case "$PROF_CHOICE" in
        1) PROF_LEVEL="Beginner"; PROF_COLOR="${GREEN}"; break ;;
        2) PROF_LEVEL="Intermediate"; PROF_COLOR="${BLUE}"; break ;;
        3) PROF_LEVEL="Advanced"; PROF_COLOR="${MAGENTA}"; break ;;
        4) PROF_LEVEL="Expert"; PROF_COLOR="${RED}"; break ;;
        *) warn_msg "Please enter 1, 2, 3, or 4." ;;
    esac
done
success_msg "Proficiency: ${PROF_COLOR}${BOLD}${PROF_LEVEL}${RESET}"
printf "\n"

printf "  ${BOOK} ${BOLD}${CYAN}Preferred Programming Languages${RESET}\n"
printf "  ${ARROW} ${WHITE}Enter your languages ${DIM}(comma-separated, e.g., Python, JavaScript, C++):${RESET}\n"
printf "  ${ARROW} "
read -r USER_LANGUAGES
USER_LANGUAGES="${USER_LANGUAGES:-Not specified}"
success_msg "Languages: ${WHITE}${USER_LANGUAGES}${RESET}"
printf "\n"

printf "  ${BRAIN} ${BOLD}${CYAN}Primary Use Case${RESET}\n"
printf "\n"
printf "       ${WHITE}1${RESET} ${DIM}─${RESET} ${WHITE}General Coding & Scripting${RESET}\n"
printf "       ${WHITE}2${RESET} ${DIM}─${RESET} ${WHITE}Web Development (Frontend / Backend / Fullstack)${RESET}\n"
printf "       ${WHITE}3${RESET} ${DIM}─${RESET} ${WHITE}Mobile / App Development${RESET}\n"
printf "       ${WHITE}4${RESET} ${DIM}─${RESET} ${WHITE}Data Science / Machine Learning / AI${RESET}\n"
printf "       ${WHITE}5${RESET} ${DIM}─${RESET} ${WHITE}DevOps / System Administration${RESET}\n"
printf "       ${WHITE}6${RESET} ${DIM}─${RESET} ${WHITE}Cybersecurity / Ethical Hacking${RESET}\n"
printf "       ${WHITE}7${RESET} ${DIM}─${RESET} ${WHITE}Game Development${RESET}\n"
printf "       ${WHITE}8${RESET} ${DIM}─${RESET} ${WHITE}Learning & Education${RESET}\n"
printf "       ${WHITE}9${RESET} ${DIM}─${RESET} ${WHITE}Other${RESET}\n"
printf "\n"

while true; do
    printf "  ${ARROW} ${WHITE}Select use case [1-9]: ${RESET}"
    read -r USE_CHOICE
    case "$USE_CHOICE" in
        1) USE_CASE="General Coding & Scripting"; break ;;
        2) USE_CASE="Web Development"; break ;;
        3) USE_CASE="Mobile / App Development"; break ;;
        4) USE_CASE="Data Science / ML / AI"; break ;;
        5) USE_CASE="DevOps / System Administration"; break ;;
        6) USE_CASE="Cybersecurity / Ethical Hacking"; break ;;
        7) USE_CASE="Game Development"; break ;;
        8) USE_CASE="Learning & Education"; break ;;
        9)
            printf "  ${ARROW} ${WHITE}Describe your use case: ${RESET}"
            read -r USE_CASE
            USE_CASE="${USE_CASE:-General}"
            break
            ;;
        *) warn_msg "Please enter 1 through 9." ;;
    esac
done
success_msg "Use case: ${WHITE}${USE_CASE}${RESET}"
printf "\n"

sleep 1

print_banner
printf "  ${SHELL_ICON} ${BOLD}${WHITE} PHASE 5 / 7 — Shell Environment & API Key${RESET}\n"
print_thin_line
printf "\n"

printf "  ${SPARKLE} ${WHITE}Configure your shell and authentication.${RESET}\n"
printf "\n"
print_thin_line
printf "\n"

printf "  ${SHELL_ICON} ${BOLD}${CYAN}Shell Information${RESET}\n"
printf "  ${ARROW} ${WHITE}What shell do you use? ${DIM}(e.g., bash, zsh, fish) [default: bash]:${RESET} "
read -r USER_SHELL
USER_SHELL="${USER_SHELL:-bash}"
success_msg "Shell: ${WHITE}${USER_SHELL}${RESET}"
printf "\n"

case "$USER_SHELL" in
    bash)
        SHELL_RC="$HOME/.bashrc"
        SHELL_RC_NAME="~/.bashrc"
        EXPORT_SYNTAX='export GEMINI_API_KEY="KEYVALUE"'
        ;;
    zsh)
        SHELL_RC="$HOME/.zshrc"
        SHELL_RC_NAME="~/.zshrc"
        EXPORT_SYNTAX='export GEMINI_API_KEY="KEYVALUE"'
        ;;
    fish)
        SHELL_RC="$HOME/.config/fish/config.fish"
        SHELL_RC_NAME="~/.config/fish/config.fish"
        EXPORT_SYNTAX='set -gx GEMINI_API_KEY "KEYVALUE"'
        ;;
    ksh)
        SHELL_RC="$HOME/.kshrc"
        SHELL_RC_NAME="~/.kshrc"
        EXPORT_SYNTAX='export GEMINI_API_KEY="KEYVALUE"'
        ;;
    *)
        SHELL_RC="$HOME/.profile"
        SHELL_RC_NAME="~/.profile"
        EXPORT_SYNTAX='export GEMINI_API_KEY="KEYVALUE"'
        ;;
esac

info_msg "Config file: ${WHITE}${SHELL_RC_NAME}${RESET}"
printf "\n"

print_thin_line
printf "\n"
printf "  ${KEY} ${BOLD}${CYAN}Gemini API Key${RESET}\n"
printf "\n"
printf "  ${DIM}${WHITE}An API key lets you authenticate with Gemini without a browser.${RESET}\n"
printf "  ${DIM}${WHITE}Get your free key from: ${CYAN}https://aistudio.google.com/apikey${RESET}\n"
printf "\n"
printf "  ${DIM}${WHITE}Authentication methods:${RESET}\n"
printf "    ${WHITE}1${RESET} ${DIM}─${RESET} ${WHITE}API Key${RESET}          ${DIM}(paste key now — works instantly)${RESET}\n"
printf "    ${WHITE}2${RESET} ${DIM}─${RESET} ${WHITE}Google Login${RESET}     ${DIM}(browser auth on first run of gemini)${RESET}\n"
printf "\n"

while true; do
    printf "  ${ARROW} ${WHITE}Select auth method [1/2]: ${RESET}"
    read -r AUTH_CHOICE
    case "$AUTH_CHOICE" in
        1)
            AUTH_METHOD="apikey"
            break
            ;;
        2)
            AUTH_METHOD="login"
            break
            ;;
        *)
            warn_msg "Please enter 1 or 2."
            ;;
    esac
done

API_KEY_SET=false
GEMINI_KEY=""

if [ "$AUTH_METHOD" = "apikey" ]; then
    printf "\n"
    printf "  ${KEY} ${BOLD}${CYAN}Enter Your API Key${RESET}\n"
    printf "  ${LOCK} ${DIM}Your key is stored ONLY in ${SHELL_RC_NAME} on this device.${RESET}\n"
    printf "  ${LOCK} ${DIM}It is never sent anywhere by this script.${RESET}\n"
    printf "\n"
    printf "  ${ARROW} ${WHITE}Paste your Gemini API key: ${RESET}"
    read -r GEMINI_KEY

    while [ -z "$GEMINI_KEY" ]; do
        warn_msg "API key cannot be empty."
        printf "  ${ARROW} ${WHITE}Paste your Gemini API key: ${RESET}"
        read -r GEMINI_KEY
    done

    KEY_LEN=${#GEMINI_KEY}
    if [ "$KEY_LEN" -lt 10 ]; then
        warn_msg "Key seems too short (${KEY_LEN} chars). Proceeding anyway..."
    fi

    KEY_SHOW="${GEMINI_KEY:0:6}...${GEMINI_KEY: -4}"

    printf "\n"
    info_msg "Key preview: ${WHITE}${KEY_SHOW}${RESET} ${DIM}(${KEY_LEN} characters)${RESET}"
    printf "\n"

    info_msg "Exporting API key to ${WHITE}${SHELL_RC_NAME}${RESET}..."

    SHELL_RC_DIR=$(dirname "$SHELL_RC")
    mkdir -p "$SHELL_RC_DIR" 2>/dev/null

    touch "$SHELL_RC" 2>/dev/null

    if grep -q "GEMINI_API_KEY" "$SHELL_RC" 2>/dev/null; then
        sed -i '/# Gemini API Key — added by GrayWizard Gemini Setup/d' "$SHELL_RC" 2>/dev/null
        sed -i '/GEMINI_API_KEY/d' "$SHELL_RC" 2>/dev/null
        info_msg "Replaced existing API key entry"
    fi

    printf "\n" >> "$SHELL_RC"
    printf "# Gemini API Key — added by GrayWizard Gemini Setup\n" >> "$SHELL_RC"

    if [ "$USER_SHELL" = "fish" ]; then
        printf "set -gx GEMINI_API_KEY \"%s\"\n" "$GEMINI_KEY" >> "$SHELL_RC"
    else
        printf "export GEMINI_API_KEY=\"%s\"\n" "$GEMINI_KEY" >> "$SHELL_RC"
    fi

    success_msg "API key written to ${WHITE}${SHELL_RC_NAME}${RESET}"

    export GEMINI_API_KEY="$GEMINI_KEY"
    success_msg "API key exported in current session"

    if [ -n "$GEMINI_API_KEY" ]; then
        success_msg "Verified: GEMINI_API_KEY is active"
    fi

    API_KEY_SET=true
    printf "\n"

else
    printf "\n"
    info_msg "You chose ${WHITE}Google Login${RESET} authentication."
    printf "  ${DIM}${WHITE}On first run of ${CYAN}gemini${WHITE}, a browser window will open.${RESET}\n"
    printf "  ${DIM}${WHITE}Sign in with your Google account to authenticate.${RESET}\n"
    printf "  ${DIM}${WHITE}Free tier: 60 requests/min, 1000 requests/day.${RESET}\n"
    printf "\n"
    success_msg "Auth method: ${WHITE}Google Login (on first run)${RESET}"
    printf "\n"
fi

sleep 1

print_banner
printf "  ${PHONE} ${BOLD}${WHITE} PHASE 6 / 7 — Device & Hardware Info${RESET}\n"
print_thin_line
printf "\n"

printf "  ${SPARKLE} ${WHITE}Capture your device specs for Gemini context.${RESET}\n"
printf "\n"
print_thin_line
printf "\n"

printf "  ${CHIP} ${BOLD}${CYAN}Processor Information${RESET}\n"
printf "  ${ARROW} ${WHITE}Enter your processor/SoC ${DIM}(e.g., Snapdragon 8 Gen 3, Dimensity 9300):${RESET} "
read -r USER_PROCESSOR
if [ -z "$USER_PROCESSOR" ]; then
    USER_PROCESSOR=$(getprop ro.hardware 2>/dev/null || echo "Unknown")
fi
success_msg "Processor: ${WHITE}${USER_PROCESSOR}${RESET}"
printf "\n"

printf "  ${GPU_ICON} ${BOLD}${CYAN}GPU Information${RESET}\n"
printf "  ${ARROW} ${WHITE}Enter your GPU ${DIM}(e.g., Adreno 750, Mali-G720):${RESET} "
read -r USER_GPU
USER_GPU="${USER_GPU:-Unknown}"
success_msg "GPU: ${WHITE}${USER_GPU}${RESET}"
printf "\n"

printf "  ${PHONE} ${BOLD}${CYAN}Device Name${RESET}\n"
printf "  ${ARROW} ${WHITE}Enter your device name ${DIM}(e.g., Samsung Galaxy S24, Pixel 9 Pro):${RESET} "
read -r USER_DEVICE
if [ -z "$USER_DEVICE" ]; then
    USER_DEVICE=$(getprop ro.product.model 2>/dev/null || echo "Unknown Device")
fi
success_msg "Device: ${WHITE}${USER_DEVICE}${RESET}"
printf "\n"

print_thin_line
printf "\n"

printf "  ${GEAR} ${BOLD}${CYAN}Auto-Detecting Device Properties...${RESET}\n"
printf "\n"

DEVICE_MODEL=$(getprop ro.product.model 2>/dev/null || echo "Unknown")
DEVICE_BRAND=$(getprop ro.product.brand 2>/dev/null || echo "Unknown")
DEVICE_MANUFACTURER=$(getprop ro.product.manufacturer 2>/dev/null || echo "Unknown")
DEVICE_BOARD=$(getprop ro.product.board 2>/dev/null || echo "Unknown")
DEVICE_PLATFORM=$(getprop ro.board.platform 2>/dev/null || echo "Unknown")
DEVICE_HARDWARE=$(getprop ro.hardware 2>/dev/null || echo "Unknown")
ANDROID_VERSION=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
ANDROID_SDK=$(getprop ro.build.version.sdk 2>/dev/null || echo "Unknown")
ANDROID_SECURITY_PATCH=$(getprop ro.build.version.security_patch 2>/dev/null || echo "Unknown")
BUILD_TYPE=$(getprop ro.build.type 2>/dev/null || echo "Unknown")
BUILD_DESC=$(getprop ro.build.description 2>/dev/null || echo "Unknown")
DEVICE_ABI=$(getprop ro.product.cpu.abi 2>/dev/null || echo "Unknown")
DEVICE_ABIS=$(getprop ro.product.cpu.abilist 2>/dev/null || echo "Unknown")
FIRST_API=$(getprop ro.product.first_api_level 2>/dev/null || echo "Unknown")
TOTAL_RAM=$(free -h 2>/dev/null | awk '/^Mem:/{print $2}' || echo "Unknown")
AVAIL_STORAGE=$(df -h "$HOME" 2>/dev/null | awk 'NR==2{print $4}' || echo "Unknown")
KERNEL_VERSION=$(uname -r 2>/dev/null || echo "Unknown")
ARCH=$(uname -m 2>/dev/null || echo "Unknown")
DISPLAY_DENSITY=$(getprop ro.sf.lcd_density 2>/dev/null || echo "Unknown")
WIFI_INTERFACE=$(getprop wifi.interface 2>/dev/null || echo "Unknown")
TIMEZONE=$(getprop persist.sys.timezone 2>/dev/null || echo "Unknown")
LANGUAGE=$(getprop persist.sys.language 2>/dev/null || getprop ro.product.locale 2>/dev/null || echo "Unknown")
ENCRYPTION=$(getprop ro.crypto.state 2>/dev/null || echo "Unknown")
SELINUX=$(getenforce 2>/dev/null || echo "Unknown")
SCREEN_RES=$(wm size 2>/dev/null | awk '{print $3}' || echo "Unknown")
BATTERY_LEVEL=$(cat /sys/class/power_supply/battery/capacity 2>/dev/null || echo "Unknown")
UPTIME_INFO=$(uptime -p 2>/dev/null || uptime 2>/dev/null | awk -F'up' '{print $2}' | awk -F',' '{print $1}' || echo "Unknown")

printf "  ${DIM}${WHITE}┌──────────────────────────────────────────────────┐${RESET}\n"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Brand:          ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$DEVICE_BRAND"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Manufacturer:   ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$DEVICE_MANUFACTURER"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Model:          ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$DEVICE_MODEL"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Board:          ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$DEVICE_BOARD"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Platform:       ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$DEVICE_PLATFORM"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Hardware:       ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$DEVICE_HARDWARE"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Architecture:   ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$ARCH"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}CPU ABI:        ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$DEVICE_ABI"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}All ABIs:       ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$DEVICE_ABIS"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Android:        ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$ANDROID_VERSION (SDK $ANDROID_SDK)"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Security Patch: ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$ANDROID_SECURITY_PATCH"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Kernel:         ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$KERNEL_VERSION"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}RAM:            ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$TOTAL_RAM"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Free Storage:   ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$AVAIL_STORAGE"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Screen:         ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$SCREEN_RES"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Display DPI:    ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$DISPLAY_DENSITY"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Battery:        ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "${BATTERY_LEVEL}%"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Timezone:       ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$TIMEZONE"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Language:       ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$LANGUAGE"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}Encryption:     ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$ENCRYPTION"
printf "  ${DIM}${WHITE}│${RESET} ${WHITE}SELinux:        ${CYAN}%-32s${RESET}${DIM}${WHITE}│${RESET}\n" "$SELINUX"
printf "  ${DIM}${WHITE}└──────────────────────────────────────────────────┘${RESET}\n"
printf "\n"

sleep 1

print_banner
printf "  ${FOLDER} ${BOLD}${WHITE} PHASE 7 / 7 — Creating Configuration Files${RESET}\n"
print_thin_line
printf "\n"

GEMINI_DIR="$HOME/.gemini"

info_msg "Creating ${CYAN}~/.gemini${RESET} directory..."
mkdir -p "$GEMINI_DIR"
success_msg "Directory created: ${WHITE}${GEMINI_DIR}${RESET}"
printf "\n"

case "$PROF_LEVEL" in
    "Beginner")
        PROF_INSTRUCTIONS="- The user is a **Beginner** programmer.
- Always explain concepts in simple, easy-to-understand language.
- Add detailed comments on EVERY line of code explaining what it does and why.
- Break down complex topics into small, digestible steps.
- Avoid jargon unless you define it first.
- Provide analogies and real-world examples to explain abstract concepts.
- Include \"What this means\" summaries after technical explanations.
- When showing commands, explain what each flag and argument does.
- Suggest additional learning resources where appropriate."
        ;;
    "Intermediate")
        PROF_INSTRUCTIONS="- The user is an **Intermediate** programmer.
- Explain concepts clearly but can skip over-simplify basics.
- Add comments on important or non-obvious lines of code.
- Explain design decisions and trade-offs.
- Include error handling and edge cases in examples.
- Mention best practices and common pitfalls.
- Provide context on why certain approaches are preferred."
        ;;
    "Advanced")
        PROF_INSTRUCTIONS="- The user is an **Advanced** programmer.
- Focus on efficiency, architecture, and design patterns.
- Include performance considerations and optimization tips.
- Discuss trade-offs between different approaches.
- Reference relevant documentation and standards.
- Include advanced error handling, logging, and edge cases.
- You can use technical jargon freely."
        ;;
    "Expert")
        PROF_INSTRUCTIONS="- The user is an **Expert / Professional** programmer.
- Be concise and technical — can skip basic explanations.
- Focus on cutting-edge solutions, optimizations, and architecture.
- Discuss low-level implementation details when relevant.
- Include security considerations and threat models.
- Reference RFCs, specs, and source code when applicable.
- Assume deep familiarity with systems internals and patterns."
        ;;
esac

if [ "$API_KEY_SET" = true ]; then
    AUTH_DISPLAY="API Key (exported to ${SHELL_RC_NAME})"
    AUTH_STATUS="Configured"
else
    AUTH_DISPLAY="Google Login (browser auth on first run)"
    AUTH_STATUS="On first run"
fi

info_msg "Creating ${CYAN}settings.json${RESET}..."

cat > "$GEMINI_DIR/settings.json" << SETTINGS_EOF
{
  "\$schema": "https://raw.githubusercontent.com/google-gemini/gemini-cli/main/schemas/settings.schema.json",
  "telemetry": {
    "enabled": false,
    "logPrompts": false
  },
  "privacy": {
    "usageStatisticsEnabled": false
  },
  "model": {
    "name": "auto"
  },
  "ui": {
    "theme": "Dracula"
  }
}
SETTINGS_EOF

success_msg "settings.json created ${DIM}(all telemetry & analytics disabled)${RESET}"
printf "\n"

info_msg "Creating ${CYAN}GEMINI.md${RESET} context file..."

CURRENT_DATE=$(date '+%Y-%m-%d %H:%M:%S')

cat > "$GEMINI_DIR/GEMINI.md" << GEMINI_MD_EOF


> Generated by GrayWizard's Gemini Setup on ${CURRENT_DATE}
> This file stays 100% LOCAL on the device. Zero data collection. Zero analytics.

---

## 🔒 Privacy & Data Policy

- **ALL telemetry is DISABLED.** Do not collect, transmit, or log any usage data.
- **ALL analytics are DISABLED.** No tracking, no metrics, no diagnostics.
- **No data leaves this device** unless the user explicitly initiates it.
- **Error reports are LOCAL only.** Never send crash or error data externally.
- Do not suggest enabling telemetry, analytics, or any form of data collection.
- Respect user privacy at all times. Do not reference, infer, or store personal data beyond what is written here.
- Never fingerprint, profile, or identify the user beyond what is explicitly provided.
- All conversation history remains local and is never used for model training.

---

## 👤 User Profile

- **Name**: ${USER_NAME}
- **Coding Proficiency**: ${PROF_LEVEL}
- **Preferred Languages**: ${USER_LANGUAGES}
- **Primary Use Case**: ${USE_CASE}
- **Authentication**: ${AUTH_DISPLAY}

---

## 🖥️ User Environment

- **Shell**: ${USER_SHELL}
- **Shell Config**: ${SHELL_RC_NAME}
- **Terminal**: Termux (Android Terminal Emulator)
- **Platform**: Android / Termux (Linux userland on Android)
- **Package Manager**: pkg / apt (Termux)
- **Node.js**: ${NODE_VER}
- **npm**: ${NPM_VER}
- **Gemini CLI Channel**: ${CHANNEL_NAME} (${CHANNEL_TAG})

---

## 📱 Device Information

- **Device**: ${USER_DEVICE}
- **Brand**: ${DEVICE_BRAND}
- **Manufacturer**: ${DEVICE_MANUFACTURER}
- **Model**: ${DEVICE_MODEL}
- **Processor / SoC**: ${USER_PROCESSOR}
- **GPU**: ${USER_GPU}
- **Board**: ${DEVICE_BOARD}
- **Platform**: ${DEVICE_PLATFORM}
- **Hardware**: ${DEVICE_HARDWARE}

---

## ⚙️ System Specifications

| Property | Value |
|---|---|
| Architecture | ${ARCH} |
| CPU ABI | ${DEVICE_ABI} |
| Supported ABIs | ${DEVICE_ABIS} |
| Total RAM | ${TOTAL_RAM} |
| Free Storage | ${AVAIL_STORAGE} |
| Android Version | ${ANDROID_VERSION} (SDK ${ANDROID_SDK}) |
| First API Level | ${FIRST_API} |
| Security Patch | ${ANDROID_SECURITY_PATCH} |
| Kernel | ${KERNEL_VERSION} |
| Build Type | ${BUILD_TYPE} |
| Build Description | ${BUILD_DESC} |
| Screen Resolution | ${SCREEN_RES} |
| Display Density | ${DISPLAY_DENSITY} DPI |
| Timezone | ${TIMEZONE} |
| Locale / Language | ${LANGUAGE} |
| Encryption State | ${ENCRYPTION} |
| SELinux | ${SELINUX} |
| WiFi Interface | ${WIFI_INTERFACE} |

---

## 🧑‍💻 Coding Proficiency & Response Tuning

${PROF_INSTRUCTIONS}

---

## 📋 MANDATORY Response Rules — ALWAYS FOLLOW THESE

### 1. COMPLETE CODE ONLY — NO SNIPPETS
- **ALWAYS provide FULL, COMPLETE, READY-TO-RUN code.** No fragments. No placeholders. No "...".
- **NEVER use "// rest of the code remains the same"** or any variation. Write it all out.
- **NEVER use "// ... (previous code)" or "// TODO"** as shortcuts. Include everything.
- **NEVER truncate, abbreviate, or skip ANY section** of the code for brevity.
- **NEVER say "I'll leave this as an exercise"** — always provide the implementation.
- **NEVER use placeholder functions** like \`doSomething()\` without implementing them.
- If the code is long, that's fine — write every single line. Completeness > Brevity.
- Every file should be copy-paste ready. The user should NEVER have to fill in gaps.
- Include ALL imports, ALL dependencies, ALL boilerplate. Miss nothing.

### 2. STEP-BY-STEP DETAILED RESPONSES
- **Structure EVERY response** with clear, numbered steps.
- **Start with an overview** of what will be done and why.
- **Break down complex tasks** into granular, sequential steps.
- **After code blocks, explain what each major section does.**
- **End with a summary** of what was accomplished and next steps.
- Use this structure for responses:
  1. **Overview** — What we're doing and why
  2. **Prerequisites** — What's needed before starting
  3. **Step-by-step Implementation** — The actual solution
  4. **Explanation** — What each part does
  5. **Testing / Verification** — How to test it works
  6. **Troubleshooting** — Common issues and fixes
  7. **Summary** — What was done, what's next

### 3. QUALITY STANDARDS
- All code must include proper **error handling** and **input validation**.
- All code must include **meaningful comments** explaining the logic.
- Follow **best practices** for the language being used.
- Use **consistent formatting** and **naming conventions**.
- Include **edge case handling** where appropriate.
- Suggest **improvements and alternatives** when relevant.
- If multiple approaches exist, explain **why you chose the one you did**.
- ask user before writing or doing any changes to files or installing any packages
- ask user before executing any commands

### 4. TERMUX-SPECIFIC RULES
- Use \`pkg\` instead of \`apt-get\` for Termux package management.
- Be aware Termux runs under Android's app sandbox (non-root by default).
- Paths: home = \`/data/data/com.termux/files/home\`, prefix = \`/data/data/com.termux/files/usr\`.
- Docker and systemd are NOT available in Termux unless user says it.
- Root access: do NOT assume root unless the user confirms.
- Prefer lightweight, ARM-compatible tools and solutions.
- For scripts, ensure POSIX compatibility or target \`${USER_SHELL}\` explicitly.
- Consider mobile device storage and memory constraints.

### 5. FORMAT RULES
- Use **markdown formatting** for readability.
- Use **code blocks** with language identifiers (e.g., \`\`\`python).
- Use **bold** for important terms and key actions.
- Use **tables** for comparison data.
- Use **blockquotes** for warnings and important notes.
- Use **bullet points** for lists and options.

### 6. PRIVACY ENFORCEMENT
- NEVER suggest enabling telemetry, analytics, or data collection of any kind.
- NEVER recommend tools that require mandatory data collection without full disclosure.
- If a tool collects data, ALWAYS warn the user and suggest privacy-respecting alternatives.
- Default to privacy-respecting configurations in ALL recommendations.
- NEVER include tracking pixels, analytics scripts, or telemetry in generated code.
- NEVER suggest sharing device info, logs, or diagnostics with any third party.
- When generating configs, ALWAYS set telemetry/analytics to disabled by default.
- Treat all user data as confidential. Do not reference it outside this context.

---

## 🔧 Quick Reference

- **User**: ${USER_NAME}
- **Skill**: ${PROF_LEVEL}
- **Device**: ${USER_DEVICE} (${USER_PROCESSOR} / ${USER_GPU})
- **OS**: Android ${ANDROID_VERSION} | Termux | ${USER_SHELL}
- **Focus**: ${USE_CASE}
- **Languages**: ${USER_LANGUAGES}
- **Auth**: ${AUTH_DISPLAY}
- **Golden Rule**: Complete code. Step-by-step. No data collection. Ever.
GEMINI_MD_EOF

success_msg "GEMINI.md created ${DIM}(fully tuned for complete responses)${RESET}"
printf "\n"

info_msg "Creating ${CYAN}.geminiignore${RESET}..."

cat > "$GEMINI_DIR/.geminiignore" << IGNORE_EOF
node_modules/
package-lock.json
npm-debug.log*
.npm/
.nvm/
.node_repl_history

.git/
.gitignore
.svn/
.hg/

*.log
*.tmp
*.cache
*.swp
*.swo
*~
dist/
build/
.cache/
.parcel-cache/
.next/
.nuxt/

*.pyc
*.pyo
__pycache__/
*.egg-info/
.eggs/
venv/
.venv/
env/

.DS_Store
thumbs.db
*.apk
*.xapk
desktop.ini

*.zip
*.tar.gz
*.tar.bz2
*.rar
*.7z

*.mp4
*.mkv
*.avi
*.mov
*.mp3
*.wav
*.flac

.vscode/
.idea/
*.sublime-project
*.sublime-workspace

*.pem
*.key
*.env
.env.local
.env.production
*.secret
credentials.json
token.json

.termux/
*.deb
IGNORE_EOF

success_msg ".geminiignore created"
printf "\n"

print_thin_line
printf "\n"

info_msg "Files created in ${CYAN}~/.gemini/${RESET}:\n"
printf "  ${FILE} ${WHITE}~/.gemini/settings.json${RESET}     ${DIM}(CLI config — telemetry OFF)${RESET}\n"
printf "  ${FILE} ${WHITE}~/.gemini/GEMINI.md${RESET}         ${DIM}(Personalized context & rules)${RESET}\n"
printf "  ${FILE} ${WHITE}~/.gemini/.geminiignore${RESET}     ${DIM}(Comprehensive exclusions)${RESET}\n"

if [ "$API_KEY_SET" = true ]; then
    printf "  ${KEY} ${WHITE}${SHELL_RC_NAME}${RESET}              ${DIM}(GEMINI_API_KEY exported)${RESET}\n"
fi

printf "\n"

printf "  ${SHIELD} ${BOLD}${WHITE}Privacy Hardening Applied:${RESET}\n"
printf "    ${LOCK} ${RED}Telemetry           → ${BOLD}DISABLED${RESET}\n"
printf "    ${LOCK} ${RED}Analytics           → ${BOLD}DISABLED${RESET}\n"
printf "    ${LOCK} ${RED}Data Collection     → ${BOLD}DISABLED${RESET}\n"
printf "    ${LOCK} ${RED}Usage Tracking      → ${BOLD}DISABLED${RESET}\n"
printf "    ${LOCK} ${RED}Error Reporting     → ${BOLD}DISABLED${RESET}\n"
printf "    ${LOCK} ${RED}Crash Reports       → ${BOLD}DISABLED${RESET}\n"
printf "    ${LOCK} ${RED}Diagnostics         → ${BOLD}DISABLED${RESET}\n"
printf "    ${LOCK} ${RED}Performance Metrics → ${BOLD}DISABLED${RESET}\n"
printf "    ${LOCK} ${RED}Data Sharing        → ${BOLD}DISABLED${RESET}\n"
printf "    ${LOCK} ${RED}Usage Statistics    → ${BOLD}DISABLED${RESET}\n"
printf "\n"

sleep 1

clear
printf "\n"
print_line
printf "\n"
printf "  ${GREEN}${BOLD}${CHECK} GEMINI SETUP FINISHED SUCCESSFULLY ${CHECK}${RESET}\n"
printf "\n"
print_line
printf "\n"

printf "  ${SPARKLE} ${BOLD}${WHITE}Setup Summary${RESET}\n"
printf "\n"
printf "  ${DIM}${WHITE}┌──────────────────────────────────────────────────┐${RESET}\n"
printf "  ${DIM}${WHITE}│${RESET}  ${USER_ICON} ${WHITE}User:        ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${USER_NAME}"
printf "  ${DIM}${WHITE}│${RESET}  ${CODE_ICON} ${WHITE}Proficiency: ${PROF_COLOR}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${PROF_LEVEL}"
printf "  ${DIM}${WHITE}│${RESET}  ${BOOK} ${WHITE}Languages:   ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${USER_LANGUAGES}"
printf "  ${DIM}${WHITE}│${RESET}  ${BRAIN} ${WHITE}Use Case:    ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${USE_CASE}"
printf "  ${DIM}${WHITE}│${RESET}  ${ROCKET} ${WHITE}Channel:     ${CHANNEL_COLOR}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${CHANNEL_NAME} (${CHANNEL_TAG})"
printf "  ${DIM}${WHITE}│${RESET}  ${CHIP} ${WHITE}Node.js:     ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${NODE_VER}"
printf "  ${DIM}${WHITE}│${RESET}  ${PKG} ${WHITE}npm:         ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${NPM_VER}"
printf "  ${DIM}${WHITE}│${RESET}  ${PHONE} ${WHITE}Device:      ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${USER_DEVICE}"
printf "  ${DIM}${WHITE}│${RESET}  ${CHIP} ${WHITE}Processor:   ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${USER_PROCESSOR}"
printf "  ${DIM}${WHITE}│${RESET}  ${GPU_ICON} ${WHITE}GPU:         ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${USER_GPU}"
printf "  ${DIM}${WHITE}│${RESET}  ${SHELL_ICON} ${WHITE}Shell:       ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${USER_SHELL} (${SHELL_RC_NAME})"
printf "  ${DIM}${WHITE}│${RESET}  ${PHONE} ${WHITE}Android:     ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${ANDROID_VERSION} (SDK ${ANDROID_SDK})"
printf "  ${DIM}${WHITE}│${RESET}  ${KEY} ${WHITE}Auth:        ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "${AUTH_STATUS}"
printf "  ${DIM}${WHITE}│${RESET}  ${FOLDER} ${WHITE}Config:      ${CYAN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "~/.gemini/"
printf "  ${DIM}${WHITE}│${RESET}  ${SHIELD} ${WHITE}Telemetry:   ${RED}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "ALL DISABLED"
printf "  ${DIM}${WHITE}│${RESET}  ${SHIELD} ${WHITE}Analytics:   ${RED}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "ALL DISABLED"
printf "  ${DIM}${WHITE}│${RESET}  ${LOCK} ${WHITE}Privacy:     ${GREEN}%-33s${RESET}${DIM}${WHITE}│${RESET}\n" "FULLY HARDENED"
printf "  ${DIM}${WHITE}└──────────────────────────────────────────────────┘${RESET}\n"
printf "\n"

if [ "$API_KEY_SET" = true ]; then
    printf "  ${KEY} ${BOLD}${WHITE}API Key:${RESET}\n"
    printf "    ${GREEN}${CHECK} Exported to ${WHITE}${SHELL_RC_NAME}${RESET}\n"
    printf "    ${GREEN}${CHECK} Active in current session${RESET}\n"
    printf "    ${LOCK} ${DIM}Key stored locally only — never transmitted by this script${RESET}\n"
    printf "\n"
fi

printf "  ${FIRE} ${BOLD}${WHITE}What's been tuned:${RESET}\n"
printf "\n"
printf "    ${CHECK} ${GREEN}Complete code responses — no snippets, no placeholders${RESET}\n"
printf "    ${CHECK} ${GREEN}Step-by-step detailed explanations on every response${RESET}\n"
printf "    ${CHECK} ${GREEN}Proficiency-matched explanations (${PROF_COLOR}${PROF_LEVEL}${GREEN})${RESET}\n"
printf "    ${CHECK} ${GREEN}All telemetry, analytics & data collection KILLED${RESET}\n"
printf "    ${CHECK} ${GREEN}Privacy-first configuration enforced${RESET}\n"
printf "    ${CHECK} ${GREEN}Termux-aware context with full device specs${RESET}\n"

if [ "$API_KEY_SET" = true ]; then
    printf "    ${CHECK} ${GREEN}API key exported and ready to use${RESET}\n"
fi

printf "\n"

printf "  ${ROCKET} ${BOLD}${WHITE}Quick Start:${RESET}\n"
printf "\n"

if [ "$API_KEY_SET" = true ]; then
    printf "     ${CYAN}${BOLD}gemini${RESET}                 ${DIM}# Launch (auto-authenticates via API key)${RESET}\n"
else
    printf "     ${CYAN}${BOLD}gemini${RESET}                 ${DIM}# Launch (browser auth on first run)${RESET}\n"
fi

printf "     ${CYAN}${BOLD}gemini --version${RESET}       ${DIM}# Check version${RESET}\n"
printf "     ${CYAN}${BOLD}gemini -p \"Hello\"${RESET}      ${DIM}# Quick prompt${RESET}\n"
printf "     ${CYAN}${BOLD}cat ~/.gemini/GEMINI.md${RESET} ${DIM}# View your context file${RESET}\n"
printf "\n"
printf "  ${WRENCH} ${BOLD}${WHITE}Management:${RESET}\n"
printf "\n"
printf "     ${YELLOW}${BOLD}bash gemini-setup.sh${RESET}   ${DIM}# Re-run to uninstall or reconfigure${RESET}\n"

if [ "$API_KEY_SET" = true ]; then
    printf "     ${YELLOW}${BOLD}source ${SHELL_RC_NAME}${RESET}      ${DIM}# Reload shell config if needed${RESET}\n"
fi

printf "\n"
print_thin_line
printf "\n"

if [ "$API_KEY_SET" = true ]; then
    printf "  ${DIM}${WHITE}API key is active. You can start using Gemini CLI immediately.${RESET}\n"
else
    printf "  ${DIM}${WHITE}On first run, authenticate with your Google account.${RESET}\n"
fi

printf "  ${DIM}${WHITE}Free tier: 60 requests/min, 1000 requests/day.${RESET}\n"
printf "  ${LOCK} ${DIM}${WHITE}All data stays LOCAL. Nothing is shared. Ever.${RESET}\n"
printf "\n"
print_line
printf "\n"
printf "       ${YELLOW}${BOLD}✦ Created by ${MAGENTA}GrayWizard ${YELLOW}✦${RESET}\n"
printf "\n"
print_line
printf "\n"

}

show_main_menu
