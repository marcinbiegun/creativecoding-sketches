#version 150

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
uniform vec3 spectrum;
uniform sampler2D texture0;
uniform sampler2D texture1;
uniform sampler2D texture2;
uniform sampler2D texture3;
uniform sampler2D prevFrame;

in VertexData
{
   vec4 v_position;
   vec3 v_normal;
   vec2 v_texcoord;
} inData;

out vec4 fragColor;

void main(void)
{
    // consts
    const vec3 background = vec3(0.0);
    const vec3 foreground = vec3(0.33);
    const int scale = 10;
    const int scroll_speed = 5;
    
    // coordinates
    vec2 uv = inData.v_texcoord.xy; // [0, 1] coordinates, starts in left-bottom
    vec2 uvr = (uv - vec2(0.5)) * 2; // [-1, 1] coordinats
    vec2 r = (uvr * resolution.xy)/resolution.y; // [-1.2, 1.2] coordinates, supports ratio

    // scroll image left
    r.x += time / (10.0 / scroll_speed);


    int size = 10 * scale;
    int strip = 20;
    int canvas = 5; // draw more than only inside [0, 1] coords

    int cycle_y = int((r.y + canvas) * size) % strip;

    float displace;
    if (cycle_y % strip < strip/2) {
       displace = r.y;
    } else {
       displace = -r.y;
    }

    float move_x = canvas + displace;
    int cycle_x = int((r.x + move_x) * size) % strip;

    vec3 pixel = background;
    if (cycle_x > 0 && cycle_x < strip/2) {
        pixel = foreground;
    } 
   

    fragColor = vec4(pixel, 1.0);
}
