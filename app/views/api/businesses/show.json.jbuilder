json.business
	json.id @business.id
	json.name @business.name
	json.price_range @business.price_range
	json.street @business.street
	json.city @business.city
	json.state @business.state
	json.zipcode @business.zipcode
	json.description @business.description
	json.latitude @business.latitude
	json.longitude @business.longitude
	json.tags @business.tags do |tag|
		json.name tag.name
	end
	json.images @business.images do |image|
		json.id image.id
		json.url image.url
	end
	json.reviews @business.reviews do |review|
		json.id review.id
		json.user_id review.user_id
		json.score review.score
		json.date review.created_at
	end
end