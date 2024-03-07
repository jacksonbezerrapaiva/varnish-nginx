vcl 4.0;

import directors;
import std;

backend site {
    .host = "google.com.br";
    .port = "80";
}

sub vcl_recv {
    set req.backend_hint = site;   
}

sub vcl_deliver {
    if (obj.hits > 0) {
        set resp.http.X-Cache = "HIT from Varnish cache" ;
    } else {
        set resp.http.X-Cache = "MISS";
    }
}