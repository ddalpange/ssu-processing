export class DialogContent {
  public id: string;
  public text: string;
  public teller: string | undefined;
  public voicePath: string | undefined;

  constructor(id: string, text: string, teller?: string, voicePath?: string) {
    this.id = id;
    this.text = text;
    this.teller = teller;
    this.voicePath = voicePath;
  }
}
