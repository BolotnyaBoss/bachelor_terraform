```python
# Python built-in library for interacting with file system
import os

# Function to update a file
def update_file(file_path, old_content, new_content):
    # Read the file
    with open(file_path, 'r') as file:
        data = file.read()
    # Replace old content with new content
    data = data.replace(old_content, new_content)
    # Write the updated data to file
    with open(file_path, 'w') as file:
        file.write(data)
    print('File Updated Successfully')

# Function to create a new file
def create_file(file_path, content):
    # Create a new file and write the content
    with open(file_path, 'w') as file:
        file.write(content)
    print('File Created Successfully')

# Function to delete a file
def delete_file(file_path):
    # Delete the file
    os.remove(file_path)
    print('File Deleted Successfully')

# Actions
actions = [
    {"action": "Update File", "file_path": "/path/to/file/test.txt", "old_content": "old contents", "new_content": "new contents"},
    {"action": "Create File", "file_path": "/path/to/file/test.txt", "content": "new contents"},
    {"action": "Delete File", "file_path": "/path/to/file/test.txt"}
]

for action in actions:
    if action['action'] == 'Update File':
        update_file(action['file_path'], action['old_content'], action['new_content'])
    elif action['action'] == 'Create File':
        create_file(action['file_path'], action['content'])
    elif action['action'] == 'Delete File':
        delete_file(action['file_path'])
```