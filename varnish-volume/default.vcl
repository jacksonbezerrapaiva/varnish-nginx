vcl 4.1;

backend site {
    .host = "10.244.0.27";
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