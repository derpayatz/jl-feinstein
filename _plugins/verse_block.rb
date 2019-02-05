# _plugins/verse_block.rb
# Liquid tag block to output html suitable for verse poetry

module Jekyll
  module Tags
    class VerseBlock < Liquid::Block

      def initialize(tag_name, markup, tokens)
        super
      end

      def render(context)
        site = context.registers[:site]
        text = super(context).split("\n\n")
        text.map! do |verse|
          verse = verse.split("\n")
          verse.map! do |line|
            if line == "" # is blank
              next
            else
              line = "<span>#{line} </span>"
            end
          end
          verse = "<p class=\"verse\">#{verse.join("<br \>\n")}</p>"
        end
        text.join("\n\n")
      end
    end
  end
end

Liquid::Template.register_tag('verse', Jekyll::Tags::VerseBlock) 
