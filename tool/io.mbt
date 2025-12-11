///|
pub fn read_file_by_line(filename : String) -> Array[StringView] {
  @fs.read_file_to_string(filename).split("\n").collect() catch {
    _ => []
  }
}
