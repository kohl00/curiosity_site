module RecipesHelper

	#def markdownify(content)
	#	pipeline_context = { gfm: true}
	#	pipeline = HTML::Pipeline.new [HTML::Pipeline::MarkdownFilter, HTML::Pipeline::SanitizationFilter], pipeline_context
	#	pipeline.call(content)[:output].to_s.html_safe
	#end

	def embed(youtube_url)
    	youtube_id = youtube_url.split("=").last
    	content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
    end

end
