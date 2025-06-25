#!/usr/bin/env python3

import os
import re
from pathlib import Path
from datetime import datetime

def extract_table_metadata(content):
    """Extract metadata from table format."""
    table_match = re.search(
        r'\|\s*Category\s*\|\s*Author\s*\|\s*Tags\s*\|\s*Points\s*\|\s*Solves\s*\|\s*\n'
        r'\|\s*:---.*?\n'
        r'\|\s*([^|]+)\s*\|\s*([^|]+)\s*\|\s*([^|]+)\s*\|\s*([^|]+)\s*\|\s*([^|]+)\s*\|',
        content
    )
    
    if table_match:
        return {
            'category': table_match.group(1).strip(),
            'author': table_match.group(2).strip(),
            'tags': [tag.strip() for tag in table_match.group(3).strip().split() if tag.strip()],
            'points': int(table_match.group(4).strip()) if table_match.group(4).strip().isdigit() else 0,
            'solves': int(table_match.group(5).strip()) if table_match.group(5).strip().isdigit() else 0
        }
    return {}

def normalize_category(category_name):
    """Normalize category names."""
    category_lower = category_name.lower().replace('_', ' ').replace('-', ' ')
    if 'web' in category_lower:
        return 'web'
    elif 'crypto' in category_lower:
        return 'crypto'
    elif 'forensic' in category_lower:
        return 'forensics'
    elif 'binary' in category_lower or 'pwn' in category_lower:
        return 'pwn'
    elif 'osint' in category_lower or 'intelligence' in category_lower or 'open source' in category_lower:
        return 'osint'
    elif 'reverse' in category_lower:
        return 'rev'
    elif 'misc' in category_lower:
        return 'misc'
    else:
        return 'misc'

def determine_difficulty(tags, points):
    """Determine difficulty based on tags and points."""
    if tags:
        tags_lower = [tag.lower() for tag in tags]
        if any('easy' in tag or 'baby' in tag for tag in tags_lower):
            return 'Easy'
        elif any('hard' in tag or 'insane' in tag for tag in tags_lower):
            return 'Hard'
    
    if points < 100:
        return 'Easy'
    elif points > 300:
        return 'Hard'
    else:
        return 'Medium'

def get_ctf_name_from_path(filepath):
    """Extract CTF name from file path."""
    parts = Path(filepath).parts
    if len(parts) > 1:
        ctf_name = parts[0]  # Changed from parts[1] to parts[0] - first part after . is the CTF name
        # Clean up CTF name
        if ctf_name == 'IrisCTF':
            return 'IrisCTF 2025'
        elif ctf_name == 'HeroCTF_v6':
            return 'HeroCTF v6'
        elif ctf_name == 'HTBUniversity2024':
            return 'HTB University CTF 2024'
        elif ctf_name == 'CyberApocalypse2025':
            return 'HTB Cyber Apocalypse CTF 2025'
        elif ctf_name == '404CTF_2025':
            return '404CTF 2025'
        elif ctf_name == 'CTF_HackHer':
            return 'HackHer CTF'
        else:
            return ctf_name
    return 'Unknown CTF'

def extract_title_from_content(content):
    """Extract title from markdown content."""
    title_match = re.search(r'^#\s+(.+)$', content, re.MULTILINE)
    if title_match:
        return title_match.group(1).strip()
    return None

def add_yaml_frontmatter(filepath):
    """Add YAML frontmatter to a writeup file."""
    print(f"Processing: {filepath}")
    
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Remove existing frontmatter if present
        if content.startswith('---\n'):
            # Find the end of frontmatter
            end_match = re.search(r'\n---\n', content[4:])
            if end_match:
                content = content[4 + end_match.end():]
                print(f"  🔄 Removing existing frontmatter")
        
        # Extract metadata from table
        table_metadata = extract_table_metadata(content)
        
        # Extract title
        title = extract_title_from_content(content)
        if not title:
            # Use filename as fallback
            title = Path(filepath).parent.name.replace('-', ' ').replace('_', ' ')
        
        # Get CTF name
        ctf_name = get_ctf_name_from_path(filepath)
        
        # Determine category from path
        path_parts = Path(filepath).parts
        category_from_path = 'misc'
        if len(path_parts) >= 3:
            category_from_path = normalize_category(path_parts[1])  # This should be the category directory
        
        # Use table metadata if available, otherwise use path-based info
        category = normalize_category(table_metadata.get('category', category_from_path))
        author = table_metadata.get('author', 'Tham Le')
        tags = table_metadata.get('tags', [category])
        points = table_metadata.get('points', 100)
        difficulty = determine_difficulty(tags, points)
        
        # Create YAML frontmatter
        frontmatter = f"""---
title: "{title}"
date: "2025-01-12"
ctf: "{ctf_name}"
category: "{category}"
difficulty: "{difficulty}"
points: {points}
tags: {tags}
author: "{author}"
solved: true
---

"""
        
        # Add frontmatter to content
        new_content = frontmatter + content
        
        # Write back to file
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        print(f"  ✅ Added frontmatter: {title} ({category}, {difficulty}, {points}pts)")
        
    except Exception as e:
        print(f"  ❌ Error processing {filepath}: {e}")

def main():
    """Main function to process all writeup files."""
    print("🔄 Adding YAML frontmatter to CTF writeups...")
    
    # Find all writeup files
    writeup_files = []
    for root, dirs, files in os.walk('.'):
        for file in files:
            if file in ['writeup.md', 'wu.md']:
                writeup_files.append(os.path.join(root, file))
    
    print(f"Found {len(writeup_files)} writeup files")
    
    # Process each file
    for filepath in sorted(writeup_files):
        add_yaml_frontmatter(filepath)
    
    print(f"\n✅ Processed {len(writeup_files)} writeup files")

if __name__ == '__main__':
    main() 