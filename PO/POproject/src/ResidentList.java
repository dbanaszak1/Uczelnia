import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ResidentList {
    private List<Resident> residents;

    public ResidentList() {
        this.residents = new ArrayList<>();
    }

    public void addResident(String city, String firstName, String lastName, String pesel) throws IOException {
        if (pesel.length() != 11 || !validatePesel(pesel)) {
            System.out.println("Error: Invalid PESEL number");
        } else {
            Resident resident = new Resident(city, firstName, lastName, pesel);
            residents.add(resident);

            boolean residentUpdated = updateResident(resident);
            if (!residentUpdated) {
                writeResident(resident);
                System.out.println("\nResident added");
            }
        }
    }

    private static boolean validatePesel(String pesel) {
        int[] peselArray = new int[11];
        for (int i = 0; i < 11; i++) {
            peselArray[i] = Character.getNumericValue(pesel.charAt(i));
        }
        return (peselArray[0] * 1 + peselArray[1] * 3 + peselArray[2] * 7 + peselArray[3] * 9 +
                peselArray[4] * 1 + peselArray[5] * 3 + peselArray[6] * 7 + peselArray[7] * 9 +
                peselArray[8] * 1 + peselArray[9] * 3 + peselArray[10]) % 10 == 0;
    }

    public static void createFile() throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter("residents.txt"));
        writer.close();
    }

    private static void writeResident(Resident resident) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter("residents.txt", true));
        String residentData = "{\"city\":\"" + resident.getCity() + "\",\"firstName\":\"" +
                resident.getFirstName() + "\",\"lastName\":\"" + resident.getLastName() +
                "\",\"pesel\":\"" + resident.getPesel() + "\"}\n";
        writer.write(residentData);
        writer.close();
    }

    public void addNewResidents() throws IOException {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.print("Enter city (or 'quit' to exit): ");
            String city = scanner.nextLine();
            if (city.equals("quit")) {
                break;
            }
            System.out.print("Enter first name: ");
            String firstName = scanner.nextLine();
            System.out.print("Enter last name: ");
            String lastName = scanner.nextLine();
            System.out.print("Enter PESEL number: ");
            String pesel = scanner.nextLine();
            addResident(city, firstName, lastName, pesel);
        }
    }

    private static boolean updateResident(Resident resident) throws IOException {
        String residentData = "{\"city\":\"" + resident.getCity() + "\",\"firstName\":\"" +
                resident.getFirstName() + "\",\"lastName\":\"" + resident.getLastName() +
                "\",\"pesel\":\"" + resident.getPesel() + "\"}";
        List<String> lines = Files.readAllLines(Paths.get("residents.txt"));
        for (int i = 0; i < lines.size(); i++) {
            if (lines.get(i).contains(resident.getPesel())) {
                lines.set(i, residentData);
                BufferedWriter writer = new BufferedWriter(new FileWriter("residents.txt"));
                for (String line : lines) {
                    writer.write(line + "\n");
                }
                writer.close();
                System.out.println("\nResident updated");
                return true;
            }
        }
        return false;
    }

    public static void testPesel() {
        int countValid = 0;
        int countInvalid = 0;
        String[] validPesel = {
                "49121957312", "06212418471", "72070876519", "57031685342", "67020782864",
                "75121399467", "57102275289", "53051738167", "54082253476", "78032756659", "57102275289"
        };
        String[] invalidPesel = {
                "12343456778", "43123214214", "54353454354", "98980980899", "376254343254521",
                "54545477777", "560534574353", "73545454545", "83324453454554", "800045433513679"
        };
        for (String pesel : validPesel) {
            if (validatePesel(pesel)) {
                countValid++;
            }
        }
        for (String pesel : invalidPesel) {
            if (!validatePesel(pesel)) {
                countInvalid++;
            }
        }
        System.out.println("Count valid:" + countValid + " \n" + "Cound invalid:" + countInvalid);
    }

    public static void testResidentUpdate() throws IOException {
        ResidentList residentList = new ResidentList();
        residentList.addResident("Konin", "Adam", "Nowak", "57031685342");
        try {
            List<String> lines = Files.readAllLines(Paths.get("residents.txt"));
            for (String line : lines) {
                System.out.println(line);
            }
        } catch (IOException e) {
            System.out.println("Error reading residents: " + e.getMessage());
        }
        residentList.addResident("Poznan", "Jan", "Kowalski", "57031685342");
        try {
            List<String> lines = Files.readAllLines(Paths.get("residents.txt"));
            for (String line : lines) {
                System.out.println(line);
            }
        } catch (IOException e) {
            System.out.println("Error reading residents: " + e.getMessage());
        }
    }

    public static void main(String[] args) throws IOException {
        ResidentList residentList = new ResidentList();

        testPesel();
        try {
            createFile();
        } catch (IOException e) {
            System.out.println("Error creating file: " + e.getMessage());
        }
        testResidentUpdate();
        residentList.addNewResidents();
    }
}

class Resident {
    private String city;
    private String firstName;
    private String lastName;
    private String pesel;

    public Resident(String city, String firstName, String lastName, String pesel) {
        this.city = city;
        this.firstName = firstName;
        this.lastName = lastName;
        this.pesel = pesel;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPesel() {
        return pesel;
    }

    public void setPesel(String pesel) {
        this.pesel = pesel;
    }
}
