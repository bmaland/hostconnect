class Symbol
  def classify
    ActiveSupport::Inflector.classify(self.to_s)
  end

  def camelize
    ActiveSupport::Inflector.camelize(self.to_s)
  end
end
