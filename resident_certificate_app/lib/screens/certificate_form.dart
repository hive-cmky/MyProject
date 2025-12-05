// import 'package:flutter/material.dart';
// import '../widgets/form_widgets.dart';


// class CertificateFormScreen extends StatefulWidget {

//   @override
//   _CertificateFormScreenState createState() => _CertificateFormScreenState();
// }

// class _CertificateFormScreenState extends State<CertificateFormScreen> {
//   final _formKey = GlobalKey<FormState>();

//   // personal details
//   TextEditingController memberNameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController motherNameController = TextEditingController();

//   // address details
//   TextEditingController cityController = TextEditingController();
//   TextEditingController policeStationController = TextEditingController();
//   TextEditingController postOfficeController = TextEditingController();
//   TextEditingController yearsController = TextEditingController();
//   TextEditingController monthsController = TextEditingController();

//   // other details
//   TextEditingController placeController = TextEditingController();
//   TextEditingController captchaController = TextEditingController();

//   // dropdown values
//   String? selectedGender;
//   String? selectedMaritalStatus;
//   String? selectedDistrict;
//   String? selectedTehsil;
//   String? selectedVillage;
//   String? selectedRI;
//   String? selectedPurpose;
//   String? selectedApplyOffice;

//   bool sameAsPresentAddress = false;
//   bool agreeToTerms = false;
//   String captchaText = 'A1B2C3';

//   List<String> genderOptions = ['Select', 'Male', 'Female', 'Other'];
//   List<String> maritalOptions = ['Select', 'Single', 'Married', 'Divorced', 'Widowed'];
//   List<String> districtOptions = ['Select', 'District 1', 'District 2'];
//   List<String> tehsilOptions = ['Select', 'Tehsil 1', 'Tehsil 2'];
//   List<String> villageOptions = ['Select', 'Village 1', 'Village 2'];
//   List<String> riOptions = ['Select', 'RI 1', 'RI 2', 'RI 3'];
//   List<String> purposeOptions = ['Select', 'Educaiton', 'Employment', 'Government Scheme', 'Passport', 'Legal Purposes', 'Other'];
//   List<String> otherPersonOptions = ['Select', 'Yes', 'No'];

//   @override
//   void initState() {
//     super.initState();
//     _generateCaptcha();
//   }

//   void _generateCaptcha() {
//     const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
//     captchaText = '';
//     for (int i =0; i < 6; i++) {
//       captchaText += chars[(DateTime.now().microsecondsSinceEpoch * i) % chars.length];
//     }
//   }

//   void _refreshCaptcha() {
//     setState(() {
//       _generateCaptcha();
//     });
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate() && agreeToTerms) {
//       if (captchaController.text != captchaText) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Invalid CAPTCHA. Please try again.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Success'),
//           content: Text('Your application has been submitted successfully.'),
//           actions: [
//             TextButton(onPressed: () {
//               Navigator.pop(context);
//               _resetForm();
//             },
//             child: Text('OK'),
//            ),
//           ],
//         ),
//       );
//     } else {
//       String errorMessage = 'Please fill all required fields correctly.';
//       if (!agreeToTerms) {
//         errorMessage = 'Please agree to the terms and conditions';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(errorMessage),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   void _resetForm() {
//     _formKey.currentState!.reset();
//     setState(() {
//       selectedGender = null;
//       selectedMaritalStatus = null;
//       selectedDistrict = null;
//       selectedTehsil = null;
//       selectedVillage = null;
//       selectedRI = null;
//       selectedPurpose = null;
//       selectedApplyOffice = null;
//       //selectedOtherPerson = null;
//       sameAsPresentAddress = false;
//       agreeToTerms = false;
//       captchaController.clear();
//       _generateCaptcha();
//     });
//   }

//   Widget _buildPersonalDetailsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SectionHeader(title: 'Personal Details'),
        
//         // Photo Upload
//         PhotoUploadSection(),
        
//         // Member Name
//         CustomTextField(
//           label: 'Member Name',
//           controller: memberNameController,
//           isRequired: true,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter member name';
//             }
//             return null;
//           },
//         ),
        
//         SizedBox(height: 16),
        
//         // Gender and Marital Status
//         Row(
//           children: [
//             Expanded(
//               child: CustomDropdown(
//                 label: 'Gender',
//                 value: selectedGender,
//                 items: genderOptions,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedGender = value;
//                   });
//                 },
//                 isRequired: true,
//               ),
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: CustomDropdown(
//                 label: 'Marital Status',
//                 value: selectedMaritalStatus,
//                 items: maritalOptions,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedMaritalStatus = value;
//                   });
//                 },
//                 isRequired: true,
//               ),
//             ),
//           ],
//         ),
        
//         // Phone Number
//         CustomTextField(
//           label: 'Phone Number',
//           controller: phoneController,
//           isRequired: true,
//           keyboardType: TextInputType.phone,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter phone number';
//             }
//             if (value.length < 10) {
//               return 'Please enter valid phone number';
//             }
//             return null;
//           },
//         ),
        
//         // Email
//         CustomTextField(
//           label: 'E-Mail',
//           controller: emailController,
//           keyboardType: TextInputType.emailAddress,
//           validator: (value) {
//             if (value != null && value.isNotEmpty) {
//               if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                 return 'Please enter valid email';
//               }
//             }
//             return null;
//           },
//         ),
        
//         // Address No and Mother's Name
//         Row(
//           children: [
//             Expanded(
//               child: CustomTextField(
//                 label: 'Address No',
//                 controller: addressController,
//                 isRequired: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter address number';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: CustomTextField(
//                 label: 'Mother\'s Name',
//                 controller: motherNameController,
//                 isRequired: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter mother\'s name';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildAddressSection(String title, bool isPresentAddress) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SectionHeader(title: title),
        
//         if (!isPresentAddress) ...[
//           CheckboxListTile(
//             title: Text('Same as Present Address'),
//             value: sameAsPresentAddress,
//             onChanged: (value) {
//               setState(() {
//                 sameAsPresentAddress = value!;
//               });
//             },
//             controlAffinity: ListTileControlAffinity.leading,
//             contentPadding: EdgeInsets.zero,
//           ),
//           SizedBox(height: 16),
//         ],
        
//         if (isPresentAddress || !sameAsPresentAddress) ...[
//           AddressFields(
//             selectedDistrict: selectedDistrict,
//             selectedTehsil: selectedTehsil,
//             selectedVillage: selectedVillage,
//             selectedRI: selectedRI,
//             onDistrictChanged: (value) => setState(() => selectedDistrict = value),
//             onTalukChanged: (value) => setState(() => selectedTehsil = value),
//             onVillageChanged: (value) => setState(() => selectedVillage = value),
//             onRIChanged: (value) => setState(() => selectedRI = value),
//           ),
          
//           // Village Not in List
//           CustomTextField(
//             label: 'Village Not in List - City Here',
//             controller: cityController,
//           ),
          
//           // Police Station and Post Office
//           Row(
//             children: [
//               Expanded(
//                 child: CustomTextField(
//                   label: 'Police Station',
//                   controller: policeStationController,
//                 ),
//               ),
//               SizedBox(width: 16),
//               Expanded(
//                 child: CustomTextField(
//                   label: 'Post Office',
//                   controller: postOfficeController,
//                 ),
//               ),
//             ],
//           ),
          
//           // Residing Duration
//           Row(
//             children: [
//               Expanded(
//                 child: CustomTextField(
//                   label: 'Years',
//                   controller: yearsController,
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value != null && value.isNotEmpty) {
//                       if (int.tryParse(value) == null) {
//                         return 'Please enter valid number';
//                       }
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               SizedBox(width: 16),
//               Expanded(
//                 child: CustomTextField(
//                   label: 'Months',
//                   controller: monthsController,
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value != null && value.isNotEmpty) {
//                       if (int.tryParse(value) == null) {
//                         return 'Please enter valid number';
//                       }
//                       int months = int.parse(value);
//                       if (months < 0 || months > 11) {
//                         return 'Months must be 0-11';
//                       }
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ],
//           ),
          
//           if (isPresentAddress) SizedBox(height: 24),
//         ],
//       ],
//     );
//   }
  
//   Widget _buildOtherSections() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Other Person Filling
//         CustomDropdown(
//           label: 'If any person other than applicant filling the Application?',
//           value: selectedOtherPerson,
//           items: otherPersonOptions,
//           onChanged: (value) {
//             setState(() {
//               selectedOtherPerson = value;
//             });
//           },
//         ),
        
//         if (selectedOtherPerson == 'Yes') ...[
//           SizedBox(height: 16),
//           CustomTextField(
//             label: 'Filler\'s Name',
//             isRequired: true,
//             validator: (value) {
//               if (selectedOtherPerson == 'Yes' && (value == null || value.isEmpty)) {
//                 return 'Please enter filler\'s name';
//               }
//               return null;
//             },
//           ),
//           CustomTextField(
//             label: 'Filler\'s Relationship with Applicant',
//             isRequired: true,
//             validator: (value) {
//               if (selectedOtherPerson == 'Yes' && (value == null || value.isEmpty)) {
//                 return 'Please enter relationship';
//               }
//               return null;
//             },
//           ),
//           CustomTextField(
//             label: 'Filler\'s Phone Number',
//             keyboardType: TextInputType.phone,
//             isRequired: true,
//             validator: (value) {
//               if (selectedOtherPerson == 'Yes') {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter phone number';
//                 }
//                 if (value.length < 10) {
//                   return 'Please enter valid phone number';
//                 }
//               }
//               return null;
//             },
//           ),
//         ],
        
//         SizedBox(height: 24),
        
//         // Purpose Section
//         SectionHeader(title: 'Purpose'),
//         CustomDropdown(
//           label: 'Purpose',
//           value: selectedPurpose,
//           items: purposeOptions,
//           onChanged: (value) {
//             setState(() {
//               selectedPurpose = value;
//             });
//           },
//           isRequired: true,
//         ),
        
//         SizedBox(height: 24),
        
//         // Declaration
//         SectionHeader(title: 'Declaration'),
//         DeclarationBox(),
        
//         SizedBox(height: 16),
        
//         // Place and Agreement
//         Row(
//           children: [
//             Expanded(
//               child: CustomTextField(
//                 label: 'Place',
//                 controller: placeController,
//                 isRequired: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter place';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Agree *',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   CheckboxListTile(
//                     title: Text('I Agree to the terms'),
//                     value: agreeToTerms,
//                     onChanged: (value) {
//                       setState(() {
//                         agreeToTerms = value!;
//                       });
//                     },
//                     controlAffinity: ListTileControlAffinity.leading,
//                     contentPadding: EdgeInsets.zero,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
        
//         SizedBox(height: 16),
        
//         // Apply to Office
//         CustomDropdown(
//           label: 'Apply to the Office',
//           value: selectedApplyOffice,
//           items: ['Select', 'Office 1', 'Office 2', 'Office 3'],
//           onChanged: (value) {
//             setState(() {
//               selectedApplyOffice = value;
//             });
//           },
//           isRequired: true,
//         ),
        
//         SizedBox(height: 24),
        
//         // Captcha Section
//         CaptchaSection(
//           captchaText: captchaText,
//           controller: captchaController,
//           onRefresh: _refreshCaptcha,
//         ),
//       ],
//     );
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('APPLICATION FORM FOR ISSUE OF RESIDENT CERTIFICATE'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildPersonalDetailsSection(),
//               _buildAddressSection('Present Address', true),
//               _buildAddressSection('Permanent Address', false),
//               _buildOtherSections(),
              
//               SizedBox(height: 32),
              
//               // Submit and Reset Buttons
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: _submitForm,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         'SUBMIT APPLICATION',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: _resetForm,
//                       style: OutlinedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         'RESET FORM',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
              
//               SizedBox(height: 32),
//             ],
//           ),
//         ),
//       ),
//     );
//   }


// }