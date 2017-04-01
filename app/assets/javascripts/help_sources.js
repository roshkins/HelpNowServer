function checkResponseTime(zip) {
  $.ajax({
    url: "https://data.marincounty.org/resource/7bzr-ymkc.json?$query=SELECT time_call_was_received as call_time, time_arrived_on_scene AS arrive_time, incident_zip_postal AS zip  WHERE zip=\""+zip+"\"",
    dataType: "json",
    success: function (data) {
      var max = data.reduce((acc, val) => {
        var diff = (new Date(val.arrive_time)).getMinutes() - (new Date(val.call_time)).getMinutes();
        return ((new Date(val.arrive_time)).getFullYear() == 2016) ? Math.max(diff, acc) : acc;
      }, 0);
      $("#time").text(max);
    }
  });
}
