# sources — 只读原始资料

这里存放本次重构开始时的原始文件，供转换、比对和追溯使用。

```text
sources/
├─ docx/
│  └─ 算法手册1.docx
├─ pdf/
│  ├─ 哈希常用技巧及模板.pdf
│  ├─ bitset用法.pdf
│  ├─ C++随机数函数与均匀生成器.pdf
│  └─ C++字符串常用操作.pdf
├─ baseline.md      # 文件哈希、页数、题解库 commit
└─ README.md
```

约定：

- 不直接编辑这里的文件。
- 转换前先确认 `baseline.md` 中的 SHA256。
- 题解库不在本仓库内，路径为 `D:\MyProject\acm-icpc`；只读使用，抽取时记录 commit。
- 如果原始资料需要更新，新增一份基线记录，不覆盖旧记录。
