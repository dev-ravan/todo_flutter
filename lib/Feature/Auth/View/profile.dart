import '../../../Utils/exports.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.white,
          title:
              MyTexts().DMSansNormalBlackText(text: provider.title, size: 25),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      // Profile Avatar
                      myWidgets.profileAvatar(
                          image: provider.image != null
                              ? FileImage(File(provider.image!.path))
                              : const AssetImage("assets/Images/profile.jpg"),
                          onTap: () => provider.getImage()),
                      gap20,
                      // Name Field
                      myTextFields.authField(
                          hintText: provider.name.hintText,
                          controller: provider.nameController,
                          validator: (val) => provider.commonValidation(val),
                          icon: Icons.person),
                      gap20,

                      Row(
                        children: [
                          // Age Field
                          Expanded(
                            child: myTextFields.authField(
                                hintText: provider.age.hintText,
                                controller: provider.ageController,
                                validator: (val) =>
                                    provider.commonValidation(val),
                                icon: Icons.numbers),
                          ),
                          gap20,
                          // Pin Code Field
                          Expanded(
                            flex: 2,
                            child: myTextFields.authField(
                                hintText: provider.pinCode.hintText,
                                controller: provider.pinCodeController,
                                validator: (val) =>
                                    provider.commonValidation(val),
                                icon: Icons.lan_rounded),
                          ),
                        ],
                      ),
                      gap20,
                      // Gender Dropdown
                      myDropDowns.genderDropDown(
                        hintText: provider.gender.hintText,
                        validator: (val) => provider.dropDownValidation(val),
                        value: provider.genderValue,
                        items: provider.genderList
                            .map((e) => DropdownMenuItem(
                                  value: e["value"],
                                  child: Text(e["gender"]),
                                ))
                            .toList(),
                        icon: Icons.person_2,
                      ),
                      gap20,
                      // Skills Field
                      Row(children: [
                        Expanded(
                          flex: 4,
                          child: myTextFields.authField(
                              hintText: provider.skills.hintText,
                              controller: provider.skillsController,
                              validator: (val) => provider.skillsList.isEmpty
                                  ? provider.commonValidation(val)
                                  : null,
                              icon: Icons.accessibility),
                        ),
                        gap20,
                        //  Add Button
                        Expanded(
                            child: myButtons.customButton(
                                context: context,
                                title: "✓",
                                onTap: () => provider.addSkills()))
                      ]),
                      gap5,
                      //  Skills list
                      Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              spacing: 5, // Space between children
                              runSpacing: 5, // Space between lines
                              children: List.generate(
                                  provider.skillsList.length, (i) {
                                return myWidgets.skillChips(
                                    text: provider.skillsList[i],
                                    onCancel: () =>
                                        provider.removeSkills(index: i));
                              }),
                            ),
                          ),
                        ],
                      ),

                      gap10,
                      // Mobile Field
                      myTextFields.authField(
                          hintText: provider.mobile.hintText,
                          controller: provider.mobileController,
                          validator: (val) => provider.commonValidation(val),
                          icon: Icons.phone),
                      gap20,
                      // Email Field
                      myTextFields.authField(
                          hintText: provider.email.hintText,
                          controller: provider.emailController,
                          validator: (val) => provider.commonValidation(val),
                          icon: Icons.mail),
                      gap20,
                      // Address Field
                      myTextFields.addressField(
                          hintText: provider.address.hintText,
                          controller: provider.addressController,
                          validator: (val) => provider.commonValidation(val),
                          icon: Icons.location_pin),
                      gap20,
                      // LinkedIn url Field
                      myTextFields.authField(
                          hintText: provider.linkedInUrl.hintText,
                          controller: provider.linkedInController,
                          validator: (val) => provider.commonValidation(val),
                          icon: Icons.add_link_outlined),
                    ],
                  ),
                ),
                gap30,
                // Submit and cancel field
                Row(
                  children: [
                    Expanded(
                      child: myButtons.customButton(
                          context: context,
                          title: "Cancel",
                          onTap: () {},
                          color: Palette.grey),
                    ),
                    gap20,
                    Expanded(
                      child: myButtons.customButton(
                          context: context,
                          title: "Submit",
                          onTap: () => provider.submitForm()),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
