# ShareBite Splash Screen - 4 Second Setup

## 🎯 **Current Configuration:**

### **Welcome File Order:**
1. **`splash.html`** ← **FIRST** (4-second animated splash screen)
2. `splash.jsp` (backup JSP version)
3. `welcome.jsp` (redirect page)
4. `index.jsp` (main ShareBite application)

### **What Happens Now:**
1. **User visits website** → **`splash.html` loads automatically**
2. **Splash screen shows for 5 seconds** with animations
3. **After 5 seconds** → **Automatically redirects to `index.jsp`**
4. **No skip option available** → Users must wait for the full 5 seconds

## ⏱️ **Timing:**
- **Total duration**: 5 seconds
- **Skip button appears**: After 0.5 seconds
- **Auto-redirect**: After 5 seconds

## 🚀 **To Test in Eclipse:**
1. **Right-click on project** → **Run As** → **Run on Server**
2. **Choose Tomcat server**
3. **Start the server**
4. **Visit your application URL**
5. **You should see the splash screen immediately**
6. **Wait 4 seconds or click Skip**
7. **Verify you land on the main ShareBite page**

## 🔧 **Files Used:**
- **`splash.html`** - Main splash screen (5 seconds)
- **`splash.css`** - Styling and animations
- **`web1.xml`** - Configuration (splash.html is first)
- **`index.jsp`** - Main application page

## ✅ **Expected Result:**
- Splash screen loads **automatically** on startup
- Shows for **exactly 4 seconds**
- **No manual clicking** required
- Smooth transition to main application
