# AlgorithmTextsEdit

算法手册的 Markdown 化、题解板子沉淀与 Word 重新排版项目。

完整方案见：[算法手册重构计划.md](算法手册重构计划.md)

## 当前状态

- **P0 基线**：进行中（目录、环境、原件归档、便携版 pandoc）。
- P1 Word → Markdown：待开始。
- P2 题解 → 候选板子：待开始。
- P3 筛选 / 合并：待开始。
- P4 Word 排版：待开始。

## 目录

```text
sources/    只读原件（docx、pdf、基线哈希）
docs/       正式版 Markdown，唯一真源
staging/    候选板子（inbox / snippets / appendix）
tools/      转换、抽取、合并、构建脚本
assets/     reference.docx、tags.yml、样式规格
build/      生成的 docx / pdf（git 忽略）
reports/    转换、审计、合并、QA 报告
```

## 环境

项目工具链尽量保持项目内，不修改系统环境。

### 便携版 pandoc

安装在：

```text
tools/bin/pandoc/pandoc.exe
```

重新安装或更新：

```powershell
powershell -ExecutionPolicy Bypass -File tools/install_pandoc.ps1 -Force
```

在 PowerShell 中临时启用项目工具链（只影响当前窗口）：

```powershell
. .\tools\env.ps1
```

也可以直接使用包装脚本：

```powershell
.\tools\pandoc.cmd --version
```

### Python 虚拟环境

```powershell
python -m venv .venv
.\.venv\Scripts\python -m pip install -r requirements.txt
```

`pdfplumber` 只在 P5 做 PDF 附录时用到，单独放在 `requirements-pdf.txt`，需要时再装。

### 环境检查

```powershell
.\.venv\Scripts\python tools\verify_env.py
```

## 约定

- `sources/` 下的原文件只读，不直接修改。
- `docs/` 是正式版；Word 是构建产物，不反向手改。
- 题解库 `D:\MyProject\acm-icpc` 只读，抽取时记录 commit。
- 候选必须先进入 `staging/`，经过筛选和 dry-run 后才能合并。
- 每次合并产生一个 git commit，可 diff、可回滚。
