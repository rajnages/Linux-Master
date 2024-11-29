#!/bin/bash

# ====================================================================
# Script Name: user_management.sh
# Description: Create a user and group, set a temporary password,
#              and enforce password change at first login.
# Author: Rajavarapu Nageswarao
# Date: 2024-11-28
# ====================================================================

# Function to create a user and group, and set a temporary password
create_user_and_group() {
    local username="$1"
    local groupname="$2"
    local temp_password="$3"

    echo "Processing user and group setup..."

    # Check and create group if not exists
    if ! grep -q "^$groupname:" /etc/group; then
        if sudo groupadd "$groupname"; then
            echo "Group '$groupname' created successfully."
        else
            echo "Error: Failed to create group '$groupname'."
            exit 1
        fi
    else
        echo "Group '$groupname' already exists."
    fi

    # Check and create user if not exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
    else
        if sudo useradd -m -g "$groupname" -s /bin/bash "$username"; then
            echo "User '$username' created and added to group '$groupname'."
        else
            echo "Error: Failed to create user '$username'."
            exit 1
        fi

        # Set temporary password
        if echo "$username:$temp_password" | sudo chpasswd; then
            echo "Temporary password set for user '$username'."
        else
            echo "Error: Failed to set password for user '$username'."
            exit 1
        fi

        # Enforce password change on first login
        if sudo chage -d 0 "$username"; then
            echo "User '$username' must change their password upon first login."
        else
            echo "Error: Failed to enforce password change for user '$username'."
            exit 1
        fi
    fi
}

# Main Script Execution
read -p "Enter username: " username
read -p "Enter group name: " groupname
read -s -p "Enter temporary password: " temp_password
echo

if [[ -z "$username" || -z "$groupname" || -z "$temp_password" ]]; then
    echo "Error: All fields (username, group name, password) are required."
    exit 1
fi

create_user_and_group "$username" "$groupname" "$temp_password"

echo "Script execution completed successfully."
