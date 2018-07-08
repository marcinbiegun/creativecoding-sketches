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
   vec3 pixel;
   vec3 red = vec3(0.5, 0.1, 0.1);
   vec3 green = vec3(0.1, 0.2, 0.1);
   vec3 black = vec3(0.0, 0.0, 0.0);

   vec2 uv = inData.v_texcoord.xy; // [0, 1] coordinates, starts in left-bottom
   vec2 uvr = (uv - vec2(0.5)) * 2; // [-1, 1] coordinats
   vec2 r = (uvr * resolution.xy)/resolution.y; // [-1.2, 1.2] coordinates, supports ratio


   pixel = black;


   // draw lines
   const float tickWidth = 0.1;
   for(float i=-2.0; i<2.0; i+=tickWidth) {
       if (abs(r.x - i) < 0.005) { pixel = green; }
       if (abs(r.y - i) < 0.005) { pixel = green; }
   }

   // draw axes
   if( abs(r.x)<0.005 ) pixel = red;
   if( abs(r.y)<0.005 ) pixel = red;


   fragColor = vec4(pixel, 1.0);
}
