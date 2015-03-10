class Sanitizer

	def initialize(recipe)
		@recipe = recipe
	end

	def markdownify
		pipeline_context = { gfm: true}
		pipeline = HTML::Pipeline.new [HTML::Pipeline::MarkdownFilter, HTML::Pipeline::SanitizationFilter], pipeline_context
		pipeline.call(@recipe.instructions)[:output].to_s.html_safe
	end

	def pretty_instructions
		markdownify
	end

end
