///|
pub fn part1() -> Int {
  try {
    let lines : Array[StringView] = @tool.read_file_by_line(
      "/Users/lesparlesparkk/project/aoc2025/day1/input.txt",
    )
    let mut pos = 50
    let mut answer = 0
    for line in lines {
      if line.length() < 2 {
        continue
      }
      let letter = line[0:1]
      let num = @strconv.parse_int(line[1:])
      let dir = if letter == "R" { 1 } else { -1 }

      // 更新最终位置
      if dir == 1 {
        pos = (pos + num) % 100
      } else {
        pos = (pos - num % 100 + 100) % 100
      }
      if pos == 0 {
        answer += 1
      }
    }
    answer
  } catch {
    _ => 0
  }
}

///|
pub fn part2() -> Int {
  try {
    let lines : Array[StringView] = @tool.read_file_by_line(
      "/Users/lesparlesparkk/project/aoc2025/day1/input.txt",
    )
    let mut pos = 50
    let mut answer = 0
    for line in lines {
      if line.length() < 2 {
        continue
      }
      let letter = line[0:1]
      let num = @strconv.parse_int(line[1:])
      let dir = if letter == "R" { 1 } else { -1 }

      // Part 2: 计算经过 0 次数
      answer += count_cross(pos, num, dir)

      // 更新最终位置
      if dir == 1 {
        pos = (pos + num) % 100
      } else {
        pos = (pos - num % 100 + 100) % 100
      }
    }
    answer
  } catch {
    _ => 0
  }
}

///|
fn count_cross(pos : Int, num : Int, dir : Int) -> Int {
  if num <= 0 {
    return 0
  }

  // 起始是 0：起点不算，只算完整的 100 步循环
  if pos == 0 {
    return num / 100
  }

  // 计算第一次到 0 需要多少步
  let distance = if dir == 1 {
    // 右转 +1
    (100 - pos) % 100
  } else {
    // 左转 -1
    pos % 100
  }

  // 不够走到 0
  if num < distance {
    return 0
  }

  // 第一次经过 + 后续绕圈
  return 1 + (num - distance) / 100
}
