#!/run/current-system/sw/bin/bash

# Set the path to the user-dirs.dirs file
user_dirs_file="$HOME/.config/user-dirs.dirs"
# Set the parent directory name
parent_directory="SynologyDrive"

# Check if the parent directory exists
if [ ! -d "$HOME/$parent_directory" ]; then
    echo "Parent directory '$parent_directory' does not exist."
    exit 1
fi

# Check if the user-dirs.dirs file exists
if [ ! -f "$user_dirs_file" ]; then
    echo "user-dirs.dirs file not found."
    exit 1
fi

echo "Updating XDG directories..."

# Define the XDG subdirectories to update
declare -A xdg_subdirs=(
    ["XDG_DOCUMENTS_DIR"]="Documents"
    ["XDG_DESKTOP_DIR"]="Desktop"
    ["XDG_TEMPLATES_DIR"]="Templates"
    ["XDG_MUSIC_DIR"]="Music"
    ["XDG_PICTURES_DIR"]="Pictures"
    ["XDG_VIDEOS_DIR"]="Videos"
)

# Read the lines and update in memory
updated_lines=()
while IFS= read -r line; do
    for xdg_dir in "${!xdg_subdirs[@]}"; do
        if [[ "$line" == "$xdg_dir="* ]]; then
            xdg_fullpath="\$HOME/$parent_directory/${xdg_subdirs[$xdg_dir]}"
            if [ -d "$HOME/$parent_directory/${xdg_subdirs[$xdg_dir]}" ]; then
                line="$xdg_dir=\"$xdg_fullpath\""
                echo "Updated $xdg_dir to: $xdg_fullpath"
            else
                echo "XDG directory '$HOME/$parent_directory/${xdg_subdirs[$xdg_dir]}' does not exist. Skipping update."
            fi
            break
        fi
    done
    updated_lines+=("$line")
done < "$user_dirs_file"

# Write the updated lines back to the file
printf "%s\n" "${updated_lines[@]}" > "$user_dirs_file"

echo "XDG directories updated successfully."

echo "Removing subdirectories from the home folder..."

for xdg_subdir in "${xdg_subdirs[@]}"; do
    full_subdir="$HOME/$xdg_subdir"
    if [ -d "$full_subdir" ]; then
        rm -r "$full_subdir"
        echo "Removed: $full_subdir"
    fi
done

echo "Subdirectories removed successfully."

echo "Creating symlinks to the parent directory..."

for xdg_subdir in "${xdg_subdirs[@]}"; do
    parent_subdir="$HOME/$parent_directory/$xdg_subdir"
    home_subdir="$HOME/$xdg_subdir"
    if [ -d "$parent_subdir" ]; then
        ln -s "$parent_subdir" "$home_subdir"
        echo "Created symlink: $home_subdir"
    else
        echo "Parent directory '$parent_subdir' does not exist. Skipping symlink creation."
    fi
done

echo "Symlinks created successfully."

