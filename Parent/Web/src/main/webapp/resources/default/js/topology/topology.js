var visWidth = 1024, visHeight = 400;

// mouse event vars
var selected_node = null, selected_link = null, mousedown_link = null, mousedown_node = null, mouseup_node = null;

var mouseup_position, mousedown_position;

var svg, vis;

var nodes, links, node, link;

var force;

var drag_line;

function cleanDragLine() {
	drag_line.attr("x1", 0).attr("y1", 0).attr("x2", 0).attr("y2", 0);
}

function rescale() {
	trans = d3.event.translate;
	scale = d3.event.scale;
	vis.attr("transform", "translate(" + trans + ")" + " scale(" + scale + ")");
}

function keydown() {
	if (!selected_node && !selected_link)
		return;
	switch (d3.event.keyCode) {
	case 8: // backspace
	case 46: { // delete
		if (selected_link) {
			links.splice(links.indexOf(selected_link), 1);
		}
		selected_link = null;
		selected_node = null;
		redraw();
		break;
	}
	}
}

function redraw() {

	link = link.data(links);

	link.enter().insert("line", ".node").attr("class", function(d) {
		if (d.source.status == 0 && d.target.status == 0) {
			return "line";
		} else {
			return "line_err";
		}
	}).on("mousedown", function(d) {
		mousedown_link = d;
		if (mousedown_link == selected_link) {
			selected_link = null;
		} else {
			selected_link = mousedown_link;
		}
		selected_node = null;
		redraw();
	})

	link.exit().remove();

	link.classed("line_selected", function(d) {
		return d === selected_link;
	});

	node = node.data(nodes);

	node.enter().append("svg:g").attr("class", "node").on(
			"mousedown",
			function(d) {
				svg.call(d3.behavior.zoom()).on("zoom", null);
				mousedown_node = d;
				mouseup_node = null;
				if (mousedown_node == selected_node) {
					selected_node = null;
				} else {
					selected_node = mousedown_node;
				}
				selected_link = null;

				drag_line.attr("x1", mousedown_position[0]).attr("y1",
						mousedown_position[1])
						.attr("x2", mousedown_position[0]).attr("y2",
								mousedown_position[1]);
				redraw();
			}).on("mouseup", function(d) {
		mouseup_node = d;
		if (mouseup_node == mousedown_node) {
			mouseup_node = null;
			mousedown_node = null;
			cleanDragLine();
			svg.call(d3.behavior.zoom().on("zoom", rescale));
			return;
		}
		if (mousedown_node != null) {
			// add link
			var link = {
				source : mousedown_node,
				target : mouseup_node
			};
			links.push(link);			
			mousedown_node = null;
			cleanDragLine();
			redraw();
		}
		svg.call(d3.behavior.zoom().on("zoom", rescale));
	});// .call(force.drag);

	node.append("svg:image").attr("class", "circle").attr("xlink:href",
			function(d) {
				if (d.type == 'host') {
					return "/resources/topology/server.png";
				} else if (d.type == 'router') {
					return "/resources/topology/router.png";
				} else {
					return "/resources/topology/switcher.png";
				}
			}).attr("x", "-8px").attr("y", "-8px").attr("width", "32px").attr(
			"height", "32px");

	node.append("svg:text").attr("class", "nodetext").attr("dx", -36).attr(
			"dy", 40).text(function(d) {
		return d.ip;
	});

	force.start();
}

function initTopology() {

	svg = d3.select("#topologyDiv").append("svg:svg").attr(
			"style",
			"width:100%;height:"
					+ (document.body.clientHeight - $(".title").height() - $(
							"#footer").height()) + "px;").attr(
			"pointer-events", "all");

	svg.on("contextmenu", function(data, index) {
		d3.select('#my_custom_menu').style('position', 'absolute').style(
				'left', d3.event.x + "px").style('top', d3.event.y + "px")
				.style('display', 'block');

		d3.event.preventDefault();
	});

	svg.on(
			"mousemove",
			function(d) {

				if (!mousedown_node) {
					return;
				}

				drag_line.attr("x1", mousedown_position[0]).attr("y1",
						mousedown_position[1]).attr("x2", d3.mouse(this)[0])
						.attr("y2", d3.mouse(this)[1]);

			}).on("mousedown", function(d) {
		mousedown_position = d3.mouse(this);
	}).on("mouseup", function(d) {
		mouseup_position = d3.mouse(this);
		if (mouseup_node == null) {
			mousedown_node = null;
			cleanDragLine();
		}
	});

	vis = svg;

	vis.append("rect").attr("width", "100%").attr("height", "100%").attr(
			"fill", "#F0F0F0").attr("cursor", "move").attr('id', 'zoomCanvas')
			.style("cursor", "url(/resources/topology/openhand.png)").on(
					"mousedown",
					function() {
						d3.select("#zoomCanvas").style("cursor",
								"url(/resources/topology/closedhand.png)");
						d3.select("#zoomCanvas").attr("class", "grabbing");
					}).on(
					"mouseup",
					function() {
						d3.select("#zoomCanvas").style("cursor",
								"url(/resources/topology/openhand.png)");
						d3.select("#zoomCanvas").attr("class", "");
					});

	vis.call(d3.behavior.zoom().on("zoom", rescale));

	vis = vis.append("svg:g");

	drag_line = svg.append("line").attr("class", "drag_line");

	d3.json("loadNetwork", function(json) {

		force = d3.layout.force().nodes(json.nodes).links(json.links).gravity(
				.05).distance(150).charge(-200).size([ visWidth, visHeight ]).start();

		nodes = force.nodes();
		links = force.links();

		node = vis.selectAll(".node");
		link = vis.selectAll(".link");

		redraw();

		force.on("tick", function() {
			link.attr("x1", function(d) {
				return d.source.x;
			}).attr("y1", function(d) {
				return d.source.y;
			}).attr("x2", function(d) {
				return d.target.x;
			}).attr("y2", function(d) {
				return d.target.y;
			});

			node.attr("transform", function(d) {
				return "translate(" + d.x + "," + d.y + ")";
			});
		});

	});

	d3.select(window).on("keydown", keydown);

}