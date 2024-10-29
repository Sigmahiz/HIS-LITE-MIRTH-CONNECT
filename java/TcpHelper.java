package issi.tcp; // Package folder path
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class TcpHelper {
    public static String sendTcpMessage(String pattern, String xmldata) {
        String jsonMessage = "{\"pattern\": \"" + pattern + "\", \"data\": \"" + xmldata + "\"}";
        String response = "";
        String host = ""; // mirth host
        int port = 0; //6661 mirth default port

        try (Socket socket = new Socket(host, port);
             PrintWriter writer = new PrintWriter(socket.getOutputStream(), true);
             BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()))) {

            // Enviar el mensaje JSON
            writer.println(jsonMessage);
            
            // Leer la respuesta
            response = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return response;
    }
}