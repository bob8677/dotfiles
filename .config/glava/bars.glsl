/* Center line thickness (pixels) */
#define C_LINE 0
/* Width (in pixels) of each bar */
#define BAR_WIDTH 10
/* Width (in pixels) of each bar gap */
#define BAR_GAP 5
/* Outline color */
#define BAR_OUTLINE #262626
/* Outline width (in pixels, set to 0 to disable outline drawing) */
#define BAR_OUTLINE_WIDTH 0
/* Amplify magnitude of the results each bar displays */
#define AMPLIFY 600
/* Whether the current settings use the alpha channel;
   enabling this is required for alpha to function
   correctly on X11 with `"native"` transparency. */
#define USE_ALPHA 0
/* Colors */
#define COLOR1 #5294E2
#define COLOR2 #52E167
#define COLOR3 #E09F52
#define COLOR4 #E0527E
#define COLOR_METHOD COLOR_X
// Can be TOP_ROUND, TOP_PARABOLA, TOP_TRIANGLE, or TOP_SQUARE
#define TOPS TOP_TRIANGLE
/* defintions for color settings */
// Square tops (flat)
#define TOP_SQUARE (1)
// Triangle tops (pointy)
#define TOP_TRIANGLE (d >= v - abs(md+mod(nbars+1,2)/2) - 1 ? d >= v - abs(md+mod(nbars+1,2)/2) ? 0 : 0.5 : 1)
// Parabola tops
#define TOP_PARABOLA (d >= v - exp2(abs(md+mod(nbars+1,2)/2)) - 1 ? d >= v - exp2(abs(md+mod(nbars+1,2)/2)-0.5) ? 0 : 0.5 : 1)
// Rounded tops
#define TOP_ROUND (BAR_WIDTH/2 >= exp2(v - d) - exp2(abs(md+mod(nbars+1,2)/2)+1) ? BAR_WIDTH/2 >= exp2(v - d) - exp2(abs(md+mod(nbars+1,2)/2)) ? 0 : 0.5 : 1)
/* Each color is 1/4th of bar height */
#define COLOR_QUARTER (d >= v/ ? d >= v/2 ? d >= .75*v ? COLOR1 : COLOR2 : COLOR3 : COLOR4)
/* color based on bar x position */
#define COLOR_X (abs(s) >= 9 ? abs(s) >= 27 ? abs(s) >= 45 ? COLOR1 : COLOR2 : COLOR3 : COLOR4)
/* final color defintion */
#define COLOR (COLOR_METHOD * TOPS)
/* Direction that the bars are facing, 0 for inward, 1 for outward */
#define DIRECTION 1
/* Whether to switch left/right audio buffers */
#define INVERT 0
/* Whether to flip the output vertically */
#define FLIP 0
/* Whether to mirror output along `Y = X`, causing output to render on the left side of the window */
/* Use with `FLIP 1` to render on the right side */
#define MIRROR_YX 0
