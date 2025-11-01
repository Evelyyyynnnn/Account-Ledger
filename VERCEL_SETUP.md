# 🔐 Vercel 环境变量配置指南

## 📋 需要配置的环境变量

在 Vercel Dashboard 中需要添加以下环境变量：

### 必需的变量：

1. **NOTION_API_KEY**
   - 获取方式：https://www.notion.so/my-integrations
   - 格式：`secret_...` 或 `ntn_...`

2. **NOTION_DATABASE_ID**
   - 从 Notion 数据库 URL 中提取（32位字符）
   - 格式：`XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`

3. **OPENAI_API_KEY**
   - 获取方式：https://platform.openai.com/api-keys
   - 格式：`sk-...`

4. **NODE_ENV** (可选，但推荐)
   - 值：`production`

5. **PORT** (可选，Vercel 会自动分配)
   - 值：留空或设置 `3000`

---

## 🚀 在 Vercel 中添加环境变量的步骤

### 方法一：通过 Vercel Dashboard（推荐）

1. **登录 Vercel**
   - 访问 [vercel.com](https://vercel.com)
   - 使用 GitHub 账号登录

2. **选择项目**
   - 在 Dashboard 中找到你的项目
   - 点击项目名称进入项目页面

3. **进入设置**
   - 点击顶部的 **"Settings"** 选项卡
   - 在左侧菜单选择 **"Environment Variables"**

4. **添加变量**
   点击 **"Add New"** 按钮，然后：

   **添加 NOTION_API_KEY：**
   - Key: `NOTION_API_KEY`
   - Value: 你的 Notion API Key（从 https://www.notion.so/my-integrations 获取）
   - Environment: 选择 `Production`, `Preview`, `Development`（或根据需要选择）
   - 点击 **"Save"**

   **添加 NOTION_DATABASE_ID：**
   - Key: `NOTION_DATABASE_ID`
   - Value: 你的 Notion 数据库 ID（32位字符）
   - Environment: 选择 `Production`, `Preview`, `Development`
   - 点击 **"Save"**

   **添加 OPENAI_API_KEY：**
   - Key: `OPENAI_API_KEY`
   - Value: 你的 OpenAI API Key（从 https://platform.openai.com/api-keys 获取）
   - Environment: 选择 `Production`, `Preview`, `Development`
   - 点击 **"Save"**

   **添加 NODE_ENV（可选）：**
   - Key: `NODE_ENV`
   - Value: `production`
   - Environment: 选择 `Production`, `Preview`
   - 点击 **"Save"**

5. **重新部署**
   - 添加完所有环境变量后
   - 在项目页面点击 **"Deployments"** 选项卡
   - 找到最新的部署记录，点击右侧的 **"..."** 菜单
   - 选择 **"Redeploy"**
   - 或直接点击顶部的 **"Redeploy"** 按钮

### 方法二：通过 Vercel CLI

```bash
# 安装 Vercel CLI（如果还没有）
npm i -g vercel

# 登录
vercel login

# 添加环境变量
vercel env add NOTION_API_KEY production
# 然后粘贴你的 Notion API Key

vercel env add NOTION_DATABASE_ID production
# 然后粘贴你的数据库 ID

vercel env add OPENAI_API_KEY production
# 然后粘贴你的 OpenAI API Key

# 重新部署
vercel --prod
```

---

## ✅ 验证环境变量

1. **检查环境变量**
   - 在 Vercel Dashboard → Settings → Environment Variables
   - 确认所有变量都已添加

2. **检查 API 是否工作**
   - 访问 `https://你的域名.vercel.app/api/health`
   - 应该返回 `{"status":"ok"}`

3. **检查应用功能**
   - 访问你的网站
   - 尝试加载数据
   - 如果出现错误，检查浏览器控制台和 Vercel 部署日志

---

## 🔒 安全提示

- ✅ **不要在代码中硬编码 API Key**
- ✅ **不要提交 `.env` 文件到 GitHub**
- ✅ **使用 Vercel 的环境变量管理敏感信息**
- ✅ **定期轮换 API Key（如果泄露）**
- ✅ **使用不同的 Key 用于开发和生产环境**

---

## 🐛 常见问题

### Q: 环境变量添加后还是不生效？

A: 确保：
1. 变量名称拼写正确（大小写敏感）
2. 已经重新部署项目
3. 选择的环境（Production/Preview/Development）正确

### Q: 如何更新环境变量？

A: 在 Vercel Dashboard → Settings → Environment Variables 中：
1. 找到要更新的变量
2. 点击右侧的 **"Edit"** 或删除后重新添加
3. 重新部署项目

### Q: 如何删除环境变量？

A: 在环境变量列表中，点击变量右侧的 **"..."** 菜单，选择 **"Delete"**

---

## 📝 环境变量清单

部署前确认以下变量已添加：

- [ ] `NOTION_API_KEY`
- [ ] `NOTION_DATABASE_ID`
- [ ] `OPENAI_API_KEY`
- [ ] `NODE_ENV` (推荐)
- [ ] `PORT` (可选)

完成所有检查后，你的应用就可以正常运行了！🎉

