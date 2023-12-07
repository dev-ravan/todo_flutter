// ignore_for_file: unused_field, unused_local_variable
import 'package:todo_app/Utils/exports.dart';
import 'package:http/http.dart' as http;

class ProfileProvider extends ChangeNotifier {
  //? Navigation
  final GoRouter _router;
  ProfileProvider(this._router);

  //? Global form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //? Loading
  bool isLoading = false;

  //? Pick image file
  File? _image;
  String? _base64Img;
  File? get image => _image;
  String? get base64Img => _base64Img;
  XFile? pickedFile;

  //? Text Editing Controllers
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final mobileController = TextEditingController();
  final ageController = TextEditingController();
  final pinCodeController = TextEditingController();
  final skillsController = TextEditingController();
  final linkedInController = TextEditingController();

  // ? List of Items
  List skillsList = [];

  // ? Gender Drop down value
  int genderValue = 0;

  //? Login Form Items
  String title = "Profile";
  String subTitle = "Require information for account creation";
  final email = FormItems(
      hintText: "Email",
      errorMsg: "Please enter a valid email",
      formatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
              r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
              r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
              r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
              r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
              r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
              r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'),
        ),
      ]);

  final name = FormItems(hintText: "Name", errorMsg: "Please enter your name");

  final mobile =
      FormItems(hintText: "Mobile Number", errorMsg: "Please enter number");

  final address =
      FormItems(hintText: "Address", errorMsg: "Please enter address");

  final pinCode =
      FormItems(hintText: "Pin Code", errorMsg: "Please enter pin code");

  final gender =
      FormItems(hintText: " Gender", errorMsg: "Please enter gender");

  final skills =
      FormItems(hintText: "Skills", errorMsg: "Please add your skills");

  final linkedInUrl = FormItems(
      hintText: "LinkedIn Url", errorMsg: "Please enter linkedIn url");

  final age = FormItems(hintText: "Age", errorMsg: "Please enter age");

  //? [Validations]

  // Email Validation
  String? emailValidation(String? val) => val == null ? email.errorMsg : null;

  String? commonValidation(String? val) =>
      val!.isEmpty ? "Please fill the empty field" : null;

  String? dropDownValidation(int? val) =>
      val == null ? "Please fill the empty field" : null;

  // Get image from device
  Future getImage() async {
    pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _image = File(pickedFile!.path);
    notifyListeners();
    return _image;
  }

  //? Convert image to base64
  void convertImageToBase64() async {
    // Pick and encode image
    File imageFile = await getImage();
    List<int> imageBytes = imageFile.readAsBytesSync();
    _base64Img = base64Encode(imageBytes);

    // Print the base64 string
    // print(_base64Img);
  }

  void postProfile() async {
    // Additional fields
    String name = nameController.text;
    String age = ageController.text;
    String pinCode = pinCodeController.text;
    String gender = genderValue.toString();
    String mobileNumber = mobileController.text;
    String email = emailController.text;
    String address = addressController.text;
    String linkedInUrl = linkedInController.text;

    // Create multipart request
    var uri = Uri.parse("http://localhost:2323/bio-data");
    var request = http.MultipartRequest("POST", uri);

    // Attach file to request
    request.files.add(await http.MultipartFile.fromPath(
      "profile",
      image!.path,
    ));

    // Attach additional fields
    request.fields['name'] = name;
    request.fields['age'] = age.toString();
    request.fields['pin_code'] = pinCode;
    request.fields['gender'] = gender.toString();
    request.fields['skills'] = jsonEncode(skillsList);
    request.fields['phone_number'] = mobileNumber;
    request.fields['email_id'] = email;
    request.fields['address'] = address;
    request.fields['linkedin_url'] = linkedInUrl;
    request.fields['no_of_views'] = "0";
    request.fields['profile_url'] = "-";

    // Send request
    try {
      var response = await request.send();

      // Handle response
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print("Upload successful! Response: $responseBody");
      } else {
        print("Upload failed with status: ${response.statusCode}");
      }
    } catch (error) {
      print("Error sending request: $error");
    }
  }

  //? List items

  List genderList = [
    {"gender": "Male", "value": 0},
    {"gender": "Female", "value": 1}
  ];

  // ? Add Skills
  addSkills() {
    if (skillsController.text != "") {
      skillsList.add(skillsController.text);
    }
    skillsController.clear();
    notifyListeners();
    print(skillsList);
  }

  // ? Remove Skills
  removeSkills({required int index}) {
    skillsList.removeAt(index);
    notifyListeners();
    print(skillsList);
  }

  //? It changes the loading state
  setLoading(bool loading) async {
    isLoading = loading;
    notifyListeners();
  }

  //? Submit the profile form
  void submitForm() {
    if (formKey.currentState!.validate()) {
      postProfile();
    } else {
      print("Sign up failed...");
    }
  }

  //? Reset profile Form
  void resetForm() => formKey.currentState?.reset();
}
