class Symbol
  def classify
    Inflector.classify(self.to_s)
  end
  
  def camelize
    Inflector.camelize(self.to_s)
  end
end
