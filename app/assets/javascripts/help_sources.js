function checkResponseTime(zip) {
  $.ajax({
    url: "https://data.marincounty.org/resource/7bzr-ymkc.json?$query=SELECT time_call_was_received as call_time, time_arrived_on_scene AS arrive_time, incident_zip_postal AS zip  WHERE zip=\""+zip+"\"",
    dataType: "json",
    success: function (data) {
      var sum = data.reduce((acc, val) => {
        var diff = (new Date(val.arrive_time)).getMinutes() - (new Date(val.call_time)).getMinutes();
        var positiveDiff = (((new Date(val.arrive_time)).getFullYear() == 2016) && diff > 0 );
        if (positiveDiff) {
        }
        return positiveDiff ? acc + diff : acc;
      }, 0);
      $("#time").text(Math.ceil(sum/data.length));
    }
  });
}

function checkOpioidPop(age) {
  var age_group;
  if (age <= 14) {
    age_group = "=< 14 yrs";
  } else if (age <= 24) {
    age_group = "15-24 yrs";
  } else if (age <= 44) {
    age_group = "25-44 yrs";
  } else if (age <= 64) {
    age_group = "45-64 yrs";
  } else {
    age_group = ">= 65 yrs";
  }
  $.ajax({
    url: "https://data.marincounty.org/resource/duhg-p8hy.json?$query=SELECT year, month, age_group, patient_count_opioids WHERE age_group LIKE \""+ age_group +"\" AND year = 2016 AND month = 12",
    dataType: "json",
    success: function (data) {
      var datum = data[0];
      $("#opioidNum").text(datum.patient_count_opioids);
      $("#opioidAge").text(datum.age_group);
    }
  });
}
