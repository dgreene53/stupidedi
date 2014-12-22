class String

  # True if the string is `empty?` or contains all whitespace
  #
  # @example
  #   "abc".edi_blank?    #=> false
  #   "   ".edi_blank?    #=> true
  #   "".edi_blank?       #=> true
  #
  def edi_blank?
    self !~ /\S/
  end

  def edi_present?
    self =~ /\S/
  end
end

# module Enumerable
#
#   # True if the collection is `empty?`
#   #
#   # @example
#   #   [1,2].edi_blank?    #=> false
#   #   [].edi_blank?       #=> false
#   #
#   unless respond_to?(:edi_blank?)
#
#   def edi_blank?
#     empty?
#   end
#
#   def edi_present?
#     not empty?
#   end
# end

class NilClass

  # Always `true`. Note this overrides {Object#edi_blank?} which returns false.
  #
  # @example
  #   nil.edi_blank?    #=> true
  #
  def edi_blank?
    true
  end

  def edi_present?
    false
  end
end

class Object

  # Always `false`. Note that {NilClass#edi_blank?} is overridden to return `true`
  #
  # @example
  #   false.edi_blank?    #=> false
  #   100.edi_blank?      #=> false
  #
  def edi_blank?
    false
  end

  def edi_present?
    true
  end
end
