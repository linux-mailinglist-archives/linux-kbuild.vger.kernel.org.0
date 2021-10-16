Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB79430261
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Oct 2021 13:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244314AbhJPL3F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Oct 2021 07:29:05 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:42305 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229848AbhJPL3D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Oct 2021 07:29:03 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6E3AB580FDE;
        Sat, 16 Oct 2021 07:26:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 16 Oct 2021 07:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        joshtriplett.org; h=date:from:to:cc:subject:message-id
        :mime-version:content-type; s=fm1; bh=eILtDThS15EVW64aCebMmA4bjm
        6AbsJmEdCTRDYtsoQ=; b=JFiW4Y6C8+WQ58dOasxfFFnr8YpBTjrXRJT7CCLPw8
        3ERsqbu2TKAP5dJ7XQVpq4I9jvULZWJTwVbGgs0wzVeJGTO6kBdHtuu7xc6uVBHf
        4JRbI87GcaaygnZOTlE3vn7PcsxvMjK8FMEO8IBAOO0zO/oK3lvtXhJSoS6GQesd
        yyS8KA/Tz/20Kpy2IrngEBv37JFtQRgNJUDnQaqZiWnYDcN13IHVl92SuTV74fc7
        I//ymom6LQLliYXfWCel2DHVPR4TqEJH68B7V0jEYUBHjjqu7W/1jUTBAUmyYVKN
        FgeDgHBQ8ou2ExPMlyBQzEHEjQTl72k2BgbJ5Xg+RQNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=eILtDThS15EVW64aCebMmA4bjm6Ab
        sJmEdCTRDYtsoQ=; b=J61Vyz+Kw9LuRHcEMID+5eIR1Rbxd9OTk1een1HchHNoW
        Ri0p8oUNmkzThooGzw44teV3Rppah5llq0OFgUishSAeKGMs2BYwx8GZFeeBbmTA
        /opZFUJOGZdWoVCg1BramyH1B5apbVn7SOBAew8cD8ATDATmHnhvzZ2pkWzJf+nu
        AlgQb/FIKcbCVokcECmYjJRtjFazhCv3ZP4rd+btdyC904yTTzIA+OXNlWhPlqVj
        PdExcfh07kCBwL1OMyNtLRXxBWLbXynKKQN3TnCBbwwibRV4te8TITvr03yiNwf3
        bz/FbNmEaPHees6Bs87BjtEh6f7foPzswkkcrJtwg==
X-ME-Sender: <xms:_rZqYYp_w5x2fWGh92loCgwp9wPtwEOLFTf6a_AIt8K_o2Cyth_uyw>
    <xme:_rZqYeplAethZCFcem8ssZLLkkUNJOilC6PZ7E44w4-jzKgGlAEM5In-qbVxETr1A
    2neDd5rDiR62I-sYkQ>
X-ME-Received: <xmr:_rZqYdP4QChYK5zgQSX46k4muR7PcgbhmZHZMO-mC8CvjD1li8ORmu9-ovtlPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduiedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehttdertddttddvnecuhfhrohhmpeflohhshhcuvfhr
    ihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqnecuggftrf
    grthhtvghrnhepleelgeegtdejjeefuedvudefgefgkedtfeekheevueevvddvhfegfffg
    vdfgffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epjhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgh
X-ME-Proxy: <xmx:_rZqYf7vniRMyEPMVgNaMsJHPy5GgVLDBhWl3K9-erkN0Hvsiha10Q>
    <xmx:_rZqYX4ntiHyzKlLA2d46Q5ha7C1nfBgZ8Ih7L6Pu8yvk3YAFpELpg>
    <xmx:_rZqYfigGC830MJ30DH0KdLSavTTkLsFxLd4jCzNCFJYrA5XddF87A>
    <xmx:_rZqYRS9mPwDr2EWIqdxO19at6gTljrh-ySbZ_hkofgPKf5FxSDbNQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Oct 2021 07:26:52 -0400 (EDT)
Date:   Sat, 16 Oct 2021 13:26:50 +0200
From:   Josh Triplett <josh@joshtriplett.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: lxdialog: Support home/end when editing values
Message-ID: <257b264c328253acda17ebafd7be6740021b1707.1634383536.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When editing long string values, this makes navigation much easier.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---

Ran into this when repeatedly editing CONFIG_CMDLINE and wanting to
change the first value.

 scripts/kconfig/lxdialog/inputbox.c | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 1dcfb288ee63..25c7cb05b3da 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -181,6 +181,39 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 					pos++;
 				}
 				continue;
+			case KEY_HOME:
+				if (pos > 0) {
+					pos = show_x = input_x = 0;
+					wmove(dialog, box_y, box_x);
+					for (i = 0; i < box_width; i++)
+						waddch(dialog, ' ');
+					wmove(dialog, box_y, box_x);
+					for (i = 0; i < box_width && instr[show_x + i]; i++)
+						waddch(dialog, instr[show_x + i]);
+					wmove(dialog, box_y, box_x);
+				}
+				continue;
+			case KEY_END:
+				if (pos < len) {
+					pos = len;
+					wmove(dialog, box_y, box_x);
+					for (i = 0; i < box_width; i++)
+						waddch(dialog, ' ');
+					wmove(dialog, box_y, box_x);
+					if (len < box_width) {
+						show_x = 0;
+						input_x = box_width - 1;
+						for (i = 0; i < box_width && instr[show_x + i]; i++)
+							waddch(dialog, instr[show_x + i]);
+					} else {
+						show_x = len - box_width + 1;
+						input_x = box_width - 1;
+					}
+					for (i = 0; i < box_width && instr[show_x + i]; i++)
+						waddch(dialog, instr[show_x + i]);
+					wmove(dialog, box_y, input_x + box_x);
+				}
+				continue;
 			default:
 				if (key < 0x100 && isprint(key)) {
 					if (len < MAX_LEN) {
-- 
2.33.0

