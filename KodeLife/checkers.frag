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
    float scale = 0.44 + sin(time)/3;
    
    // coordinates
    vec2 uv = inData.v_texcoord.xy; // [0, 1] coordinates, starts in left-bottom
    vec2 uvr = (uv - vec2(0.5)) * 2; // [-1, 1] coordinats
    vec2 r = (uvr * resolution.xy)/resolution.y; // [-1.2, 1.2] coordinates, supports ratio

    vec3 pixel = background;
    bool checked;


    if (mod(r.y, scale) < scale/2) {
        checked = mod(r.x, scale) < scale/2;
    } else {
        checked = mod(r.x, scale) > scale/2;
    }

    if (checked) {
        pixel = foreground;
    } 
   

    fragColor = vec4(pixel, 1.0);
}
