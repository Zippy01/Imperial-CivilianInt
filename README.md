# Imperial CivilianInt Script

The **CivilianInt** script allows users in the *Imperial CAD* community to manage an active civilian profile within the game. This setup simplifies access to civilian-related commands, including in-game vehicle registration with CAD or integration with scripts like the *DriversLic Script*. This script is essential for most civilian-related functionalities within the *Imperial CAD* system.

---

## Features

- **Set Active Civilian Profile** - Choose a civilian profile for streamlined in-game commands.
- **Vehicle Registration** - Register your vehicle to CAD using in-game commands.
- **Seamless Script Integration** - Compatible with other *Imperial CAD* scripts, such as the *DriversLic Script*.

## Commands

| Command               | Description                                                                                     |
|-----------------------|-------------------------------------------------------------------------------------------------|
| `/setciv (ssn)`      | Sets the active civilian profile using a specified SSN.                                         |
| `/getciv`            | Displays the current civilian profile's information.                                            |
| `/clearciv`          | Clears the currently set civilian profile.                                                      |
| `/regveh`            | Registers the player’s vehicle with *Imperial CAD* based on the selected civilian profile.      |

---

## Installation

To install the **CivilianInt** script, follow these steps:

1. **Download the Script Files**  
   Download the latest release from this repository.

2. **Add to Your Server Resources**  
   Place the `CivilianInt` folder into your server's resources directory.

3. **Set Up your Community ID convar**  
   All Imperial Scripts rely on a `community ID` to function. To set this up:
   
   - Locate your community ID in *Admin Panel > Customization > Community ID*.
   - Add the following line at the top of your `server.cfg` file:
     ```plaintext
     setr imperial_community_id "COMMUNITY_ID_HERE"
     ```
   - **Note**: If you've already set this up for another *Imperial CAD* plugin, you can skip this step. Without this configuration, Your Imperial Scripts will return a error in the console.

4. **Ensure Resources in `server.cfg`**  
   Add the following lines to your `server.cfg` to ensure the Imperial *CivilianInt* loads correctly:
   ```plaintext
   ensure CivilianInt
   ```

5. **Configure Additional Vehicles**  
   Inside the `CivilianInt` folder, you'll find a `Library` folder containing a script named `vehicles.lua`. This file lists supported vehicle makes for registration. If you need to add additional vehicles not currently listed, open `vehicles.lua` and add them here to ensure the make displays correctly when registered in CAD. 

6. **Restart Your Server**  
   Restart your server to apply the changes.

---

## Requirements

- **Imperial CAD**: Ensure you have a valid *Imperial CAD* subscription and that it's configured, as this script interacts directly with CAD.


## Usage Notes

The **CivilianInt** script is a foundational component for civilian-related interactions in *Imperial CAD*. Setting an active civilian profile is required for in-game registration and other scripts to function properly.

---

### License

This script is owned by *Imperial Solutions*. Unauthorized copying, distribution, or use of this script without permission is prohibited and may result in legal actions.

--- 

For further assistance, visit the *Imperial Solutions* [Support Discord](https://discord.gg/N5UJBSDdsn) or refer to our support channels.
