#version 330 core
out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D screenTexture;
uniform float time;

void main() {
    vec2 center = vec2(0.5, 0.5);
    vec2 toCenter = center - TexCoords;
    float dist = length(toCenter);
    
    // Vortex effect
    float angle = time * 0.5;
    float strength = 0.5;
    vec2 offset = vec2(
        cos(angle) * toCenter.x - sin(angle) * toCenter.y,
        sin(angle) * toCenter.x + cos(angle) * toCenter.y
    ) * strength * dist;
    
    // Chromatic aberration
    vec2 dir = normalize(toCenter) * 0.01;
    vec3 color;
    color.r = texture(screenTexture, TexCoords + offset + dir).r;
    color.g = texture(screenTexture, TexCoords + offset).g;
    color.b = texture(screenTexture, TexCoords + offset - dir).b;

    // Vignette
    float vignette = 1.0 - dist * 1.5;
    vignette = clamp(vignette, 0.0, 1.0);
    
    FragColor = vec4(color * vignette, 1.0);
}
