import p5 from "p5";
import { main } from "./main";
import "./style.css";

new p5((p5Instance) => {
    const p = p5Instance as unknown as p5;
    window.p = p;
    //let deltaTime = 0;
    let lastMills = 0;
    window.deltaTime = 0;
    window.updateDeltaTime = () => {
        const currentMills = Date.now();
        window.deltaTime = (currentMills - lastMills) / 1000;
        lastMills = currentMills;
        //console.log('deltatime: ' + deltaTime)
    };
    main(p);
}, document.getElementById("app")!);
