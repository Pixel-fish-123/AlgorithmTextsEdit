# 基线记录

> 记录时间：2026-11-21  
> 用途：固定本次重构开始时的原始资料与题解库版本，后续所有转换、抽取、合并都以这份基线为准。

## 1. 原始 Word

| 项目 | 值 |
|---|---|
| 路径 | `sources/docx/算法手册1.docx` |
| 大小 | 160,740 字节 |
| SHA256 | `19627033c16c1b10a020c71252a9688d93c0239d7d450398ed1fb13a80efe471` |
| 页面 | Letter，21.59 × 27.94 cm |
| 结构 | 6 个 Part、41 个算法小节、4368 段、3647 个代码段落、337 个 OMML 公式、127 条 Callout |

## 2. PDF 资料

| 文件 | 页数 | 大小 | SHA256 |
|---|---:|---:|---|
| `sources/pdf/哈希常用技巧及模板.pdf` | 11 | 608,141 | `1bc4fc067989487374ef0d594747ee6a1641c47d58be9419a0a9fa548d3e69cb` |
| `sources/pdf/bitset用法.pdf` | 6 | 559,906 | `f9e826147a0a864441f599d6a186c7d6c5661b4947241bec6027b1647ca819c2` |
| `sources/pdf/C++随机数函数与均匀生成器.pdf` | 5 | 154,254 | `eeffc58ae7102c2e9ab923050ce6af6ba42f63efed97add0e3ae9f16809d47da` |
| `sources/pdf/C++字符串常用操作.pdf` | 9 | 154,298 | `ba348af9dc8deaa5aa39cabaa3c12ae301cd62863bce14155fa9b88d25eb6781` |

## 3. 题解库

| 项目 | 值 |
|---|---|
| 路径 | `D:\MyProject\acm-icpc\solutions` |
| 当前 commit | `eb29d10d5e97016fbed4d7827fd8a1cb60ef820b` |
| `solutions/` 未提交改动 | 0 |
| Markdown 题解 | 136 篇 |
| 标签 | 75 个 |
| 代码块 | 138 个 |

## 4. 工具版本

| 工具 | 版本 / 路径 |
|---|---|
| Python | 3.14.0 |
| python-docx | 1.2.0（项目 `.venv`） |
| PyYAML | 6.0.3（项目 `.venv`） |
| pypdf | 6.21.4（项目 `.venv`） |
| pdfplumber | 未安装（P5 可选，见 `requirements-pdf.txt`） |
| g++ | 14.2.0（MinGW-w64） |
| git | 2.52.0.windows.1 |
| pandoc | 3.14（`tools/bin/pandoc/pandoc.exe`，SHA256 `0144b96e8c7b023fd382ec5ef5bdc475e873f1019d6fa72502492df2c9a94a3b`） |

## 5. 说明

- `sources/` 下的文件只读，不直接编辑。
- 后续如需更新原始资料，先新增一份基线记录，不覆盖本文件。
- 题解库抽取时使用上面的 commit 作为来源版本。
