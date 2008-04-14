class String  
  def requestify
    self.gsub(/Id$/, 'ID')
  end
  
  # Useful for heredocs - removes whitespace margin.
  def margin
    lines = self.dup.split($/)
    
    min_margin = 0
    lines.each do |line|
      if line =~ /^(\s+)/ && (min_margin == 0 || $1.size < min_margin)
        min_margin = $1.size
      end
    end
    lines.map { |line| line.sub(/^\s{#{min_margin}}/, '') }.join($/)
  end
end
