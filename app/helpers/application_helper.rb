module ApplicationHelper #namespace
	def generate_title(subtitle)
		main_title = "Fragment"
		if subtitle.empty?
			full_title = "#{main_title}"
		else
			full_title = "#{main_title} | #{subtitle}"
		end
	end
end
