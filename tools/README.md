# tools — 项目脚本

所有脚本都只依赖项目内环境：

- 便携版 pandoc：`tools/bin/pandoc/pandoc.exe`
- Python 虚拟环境：`.venv/`

## 环境

在 PowerShell 中临时启用：

```powershell
. .\tools\env.ps1
```

安装 / 更新便携版 pandoc：

```powershell
powershell -ExecutionPolicy Bypass -File tools\install_pandoc.ps1 -Force
```

检查环境：

```powershell
.\.venv\Scripts\python.exe tools\verify_env.py
```

## 脚本

| 脚本 | 用途 | 阶段 |
|---|---|---|
| `install_pandoc.ps1` | 下载项目内便携版 pandoc | P0 |
| `env.ps1` | 临时把项目工具加入当前 PowerShell 的 PATH | P0 |
| `pandoc.cmd` | 直接调用项目内 pandoc | P0 |
| `verify_env.py` | 检查 Python 依赖、pandoc、git、g++ | P0 |
| `docx2md.py` | Word → Markdown | P1（待写） |
| `split_md.py` | 按章节拆分并编号 | P1（待写） |
| `extract_snippets.py` | 从题解抽取候选板子 | P2（待写） |
| `review.py` | 查看、接受、拒绝候选 | P3（待写） |
| `merge.py` | dry-run / 合并 / 回滚 | P3（待写） |
| `build_docx.py` | Markdown → Word / PDF | P4（待写） |
| `renumber.py` | 重新编号小节 | P3/P4（待写） |
| `verify.py` | 检查 md、候选、链接、代码围栏 | P1–P4（待写） |
