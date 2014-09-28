Hotspots.Views.SearchView = Backbone.CompositeView.extend({
	template: JST["search"],
	
	initialize: function () {
		
		$('body').removeClass('bg');
		$('#main-search').addClass('hidden');
		
		var businessesView = new Hotspots.Views.BusinessesIndex({
			collection: this.collection
		})
		
		var mapView = new Hotspots.Views.Map({
			collection: this.collection
		});
		
		var filterView = new Hotspots.Views.Filter({
			collection: this.collection
		});
		
		this.addSubview('.bus-lists', businessesView);
		this.addSubview('.map', mapView);
		this.addSubview('.filter', filterView);
	},
	
	render: function () {
		var renderedContent = this.template({});
		this.$el.html(renderedContent);
		this.attachSubviews();
		
		return this;
	}
	
});