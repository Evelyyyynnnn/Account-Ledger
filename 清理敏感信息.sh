#!/bin/bash

# 清理 Git 历史中的敏感信息脚本
# 使用方法：bash 清理敏感信息.sh

echo "🔍 检查 Git 历史中的敏感信息..."

# 检查是否包含 .env 文件的历史
if git log --all --full-history --source -- "backend/.env" | grep -q "commit"; then
    echo "⚠️  发现 backend/.env 在 Git 历史中"
    echo "开始清理..."
    
    # 方法1：使用 filter-branch 从历史中移除 .env 文件
    echo "使用 git filter-branch 清理历史..."
    git filter-branch --force --index-filter \
        "git rm --cached --ignore-unmatch backend/.env" \
        --prune-empty --tag-name-filter cat -- --all
    
    echo "✅ 清理完成！"
else
    echo "✅ 没有发现 .env 文件在 Git 历史中"
fi

# 清理引用
echo "清理 Git 引用..."
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d

# 清理和压缩
echo "压缩仓库..."
git reflog expire --expire=now --all
git gc --prune=now --aggressive

echo "🎉 完成！现在可以安全地推送了"

