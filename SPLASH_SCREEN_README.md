# ShareBite Splash Screen Integration

## Overview
The splash screen has been successfully integrated into your FoodRescueApp. When users visit your website, they will now see an animated splash screen for 10 seconds before being redirected to the main application.

## Files Created/Modified

### New Files:
1. **`splash.html`** - The main splash screen HTML file
2. **`splash.css`** - Styling and animations for the splash screen
3. **`welcome.jsp`** - Entry point that redirects to the splash screen
4. **`SPLASH_SCREEN_README.md`** - This documentation file

### Modified Files:
1. **`src/main/webapp/WEB-INF/web1.xml`** - Updated welcome file list to include splash screen

## How It Works

1. **Entry Point**: Users visiting your website will first hit `welcome.jsp`
2. **Splash Screen**: `welcome.jsp` automatically redirects to `splash.html`
3. **Animation Sequence**:
   - Initial splash overlay with "ShareBite" text (0-1.5s)
   - Main content fades in (1.5s+)
   - Logo zooms in with shooting star effect (1.6s+)
   - Caption appears with glow effect (2.2s+)
   - Skip button appears (3s+)
4. **Auto-redirect**: After 10 seconds, users are automatically redirected to `index.jsp`
5. **Manual Skip**: Users can click "Skip" button or press Escape key to bypass

## Features

- **10-second countdown timer** with visual display
- **Skip button** that appears after 3 seconds
- **Keyboard shortcut** (Escape key) to skip
- **Smooth animations** with proper timing
- **Responsive design** that works on all devices
- **Branded colors** matching your ShareBite theme (orange: rgb(243, 152, 32))

## Customization

### Timing:
- Modify the `timeLeft` variable in `splash.html` to change duration
- Adjust animation delays in `splash.css`

### Colors:
- Update the orange color `rgb(243, 152, 32)` throughout the CSS
- Modify the shooting star effect colors

### Text:
- Change "Share a meal, Spread a Smile" caption in `splash.html`
- Update the main logo text if needed

## Testing

1. Deploy your application
2. Visit the root URL of your website
3. You should see the splash screen automatically
4. Wait 10 seconds for auto-redirect or use skip options
5. Verify you land on the main ShareBite application

## Troubleshooting

- **Splash doesn't show**: Check that `welcome.jsp` is first in the welcome-file-list
- **Animations not working**: Ensure `splash.css` is properly linked
- **Redirect issues**: Verify `index.jsp` exists and is accessible
- **Timing problems**: Check JavaScript console for errors

## Browser Compatibility

The splash screen uses modern CSS animations and should work on:
- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+

For older browsers, the splash screen will still function but animations may be limited.
