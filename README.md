# Ticketapp

A new Flutter assignment.

## What I did ? 

I made an application close to the given design. Apart from that, drawing and displaying data with mvvm and provider in the ticket detail field. I did the login post process directly without using status management.For the popup in the login screen of the application, I have selected it according to the platform. Cupertino for IOS, alert dialog for android is used.In general, the variables always came from fixed folders, so I tried to make a responsive design and a nice folder.

## What I couldn't create ? 

I did not make the desired post structure with the state management in the application, I immediately established the communication with the post process and when I got an error, I could not show it with the help of the validator. Validator errors are only active when the user enters values manually. Apart from that, I couldn't create the matching parts with the data and api coming from the userid, I couldn't spare time for this. I tried to get the userid directly and pull data from the api, but because the api structure is not in the form of a list, it returned null. I also created a new api for myself by adding a list structure to at least do the same with the design.



## dependencies
```yaml
dio: 3.0.9
provider: 4.0.0
form_field_validator: 1.1.0
qr_flutter: 4.0.0
``` 

You can install packages from the command line:

```bash
$ pub get
..
```

<table>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/45129432/133926513-c6fd4726-990a-447f-94ef-4aeb1a0d7e15.png" width=250 height=480></td>
    <td><img src="https://user-images.githubusercontent.com/45129432/133926491-eb80ca3b-1d8a-4cef-8b36-ad2ce202adea.png" width=250 height=480></td>
  </tr>

  <td><img src="https://user-images.githubusercontent.com/45129432/133926492-f08401d0-4694-4a86-bf04-758276a4f3e2.png" width=250 height=480></td>
  <td><img src="https://user-images.githubusercontent.com/45129432/133926497-249c7bff-b01e-49f8-a7b6-21929b7a642e.png" width=250 height=480></td>
</table>
  





