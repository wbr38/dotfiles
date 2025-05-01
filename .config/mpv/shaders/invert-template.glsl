//!HOOK LUMA
//!BIND HOOKED

// float strength = 0.95;
float strength = __STRENGTH__;
// vec4 hook()
// {
//     float luma = LUMA_texOff(1).x;
//     float invertedLuma = mix(luma, 1.0 - luma, strength);
//     return vec4(vec3(invertedLuma), 1.0);
// }

// https://chatgpt.com/c/67fbb195-fc50-800c-a59d-39f289d89d85
vec4 hook()
{
    vec2 uv = HOOKED_pos;
    vec2 texel = vec2(1.0 / HOOKED_size.x, 1.0 / HOOKED_size.y);

    // Fetch center and neighbors
    vec3 center = HOOKED_tex(uv).rgb;
    vec3 left   = HOOKED_tex(uv - vec2(texel.x, 0)).rgb;
    vec3 right  = HOOKED_tex(uv + vec2(texel.x, 0)).rgb;
    vec3 up     = HOOKED_tex(uv - vec2(0, texel.y)).rgb;
    vec3 down   = HOOKED_tex(uv + vec2(0, texel.y)).rgb;

    // Luminance (perceived brightness)
    float lum = dot(center, vec3(0.299, 0.587, 0.114));

    // Edge detection: if contrast with neighbors is high, likely handwriting
    float lum_left  = dot(left, vec3(0.299, 0.587, 0.114));
    float lum_right = dot(right, vec3(0.299, 0.587, 0.114));
    float lum_up    = dot(up, vec3(0.299, 0.587, 0.114));
    float lum_down  = dot(down, vec3(0.299, 0.587, 0.114));

    float edge_strength = max(
        abs(lum - lum_left),
        max(
            abs(lum - lum_right),
            max(abs(lum - lum_up), abs(lum - lum_down))
        )
    );

    // Base inversion
    vec3 inverted = vec3(1.0) - center;

    // Adjusted blend with inversion
    vec3 mixed = mix(center, inverted, strength);

    // Heuristic:
    // - Allow full inversion on bright pixels
    // - Reduce inversion on dark areas (hands), *unless* it's a sharp edge (i.e. handwriting)
    float suppression = smoothstep(0.0, 0.3, lum); // suppress dark
    float edge_boost = smoothstep(0.05, 0.2, edge_strength); // preserve edges

    float blend_factor = strength * max(suppression, edge_boost);

    vec3 final_color = mix(center, mixed, blend_factor);

    return vec4(final_color, 1.0);
}
