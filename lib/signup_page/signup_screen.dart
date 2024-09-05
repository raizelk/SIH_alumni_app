import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  File? imageFile;

  String? selectedSalutation;
  String? selectedCountry;
  String? selectedDepartment;
  String? selectedYearOfJoining;
  bool agreeToTerms = false;
  bool _isPasswordVisible = false;

  List<String> salutations = ['Mr.', 'Ms.', 'Dr.', 'Prof.'];
  List<String> countries = ['India', 'USA', 'UK', 'Canada'];
  List<String> departments = ['CSE', 'ECE', 'Mechanical', 'Civil'];
  List<String> yearsOfJoining = ['2018', '2019', '2020', '2021'];

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _enrollmentController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();


  void _showImageDialog()
  {
    showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            title: const Text('Please choose an option'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){
                    _getFromCamera();
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.camera,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(color: Colors.blueAccent),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    _getFromGallery();
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.image,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(color: Colors.blueAccent),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  void _getFromCamera() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _getFromGallery() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _cropImage(filePath) async
  {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: filePath, maxHeight: 1080,maxWidth: 1080
    );

    if(croppedImage != null)
      {
        setState(()
        {
          imageFile = File(croppedImage.path);
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: ListView(
              children: [
                Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      const Text(
                        'Alumni Registration',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                      GestureDetector(
                        onTap: ()
                        {
                          _showImageDialog();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width * 0.24,
                            height: size.width * 0.24,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.cyanAccent,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: imageFile == null
                                  ? const Icon(
                                Icons.camera_enhance_sharp,
                                color: Colors.cyanAccent,
                                size: 40,
                              )
                                  : Image.file(
                                imageFile!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: selectedSalutation,
                        dropdownColor: Colors.grey[900],
                        style: const TextStyle(color: Colors.white),
                        items: salutations
                            .map((salutation) => DropdownMenuItem(
                          value: salutation,
                          child: Text(salutation),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedSalutation = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Salutation',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyanAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyanAccent),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your salutation';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        'First Name',
                        _firstNameController,
                        'First name is required',
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        'Last Name',
                        _lastNameController,
                        'Last name is required',
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        'Email',
                        _emailController,
                        'Email is required',
                        emailValidation: true,
                      ),
                      const SizedBox(height: 10),
                      _buildPasswordFormField(
                        'Set Password',
                        _passwordController,
                        'Password is required',
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: selectedCountry,
                        dropdownColor: Colors.grey[900],
                        style: const TextStyle(color: Colors.white),
                        items: countries
                            .map((country) => DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCountry = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Country',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyanAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyanAccent),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your country';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        'City',
                        _cityController,
                        'City is required',
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        'Phone Number',
                        _phoneNumberController,
                        'Phone number is required',
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: selectedDepartment,
                        dropdownColor: Colors.grey[900],
                        style: const TextStyle(color: Colors.white),
                        items: departments
                            .map((department) => DropdownMenuItem(
                          value: department,
                          child: Text(department),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDepartment = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Department',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyanAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyanAccent),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your department';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        'Enrollment Number',
                        _enrollmentController,
                        'Enrollment number is required',
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        'Organization',
                        _organizationController,
                        'Organization is required',
                      ),
                      const SizedBox(height: 10),
                      _buildTextFormField(
                        'LinkedIn Profile',
                        _linkedinController,
                        'LinkedIn profile is required',
                      ),
                      const SizedBox(height: 20),

                      // Checkbox and agreement text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: agreeToTerms,
                            onChanged: (bool? value) {
                              setState(() {
                                agreeToTerms = value!;
                              });
                            },
                            checkColor: Colors.black,
                            activeColor: Colors.cyanAccent,
                          ),
                          const Expanded(
                            child: Text(
                              'I agree that all the information provided above is correct and not false.',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Register button
                      ElevatedButton(
                        onPressed: () {
                          if (_signUpFormKey.currentState!.validate() &&
                              imageFile != null &&
                              agreeToTerms) {
                            // Implement registration logic here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Registered Successfully')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'All fields and image are required. Please make sure to fill out everything.',
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      // Already have an account? Login
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Already have an account? Login',
                          style: TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build a TextFormField with validation
  Widget _buildTextFormField(String label, TextEditingController controller,
      String validationMessage,
      {bool emailValidation = false}) {
    return TextFormField(
      controller: controller,
      keyboardType:
      emailValidation ? TextInputType.emailAddress : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyanAccent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyanAccent),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        if (emailValidation && !value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  // Function to build a password TextFormField with visibility toggle and validation
  Widget _buildPasswordFormField(
      String label, TextEditingController controller, String validationMessage) {
    return TextFormField(
      controller: controller,
      obscureText: !_isPasswordVisible,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyanAccent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyanAccent),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.cyanAccent,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }
}
