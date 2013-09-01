module Milestone_old

def generate_scale(progress, total_items)

	returnhtml = ""
	captions = ""
	step_value = Float(total_items/5);

	for i in 0..5 do
		captions += content_tag(:div, "#{step_value.ceil*i}", class: "milestonecaption", style: "left: #{20*i}%")+"\n"
	end
	returnhtml += content_tag(:div, captions.html_safe, class: "mscaption_wrapper")+"\n"
	returnhtml += content_tag(:p,"", style: "height: 8px; margin: 0px")+"\n"

	scalemarks = "";

	for i in 0..5 do
		scalemarks += content_tag(:div, "", class: "scalemark", style: "left: #{20*i}%")+"\n"
	end

	returnhtml += content_tag(:div, scalemarks.html_safe, class: "scale-tb2")+"\n"
	returnhtml += content_tag(:p,"", style: "height: 6px; margin: 0px")+"\n"

	return returnhtml
end

def generate_milestone_bars(progress, users_required, width, total_items)

	returnvalue = content_tag(:div, "", class: "box1")

	users_required.each_index { |x| 
		returnvalue += content_tag(:div, "" , class: "target", id: "milestonemark#{x+1}", style: "left: #{(100.0/Float(total_items))*Float(users_required[x])}%")+"\n"
	}

	progress.each_index { |x| 
		returnvalue += content_tag(:div, "#{((100.0/Float(total_items))*Float(progress[x]))}", class: "msbar", id: "milestonebar#{x+1}", style: "width: 0px")+"\n"
	}

	returnvalue = content_tag(:div, returnvalue.html_safe, class: "box-wrap")+"\n"
end

def generate_milestone_indicators(users_required, width, total_items, milestone_texts)

	returnvalue = ""

	users_required.each_index { |x| 
		content = content_tag(:span, "", class: "icon", id: "milestoneicon#{x+1}")+"\n"
		content += content_tag(:span, milestone_texts[x], class: "mstext")+"\n"
		unless (((100.0/Float(total_items))*Float(users_required[x]).ceil+14)+90 > width.to_i)
			returnvalue += content_tag(:li, content.html_safe , class: "milestone", style: "left: #{(100.0/Float(total_items))*Float(users_required[x]).ceil}%")+"\n"
		else
			returnvalue += content_tag(:li, content.html_safe , class: "milestone", style: "left: #{(100.0/Float(total_items))*Float(users_required[x]).ceil}%")+"\n"
		end
	}

	returnvalue = content_tag(:ul, returnvalue.html_safe, class: "milestones")+"\n"

end

def generate_graph_legend(progress, users_required, milestone_texts, total_items)

	current_milestone = "Sale is a no no"
	next_milestone = milestone_texts[progress.length-1]
	number_of_bids = progress[progress.length-1]
	bids_until_next_milestone = total_items

	progress.each_index { |x|
		if bids_until_next_milestone<=0
			bids_until_next_milestone = total_items
		end

		if progress[x] >= users_required[x]
			current_milestone = milestone_texts[x]
		end

		if bids_until_next_milestone > users_required[x] - progress[x]
				bids_until_next_milestone = users_required[x] - progress[x]
				next_milestone = milestone_texts[x]
		end
	}

	bids = content_tag(:li, (content_tag(:strong, "#{number_of_bids}", id: "bids")+"Number of bids").html_safe, class: "graphpoint")+"\n"
	cmilestone = content_tag(:li, (content_tag(:strong, current_milestone, id: "bids")+"Current milestone").html_safe, class: "graphpoint")+"\n"
	
	if(bids_until_next_milestone>0)
		buntil = content_tag(:li, (content_tag(:strong, "#{bids_until_next_milestone}", id: "bids")+"Bids until next milestone").html_safe, class: "graphpoint")+"\n"
	else
		next_milestone = "-"
		buntil = content_tag(:li, (content_tag(:strong, "-", id: "bids")+"Bids until next milestone").html_safe, class: "graphpoint")+"\n"
	end
	nmilestone = content_tag(:li, (content_tag(:strong, next_milestone, id: "bids")+"Next milestone").html_safe, class: "graphpoint")+"\n"
	glegend = content_tag(:ul, bids.html_safe+cmilestone.html_safe+nmilestone.html_safe+buntil.html_safe, id: "graphlegend")+"\n"

	wrapper = content_tag(:div, glegend.html_safe, id: "graphwrapper")+"\n"
	return wrapper.html_safe
end

def milestone_bar(progress, users_required, total_items, milestone_texts, options = {})

	width = options[:width] || "100%"

	content = generate_scale(100, total_items).html_safe
	content += generate_milestone_bars(progress, users_required, width, total_items)
	content += generate_milestone_indicators(users_required, width, total_items, milestone_texts)
	content += generate_graph_legend(progress, users_required, milestone_texts, total_items)

	return content_tag(:div, content.html_safe, id: "container", style: "width:#{width}")
end

end