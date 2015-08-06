//OMLIAA_client, by 220
//OUTTER WORLD POWERED SUN
//LSL for OpenSim and SecondLife

// change the adress on lines 40 and 47 for your own broadcast IP server.

key http_request_id;

integer mode = 0;
float v;

vector COLOR_BLUE = <0.0, 0.0, 1.0>;
float OPAQUE = 1.0;

default
{
    state_entry()
    {
        llShout (0, "OLMIAA executing");
        
        llSetText ("init", COLOR_BLUE, OPAQUE);
    }
    touch_start (integer total_number)
    {
        integer update_speed = 0;
        

        if (mode==0) update_speed = 1;
        else if (mode==1) update_speed = 3;
        else if (mode==2) update_speed = 7;
        else if (mode==3) update_speed = 15;
        else if (mode==4) update_speed = 30;
        else if (mode==5) update_speed = 60;

        if (mode<6) mode++; else mode=0;
    
        string s = "update: "+(string)update_speed;
        llShout (0, s);

        http_request_id = llHTTPRequest ("http://rita:8003", [], "");
        llSetTimerEvent (update_speed);
        
    }
    timer ()
    {
        http_request_id = llHTTPRequest ("http://rita:8003", [], "");
    }
    http_response (key request_id, integer status, list metadata, string body)
    {
        if (request_id != http_request_id) return;
        
        v = (float)body;
        v/=255;
        
        llSetPrimitiveParams ([PRIM_GLOW, ALL_SIDES, v]);
    }
    
}
 
