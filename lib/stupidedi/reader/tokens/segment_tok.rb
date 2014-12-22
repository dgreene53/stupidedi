module Stupidedi
  module Reader

    class SegmentTok
      include Inspect

      # @return [Symbol]
      attr_reader :id

      # @return [Array<CompositeElementTok, SimpleElementTok>]
      attr_reader :element_toks

      # @return [Position]
      attr_reader :position

      # @return [Position]
      attr_reader :remainder

      def initialize(id, element_toks, position, remainder)
        @id, @element_toks, @position, @remainder =
          id, element_toks, position, remainder
      end

      def pretty_print(q)
        q.pp(:segment.cons(@id.cons(@element_toks)))
      end

      def edi_blank?
        @element_toks.all(&:edi_blank?)
      end

      def edi_present?
        not edi_blank?
      end
    end

    class << SegmentTok
      # @group Constructors
      #########################################################################

      # @return [SegmentTok]
      def build(id, element_toks, position, remainder)
        new(id, element_toks, position, remainder)
      end

      # @endgroup
      #########################################################################
    end

  end
end
