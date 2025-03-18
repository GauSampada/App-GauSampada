// ignore_for_file: constant_identifier_names

import 'package:flutter_localization/flutter_localization.dart';

List<MapLocale> locale = [
  const MapLocale('en', AppLocale.en),
  const MapLocale('tel', AppLocale.tel),
  const MapLocale('hin', AppLocale.hin),
];

mixin AppLocale {
  static const String title = 'title';

  // Onboarding Screen Titles
  static const String onboarding_screen1_title = 'onboarding_screen1_title';
  static const String onboarding_screen2_title = 'onboarding_screen2_title';
  static const String onboarding_screen3_title = 'onboarding_screen3_title';
  static const String onboarding_screen4_title = 'onboarding_screen4_title';
  static const String onboarding_screen5_title = 'onboarding_screen5_title';
  static const String new_title = 'new_title';
  static const String learn_more = 'learn_more';

  // Onboarding Screen Descriptions
  static const String onboarding_screen1_desc = 'onboarding_screen1_desc';
  static const String onboarding_screen2_desc = 'onboarding_screen2_desc';
  static const String onboarding_screen3_desc = 'onboarding_screen3_desc';
  static const String onboarding_screen4_desc = 'onboarding_screen4_desc';
  static const String onboarding_screen5_desc = 'onboarding_screen5_desc';

  // Navigation Buttons
  static const String next_btn = 'next_btn';
  static const String skip_btn = 'skip_btn';
  static const String get_started_btn = 'get_started_btn';

  //Login & SignUp Screens
  static const String signupScreenTitle = "signup_screen_title";
  static const String signupScreenSubtitle = "signup_screen_subtitle";
  static const String signupNameLabel = "signup_name_label";
  static const String signupNameHint = "signup_name_hint";
  static const String signupEmailLabel = "signup_email_label";
  static const String signupEmailHint = "signup_email_hint";
  static const String signupPasswordLabel = "signup_password_label";
  static const String signupPasswordHint = "signup_password_hint";
  static const String signupPhoneLabel = "signup_phone_label";
  static const String signupPhoneHint = "signup_phone_hint";
  static const String signupButton = "signup_button";
  static const String signupGoogleButton = "signup_google_button";
  static const String signupAlreadyHaveAccount = "signup_already_have_account";
  static const String signupFillAllFields = "signup_fill_all_fields";
  static const String signupNameRequired = "signup_name_required";
  static const String signupEmailRequired = "signup_email_required";
  static const String signupEmailInvalid = "signup_email_invalid";
  static const String signupPasswordRequired = "signup_password_required";
  static const String signupPhoneRequired = "signup_phone_required";

  //Login
  static const String welcomeBack = "welcomeBack";
  static const String accessYourAccount = "accessYourAccount";
  static const String loginWithGoogle = "loginWithGoogle";
  static const String dontHaveAccount = "dontHaveAccount";
  static const String login = "login";
  static const String or = "or";
  static const String forgotPassword = "forgotPassword";

  // Home
  static const String cow_health_monitoring = "cow_health_monitoring";
  static const String milk_production_tracking = "milk_production_tracking";
  static const String community_for_farmers = "community_for_farmers";
  static const String smart_nutrition_suggestions =
      "smart_nutrition_suggestions";
  static const String automated_breeding_guidance =
      "automated_breeding_guidance";

  //Feed
  static const gau_sampada = "gau_sampada";
  static const location = "location";
  static const notifications = "notifications";
  static const breed_information = "breed_information";
  static const dairy_products = "dairy_products";
  static const my_orders = "my_orders";
  static const welcome_back = "welcome_back";
  static const home = "home";
  static const market = "market";
  static const ai_diagnosis = "ai_diagnosis";
  static const breed_info = "breed_info";
  static const profile = "profile";
  static const settings = "settings";
  static const sign_out = "sign_out";
  static const log_out = "log_out";
  static const confirm_logout = "confirm_logout";
  static const cancel = "cancel";
  static const yes = "yes";

  static const Map<String, dynamic> en = {
    title: 'GauSampada',

    // Titles
    onboarding_screen1_title: "Welcome to GauSampada!",
    onboarding_screen2_title: "AI-Powered Disease Detection & Prevention",
    onboarding_screen3_title: "Sell Dairy Products Effortlessly",
    onboarding_screen4_title: "Find Nearby Farmers & Buyers",
    onboarding_screen5_title: "Veterinary Doctor Appointments",
    new_title: 'AI Assistance for Cow Health',
    learn_more: 'Learn More',
    // Descriptions
    onboarding_screen1_desc:
        "Connect with farmers and buyers through markets, cooperatives, and online platforms for fair pricing.",
    onboarding_screen2_desc:
        "AI detects diseases early, monitors vitals, optimizes nutrition, and sends alerts for better cattle health.",
    onboarding_screen3_desc:
        "Successful sales need smart pricing, inventory, and engagement, plus quality supply and marketing.",
    onboarding_screen4_desc:
        "Smart pricing, inventory, and engagement boost sales and quality.",
    onboarding_screen5_desc:
        "Veterinarians analyze cow health data for accurate diagnosis, timely treatment, and scheduling.",

    // Buttons
    next_btn: "Next",
    skip_btn: "Skip",
    get_started_btn: "Get Started",

    //For Login & Signup
    signupScreenTitle: "Onboard!",
    signupScreenSubtitle: "Create an account to start your journey",
    signupNameLabel: "Name",
    signupNameHint: "Enter Your Name",
    signupEmailLabel: "Email",
    signupEmailHint: "Enter Your Email",
    signupPasswordLabel: "Password",
    signupPasswordHint: "Enter Your Password",
    signupPhoneLabel: "Phone Number",
    signupPhoneHint: "Enter Your Mobile Number",
    signupButton: "Sign Up",
    signupGoogleButton: "Sign Up With Google",
    signupAlreadyHaveAccount: "Already Have an Account?",
    signupFillAllFields: "Fill All Fields!",
    signupNameRequired: "Name is required",
    signupEmailRequired: "Email is required",
    signupEmailInvalid: "Enter a valid email",
    signupPasswordRequired: "Password is required",
    signupPhoneRequired: "Please enter a valid phone number",

    //Login
    welcomeBack: "Welcome back!",
    accessYourAccount: "Access your account to continue your journey",
    loginWithGoogle: "Login With Google",
    dontHaveAccount: "Don't have an Account?",
    login: "Log In",
    or: "Or",
    forgotPassword: "Forgot Password",

    //Home
    cow_health_monitoring: "Monitor cow health in real-time",
    milk_production_tracking: "Track milk production & yield",
    community_for_farmers: "Join the farmers' community",
    smart_nutrition_suggestions: "Get AI-powered nutrition suggestions",
    automated_breeding_guidance: "Receive automated breeding guidance",

    //Feed
    gau_sampada: "GauSampada",
    location: "Location",
    notifications: "Notifications",
    breed_information: "Breed Information",
    dairy_products: "Dairy Products",
    my_orders: "My Orders",
    welcome_back: "Welcome Back!",
    home: "Home",
    market: "Market",
    ai_diagnosis: "AI Diagnosis",
    breed_info: "Breed Info",
    profile: "Profile",
    settings: "Settings",
    sign_out: "Sign Out",
    log_out: "Log Out",
    confirm_logout: "Are you sure you want to Log Out?",
    cancel: "Cancel",
    yes: "Yes"
  };

  static const Map<String, dynamic> tel = {
    title: 'గౌసంపద',

    // Titles
    onboarding_screen1_title: "గౌసంపదకు స్వాగతం!",
    onboarding_screen2_title: "AI ఆధారిత వ్యాధి గుర్తింపు మరియు నివారణ",
    onboarding_screen3_title: "పాల ఉత్పత్తులను సులభంగా అమ్మండి",
    onboarding_screen4_title: "సమీప రైతులను & కొనుగోలుదారులను కనుగొనండి",
    onboarding_screen5_title: "పశువైద్యుడి అపాయింట్మెంట్లు",
    new_title: 'ఆవుల ఆరోగ్యానికి AI సహాయం',
    learn_more: 'మరింత తెలుసుకోండి',

    // Descriptions
    onboarding_screen1_desc:
        "రైతులు మరియు కొనుగోలుదారులతో మార్కెట్లు, సహకార సంస్థలు, ఆన్‌లైన్ ప్లాట్‌ఫారమ్‌ల ద్వారా సరసమైన ధరకు కనెక్ట్ అవ్వండి.",
    onboarding_screen2_desc:
        "AI వ్యాధులను తొందరగా గుర్తిస్తుంది, ఆరోగ్య సూచకాలను పర్యవేక్షిస్తుంది, పోషణను మెరుగుపరుస్తుంది మరియు గౌవు ఆరోగ్యానికి అలర్ట్‌లు పంపుతుంది.",
    onboarding_screen3_desc:
        "విజయవంతమైన అమ్మకాల కోసం తెలివైన ధర నిర్ణయం, నిల్వ నిర్వహణ, నాణ్యమైన సరఫరా మరియు మార్కెటింగ్ అవసరం.",
    onboarding_screen4_desc:
        "తెలివైన ధర నిర్ణయం, నిల్వ నిర్వహణ మరియు వినియోగదారుల భాగస్వామ్యం అమ్మకాల నాణ్యతను పెంచుతుంది.",
    onboarding_screen5_desc:
        "పశువైద్యులు గౌవు ఆరోగ్య డేటాను విశ్లేషించి ఖచ్చితమైన రోగ నిర్ధారణ, సమయపాలన చికిత్స మరియు అపాయింట్‌మెంట్ షెడ్యూలింగ్ అందిస్తారు.",

    // Buttons
    next_btn: "తరువాత",
    skip_btn: "దాటవేయి",
    get_started_btn: "ప్రారంభించండి",

    // Signup & Login
    signupScreenTitle: "ఓన్బోర్డ్!",
    signupScreenSubtitle: "మీ ప్రయాణాన్ని ప్రారంభించడానికి ఖాతాను సృష్టించండి",
    signupNameLabel: "పేరు",
    signupNameHint: "మీ పేరు నమోదు చేయండి",
    signupEmailLabel: "ఇమెయిల్",
    signupEmailHint: "మీ ఇమెయిల్ నమోదు చేయండి",
    signupPasswordLabel: "పాస్‌వర్డ్",
    signupPasswordHint: "మీ పాస్‌వర్డ్ నమోదు చేయండి",
    signupPhoneLabel: "ఫోన్ నంబర్",
    signupPhoneHint: "మీ మొబైల్ నంబర్ నమోదు చేయండి",
    signupButton: "సైన్ అప్",
    signupGoogleButton: "   తో సైన్ అప్ చేయండి",
    signupAlreadyHaveAccount: "ఇప్పటికే ఖాతా ఉందా?",
    signupFillAllFields: "అన్ని ఫీల్డ్‌లను పూర్తి చేయండి!",
    signupNameRequired: "పేరు అవసరం",
    signupEmailRequired: "ఇమెయిల్ అవసరం",
    signupEmailInvalid: "సరిగ్గా ఇమెయిల్ నమోదు చేయండి",
    signupPasswordRequired: "పాస్‌వర్డ్ అవసరం",
    signupPhoneRequired: "దయచేసి సరైన ఫోన్ నంబర్ నమోదు చేయండి",

    //Login
    welcomeBack: "మళ్ళీ స్వాగతం!",
    accessYourAccount:
        "మీ ప్రయాణాన్ని కొనసాగించడానికి మీ ఖాతాలో లాగిన్ అవ్వండి",
    loginWithGoogle: "    తో లాగిన్ అవ్వండి",
    dontHaveAccount: "ఖాతా లేనివారా?",
    login: "లాగిన్",
    or: "లేదా",
    forgotPassword: "పాస్వర్డ్ మర్చిపోయారా?",

    //Home & Feed
    cow_health_monitoring: "నిజమైన-సమయంలో గోవు ఆరోగ్యాన్ని పర్యవేక్షించండి",
    milk_production_tracking: "పాలు ఉత్పత్తి & దిగుబడిని ట్రాక్ చేయండి",
    community_for_farmers: "రైతుల కమ్యూనిటీలో చేరండి",
    smart_nutrition_suggestions: "AI ఆధారిత పోషకాహార సూచనలు పొందండి",
    automated_breeding_guidance: "ఆటోమేటెడ్ బ్రిడింగ్ మార్గదర్శకాన్ని పొందండి",
    gau_sampada: "గౌసంపద",
    location: "స్థానం",
    notifications: "ప్రకటనలు",
    breed_information: "జాతి సమాచారం",
    dairy_products: "పాల ఉత్పత్తులు",
    my_orders: "నా ఆర్డర్లు",
    welcome_back: "మళ్ళీ స్వాగతం!",
    home: "హోమ్",
    market: "మార్కెట్",
    ai_diagnosis: "AI డయాగ్నోసిస్",
    breed_info: "జాతి సమాచారం",
    profile: "ప్రొఫైల్",
    settings: "సెట్టింగ్‌లు",
    sign_out: "సైన్ అవుట్",
    log_out: "లాగ్ అవుట్",
    confirm_logout: "మీరు ఖచ్చితంగా లాగ్ అవుట్ కావాలా?",
    cancel: "రద్దు",
    yes: "అవును"
  };

  static const Map<String, dynamic> hin = {
    title: 'गौसंपदा',

    // Titles
    onboarding_screen1_title: "गौसंपदा में आपका स्वागत है!",
    onboarding_screen2_title: "एआई-समर्थित बीमारी की पहचान और रोकथाम",
    onboarding_screen3_title: "डेयरी उत्पादों को आसानी से बेचें",
    onboarding_screen4_title: "निकटतम किसान और खरीदार खोजें",
    onboarding_screen5_title: "पशु चिकित्सक नियुक्तियाँ",
    new_title: 'गाय के स्वास्थ्य के लिए AI सहायता',
    learn_more: 'अधिक जानें',

    // Descriptions
    onboarding_screen1_desc:
        "किसानों और खरीदारों से जुड़ें बाजारों, सहकारी समितियों और ऑनलाइन प्लेटफार्मों के माध्यम से उचित मूल्य पर।",
    onboarding_screen2_desc:
        "एआई बीमारियों का जल्दी पता लगाता है, स्वास्थ्य संकेतकों की निगरानी करता है, पोषण को अनुकूलित करता है और बेहतर मवेशी स्वास्थ्य के लिए अलर्ट भेजता है।",
    onboarding_screen3_desc:
        "सफल बिक्री के लिए स्मार्ट मूल्य निर्धारण, इन्वेंटरी प्रबंधन, गुणवत्ता आपूर्ति और विपणन आवश्यक है।",
    onboarding_screen4_desc:
        "स्मार्ट मूल्य निर्धारण, इन्वेंटरी प्रबंधन और जुड़ाव बिक्री और गुणवत्ता को बढ़ावा देता है।",
    onboarding_screen5_desc:
        "पशु चिकित्सक सटीक निदान, समय पर उपचार और अपॉइंटमेंट शेड्यूलिंग के लिए गाय के स्वास्थ्य डेटा का विश्लेषण करते हैं।",

    // Buttons
    next_btn: "आगे",
    skip_btn: "छोड़ें",
    get_started_btn: "शुरू करें",

    // Signup & Login
    signupScreenTitle: "ऑनबोर्ड!",
    signupScreenSubtitle: "अपना सफर शुरू करने के लिए खाता बनाएं",
    signupNameLabel: "नाम",
    signupNameHint: "अपना नाम दर्ज करें",
    signupEmailLabel: "ईमेल",
    signupEmailHint: "अपना ईमेल दर्ज करें",
    signupPasswordLabel: "पासवर्ड",
    signupPasswordHint: "अपना पासवर्ड दर्ज करें",
    signupPhoneLabel: "फोन नंबर",
    signupPhoneHint: "अपना मोबाइल नंबर दर्ज करें",
    signupButton: "साइन अप",
    signupGoogleButton: "  के साथ साइन अप करें",
    signupAlreadyHaveAccount: "पहले से खाता है?",
    signupFillAllFields: "सभी फ़ील्ड भरें!",
    signupNameRequired: "नाम आवश्यक है",
    signupEmailRequired: "ईमेल आवश्यक है",
    signupEmailInvalid: "एक मान्य ईमेल दर्ज करें",
    signupPasswordRequired: "पासवर्ड आवश्यक है",
    signupPhoneRequired: "कृपया एक मान्य फोन नंबर दर्ज करें",

    //Login
    welcomeBack: "फिर से स्वागत है!",
    accessYourAccount: "अपना खाता एक्सेस करें और अपनी यात्रा जारी रखें",
    loginWithGoogle: "   के साथ लॉगिन करें",
    dontHaveAccount: "खाता नहीं है?",
    login: "लॉग इन",
    or: "या",
    forgotPassword: "पासवर्ड भूल गए?",

    //Home & Feed
    cow_health_monitoring: "गाय के स्वास्थ्य की वास्तविक समय में निगरानी करें",
    milk_production_tracking: "दूध उत्पादन और उपज को ट्रैक करें",
    community_for_farmers: "किसानों के समुदाय से जुड़ें",
    smart_nutrition_suggestions: "एआई-संचालित पोषण सुझाव प्राप्त करें",
    automated_breeding_guidance: "स्वचालित प्रजनन मार्गदर्शन प्राप्त करें",
    gau_sampada: "गौ संपदा",
    location: "स्थान",
    notifications: "सूचनाएं",
    breed_information: "नस्ल जानकारी",
    dairy_products: "डेयरी उत्पाद",
    my_orders: "मेरे आदेश",
    welcome_back: "फिर से स्वागत है!",
    home: "होम",
    market: "बाज़ार",
    ai_diagnosis: "एआई निदान",
    breed_info: "नस्ल जानकारी",
    profile: "प्रोफाइल",
    settings: "सेटिंग्स",
    sign_out: "साइन आउट",
    log_out: "लॉग आउट",
    confirm_logout: "क्या आप लॉग आउट करना चाहते हैं?",
    cancel: "रद्द करें",
    yes: "हाँ"
  };
}
