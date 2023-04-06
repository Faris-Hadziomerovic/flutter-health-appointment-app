# Flutter Health Appointments App

## Getting Started

To get a local copy up and running follow the steps below: 

### Prerequisites

Before running the application, make sure you have the following installed on your system: 

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [VS Code](https://code.visualstudio.com/) installed along with the [Flutter extension](https://flutter.dev/docs/get-started/editor?tab=vscode) *(this is a recommendation, so you can use the GUI)*

<br>

### Running the App

1. Clone the repo to your local machine with the following command:

   ```shell
   git clone https://github.com/Faris-Hadziomerovic/flutter-health-appointment-app.git
   ```


2. Open the project folder in VS Code *(recommended)* 


3. Install packages by running the command:

   ```shell
   flutter pub get
   ```


4. To select a device you can:
    - open the command pallete with `Ctrl+Shift+P` and enter `Flutter: Select Device`
    - or open the device selection menu from the bottom tool bar


5. To run the app you can:
    - press F5 or click on the `Run` button in the top toolbar *(recommended)*
    - run the following command:

        ```shell
        flutter run
        ```


6. The app should launch in the emulator, web or on your physical device if it's connected


<br>

## Preview

<br>

This is the home screen showing an overview of the users patients, here you can search the locally available patients that are connected with the current user (doctor).

The second image shows what happens when you click on the small blue icon on the right of the patient card widget: the patient's info in QR code format appears.

![home - portrait](https://user-images.githubusercontent.com/64084436/230510252-c37f28e2-3440-4859-b6b9-fd0f0b30054f.png)
![qr code - portrait](https://user-images.githubusercontent.com/64084436/230510289-45930550-fba5-4862-8f0b-77b57c1d14d0.png)



The following is a landscape representation of the same screen.

![home - landscape](https://user-images.githubusercontent.com/64084436/230510567-a2e011cc-cc99-47f8-a30d-14e6883f56c0.png)



The first picture is the appointments overview screen. It shows all appointments between the doctor and the selected patient.
After selecting one, we navigate to the appointment details screen where the user can edit and delete the appointment, this screen is shown on the second image.

![appointments - portrait](https://user-images.githubusercontent.com/64084436/230510812-e88caadd-8757-4036-8ca8-bd2e5b1c5298.png)
![appointment details - portrait](https://user-images.githubusercontent.com/64084436/230511160-a21b3236-0163-4584-9f35-02a4b5541531.png)



The following three images show some of the dialogs that appear through the edit/delete process.

![delete dialog - portrait](https://user-images.githubusercontent.com/64084436/230511300-7331d7ae-b464-4e4b-a046-fd784de14491.png)
![date picker - portrait](https://user-images.githubusercontent.com/64084436/230511305-7528b226-9f88-48ac-8170-06544453fc15.png)
![timepicker - landscape](https://user-images.githubusercontent.com/64084436/230511311-49f8abc6-b600-4226-930f-631017e9ffb1.png)

