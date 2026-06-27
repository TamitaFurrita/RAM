float hash(vec2 p)
{
    return fract(
        sin(dot(p, vec2(127.1, 311.7))) *
        43758.5453123
    );
}

float noise(vec2 p)
{
    vec2 i = floor(p);
    vec2 f = fract(p);

    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(
        mix(a, b, u.x),
        mix(c, d, u.x),
        u.y
    );
}

vec4 ProcessTexel()
{
    vec2 uv = vTexCoord.st;

    float strength = uv.y * uv.y;

    float n = noise(
        vec2(
            uv.x * 4.0,
            uv.y * 6.0 - timer * 2
        )
    );

    uv.x += (n * 2.0 - 1.0) * 0.05 * strength;

    return texture(tex, uv);
}