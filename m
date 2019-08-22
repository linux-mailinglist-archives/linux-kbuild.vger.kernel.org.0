Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 242A598A84
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2019 06:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730957AbfHVEq3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Aug 2019 00:46:29 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:29725 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728870AbfHVEq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:29 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7M4kEYg001492;
        Thu, 22 Aug 2019 13:46:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7M4kEYg001492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566449176;
        bh=6AT+dnC1KRtHZkgR5NDUwVJPbnoa90i0FGA/GZb8vBc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EqviCUvKXVV1ky5vWgW0oSU1yC+wfqhkaix6aM5c8DmuChMg7PZ1EVAJJWUXk59pG
         N49BYLafCevpEnduIyJ1LCfEH6GsRWksHJ4UCPMaIc9eZ5HdSMxJbPC9+wf6lIhE76
         DVLnqAiaI0CFFI9R9mW3MFU4qaZYMq6Ja/V/8lhV3RSlcx9r1LwAnTBBU6Msou7cq9
         tshRgYYUfwTqXDjdUcWjpBL3inkCdyejGo13U83nsHXPUkmoKcZ18Bk2j6z2jJgBdU
         KtfyC45YE3R0RjB1zGY65yrtZ/6RfgXfTRMCYt9Ndy9BrrU2vseMW3zimavi1AkBTC
         3tWlmDwOyr/ng==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] kbuild: Inform user to pass ARCH= for make mrproper only when necessary
Date:   Thu, 22 Aug 2019 13:46:09 +0900
Message-Id: <20190822044613.5349-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822044613.5349-1-yamada.masahiro@socionext.com>
References: <20190822044613.5349-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 3a475b2166fd ("kbuild: Inform user to pass ARCH= for make
mrproper"), if you try out-of-tree build with an unclean source tree,
it suggests to run 'make ARCH=<ARCH> mrproper'.

This looks odd when you are not cross-compiling the kernel. Show the
'ARCH=<ARCH>' part only when ARCH= was given from the command line.
If ARCH is the default (native build) or came from the environment,
it should simply suggest 'make mrproper' as before.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a77102e4ee90..d9cbbc27d4ba 100644
--- a/Makefile
+++ b/Makefile
@@ -1121,7 +1121,7 @@ ifdef building_out_of_srctree
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
 		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
-		echo >&2 "  $(srctree) is not clean, please run 'make ARCH=$(ARCH) mrproper'"; \
+		echo >&2 "  $(srctree) is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
 		echo >&2 "  in the '$(srctree)' directory.";\
 		/bin/false; \
 	fi;
-- 
2.17.1

