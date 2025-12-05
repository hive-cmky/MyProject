import 'package:flutter/material.dart';

void main() {
  runApp(ResidentCertificateApp());
}

class ResidentCertificateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resident Certificate Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1E88E5),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1565C0),
          elevation: 0,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1E88E5), width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
      home: ResidentCertificateForm(),
    );
  }
}

class ResidentCertificateForm extends StatefulWidget {
  @override
  _ResidentCertificateFormState createState() => _ResidentCertificateFormState();
}

class _ResidentCertificateFormState extends State<ResidentCertificateForm> {
  final _formKey = GlobalKey<FormState>();
  
  // Form controllers
  final TextEditingController _memberNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressNoController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _policeStationController = TextEditingController();
  final TextEditingController _postOfficeController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  final TextEditingController _monthsController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _captchaController = TextEditingController();
  
  // Dropdown values
  String? _selectedGender;
  String? _selectedMaritalStatus;
  String? _selectedDistrict;
  String? _selectedTehsil;
  String? _selectedVillage;
  String? _selectedRI;
  String? _selectedPurpose;
  String? _selectedApplyOffice;
  String? _selectedOtherPerson;
  
  // Checkboxes
  bool _sameAsPresentAddress = false;
  bool _agreeToTerms = false;
  
  // Options
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  final List<String> _maritalOptions = ['Single', 'Married', 'Divorced', 'Widowed'];
  final List<String> _districtOptions = ['Bhubaneswar', 'Cuttack', 'Puri', 'Khordha'];
  final List<String> _tehsilOptions = ['Bhubaneswar', 'Cuttack Sadar', 'Puri Sadar'];
  final List<String> _villageOptions = ['Village 1', 'Village 2', 'Village 3'];
  final List<String> _riOptions = ['RI 1', 'RI 2', 'RI 3'];
  final List<String> _purposeOptions = [
    'Education',
    'Employment',
    'Government Scheme',
    'Passport',
    'Legal Purposes',
    'Other'
  ];
  final List<String> _otherPersonOptions = ['Yes', 'No'];
  
  // Captcha
  String _captchaCode = 'A1B2C3';
  
  @override
  void initState() {
    super.initState();
    _generateCaptcha();
  }
  
  void _generateCaptcha() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    _captchaCode = '';
    for (int i = 0; i < 6; i++) {
      _captchaCode += chars[(DateTime.now().microsecondsSinceEpoch * i) % chars.length];
    }
  }
  
  void _refreshCaptcha() {
    setState(() {
      _generateCaptcha();
    });
  }
  
  void _submitForm() {
    if (_formKey.currentState!.validate() && _agreeToTerms) {
      if (_captchaController.text.toUpperCase() != _captchaCode) {
        _showMessage('Invalid CAPTCHA. Please try again.', isError: true);
        return;
      }
      _showMessage('Application submitted successfully!');
      _resetForm();
    } else {
      _showMessage('Please fill all required fields correctly.', isError: true);
    }
  }
  
  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _memberNameController.clear();
      _phoneController.clear();
      _emailController.clear();
      _addressNoController.clear();
      _motherNameController.clear();
      _cityController.clear();
      _policeStationController.clear();
      _postOfficeController.clear();
      _yearsController.clear();
      _monthsController.clear();
      _placeController.clear();
      _captchaController.clear();
      
      _selectedGender = null;
      _selectedMaritalStatus = null;
      _selectedDistrict = null;
      _selectedTehsil = null;
      _selectedVillage = null;
      _selectedRI = null;
      _selectedPurpose = null;
      _selectedApplyOffice = null;
      _selectedOtherPerson = null;
      
      _sameAsPresentAddress = false;
      _agreeToTerms = false;
      _generateCaptcha();
    });
  }
  
  void _showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }
  
  Widget _buildSectionHeader(String title) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1565C0),
        ),
      ),
    );
  }
  
  Widget _buildTextField(String label, TextEditingController controller, 
      {bool isRequired = false, TextInputType keyboardType = TextInputType.text}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
              children: isRequired ? [
                TextSpan(text: ' *', style: TextStyle(color: Colors.red))
              ] : [],
            ),
          ),
          SizedBox(height: 6),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: 'Enter $label',
            ),
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildDropdown(String label, String? value, List<String> items,
      Function(String?) onChanged, {bool isRequired = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
              children: isRequired ? [
                TextSpan(text: ' *', style: TextStyle(color: Colors.red))
              ] : [],
            ),
          ),
          SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down),
                items: ['Select', ...items].map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: onChanged,
                hint: Text('Select'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildPhotoSection() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Applicant Photo (20KB - 250KB)',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[100],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, size: 30, color: Colors.grey[600]),
                  SizedBox(height: 5),
                  Text('Upload Photo', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.upload),
              label: Text('Choose File'),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildAddressSection({bool isPermanent = false}) {
    return Column(
      children: [
        if (isPermanent) ...[
          CheckboxListTile(
            title: Text('Same as Present Address'),
            value: _sameAsPresentAddress,
            onChanged: (value) {
              setState(() {
                _sameAsPresentAddress = value!;
              });
            },
            contentPadding: EdgeInsets.zero,
          ),
          SizedBox(height: 10),
        ],
        
        if (!isPermanent || !_sameAsPresentAddress) ...[
          // State (Fixed - ODISHA)
          Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('State', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                    color: Colors.grey[100],
                  ),
                  child: Text('ODISHA', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          
          // District, Tehsil, Village, RI - Mobile responsive grid
          LayoutBuilder(
            builder: (context, constraints) {
              bool isSmallScreen = constraints.maxWidth < 600;
              
              return Column(
                children: [
                  // District
                  _buildDropdown('District', _selectedDistrict, _districtOptions,
                      (value) => setState(() => _selectedDistrict = value)),
                  
                  // Tehsil
                  _buildDropdown('Tehsil', _selectedTehsil, _tehsilOptions,
                      (value) => setState(() => _selectedTehsil = value)),
                  
                  // Village
                  _buildDropdown('Village', _selectedVillage, _villageOptions,
                      (value) => setState(() => _selectedVillage = value)),
                  
                  // RI
                  _buildDropdown('RI', _selectedRI, _riOptions,
                      (value) => setState(() => _selectedRI = value)),
                ],
              );
            },
          ),
        ],
      ],
    );
  }
  
  Widget _buildCaptchaSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Word Verification', style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                alignment: Alignment.center,
                child: Text(
                  _captchaCode,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: _refreshCaptcha,
                icon: Icon(Icons.refresh),
                tooltip: 'Refresh',
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: _captchaController,
                  decoration: InputDecoration(
                    hintText: 'Enter captcha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text('Please enter the characters shown above', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESIDENT CERTIFICATE APPLICATION'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Personal Details Section
              _buildSectionHeader('Personal Details'),
              
              // Photo Upload
              _buildPhotoSection(),
              
              // Member Name
              _buildTextField('Member Name', _memberNameController, isRequired: true),
              
              // Gender and Marital Status - Row for mobile
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    // Desktop/Tablet layout
                    return Row(
                      children: [
                        Expanded(child: _buildDropdown('Gender', _selectedGender, _genderOptions,
                            (value) => setState(() => _selectedGender = value), isRequired: true)),
                        SizedBox(width: 12),
                        Expanded(child: _buildDropdown('Marital Status', _selectedMaritalStatus, _maritalOptions,
                            (value) => setState(() => _selectedMaritalStatus = value), isRequired: true)),
                      ],
                    );
                  } else {
                    // Mobile layout - vertical
                    return Column(
                      children: [
                        _buildDropdown('Gender', _selectedGender, _genderOptions,
                            (value) => setState(() => _selectedGender = value), isRequired: true),
                        SizedBox(height: 12),
                        _buildDropdown('Marital Status', _selectedMaritalStatus, _maritalOptions,
                            (value) => setState(() => _selectedMaritalStatus = value), isRequired: true),
                      ],
                    );
                  }
                },
              ),
              
              // Phone Number
              _buildTextField('Phone Number', _phoneController, 
                  isRequired: true, keyboardType: TextInputType.phone),
              
              // Email
              _buildTextField('Email', _emailController, 
                  keyboardType: TextInputType.emailAddress),
              
              // Address No and Mother's Name
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Row(
                      children: [
                        Expanded(child: _buildTextField('Address No', _addressNoController, isRequired: true)),
                        SizedBox(width: 12),
                        Expanded(child: _buildTextField("Mother's Name", _motherNameController, isRequired: true)),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildTextField('Address No', _addressNoController, isRequired: true),
                        SizedBox(height: 12),
                        _buildTextField("Mother's Name", _motherNameController, isRequired: true),
                      ],
                    );
                  }
                },
              ),
              
              SizedBox(height: 24),
              
              // Present Address Section
              _buildSectionHeader('Present Address'),
              
              _buildAddressSection(),
              
              // Village Not in List
              _buildTextField('Village Not in List - City Here', _cityController),
              
              // Police Station and Post Office
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Row(
                      children: [
                        Expanded(child: _buildTextField('Police Station', _policeStationController)),
                        SizedBox(width: 12),
                        Expanded(child: _buildTextField('Post Office', _postOfficeController)),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildTextField('Police Station', _policeStationController),
                        SizedBox(height: 12),
                        _buildTextField('Post Office', _postOfficeController),
                      ],
                    );
                  }
                },
              ),
              
              // Residing Duration
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Row(
                      children: [
                        Expanded(child: _buildTextField('Years', _yearsController, keyboardType: TextInputType.number)),
                        SizedBox(width: 12),
                        Expanded(child: _buildTextField('Months', _monthsController, keyboardType: TextInputType.number)),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildTextField('Years', _yearsController, keyboardType: TextInputType.number),
                        SizedBox(height: 12),
                        _buildTextField('Months', _monthsController, keyboardType: TextInputType.number),
                      ],
                    );
                  }
                },
              ),
              
              SizedBox(height: 24),
              
              // Permanent Address Section
              _buildSectionHeader('Permanent Address'),
              
              _buildAddressSection(isPermanent: true),
              
              SizedBox(height: 16),
              
              // Other Person Filling
              _buildDropdown('If any person other than applicant filling the Application?', 
                  _selectedOtherPerson, _otherPersonOptions,
                  (value) => setState(() => _selectedOtherPerson = value)),
              
              SizedBox(height: 24),
              
              // Purpose Section
              _buildSectionHeader('Purpose'),
              
              _buildDropdown('Purpose', _selectedPurpose, _purposeOptions,
                  (value) => setState(() => _selectedPurpose = value), isRequired: true),
              
              SizedBox(height: 24),
              
              // Declaration Section
              _buildSectionHeader('Declaration'),
              
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  'I do hereby declare that the information given by me in this application form is true to the best of my knowledge and I have not suggested or misrepresented any fact. I am solely responsible for the accuracy of the declaration and information furnished and shall be liable under relevant laws/rules in case of furnishing wrong declaration and information. Also, I am well aware of the fact that the certificate shall be summarily cancelled and all the benefits availed by me shall be withdrawn in case of furnishing wrong declaration and information.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
              
              SizedBox(height: 16),
              
              // Place and Agreement
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Row(
                      children: [
                        Expanded(child: _buildTextField('Place', _placeController, isRequired: true)),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Agree *', style: TextStyle(fontWeight: FontWeight.w500)),
                              SizedBox(height: 6),
                              CheckboxListTile(
                                title: Text('I Agree to the terms'),
                                value: _agreeToTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _agreeToTerms = value!;
                                  });
                                },
                                contentPadding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField('Place', _placeController, isRequired: true),
                        SizedBox(height: 16),
                        Text('Agree *', style: TextStyle(fontWeight: FontWeight.w500)),
                        CheckboxListTile(
                          title: Text('I Agree to the terms'),
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value!;
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
                    );
                  }
                },
              ),
              
              SizedBox(height: 16),
              
              // Apply to Office
              _buildDropdown('Apply to the Office', _selectedApplyOffice, 
                  ['Office 1', 'Office 2', 'Office 3'],
                  (value) => setState(() => _selectedApplyOffice = value), isRequired: true),
              
              SizedBox(height: 24),
              
              // Captcha Section
              _buildCaptchaSection(),
              
              SizedBox(height: 32),
              
              // Submit and Reset Buttons
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text('SUBMIT APPLICATION', style: TextStyle(fontSize: 16)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1E88E5),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _resetForm,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text('RESET FORM', style: TextStyle(fontSize: 16)),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xFF1E88E5)),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text('SUBMIT APPLICATION', style: TextStyle(fontSize: 16)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1E88E5),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: _resetForm,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text('RESET FORM', style: TextStyle(fontSize: 16)),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xFF1E88E5)),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}