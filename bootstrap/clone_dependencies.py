import os
import json
import subprocess

def clone_dependency(name, url, external_dir):
    path = os.path.join(external_dir, name)
    if os.path.exists(path):
        print(f"Dependency '{name}' already cloned, skipping.")
    else:
        print(f"Cloning '{name}' from {url}...")
        subprocess.run(["git", "clone", url, path], check=True)

def main():
    external_dir = os.path.join(os.getcwd(), 'external')
    os.makedirs(external_dir, exist_ok=True)

    with open('bootstrap/dependencies.json', 'r') as f:
        data = json.load(f)
        dependencies = data['dependencies']
        
        for dependency in dependencies:
            clone_dependency(dependency['name'], dependency['url'], external_dir)

if __name__ == "__main__":
    main()
