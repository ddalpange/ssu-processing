import { Drawable } from "../interfaces/Drawable";

export class TornWindow extends Drawable {
  declare zIndex: number;

  constructor(x: number, y: number, w: number, h: number, zIndex: number) {
    super();
    this.setup(x, y, w, h, zIndex);
  }

  private scaleX(originalX: number): number {
    return this.x + (originalX - 114) * (this.w / (437 - 114));
  }

  private scaleY(originalY: number): number {
    return this.y + (originalY - -41) * (this.h / (398 - -41));
  }

  draw(): void {
    p.push();
    p.strokeWeight(1);

    p.beginShape();
    p.fill(0);
    p.vertex(this.scaleX(114), this.scaleY(106));
    p.vertex(this.scaleX(222), this.scaleY(67));
    p.vertex(this.scaleX(438), this.scaleY(99));
    p.vertex(this.scaleX(503), this.scaleY(256));
    p.vertex(this.scaleX(420), this.scaleY(320));
    p.vertex(this.scaleX(235), this.scaleY(329));
    p.vertex(this.scaleX(113), this.scaleY(295));
    p.vertex(this.scaleX(72), this.scaleY(238));
    p.vertex(this.scaleX(114), this.scaleY(106));
    p.endShape();

    p.fill("#F5F5F5");
    p.beginShape();
    p.vertex(this.scaleX(222), this.scaleY(67));
    p.vertex(this.scaleX(219), this.scaleY(54));
    p.vertex(this.scaleX(226), this.scaleY(53));
    p.vertex(this.scaleX(225), this.scaleY(48));
    p.vertex(this.scaleX(238), this.scaleY(41));
    p.vertex(this.scaleX(241), this.scaleY(34));
    p.vertex(this.scaleX(241), this.scaleY(27));
    p.vertex(this.scaleX(250), this.scaleY(21));
    p.vertex(this.scaleX(249), this.scaleY(15));
    p.vertex(this.scaleX(252), this.scaleY(4));
    p.vertex(this.scaleX(261), this.scaleY(9));
    p.vertex(this.scaleX(261), this.scaleY(7));
    p.vertex(this.scaleX(253), this.scaleY(-7));
    p.vertex(this.scaleX(263), this.scaleY(-5));
    p.vertex(this.scaleX(268), this.scaleY(-17));
    p.vertex(this.scaleX(283), this.scaleY(-25));
    p.vertex(this.scaleX(313), this.scaleY(-22));
    p.vertex(this.scaleX(329), this.scaleY(-29));
    p.vertex(this.scaleX(335), this.scaleY(-36));
    p.vertex(this.scaleX(343), this.scaleY(-36));
    p.vertex(this.scaleX(348), this.scaleY(-41));
    p.vertex(this.scaleX(356), this.scaleY(-37));
    p.vertex(this.scaleX(372), this.scaleY(-40));
    p.vertex(this.scaleX(382), this.scaleY(-36));
    p.vertex(this.scaleX(413), this.scaleY(-26));
    p.vertex(this.scaleX(419), this.scaleY(-19));
    p.vertex(this.scaleX(408), this.scaleY(1));
    p.vertex(this.scaleX(413), this.scaleY(6));
    p.vertex(this.scaleX(418), this.scaleY(35));
    p.vertex(this.scaleX(427), this.scaleY(19));
    p.vertex(this.scaleX(438), this.scaleY(6));
    p.vertex(this.scaleX(446), this.scaleY(8));
    p.vertex(this.scaleX(454), this.scaleY(16));
    p.vertex(this.scaleX(452), this.scaleY(27));
    p.vertex(this.scaleX(448), this.scaleY(47));
    p.vertex(this.scaleX(438), this.scaleY(98));
    p.vertex(this.scaleX(222), this.scaleY(67));
    p.endShape();

    p.beginShape();
    p.vertex(this.scaleX(437), this.scaleY(98));
    p.vertex(this.scaleX(439), this.scaleY(89));
    p.vertex(this.scaleX(454), this.scaleY(79));
    p.vertex(this.scaleX(460), this.scaleY(78));
    p.vertex(this.scaleX(472), this.scaleY(80));
    p.vertex(this.scaleX(490), this.scaleY(75));
    p.vertex(this.scaleX(514), this.scaleY(81));
    p.vertex(this.scaleX(525), this.scaleY(68));
    p.vertex(this.scaleX(539), this.scaleY(65));
    p.vertex(this.scaleX(551), this.scaleY(68));
    p.vertex(this.scaleX(637), this.scaleY(181));
    p.vertex(this.scaleX(634), this.scaleY(200));
    p.vertex(this.scaleX(607), this.scaleY(219));
    p.vertex(this.scaleX(597), this.scaleY(211));
    p.vertex(this.scaleX(582), this.scaleY(235));
    p.vertex(this.scaleX(503), this.scaleY(256));
    p.vertex(this.scaleX(438), this.scaleY(98));
    p.endShape();

    p.beginShape();
    p.vertex(this.scaleX(503), this.scaleY(253));
    p.vertex(this.scaleX(520), this.scaleY(285));
    p.vertex(this.scaleX(542), this.scaleY(308));
    p.vertex(this.scaleX(539), this.scaleY(324));
    p.vertex(this.scaleX(550), this.scaleY(337));
    p.vertex(this.scaleX(536), this.scaleY(353));
    p.vertex(this.scaleX(536), this.scaleY(379));
    p.vertex(this.scaleX(541), this.scaleY(398));
    p.vertex(this.scaleX(524), this.scaleY(402));
    p.vertex(this.scaleX(495), this.scaleY(373));
    p.vertex(this.scaleX(465), this.scaleY(360));
    p.vertex(this.scaleX(433), this.scaleY(332));
    p.vertex(this.scaleX(421), this.scaleY(320));
    p.vertex(this.scaleX(503), this.scaleY(253));
    p.endShape();

    p.beginShape();
    p.vertex(this.scaleX(421), this.scaleY(320));
    p.vertex(this.scaleX(425), this.scaleY(337));
    p.vertex(this.scaleX(419), this.scaleY(344));
    p.vertex(this.scaleX(418), this.scaleY(357));
    p.vertex(this.scaleX(414), this.scaleY(359));
    p.vertex(this.scaleX(404), this.scaleY(356));
    p.vertex(this.scaleX(398), this.scaleY(349));
    p.vertex(this.scaleX(389), this.scaleY(348));
    p.vertex(this.scaleX(366), this.scaleY(339));
    p.vertex(this.scaleX(336), this.scaleY(345));
    p.vertex(this.scaleX(310), this.scaleY(338));
    p.vertex(this.scaleX(297), this.scaleY(350));
    p.vertex(this.scaleX(270), this.scaleY(353));
    p.vertex(this.scaleX(258), this.scaleY(359));
    p.vertex(this.scaleX(239), this.scaleY(348));
    p.vertex(this.scaleX(235), this.scaleY(329));
    p.vertex(this.scaleX(421), this.scaleY(320));
    p.endShape();

    p.beginShape();
    p.vertex(this.scaleX(235), this.scaleY(329));
    p.vertex(this.scaleX(228), this.scaleY(334));
    p.vertex(this.scaleX(219), this.scaleY(332));
    p.vertex(this.scaleX(203), this.scaleY(338));
    p.vertex(this.scaleX(180), this.scaleY(332));
    p.vertex(this.scaleX(167), this.scaleY(326));
    p.vertex(this.scaleX(136), this.scaleY(331));
    p.vertex(this.scaleX(125), this.scaleY(325));
    p.vertex(this.scaleX(117), this.scaleY(316));
    p.vertex(this.scaleX(113), this.scaleY(296));
    p.vertex(this.scaleX(235), this.scaleY(329));
    p.endShape();

    p.beginShape();
    p.vertex(this.scaleX(113), this.scaleY(295));
    p.vertex(this.scaleX(83), this.scaleY(294));
    p.vertex(this.scaleX(55), this.scaleY(272));
    p.vertex(this.scaleX(72), this.scaleY(239));
    p.vertex(this.scaleX(113), this.scaleY(295));
    p.endShape();

    p.beginShape();
    p.vertex(this.scaleX(73), this.scaleY(238));
    p.vertex(this.scaleX(27), this.scaleY(244));
    p.vertex(this.scaleX(5), this.scaleY(219));
    p.vertex(this.scaleX(21), this.scaleY(198));
    p.vertex(this.scaleX(16), this.scaleY(167));
    p.vertex(this.scaleX(8), this.scaleY(160));
    p.vertex(this.scaleX(29), this.scaleY(129));
    p.vertex(this.scaleX(20), this.scaleY(101));
    p.vertex(this.scaleX(114), this.scaleY(105));
    p.vertex(this.scaleX(73), this.scaleY(238));
    p.endShape();

    p.beginShape();
    p.vertex(this.scaleX(114), this.scaleY(105));
    p.vertex(this.scaleX(87), this.scaleY(99));
    p.vertex(this.scaleX(73), this.scaleY(100));
    p.vertex(this.scaleX(55), this.scaleY(95));
    p.vertex(this.scaleX(45), this.scaleY(82));
    p.vertex(this.scaleX(34), this.scaleY(82));
    p.vertex(this.scaleX(44), this.scaleY(69));
    p.vertex(this.scaleX(43), this.scaleY(53));
    p.vertex(this.scaleX(55), this.scaleY(39));
    p.vertex(this.scaleX(62), this.scaleY(26));
    p.vertex(this.scaleX(88), this.scaleY(12));
    p.vertex(this.scaleX(120), this.scaleY(13));
    p.vertex(this.scaleX(141), this.scaleY(6));
    p.vertex(this.scaleX(148), this.scaleY(0));
    p.vertex(this.scaleX(169), this.scaleY(13));
    p.vertex(this.scaleX(190), this.scaleY(31));
    p.vertex(this.scaleX(201), this.scaleY(31));
    p.vertex(this.scaleX(202), this.scaleY(39));
    p.vertex(this.scaleX(222), this.scaleY(66));
    p.vertex(this.scaleX(114), this.scaleY(105));
    p.endShape();

    p.pop();
  }
}
