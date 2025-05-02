bool containsTwice(List<int> nums, int n) {
  return nums.where((x) => x == n).length == 2;
}

bool bothStartWithZero(List<int> a, List<int> b) {
  return a.isNotEmpty && b.isNotEmpty && a[0] == 0 && b[0] == 0;
}

List<int> largestSumArray(List<int> a, List<int> b) {
  int sumA = a.reduce((x, y) => x + y);
  int sumB = b.reduce((x, y) => x + y);
  return sumA >= sumB ? a : b;
}

List<int> middleTwo(List<int> nums) {
  int mid = nums.length ~/ 2;
  return [nums[mid - 1], nums[mid]];
}

List<int> combineArrays(List<int> a, List<int> b) {
  return [...a, ...b];
}

List<int> swapFirstLast(List<int> nums) {
  if (nums.length < 2) return nums;
  int first = nums[0];
  int last = nums[nums.length - 1];
  nums[0] = last;
  nums[nums.length - 1] = first;
  return nums;
}

List<int> middleThree(List<int> nums) {
  int mid = nums.length ~/ 2;
  return [nums[mid - 1], nums[mid], nums[mid + 1]];
}

int largestOfThree(List<int> nums) {
  int first = nums.first;
  int last = nums.last;
  int middle = nums[nums.length ~/ 2];
  return [first, middle, last].reduce((x, y) => x > y ? x : y);
}

List<int> firstTwo(List<int> nums) {
  if (nums.length >= 2) {
    return [nums[0], nums[1]];
  } else if (nums.isNotEmpty) {
    return [nums[0]];
  } else {
    return [];
  }
}