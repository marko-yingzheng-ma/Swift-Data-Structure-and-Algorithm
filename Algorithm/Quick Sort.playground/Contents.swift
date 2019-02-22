import UIKit

func quickSort<T: Comparable>(nums: inout [T]) {
  quickSort(nums: &nums, start: 0, end: nums.count - 1)
}

func quickSort<T: Comparable>(nums: inout [T], start: Int, end: Int) {
  guard start < end else {
    return
  }

  let pIndex = partition(nums: &nums, start: start, end: end)
  quickSort(nums: &nums, start: start, end: pIndex - 1)
  quickSort(nums: &nums, start: pIndex + 1, end: end)
}

func partition<T: Comparable>(nums: inout [T], start: Int, end: Int) -> Int {
  let pivot = nums[end]
  var tempPivotIndex = start
  
  for i in start..<end {
    if nums[i] <= pivot {
      (nums[tempPivotIndex], nums[i]) = (nums[i], nums[tempPivotIndex])
      tempPivotIndex += 1
    }
  }
  (nums[tempPivotIndex], nums[end]) = (nums[end], nums[tempPivotIndex])
  
  return tempPivotIndex
}

var input = [4,3,2,1]

quickSort(nums: &input)

print(input)
