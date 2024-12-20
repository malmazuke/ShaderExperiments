#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 passthrough(float2 position, half4 color) {
    return color;
}

[[ stitchable ]] half4 recolour(float2 position, half4 color) {
    return half4(1, 0, 0, color.a);
}

[[ stitchable ]] half4 invertAlpha(float2 position, half4 color) {
    return half4(1, 0, 0, 1 - color.a);
}

[[ stitchable ]] half4 gradient(float2 position, half4 color) {
    return half4(
        position.x / position.y,
        0,
        position.y / position.x,
        color.a
    );
}
