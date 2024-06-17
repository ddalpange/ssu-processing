import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;



class TsvProcessor {
  String filePath;
    TsvProcessor(String filePath) {
        this.filePath = filePath;
    }

    List<Map<String, String>> readTsvFile() {
        List<Map<String, String>> list = new ArrayList<>();
        String absolutePath = sketchPath(filePath);

        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(absolutePath), "utf-8"))) {
            String line;
            String[] headers = br.readLine().split("\t"); 

            while ((line = br.readLine()) != null) {
                String[] values = line.split("\t");
                Map<String, String> map = new HashMap<>();

                for (int i = 0; i < headers.length; i++) {
                    if (i < values.length) {
                        map.put(headers[i], values[i]);
                    } else {
                        map.put(headers[i], "");
                    }
                }
                list.add(map);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    Map<String, String> getDataById(List<Map<String, String>> data, String id) {
        for (Map<String, String> row : data) {
            if (row.containsKey("id") && row.get("id").equals(id)) {
                return row;
            }
        }
        return null;
    }

}
