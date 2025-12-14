///|
pub fn read_file_by_line(
  filename : String,
  split? : String = "\n",
) -> Array[StringView] {
  @fs.read_file_to_string(filename)
  .split(split)
  .map(fn(s) { s.trim_space() })
  .collect() catch {
    _ => []
  }
}
