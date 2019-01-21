module Jekyll
    class ResponsiveImageMarkdown < Converter
        safe :false
        priority :low

        def matches(ext)
            ext =~ /^\.(md|markdown)$/i
        end

        def output_ext(ext)
            ".html"
        end

        def convert(content)
            content.gsub(/\!\[(.+)\]\((.+)\)/, '{% responsive_image path: \2 alt: \1  %}')
        end
    end
end
