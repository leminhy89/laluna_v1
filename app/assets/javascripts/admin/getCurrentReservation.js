
$(document).ready(function() { 
    init_calendar();
});


/* CALENDAR */
function  init_calendar() {
	
	if( typeof ($.fn.fullCalendar) === 'undefined'){ return; }
	console.log('init_calendar from getCurrentReservation');
		
	var date = new Date(),
		d = date.getDate(),
		m = date.getMonth(),
		y = date.getFullYear(),
		started,
		categoryClass;

	var calendar = $('#calendar').fullCalendar({
	  header: {
		left: 'prev,next today',
		center: 'title',
		right: 'month,agendaWeek,agendaDay,listMonth'
	  },
	  selectable: true,
	  selectHelper: true,
	  /*select: function(start, end, allDay) {
		$('#fc_create').click();

		started = start;
		ended = end;

		$(".antosubmit").on("click", function() {
		  var title = $("#title").val();
		  if (end) {
			ended = end;
		  }

		  categoryClass = $("#event_type").val();

		  if (title) {
			calendar.fullCalendar('renderEvent', {
				title: title,
				start: started,
				end: end,
				allDay: allDay
			  },
			  true // make the event "stick"
			);
		  }

		  $('#title').val('');

		  calendar.fullCalendar('unselect');

		  $('.antoclose').click();

		  return false;
		});
	  },*/
	  eventClick: function(calEvent, jsEvent, view) {
		$('#fc_edit').click();
		$('#reservationName').val(calEvent.title);
		$('#reservationDate').val(calEvent.resDate);
		$('#reservationTime').val(calEvent.hours + ":" + calEvent.minutes);
		$('#adult').val(calEvent.adult);
		$('#child').val(calEvent.child);

		/*categoryClass = $("#event_type").val();

		$(".antosubmit2").on("click", function() {
		  calEvent.title = $("#title2").val();

		  calendar.fullCalendar('updateEvent', calEvent);
		  $('.antoclose2').click();
		});*/

		calendar.fullCalendar('unselect');
	  },
	  editable: false,
	  allDayDefault: false,
	  events : function(start, end, timezone,callback) {
        $.ajax({
            url: '/admin/reservations/getListCurrentData',
            dataType: 'json',
            /*data: {
                start: start.unix(),
                end: end.unix()
            },*/
            success: function(doc) {
                console.log(JSON.stringify(doc))
                var events = [];
                list = JSON.parse(JSON.stringify(doc));
                
                $(list).each(function() {
                    events.push({
                        title: $(this).attr('title'),
                        start: $(this).attr('start'),
                        hours: $(this).attr('hours'),
                        minutes: $(this).attr('minutes'),
                        resDate: $(this).attr('resDate'),
                        adult: $(this).attr('adult'),
                        child: $(this).attr('child')
                    });
                });
                
                callback(events);
            }
        }); 
	     
	  }
	  
	  /*events: [{
		title: 'All Day Event',
		start: new Date(y, m, 1)
	  }, {
		title: 'Long Event',
		start: new Date(y, m, d - 5),
		end: new Date(y, m, d - 2)
	  }, {
		title: 'Meeting',
		start: new Date(y, m, d, 10, 30),
		allDay: false
	  }, {
		title: 'Lunch',
		start: new Date(y, m, d + 14, 12, 0),
		end: new Date(y, m, d, 14, 0),
		allDay: false
	  }, {
		title: 'Birthday Party',
		start: new Date(y, m, d + 1, 19, 0),
		end: new Date(y, m, d + 1, 22, 30),
		allDay: false
	  }, {
		title: 'Click for Google',
		start: new Date(y, m, 28),
		end: new Date(y, m, 29),
		url: 'http://google.com/'
	  }]*/
	});
	
	console.log(calendar);
	
};    

function getListData() {
    $.ajax({
        url: "/admin/reservations/getListCurrentData",
        type: 'GET'
    });
}