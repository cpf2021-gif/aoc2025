///|
pub type Range = (Int64, Int64)

///|
pub fn part1() -> Int64 {
  let lines : Array[StringView] = @tool.read_file_by_line(
    "/Users/lesparlesparkk/project/aoc2025/day2/input1.txt", split=","
  )
  let mut answer : Int64 = 0
  for line in lines {
    match parse_range(line) {
      Some((start, end)) => {
        // println("\{start} \{end}")
        answer += calc(start, end)
      }
      None => ()
    }
  }
  answer
}

///|
pub fn parse_range(s : StringView) -> Range? {
  let parts = s.split("-").collect()
  if parts.length() != 2 {
    return None
  }
  try {
    let start = @strconv.parse_int64(parts[0])
    let end = @strconv.parse_int64(parts[1])
    Some((start, end))
  } catch {
    e => {
      println(e)
      None
    }
  }
}

///|
pub fn calc(start : Int64, end : Int64) -> Int64 {
  let mut res: Int64 = 0

  for i in start..=end {
    let s : String = i.to_string()
    let len : Int = s.length()
    try {
      if len % 2 == 0 {
        let mid = len / 2
        let pre = s[0:mid]
        let suf = s[mid:len]
  
        if pre == suf {
          res += i
        }
      }
    } catch {
      _ => ()
    }
  }

  res
}
