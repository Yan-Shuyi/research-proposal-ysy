# 华东理工大学硕士开题报告LaTeX模板（自制）

## 📖 概述

一个用于华东理工大学硕士开题报告的 LaTeX 模板，由学生社区自主开发，仅作为个人 LaTex 项目以供交流。

## 🏗️ 文件结构

```
论文项目/
├── main.tex              # 主文档（必需）
├── ecustproposal.cls      # 文档类配置（必需）
├── references.bib        # 参考文献数据库（必需）
├── sections/             # 章节文件（推荐）
│   ├── abstract.tex      # 中文摘要
│   ├── introduction.tex  # 引言
│   ├── background.tex    # 研究背景
│   └── ...
├── figures/              # 图片文件夹（推荐）
│   └── ECUST.jpg         # jpg格式
├── build.bat             # 一键构建脚本（可选）
├── build_fast.bat        # 快速构建脚本（可选）
├── clean.bat             # 清理脚本（可选）
└── compile.bat           # 编译脚本（可选）
```

## ⚙️ 环境配置

### 必需软件安装
1. **TeX Live** - [LaTeX 发行版](https://www.tug.org/texlive/)或[国内清华镜像](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/)
2. **TeXstudio** - [LaTeX 编辑器](https://www.texstudio.org/)或[国内清华镜像](https://mirrors.tuna.tsinghua.edu.cn/github-release/texstudio-org/texstudio/LatestRelease/)

### 推荐编辑器设置
- **编译器**：XeLaTeX（支持中文）
- **参考文献工具**：Biber
- **编码**：UTF-8

### 核心概念理解
- **文档类 (.cls)** → 定义整体样式和格式
- **主文件 (.tex)** → 组织内容结构 
- **文献 (.bib)** → 管理参考文献
- **宏包** → 扩展功能（如数学公式、图表等）
- **编译** → 将源代码转换为PDF

## 📥 获取模板

### 方式一：GitHub 仓库下载
**推荐方式**：从 GitHub 仓库获取最新版本的模板文件：

1. 访问项目仓库：https://github.com/Yan-Shuyi/research-proposal-ysy
2. 点击 "Code" → "Download ZIP" 下载完整项目包
3. 解压后即可获得 `ecustproposal.cls` 和所有示例文件

### 方式二：Git 克隆（开发者推荐）
```bash
# 使用 Git 克隆完整项目
git clone https://github.com/Yan-Shuyi/research-proposal-ysy.git
cd research-proposal-ysy
```

### 方式三：仅下载核心文件
如果您只需要核心模板文件：
1. 进入 `src/` 目录下载 `ecustproposal.cls`
2. 查看 `examples/` 目录获取使用示例
3. 参考 `figures/` 目录中的示例图片

## 📝 基础编译流程

### 手动编译（推荐初学者掌握）
```bash
# 第一步：生成基础文件
xelatex main.tex

# 第二步：处理参考文献
biber main

# 第三步：处理交叉引用
xelatex main.tex

# 第四步：最终编译确保正确
xelatex main.tex
```

### 批处理文件（可选便捷方式）
项目提供了几个批处理文件**作为可选工具**，方便快速操作：

| 文件 | 功能 | 使用场景 |
|------|------|----------|
| `compile.bat` | 智能编译 | 支持完整/快速编译模式 |
| `clean.bat` | 清理临时文件 | 解决编译问题或提交前清理 |
| `build.bat` | 一键构建 | 生成最终发布版本 |
| `build_fast.bat` | 快速构建 | 日常开发测试 |

**注意**：这些批处理文件是**完全可选的**，您也可以直接使用编辑器或手动命令完成所有操作。

## 🌟 学习建议

### 推荐学习路径
1. **基础阶段**：掌握文档结构、基本命令、数学公式
2. **进阶阶段**：学习参考文献管理、图表排版、自定义命令
3. **高级阶段**：了解模板定制、宏包开发、自动化脚本

### 常见问题解决
- **中文支持**：确保使用 XeLaTeX 编译器
- **参考文献**：使用 Biber + Biblatex 组合
- **编译错误**：从第一个错误开始解决，逐条处理
- **格式问题**：模板可用，避免随意修改样式

## 📚 资源推荐

### 学习资源
- https://www.overleaf.com/learn
- https://www.tug.org/texlive/
- https://www.latexstudio.net/LearnLaTeX/

### 社区支持
- https://tex.stackexchange.com/
- http://www.ctex.org/
- https://www.latexstudio.net/

## 🔧 关于批处理文件的说明

项目提供的批处理文件（`.bat`）是**完全可选的辅助工具**，主要目的是：

1. **简化操作**：一键执行常见任务
2. **提高效率**：减少重复命令输入
3. **标准化流程**：确保编译顺序正确

**但请注意**：
- 这些脚本不是使用 LaTeX 的必需品
- 您完全可以手动执行所有操作
- 脚本可能需要根据您的系统环境进行调整
- 如果遇到问题，直接使用手动命令通常更容易排查

## 💖 致谢

感谢华东理工大学的格式要求和 LaTeX 社区的支持。

---

**作者**：言书懿  
**联系方式**：2644253780@qq.com  
**许可证**：MIT License  
**更新日期**：2025年10月

> 💡 提示：本模板将持续更新，欢迎反馈和建议！

*祝您 LaTeX 之旅愉快！*