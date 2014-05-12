module ApplicationHelper
	def sortable(column, title=nil)
		title ||= column.titleize
		if column == 'Name'
			sort_by = 'player_id'
		elsif column == "Team"
			sort_by = 'team_id'
		elsif column == "Round"||"Pick"
			sort_by = 'order_id'
		else
			sort_by = column
		end
		css_class = (sort_by == sort_column) ? "current #{sort_direction}" : nil
		direction = (sort_by == sort_column && sort_direction=="asc") ? "desc" : "asc"
		link_to title, {:sort => sort_by, :direction => direction}, {:class => css_class}
	end

	def sortable_by(input, title=nil)
		title ||= input.to_s.titleize
		link_to title, :input => input
	end

end
