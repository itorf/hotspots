Hotspots.Views.Map = Backbone.View.extend({
	template: JST["map"],
	
	className: 'show-map',
	
	initialize: function () {
		if (this.collection){
			this.listenTo(this.collection, "sync", this.render)	
		} else if (this.model){
			this.listenTo(this.model, "sync", this.render)	
		}
	},
	
	render: function () {
		var renderedContent = this.template({
			businesses: this.collection,
			business: this.model
		});
		this.$el.html(renderedContent);
		if (this.collection && this.collection.length > 1) {
	    this.mapAll();
		} else if (this.model) {
			this.mapOne();
		}
		return this;
	},
	
	mapAll: function () {
    var mapOptions = {
      center: new google.maps.LatLng(
				this.collection.first().escape('latitude'),
				this.collection.first().escape('longitude')
			), zoom: 14 };
    var map = new google.maps.Map(this.$('#map-canvas')[0], mapOptions);
		var markers =[];
		this.collection.forEach(function(business){
			var latLng = new google.maps.LatLng(
				business.escape('latitude'),
				business.escape('longitude')
			);
			var mark = new google.maps.Marker({ position: latLng, map: map });
			markers.push(mark);
		})
		this.setBounds(markers, map);
	},
	
	mapOne: function () {
    var mapOptions = {
      center: new google.maps.LatLng(
				this.model.escape('latitude'),
				this.model.escape('longitude')
			), zoom: 14 };
    var map = new google.maps.Map(this.$('#map-canvas')[0], mapOptions);
		var latLng = new google.maps.LatLng(
			this.model.escape('latitude'),
			this.model.escape('longitude')
		)
		new google.maps.Marker({ position: latLng, map: map });	
	},
	
	setBounds: function (markers, map) {
		var bounds = new google.maps.LatLngBounds();
		for (var i = 0; i < markers.length; i++){
			bounds.extend(markers[i].getPosition());
		}
		
		map.fitBounds(bounds);
	}
});