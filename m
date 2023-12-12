Return-Path: <linux-kbuild+bounces-346-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F56D80F234
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 17:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58DDCB20AA2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 16:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0CB7765F;
	Tue, 12 Dec 2023 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="H1UvUyOV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012011AA;
	Tue, 12 Dec 2023 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702397819; x=1733933819;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J7+Xj3FjWfdGPh60vkm3axKqArxj/3g1wtG+A2GoS0g=;
  b=H1UvUyOV3eKWPq9JZXVJ64jdN7ctjA/xSYJxBQJz2UlFUyZYJ4yCNzjH
   WBehaOLk8RMWOkhh5uuGXiuBAVSyo5gHT72iSyvUGlxPiAkVA0qaUBQ+1
   cuSKrk1Po8QQ9CgXxpbhPck3StamS4yysKiq6ccwh/Pshh4W5sNxc+1i1
   ztPZ2+O9Vy/PKz622p3YTbCqnoI4jAHNwVjI9KS98b2cFW2i9ZzqUNJEX
   5x/Q8jbYbJM1G11Lf5RhBg5OSpZ0BRHKx5ZAOwN+4O9ED4lUmS9HTilbE
   I++2LBRKYw63CZuWVBzhyOn3h5T6xnybPhnhqScZ4M5AW5FFhORHbV+LR
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,270,1695679200"; 
   d="scan'208";a="34463669"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2023 17:16:55 +0100
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.53.15])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 653F3280075;
	Tue, 12 Dec 2023 17:16:55 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] Reapply "kbuild: Create directory for target DTB"
Date: Tue, 12 Dec 2023 17:16:10 +0100
Message-ID: <20231212161610.100862-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit dd7699e37f289fa433f42c6bcc108468c8b198c0.

On powerpc, dtb-y is usually empty unless CONFIG_OF_ALL_DTBS is set. While
passing a DTB as a make target explicitly works fine, individual DTB
builds may also be pulled in as dependencies by cuImage.% and similar
targets. In this case, nothing creates the arch/powerpc/dts directory,
causing out-of-tree builds to fail.

Fixes: dd7699e37f28 ("Revert "kbuild: Create directory for target DTB"")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 scripts/Makefile.lib | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1a965fe68e011..3fe0fc46badfe 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -389,7 +389,8 @@ $(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
 	$(call if_changed,wrap_S_dtb)
 
 quiet_cmd_dtc = DTC     $@
-cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
+	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(DTC) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


