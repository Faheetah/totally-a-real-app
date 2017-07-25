$(document).ready(function() {
    setInterval(
        function() {
            $.ajax({
                type: "GET",
                url: "/stats",
                dataType: 'json',
                success: function(data) {
                    main = $('#main')
                    main.empty()
                    // main.append(data)
                    main.append('<tr><th>Time</th><th>Uptime</th><th>Loadavg</th><th>Free Memory</th></tr>')
                    $.each(data, function(i, d) {
                       main.append('<tr><td>' 
                                   + d['time'] 
                                   + '</td><td>' 
                                   + d['uptime'] 
                                   + '</td><td>' 
                                   + d['loadavg']
                                   + '</td><td>' 
                                   + d['free']
                                   + '</td></tr>')
                    })
                }
            })
        }
    , 5000)
});