function checkResponseTime() {
  $.ajax({url: "https://data.marincounty.org/resource/7bzr-ymkc.json?$query=SELECT MAX(time_call_was_received) as max_arrival_time, MAX(time_arrived_on_scene) AS max_call_time, incident_zip_postal AS zip  GROUP BY zip"})
}
