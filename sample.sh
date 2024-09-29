#! /usr/bin/env zsh

# Will choose zsh (default on mac) but falls 
# back to default shell if that is not found 
# (usually bash)
# Mac bash is old, that's why I chose zsh as 
# default interpreter for this script

############################################################################
# https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20
###########################################################################

screen_height=$(stty size | cut -d ' ' -f 1)
screen_width=$(stty size | cut -d ' ' -f 2)

pink="\033[38;2;242;170;242m"
green="\033[38;2;0;255;0m"  
brown="\033[38;2;139;69;19m"
nc="\033[0m"

# Automatically centers too
print_arman() {
  local ascii_art="$1"
  local num_lines=$(echo "$ascii_art" | wc -l)
  local line_num=1
  # Get the length of first line and determine padding of whole ASCII text from there
  # so that no matter the terminal size, it will always be printed in center
  local first_line=$(head -n 1 <<< "$ascii_art") 
  local padding=$(( (screen_width - ${#first_line}) / 2 ))

  while IFS= read -r line; do
    # Calculate color based on line number (red decreases, green increases)
    # local red=$((255 - (255 * line_num / num_lines)))
    local red=255
    local green=$((255 * line_num / num_lines))
    local blue=0

    # Print the line with the calculated color
    # local padding=$(( screen_width / 2 ))
    printf "%*s" "$padding" # Sets the width to be screen width, and automatically centers !? 
    printf "\033[38;2;${red};${green};${blue}m$line \033[0m\n"
    ((line_num++))
  done <<< "$ascii_art"
}


# ------------------- FLOWERS -----------------------

# Function to print the flower with color codes
print_flower() {
  local ascii_art="$1"
  local num_lines=$(echo "$ascii_art" | wc -l)
  local line_num=1
  while IFS= read -r line; do
    if [[ $line_num -eq 3 ]]; then
      local is_pink=true
      for ((i = 0; i < ${#line}; )); do
        if [[ $is_pink == true ]]; then
          two_chars=${line:$i:2}
          printf "$pink$two_chars$nc"
          (( i=i+2 ))
          is_pink=false
        else
          three_chars=${line:$i:3}
          printf "$brown$three_chars$nc"
          (( i=i+3 ))
          is_pink=true
        fi
      done
      printf "\n"  # Add newline after processing line 3
    else
      printf "$pink$line $nc\n"
    fi
    ((line_num++))
  done <<< "$ascii_art"
}

# --------------- Functions called here ---------------
# Define your ASCII art here (remove leading spaces)
ascii_art=$(cat << 'END_ASCII'
 _,-._     _,-._     _,-._     _,-._     _,-._     _,-._     _,-._
/ \_/ \   / \_/ \   / \_/ \   / \_/ \   / \_/ \   / \_/ \   / \_/ \
>-(_)-<   >-(_)-<   >-(_)-<   >-(_)-<   >-(_)-<   >-(_)-<   >-(_)-<      
\_/ \_/   \_/ \_/   \_/ \_/   \_/ \_/   \_/ \_/   \_/ \_/   \_/ \_/
  `-'       `-'       `-'       `-'       `-'       `-'       `-'
END_ASCII
)

ascii_art_arman=$(cat << 'END_ASCII'
          (       *                )           (                           (     
   (      )\ )  (  `     (      ( /(   (       )\ )      (  (       (      )\ )  
   )\    (()/(  )\))(    )\     )\())  )\ )   (()/( (    )\))(   '  )\    (()/(  
((((_)(   /(_))((_)()\((((_)(  ((_)\  (()/(    /(_)))\  ((_)()\ )((((_)(   /(_)) 
 )\ _ )\ (_))  (_()((_))\ _ )\  _((_)  /(_))_ (_)) ((_) _(())\_)())\ _ )\ (_))   
 (_)_\(_)| _ \ |  \/  |(_)_\(_)| \| | (_)) __|| _ \| __|\ \((_)/ /(_)_\(_)| |    
  / _ \  |   / | |\/| | / _ \  | .` |   | (_ ||   /| _|  \ \/\/ /  / _ \  | |__  
 /_/ \_\ |_|_\ |_|  |_|/_/ \_\ |_|\_|    \___||_|_\|___|  \_/\_/  /_/ \_\ |____|
END_ASCII
)


#-------------------- Ghost arman ------------------
ascii_art_arman2=$(cat << 'END_ASCII'
   ('-.     _  .-')  _   .-')      ('-.         .-') _                   _  .-')     ('-.    (`\ .-') /`  ('-.               
  ( OO ).-.( \( -O )( '.( OO )_   ( OO ).-.    ( OO ) )                 ( \( -O )  _(  OO)    `.( OO ),' ( OO ).-.           
  / . --. / ,------. ,--.   ,--.) / . --. /,--./ ,--,'         ,----.    ,------. (,------.,--./  .--.   / . --. / ,--.      
  | \-.  \  |   /`. '|   `.'   |  | \-.  \ |   \ |  |\        '  .-./-') |   /`. ' |  .---'|      |  |   | \-.  \  |  |.-')  
.-'-'  |  | |  /  | ||         |.-'-'  |  ||    \|  | )       |  |_( O- )|  /  | | |  |    |  |   |  |,.-'-'  |  | |  | OO ) 
 \| |_.'  | |  |_.' ||  |'.'|  | \| |_.'  ||  .     |/        |  | .--, \|  |_.' |(|  '--. |  |.'.|  |_)\| |_.'  | |  |`-' | 
  |  .-.  | |  .  '.'|  |   |  |  |  .-.  ||  |\    |        (|  | '. (_/|  .  '.' |  .--' |         |   |  .-.  |(|  '---.' 
  |  | |  | |  |\  \ |  |   |  |  |  | |  ||  | \   |         |  '--'  | |  |\  \  |  `---.|   ,'.   |   |  | |  | |      |  
  `--' `--' `--' '--'`--'   `--'  `--' `--'`--'  `--'          `------'  `--' '--' `------''--'   '--'   `--' `--' `------'  
END_ASCII
)

print_arman2() {
  local ascii_art="$1"
  local num_lines=$(echo "$ascii_art" | wc -l)
  local line_num=1
  while IFS= read -r line; do
    # set -xe
    if [[ $line_num < 3 ]]; then 
        printf "$white$line $nc"
    elif [[ $line_num == 3 ]]; then
      for ((i = 0; i < ${#line}; i++ )); do
        char=${line:$i:1}  # Extract the current character
        if [[ "$char" == "/" || "$char" == "(" || "$char" == ")" ]]; then
          printf "$white$char"; printf "$nc"
        else printf "$green$char"; printf "$nc"; fi
      done
      printf "\n"  
    elif [[ $line_num == 5 ]]; then
      for ((i = 0; i < ${#line}; i++ )); do
        char=${line:$i:1}  # Extract the current character
        if [[ "$char" == "-" || "$char" == ")" || "$char" == "(" || "$char" == "O" || "$char" == "_" ]]; then
          printf "$white$char"; printf "$nc"
        else printf "$green$char"; printf "$nc"; fi
      done
      printf "\n" 
    elif [[ $line_num > 2 && $line_num < 8 && $line_num != 5 ]]; then
      for ((i = 0; i < ${#line}; i++ )); do
        char=${line:$i:1}  # Extract the current character
        if [[ "$char" == "\\" || "$char" == "/" || "$char" == "(" || "$char" == ")" ]]; then
          printf "$white$char"; printf "$nc"
        else printf "$green$char"; printf "$nc"; fi
      done
      printf "\n" 
    else 
      printf "$green$line $nc"
    fi
    ((line_num++))
  done <<< "$ascii_art"
}                                                                                                                                     

# Call the function to print the flower
#print_arman2 "$ascii_art_arman2"
#print_flower "$ascii_art"
printf "-%.0s" {1..$screen_width}; echo 
#yes ' ' | head -n5 # print empty space for 5 times
print_arman "$ascii_art_arman"
printf "-%.0s" {1..$screen_width}; echo
#print_flower "$ascii_art"

