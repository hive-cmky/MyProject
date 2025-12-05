// import 'package:flutter/material.dart';

// class SectionHeader extends StatelessWidget {
//   final String title;
  
//   SectionHeader({required this.title});
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.blue[800],
//         ),
//       ),
//     );
//   }
// }

// class PhotoUploadSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Applicant Photo (size should be greater than 20KB and less than 250KB)',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           SizedBox(height: 12),
//           Container(
//             width: 120,
//             height: 150,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey[400]!),
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.grey[100],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.camera_alt, size: 40, color: Colors.grey[600]),
//                 SizedBox(height: 8),
//                 Text('Upload Photo', style: TextStyle(color: Colors.grey[600])),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//           ElevatedButton.icon(
//             onPressed: () {
//               // Implement photo upload
//             },
//             icon: Icon(Icons.upload),
//             label: Text('Choose File'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.grey[200],
//               foregroundColor: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomTextField extends StatelessWidget {
//   final String label;
//   final TextEditingController? controller;
//   final TextInputType keyboardType;
//   final bool isRequired;
//   final String? Function(String?)? validator;
//   final int? maxLength;
  
//   CustomTextField({
//     required this.label,
//     this.controller,
//     this.keyboardType = TextInputType.text,
//     this.isRequired = false,
//     this.validator,
//     this.maxLength,
//   });
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           RichText(
//             text: TextSpan(
//               text: label,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//                 color: Colors.black87,
//               ),
//               children: isRequired
//                   ? [
//                       TextSpan(
//                         text: ' *',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ]
//                   : [],
//             ),
//           ),
//           SizedBox(height: 8),
//           TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             maxLength: maxLength,
//             decoration: InputDecoration(
//               hintText: 'Enter $label',
//               contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//               counterText: '',
//             ),
//             validator: validator,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomDropdown extends StatelessWidget {
//   final String label;
//   final String? value;
//   final List<String> items;
//   final Function(String?) onChanged;
//   final bool isRequired;
  
//   CustomDropdown({
//     required this.label,
//     required this.value,
//     required this.items,
//     required this.onChanged,
//     this.isRequired = false,
//   });
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           RichText(
//             text: TextSpan(
//               text: label,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//                 color: Colors.black87,
//               ),
//               children: isRequired
//                   ? [
//                       TextSpan(
//                         text: ' *',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ]
//                   : [],
//             ),
//           ),
//           SizedBox(height: 8),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.grey[400]!),
//               color: Colors.grey[50],
//             ),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 value: value,
//                 isExpanded: true,
//                 icon: Icon(Icons.arrow_drop_down),
//                 items: items.map((String item) {
//                   return DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(item),
//                   );
//                 }).toList(),
//                 onChanged: onChanged,
//                 hint: Text('Select'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddressFields extends StatelessWidget {
//   final String? selectedDistrict;
//   final String? selectedTehsil;
//   final String? selectedVillage;
//   final String? selectedRI;
//   final Function(String?) onDistrictChanged;
//   final Function(String?) onTalukChanged;
//   final Function(String?) onVillageChanged;
//   final Function(String?) onRIChanged;
  
//   AddressFields({
//     required this.selectedDistrict,
//     required this.selectedTehsil,
//     required this.selectedVillage,
//     required this.selectedRI,
//     required this.onDistrictChanged,
//     required this.onTalukChanged,
//     required this.onVillageChanged,
//     required this.onRIChanged,
//   });
  
//   Widget _buildSmallDropdown({
//     required String label,
//     required String? value,
//     required List<String> items,
//     required Function(String?) onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 12,
//           ),
//         ),
//         SizedBox(height: 4),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6),
//             border: Border.all(color: Colors.grey[400]!),
//             color: Colors.grey[50],
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               value: value,
//               isExpanded: true,
//               icon: Icon(Icons.arrow_drop_down, size: 20),
//               items: items.map((String item) {
//                 return DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(
//                     item,
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 );
//               }).toList(),
//               onChanged: onChanged,
//               hint: Text(
//                 'Select',
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'State',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.grey[400]!),
//                   color: Colors.grey[100],
//                 ),
//                 child: Text(
//                   'ODISHA',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[700],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
        
//         GridView.count(
//           crossAxisCount: 2,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           mainAxisSpacing: 16,
//           crossAxisSpacing: 16,
//           childAspectRatio: 3,
//           children: [
//             _buildSmallDropdown(
//               label: 'District',
//               value: selectedDistrict,
//               items: ['Select', 'District 1', 'District 2', 'District 3'],
//               onChanged: onDistrictChanged,
//             ),
//             _buildSmallDropdown(
//               label: 'Tehsil',
//               value: selectedTehsil,
//               items: ['Select', 'Tehsil 1', 'Tehsil 2', 'Tehsil 3'],
//               onChanged: onTalukChanged,
//             ),
//             _buildSmallDropdown(
//               label: 'Village',
//               value: selectedVillage,
//               items: ['Select', 'Village 1', 'Village 2', 'Village 3'],
//               onChanged: onVillageChanged,
//             ),
//             _buildSmallDropdown(
//               label: 'RI',
//               value: selectedRI,
//               items: ['Select', 'RI 1', 'RI 2', 'RI 3'],
//               onChanged: onRIChanged,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class DeclarationBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey[300]),
//       ),
//       child: Text(
//         'I do hereby declare that the information given by me in this application form is true to the best of my knowledge and I have not suggested or misrepresented any fact. I am solely responsible for the accuracy of the declaration and information furnished and shall be liable under relevant laws/rules in case of furnishing wrong declaration and information. Also, I am well aware of the fact that the certificate shall be summarily cancelled and all the benefits availed by me shall be withdrawn in case of furnishing wrong declaration and information.',
//         style: TextStyle(
//           fontSize: 14,
//           height: 1.5,
//         ),
//       ),
//     );
//   }
// }

// class CaptchaSection extends StatelessWidget {
//   final String captchaText;
//   final TextEditingController controller;
//   final VoidCallback onRefresh;
  
//   CaptchaSection({
//     required this.captchaText,
//     required this.controller,
//     required this.onRefresh,
//   });
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Word Verification',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           SizedBox(height: 12),
//           Row(
//             children: [
//               Container(
//                 width: 120,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(4),
//                   border: Border.all(color: Colors.grey[400]!),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   captchaText,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 2,
//                     color: Colors.blue[800],
//                   ),
//                 ),
//               ),
//               SizedBox(width: 16),
//               IconButton(
//                 onPressed: onRefresh,
//                 icon: Icon(Icons.refresh),
//                 tooltip: 'Refresh Captcha',
//               ),
//             ],
//           ),
//           SizedBox(height: 12),
//           Text(
//             'Please enter the characters shown above',
//             style: TextStyle(color: Colors.grey[600]),
//           ),
//           SizedBox(height: 8),
//           TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: 'Enter captcha',
//               border: OutlineInputBorder(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }