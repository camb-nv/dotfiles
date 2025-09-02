#!/usr/bin/env zsh

# Function to abbreviate path like Fish
fish_style_pwd() {
  local pwd_path="$PWD"
  local home_path="$HOME"
  
  # Replace home with ~
  pwd_path="${pwd_path/#$home_path/~}"
  
  # Handle root directory
  if [[ "$pwd_path" == "/" ]]; then
    echo "/"
    return
  fi
  
  # Split the path into an array (remove empty elements)
  local -a path_parts
  path_parts=("${(@s:/:)pwd_path}")
  path_parts=("${(@)path_parts:#}")  # Remove empty elements
  
  local result=""
  local num_parts=${#path_parts}
  
  # Handle absolute paths (start with /)
  [[ "$PWD" == /* && "$pwd_path" == /* ]] && result="/"
  
  for i in {1..$num_parts}; do
    if [[ $i -eq $num_parts ]]; then
      # Last element - show full name
      result+="${path_parts[$i]}"
    elif [[ "${path_parts[$i]}" == "~" ]]; then
      # Home directory
      result+="~"
      [[ $i -lt $num_parts ]] && result+="/"
    else
      # Abbreviate to first letter
      result+="${path_parts[$i]:0:1}"
      [[ $i -lt $num_parts ]] && result+="/"
    fi
  done
  
  echo "$result"
}

# Set up the prompt
setopt prompt_subst

