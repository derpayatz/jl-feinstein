# _plugins/verse_block.rb

module Jekyll
  module Tags
    class VerseBlock < Liquid::Block

      def initialize(tag_name, markup, tokens)
        super
      end

      def render(context)
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        if Jekyll.configuration({})['kramdown']['hard_wrap']
            newline = "\n"
        else
            newline = "<br \>\n"
        end
        tag = "\{: .verse\}\n"
        md = "#{tag}"
        text = super(context).split("\n\n")
        text.each do |verse|
            verse = verse.split("\n")
            verse.each do |line|
                if /\S/ !~ line # is blank
                    next
                else
                    md = "#{md}<span>#{line} </span>"
                end            
                if (!line[verse.last])
                    md = "#{md}#{newline}"
                else
                    md = "#{md}\n\n"
                end
            end
        end
        converter.convert("#{md}")
      end
    end
  end
end

Liquid::Template.register_tag('verse', Jekyll::Tags::VerseBlock) 
