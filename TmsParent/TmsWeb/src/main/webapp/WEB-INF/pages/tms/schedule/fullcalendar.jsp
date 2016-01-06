<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<style>
	#calendar {
		max-width: 500px;
		margin: 0 auto;
	}
</style>
<div id='calendar'></div>
<script>
	$(document).ready(function() {
		$('#calendar').fullCalendar({
			header: {
				center: 'Forthnight',
				right: 'agendaBiWeek'
			},
			defaultDate: '2015-02-12',
			businessHours: true, // display business hours
			editable: true,
			defaultView: '${viewType}',
			events: ${eventJsons}
		});
	});

</script>