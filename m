Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E17EEE4A7E
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2019 13:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387483AbfJYLxI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Oct 2019 07:53:08 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:37462 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733282AbfJYLxI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 07:53:08 -0400
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id Hnt6210045USYZQ06nt6lR; Fri, 25 Oct 2019 13:53:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNy9S-0004EO-1n; Fri, 25 Oct 2019 13:53:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNy9R-0002Zm-VW; Fri, 25 Oct 2019 13:53:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] kconfig: Extend defconfig field size from 24 to 27
Date:   Fri, 25 Oct 2019 13:53:05 +0200
Message-Id: <20191025115305.9769-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There are 6 defconfigs with names longer than 24 characters, breaking
alignment in "make help".

The "winner" is "ecovec24-romimage_defconfig", counting in at 27
characters.

Extend the defconfig field size to 27 to restore alignment.
Don't use a larger value, to not encourage people to create even longer
defconfig names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>
---
v2:
  - Add Acked-by,
  - Reduce from 32 to 27, now avr32 and its long defconfigs have been
    removed,
  - Update statistics.
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5a1ef8db2cec69f6..a0934f3d0328b06c 100644
--- a/Makefile
+++ b/Makefile
@@ -1512,7 +1512,7 @@ help:
 	@echo  ''
 	@$(if $(boards), \
 		$(foreach b, $(boards), \
-		printf "  %-24s - Build for %s\\n" $(b) $(subst _defconfig,,$(b));) \
+		printf "  %-27s - Build for %s\\n" $(b) $(subst _defconfig,,$(b));) \
 		echo '')
 	@$(if $(board-dirs), \
 		$(foreach b, $(board-dirs), \
-- 
2.17.1

