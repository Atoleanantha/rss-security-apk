import 'package:cloudinary_public/cloudinary_public.dart';

import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
import 'registration_step2.dart';
import 'package:flutter/foundation.dart';

class RegistrationStep1 extends StatefulWidget {
  const RegistrationStep1({super.key});

  @override
  State<RegistrationStep1> createState() => _RegistrationStep1State();
}

class _RegistrationStep1State extends State<RegistrationStep1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _gender = "Male";
  String? _selectedIdType = 'ID';
  String? _pdfFileName;
  // PlatformFile? _uploadedFile;

  // Method to handle file selection
  // Future<void> _pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf', 'jpeg'],
  //   );
  //
  //   if (result != null) {
  //     setState(() {
  //       _pdfFileName = result.files.single.name;
  //       _uploadedFile = result.files.single;
  //     });
  //   }
  // }

  Future<void> uploadPdfToCloudinary() async {
    // // Configure Cloudinary with your Cloud Name and Upload Preset
    // final cloudinary = CloudinaryPublic('<your-cloud-name>', '<your-upload-preset>', cache: false);
    //
    // try {
    //   // Open file picker to select a PDF
    //   const XTypeGroup typeGroup = XTypeGroup(
    //     label: 'images',
    //     extensions: <String>['jpg', 'png'],
    //   );
    //   final XFile? file =
    //   await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
    //
    //   if (file != null) {
    //     final filePath = file.path;
    //
    //     // Upload the selected file to Cloudinary
    //     final response = await cloudinary.uploadFile(
    //       CloudinaryFile.fromFile(
    //         filePath,
    //         resourceType: CloudinaryResourceType.Auto,
    //       ),
    //     );
    //
    //     // Print the secure URL of the uploaded file
    //     print('Upload successful: ${response.secureUrl}');
    //   } else {
    //     print('No file selected.');
    //   }
    // } catch (e) {
    //   print('Error uploading PDF: $e');
    // }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // if (_uploadedFile == null) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text("Please upload your ID file.")),
      //   );
      //   return;
      // }

      // Collect data
      final formData = {
        "fullName": _nameController.text.trim(),
        "mobile": _mobileController.text.trim(),
        "email": _emailController.text.trim(),
        "gender": _gender,
        "idType": _selectedIdType,
        // "uploadedFile": _uploadedFile,
      };

      // Navigate to the next step with data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationStep2(data: formData),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
        backgroundColor: const Color.fromRGBO(211, 209, 216, 0.25),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWeb = constraints.maxWidth > 600;

          return Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (isWeb)
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          "assets/logo.png",
                          width: 66,
                          height: 69,
                          alignment: Alignment.topLeft,
                        ),
                      ),
                    if (isWeb)
                      Text(
                        "Registration",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isWeb ? 30 : 27,
                          color: Colors.black,
                        ),
                      ),
                    if (isWeb) const SizedBox(height: 10),
                    if (isWeb)
                      const Text(
                        "Fill this form below to complete your registration.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color.fromRGBO(91, 91, 94, 1),
                        ),
                      ),
                    if (isWeb) const SizedBox(height: 10),
                    Container(
                      width: isWeb
                          ? constraints.maxWidth * 0.5
                          : constraints.maxWidth,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: isWeb ? Colors.white : Colors.transparent,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: isWeb
                              ? const EdgeInsets.all(30.0)
                              : const EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (isWeb) const SizedBox(height: 20),
                              // Step Indicator
                              isWeb
                                  ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor:
                                      Color.fromRGBO(237, 27, 36, 1),
                                      radius: 12,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: constraints.maxWidth * 0.2,
                                      child: LinearProgressIndicator(
                                        value: 0.5,
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                        const AlwaysStoppedAnimation<
                                            Color>(
                                          Color.fromRGBO(237, 27, 36, 1),
                                        ),
                                        minHeight: 8,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.grey[300],
                                      child: const Text(
                                        "2",
                                        style: TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  : const Center(
                                child: Text(
                                  "1/2",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 27,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Input Fields
                              _buildTextField(
                                controller: _nameController,
                                label: 'Full Name',
                              ),
                              const SizedBox(height: 8),

                              _buildTextField(
                                controller: _mobileController,
                                label: 'Mobile',
                                inputType: TextInputType.number,
                              ),
                              const SizedBox(height: 8),

                              _buildTextField(
                                controller: _emailController,
                                label: 'Email',
                                inputType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 8),

                              const Text(
                                "Select Gender",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: "Male",
                                    groupValue: _gender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    },
                                  ),
                                  const Text("Male",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Radio<String>(
                                    value: "Female",
                                    groupValue: _gender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    },
                                  ),
                                  const Text("Female",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 10),

                              _buildDropdown(),
                              const SizedBox(height: 10),

                              _buildFileUpload(),
                              const SizedBox(height: 20),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color.fromRGBO(237, 27, 36, 1),
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: _handleSubmit,
                                child: const Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType inputType = TextInputType.text,
  }) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(198, 198, 198, 1)),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            color: Color.fromRGBO(91, 91, 94, 1),
            fontSize: 14,
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      width: double.infinity,
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(198, 198, 198, 1)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "ID Type",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromRGBO(143, 143, 145, 1),
              ),
            ),
          ),
          SizedBox(
            height: 35,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedIdType,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: <String>['ID', 'Driver\'s License', 'National ID']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedIdType = newValue;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileUpload() {
    return Container(
      width: double.infinity,
      height: 65,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(198, 198, 198, 1)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upload ID",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color.fromRGBO(143, 143, 145, 1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _pdfFileName != null ? "Selected File: $_pdfFileName" : "No file",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              GestureDetector(
                // onTap: _pickFile,
                onTap: (){
                  uploadPdfToCloudinary();
                },
                child: const Text(
                  "Choose File",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromRGBO(143, 143, 145, 1)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
