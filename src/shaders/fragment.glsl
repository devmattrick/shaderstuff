#version 300 es
precision highp float;
in vec2 v_texCoord;
out vec4 fragColor;
uniform sampler2D u_texture;

void main() {
    vec4 redShift = texture(u_texture, v_texCoord + vec2(0.015, -0.015)) * vec4(1.0, 0.0, 0.0, 1.0);
    vec4 greenShift = texture(u_texture, v_texCoord + vec2(0.0, 0.015)) * vec4(0.0, 1.0, 0.0, 1.0);
    vec4 blueShift = texture(u_texture, v_texCoord + vec2(-0.015, 0.0)) * vec4(0.0, 0.0, 1.0, 1.0);

    fragColor = max(texture(u_texture, v_texCoord), max(blueShift, max(greenShift, redShift)));
}
