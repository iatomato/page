---
layout: post
author:
title: Algorithm: Solutions in Python3
---

# [`solutions.py`](https://github.com/iatomato/myleetcode-py/blob/master/solution.py)

```python
class Solution:
    def removeDuplicates(self, nums: list) -> int:
        _nums = []
        for _index in range(len(nums)):
            # TODO best idea
            #if (not (nums[_index] in _nums)):
            #   _nums.append(nums[_index])
            if (self.isame(nums[_index], _nums, \
                    len(_nums)) == len(_nums)):
                _nums.append(nums[_index])
        return len(_nums)

    def isame(self, num: int, _nums: list, \
            _len=None) -> int:
        # TODO nice syntax
        #_index = (_len != None) and _len or len(_nums)
        _index = len(_nums)
        for index in range(_index):
            if (num == _nums[index]):   return index
        return _index
```
