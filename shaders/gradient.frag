#version 460 core

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform vec4 uColor1;
uniform vec4 uColor2;
out vec4 fragColor;

void main() {
  vec2 st = FlutterFragCoord() / uSize;

  //change st.x to st.y for vertical gradient
  fragColor = mix(uColor1, uColor2, st.x);
}