Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E54E4762F
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2019 19:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfFPRtW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Jun 2019 13:49:22 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:51789 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfFPRtW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Jun 2019 13:49:22 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x5GHmCb4032735;
        Mon, 17 Jun 2019 02:48:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x5GHmCb4032735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560707293;
        bh=IpZflS0Negz+N4Cq4nFYbftm4U1eCdP1v9vv3Zq7pwI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mjEKkL6zNDPWDoUcT/TJNVOlI+a4xtqrjGbKOTyWo9iroqkzg3fr+Rj6ni7MzLyCX
         iO8khdgXDuCB31K0oaafZxyMjaSEYsr0PQ5JKdEGftIv/I9n50ERN9lNIFU0LyMuT7
         4kO+jOKYxzCW5Xy0svE49IBOpi1zMIlVe6s5AKkIEFccIsWRqvvpju8xWXBAu+j3s9
         2pljdiYPJUwnHxlr0Ot0VhG504dhsWfz6fGs9r+qa1bJ+/knWwDu6rlcAqsT/GHH5t
         ohS6znaFFlM0ATXD0EsMGVzZ2XSPseCWTz93mBxwvDYZT7HVPWmw6/AjuTCoqZ7FzD
         z9eHvTbt3XV3w==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 2/2] lib/raid6: refactor unroll rules with pattern rules
Date:   Mon, 17 Jun 2019 02:48:05 +0900
Message-Id: <20190616174805.3069-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190616174805.3069-1-yamada.masahiro@socionext.com>
References: <20190616174805.3069-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This Makefile repeats very similar rules.

Let's use pattern rules. $(UNROLL) can be replaced with $*.

No intended change in behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/raid6/Makefile | 97 ++++++----------------------------------------
 1 file changed, 11 insertions(+), 86 deletions(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 74004037033f..42695bc8d451 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -12,9 +12,6 @@ raid6_pq-$(CONFIG_S390) += s390vx8.o recov_s390xc.o
 
 hostprogs-y	+= mktables
 
-quiet_cmd_unroll = UNROLL  $@
-      cmd_unroll = $(AWK) -f$(srctree)/$(src)/unroll.awk -vN=$(UNROLL) < $< > $@
-
 ifeq ($(CONFIG_ALTIVEC),y)
 altivec_flags := -maltivec $(call cc-option,-mabi=altivec)
 
@@ -50,111 +47,39 @@ CFLAGS_REMOVE_neon8.o += -mgeneral-regs-only
 endif
 endif
 
-targets += int1.c
-$(obj)/int1.c:   UNROLL := 1
-$(obj)/int1.c:   $(src)/int.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
-targets += int2.c
-$(obj)/int2.c:   UNROLL := 2
-$(obj)/int2.c:   $(src)/int.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
-targets += int4.c
-$(obj)/int4.c:   UNROLL := 4
-$(obj)/int4.c:   $(src)/int.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
-targets += int8.c
-$(obj)/int8.c:   UNROLL := 8
-$(obj)/int8.c:   $(src)/int.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
-targets += int16.c
-$(obj)/int16.c:  UNROLL := 16
-$(obj)/int16.c:  $(src)/int.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
+quiet_cmd_unroll = UNROLL  $@
+      cmd_unroll = $(AWK) -f$(srctree)/$(src)/unroll.awk -vN=$* < $< > $@
 
-targets += int32.c
-$(obj)/int32.c:  UNROLL := 32
-$(obj)/int32.c:  $(src)/int.uc $(src)/unroll.awk FORCE
+targets += int1.c int2.c int4.c int8.c int16.c int32.c
+$(obj)/int%.c: $(src)/int.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
 CFLAGS_altivec1.o += $(altivec_flags)
-targets += altivec1.c
-$(obj)/altivec1.c:   UNROLL := 1
-$(obj)/altivec1.c:   $(src)/altivec.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
 CFLAGS_altivec2.o += $(altivec_flags)
-targets += altivec2.c
-$(obj)/altivec2.c:   UNROLL := 2
-$(obj)/altivec2.c:   $(src)/altivec.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
 CFLAGS_altivec4.o += $(altivec_flags)
-targets += altivec4.c
-$(obj)/altivec4.c:   UNROLL := 4
-$(obj)/altivec4.c:   $(src)/altivec.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
 CFLAGS_altivec8.o += $(altivec_flags)
-targets += altivec8.c
-$(obj)/altivec8.c:   UNROLL := 8
-$(obj)/altivec8.c:   $(src)/altivec.uc $(src)/unroll.awk FORCE
+targets += altivec1.c altivec2.c altivec4.c altivec8.c
+$(obj)/altivec%.c: $(src)/altivec.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
 CFLAGS_vpermxor1.o += $(altivec_flags)
-targets += vpermxor1.c
-$(obj)/vpermxor1.c: UNROLL := 1
-$(obj)/vpermxor1.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
 CFLAGS_vpermxor2.o += $(altivec_flags)
-targets += vpermxor2.c
-$(obj)/vpermxor2.c: UNROLL := 2
-$(obj)/vpermxor2.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
 CFLAGS_vpermxor4.o += $(altivec_flags)
-targets += vpermxor4.c
-$(obj)/vpermxor4.c: UNROLL := 4
-$(obj)/vpermxor4.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
 CFLAGS_vpermxor8.o += $(altivec_flags)
-targets += vpermxor8.c
-$(obj)/vpermxor8.c: UNROLL := 8
-$(obj)/vpermxor8.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
+targets += vpermxor1.o vpermxor2.o vpermxor4.o vpermxor8.o
+$(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
 CFLAGS_neon1.o += $(NEON_FLAGS)
-targets += neon1.c
-$(obj)/neon1.c:   UNROLL := 1
-$(obj)/neon1.c:   $(src)/neon.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
 CFLAGS_neon2.o += $(NEON_FLAGS)
-targets += neon2.c
-$(obj)/neon2.c:   UNROLL := 2
-$(obj)/neon2.c:   $(src)/neon.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
 CFLAGS_neon4.o += $(NEON_FLAGS)
-targets += neon4.c
-$(obj)/neon4.c:   UNROLL := 4
-$(obj)/neon4.c:   $(src)/neon.uc $(src)/unroll.awk FORCE
-	$(call if_changed,unroll)
-
 CFLAGS_neon8.o += $(NEON_FLAGS)
-targets += neon8.c
-$(obj)/neon8.c:   UNROLL := 8
-$(obj)/neon8.c:   $(src)/neon.uc $(src)/unroll.awk FORCE
+targets += neon1.c neon2.c neon4.c neon8.c
+$(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
 targets += s390vx8.c
-$(obj)/s390vx8.c:   UNROLL := 8
-$(obj)/s390vx8.c:   $(src)/s390vx.uc $(src)/unroll.awk FORCE
+$(obj)/s390vx%.c: $(src)/s390vx.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
 quiet_cmd_mktable = TABLE   $@
-- 
2.17.1

