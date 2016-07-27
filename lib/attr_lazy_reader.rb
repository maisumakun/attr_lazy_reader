require "attr_lazy_reader/version"

# Core extension for Module
class Module
  # define lazily initialized read-only attribute.
  def attr_lazy_reader(sym, &block)
    raise ArgumentError, 'attr_lazy_reader requires block' unless block
    raise NameError, "invalid attribute name: #{sym}" unless sym =~ /^[_A-Za-z]\w*$/
    local_sym = :"@#{sym}"
    define_method sym do
      unless instance_variable_defined?(local_sym)
        instance_variable_set local_sym, instance_eval(&block)
      end
      instance_variable_get local_sym
    end
  end

  private :attr_lazy_reader
end
