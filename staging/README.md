# staging — 候选板子

这里存放从题解库抽取、尚未合并进正式手册的候选内容。

## 目录

- `inbox/`：子代理的原始产出，按批次分目录。
- `snippets/`：去重、编号、补齐元数据后的候选板子。
- `appendix/`：PDF 等附录候选（可选）。
- `INDEX.md`：总看板，用来勾选采用 / 拒绝（P2 生成）。

## 候选状态

每个候选文件头部有 YAML：

```yaml
status: pending   # pending / accepted / rejected / merged
```

- `pending`：待筛选。
- `accepted`：你已同意，等待合并。
- `rejected`：不采用，保留追溯。
- `merged`：已合并进 `docs/`。

## 原则

- 只收可复用的 C++ 模板、结构体、函数、关键写法。
- 不收整题代码；整题代码只作为来源链接。
- 每个候选必须有来源、目标章节、复杂度、坑点。
- 合并前必须经过 `merge.py --dry-run`。
- 这里是候选区，不是正式手稿；正式内容只写进 `docs/`。
