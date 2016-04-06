# require_relative '../lib/board/graph.rb'
# require_relative '../lib/board/face.rb'
require_relative '../lib/board/face_graph.rb'

# Returns true if the arrays contain the same elements, false otherwise
def array_compare(arr1, arr2)
  arr1_remaining = arr1.dup
  arr2_remaining = arr2.dup
  arr1.each do |el|
    if arr2_remaining.include?(el)
      arr1_remaining.delete(el)
      arr2_remaining.delete(el)
    else
      return false
    end
  end
  return arr1_remaining.empty? && arr2_remaining.empty?
end
