#!/bin/bash

# Print a starting message
echo "Starting Git operations..."

# Stage all changes
echo "Running: git add ."
git add .
if [ $? -eq 0 ]; then
    echo "All changes staged successfully."
else
    echo "Failed to stage changes."
    exit 1
fi

# Commit the changes with a message
echo "Running: git commit -m 'notes added'"
git commit -m "notes added"
if [ $? -eq 0 ]; then
    echo "Changes committed successfully."
else
    echo "No changes to commit or commit failed."
    exit 1
fi

# Push the changes to the repository
echo "Running: git push"
git push
if [ $? -eq 0 ]; then
    echo "Changes pushed successfully."
else
    echo "Failed to push changes."
    exit 1
fi

# Print a success message
echo "Git operations completed successfully!"

