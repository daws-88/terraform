output "merged_map" {
  value = merge({a = 1, b = 2}, {c = 3, d = 4})
}
# if u want to see or print output use output