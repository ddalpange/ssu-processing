public class TornWindow extends Drawable {
    int zIndex;
    public TornWindow(int x, int y, int w, int h, int zIndex) {
        super();
        this.setup(x,y,w,h,zIndex);
    }

    private float scaleX(float originalX) {
        return this.x + (originalX - 114) * ((float) this.w / (437 - 114));
    }

    private float scaleY(float originalY) {
        return this.y + (originalY - (-41)) * ((float) this.h / (398 - (-41)));
    }

    @Override
    public void draw() {
        pushStyle();
        strokeWeight(1);
        
        beginShape();
        fill(0);
        vertex(scaleX(114), scaleY(106));
        vertex(scaleX(222), scaleY(67));
        vertex(scaleX(438), scaleY(99));
        vertex(scaleX(503), scaleY(256));
        vertex(scaleX(420), scaleY(320));
        vertex(scaleX(235), scaleY(329));
        vertex(scaleX(113), scaleY(295));
        vertex(scaleX(72), scaleY(238));
        vertex(scaleX(114), scaleY(106));
        endShape();

        fill(#F5F5F5);
        beginShape();
        vertex(scaleX(222), scaleY(67));
        vertex(scaleX(219), scaleY(54));
        vertex(scaleX(226), scaleY(53));
        vertex(scaleX(225), scaleY(48));
        vertex(scaleX(238), scaleY(41));
        vertex(scaleX(241), scaleY(34));
        vertex(scaleX(241), scaleY(27));
        vertex(scaleX(250), scaleY(21));
        vertex(scaleX(249), scaleY(15));
        vertex(scaleX(252), scaleY(4));
        vertex(scaleX(261), scaleY(9));
        vertex(scaleX(261), scaleY(7));
        vertex(scaleX(253), scaleY(-7));
        vertex(scaleX(263), scaleY(-5));
        vertex(scaleX(268), scaleY(-17));
        vertex(scaleX(283), scaleY(-25));
        vertex(scaleX(313), scaleY(-22));
        vertex(scaleX(329), scaleY(-29));
        vertex(scaleX(335), scaleY(-36));
        vertex(scaleX(343), scaleY(-36));
        vertex(scaleX(348), scaleY(-41));
        vertex(scaleX(356), scaleY(-37));
        vertex(scaleX(372), scaleY(-40));
        vertex(scaleX(382), scaleY(-36));
        vertex(scaleX(413), scaleY(-26));
        vertex(scaleX(419), scaleY(-19));
        vertex(scaleX(408), scaleY(1));
        vertex(scaleX(413), scaleY(6));
        vertex(scaleX(418), scaleY(35));
        vertex(scaleX(427), scaleY(19));
        vertex(scaleX(438), scaleY(6));
        vertex(scaleX(446), scaleY(8));
        vertex(scaleX(454), scaleY(16));
        vertex(scaleX(452), scaleY(27));
        vertex(scaleX(448), scaleY(47));
        vertex(scaleX(438), scaleY(98));
        vertex(scaleX(222), scaleY(67));
        endShape();

        beginShape();
        vertex(scaleX(437), scaleY(98));
        vertex(scaleX(439), scaleY(89));
        vertex(scaleX(454), scaleY(79));
        vertex(scaleX(460), scaleY(78));
        vertex(scaleX(472), scaleY(80));
        vertex(scaleX(490), scaleY(75));
        vertex(scaleX(514), scaleY(81));
        vertex(scaleX(525), scaleY(68));
        vertex(scaleX(539), scaleY(65));
        vertex(scaleX(551), scaleY(68));
        vertex(scaleX(637), scaleY(181));
        vertex(scaleX(634), scaleY(200));
        vertex(scaleX(607), scaleY(219));
        vertex(scaleX(597), scaleY(211));
        vertex(scaleX(582), scaleY(235));
        vertex(scaleX(503), scaleY(256));
        vertex(scaleX(438), scaleY(98));
        endShape();

        beginShape();
        vertex(scaleX(503), scaleY(253));
        vertex(scaleX(520), scaleY(285));
        vertex(scaleX(542), scaleY(308));
        vertex(scaleX(539), scaleY(324));
        vertex(scaleX(550), scaleY(337));
        vertex(scaleX(536), scaleY(353));
        vertex(scaleX(536), scaleY(379));
        vertex(scaleX(541), scaleY(398));
        vertex(scaleX(524), scaleY(402));
        vertex(scaleX(495), scaleY(373));
        vertex(scaleX(465), scaleY(360));
        vertex(scaleX(433), scaleY(332));
        vertex(scaleX(421), scaleY(320));
        vertex(scaleX(503), scaleY(253));
        endShape();

        beginShape();
        vertex(scaleX(421), scaleY(320));
        vertex(scaleX(425), scaleY(337));
        vertex(scaleX(419), scaleY(344));
        vertex(scaleX(418), scaleY(357));
        vertex(scaleX(414), scaleY(359));
        vertex(scaleX(404), scaleY(356));
        vertex(scaleX(398), scaleY(349));
        vertex(scaleX(389), scaleY(348));
        vertex(scaleX(366), scaleY(339));
        vertex(scaleX(336), scaleY(345));
        vertex(scaleX(310), scaleY(338));
        vertex(scaleX(297), scaleY(350));
        vertex(scaleX(270), scaleY(353));
        vertex(scaleX(258), scaleY(359));
        vertex(scaleX(239), scaleY(348));
        vertex(scaleX(235), scaleY(329));
        vertex(scaleX(421), scaleY(320));
        endShape();

        beginShape();
        vertex(scaleX(235), scaleY(329));
        vertex(scaleX(228), scaleY(334));
        vertex(scaleX(219), scaleY(332));
        vertex(scaleX(203), scaleY(338));
        vertex(scaleX(180), scaleY(332));
        vertex(scaleX(167), scaleY(326));
        vertex(scaleX(136), scaleY(331));
        vertex(scaleX(125), scaleY(325));
        vertex(scaleX(117), scaleY(316));
        vertex(scaleX(113), scaleY(296));
        vertex(scaleX(235), scaleY(329));
        endShape();

        beginShape();
        vertex(scaleX(113), scaleY(295));
        vertex(scaleX(83), scaleY(294));
        vertex(scaleX(55), scaleY(272));
        vertex(scaleX(72), scaleY(239));
        vertex(scaleX(113), scaleY(295));
        endShape();

        beginShape();
        vertex(scaleX(73), scaleY(238));
        vertex(scaleX(27), scaleY(244));
        vertex(scaleX(5), scaleY(219));
        vertex(scaleX(21), scaleY(198));
        vertex(scaleX(16), scaleY(167));
        vertex(scaleX(8), scaleY(160));
        vertex(scaleX(29), scaleY(129));
        vertex(scaleX(20), scaleY(101));
        vertex(scaleX(114), scaleY(105));
        vertex(scaleX(73), scaleY(238));
        endShape();

        beginShape();
        vertex(scaleX(114), scaleY(105));
        vertex(scaleX(87), scaleY(99));
        vertex(scaleX(73), scaleY(100));
        vertex(scaleX(55), scaleY(95));
        vertex(scaleX(45), scaleY(82));
        vertex(scaleX(34), scaleY(82));
        vertex(scaleX(44), scaleY(69));
        vertex(scaleX(43), scaleY(53));
        vertex(scaleX(55), scaleY(39));
        vertex(scaleX(62), scaleY(26));
        vertex(scaleX(88), scaleY(12));
        vertex(scaleX(120), scaleY(13));
        vertex(scaleX(141), scaleY(6));
        vertex(scaleX(148), scaleY(0));
        vertex(scaleX(169), scaleY(13));
        vertex(scaleX(190), scaleY(31));
        vertex(scaleX(201), scaleY(31));
        vertex(scaleX(202), scaleY(39));
        vertex(scaleX(222), scaleY(66));
        vertex(scaleX(114), scaleY(105));
        endShape();

        popStyle();
    }
}
