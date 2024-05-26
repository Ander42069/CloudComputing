/// @description Insert description here
// You can write your code in this editor
var async_http = http_create();

http_set_url(async_http, "http://localhost:4000/auth/google");
http_set_type(async_http, http_get);

