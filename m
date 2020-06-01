Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4541E9DA0
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgFAF5w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:57:52 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39125 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbgFAF5v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:57:51 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLe023694;
        Mon, 1 Jun 2020 14:57:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLe023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991057;
        bh=hClu71YjeEoM6Vu18KHeyn59euJfqdWK4cwz1ZWo+0o=;
        h=From:To:Cc:Subject:Date:From;
        b=XmwjqNOMwrMyFQrC0w92aE/uW+U/I2SuStdzkIWNxFsPbaMCBhfi4RLPM2qGKi2q8
         5ntx8HhktUrVQCmQzsnoNVEq94MgXAAFRnoZRrexCV8B6RdZQdsFx4oLbuSVGatUW5
         WUGwKSERNnAbWLMLmC8poQWoBwGOsCmw7/Q+bmo2kj6dyT88BTHaQ5Kn2VNRpdVJ9X
         FAR7ha2P0WDo0bnpmeDrudlPvJdI+AvbjOjiZ3oqa5SVoFOWPIv5W9xgmZNcK4oZF9
         4e8xyLgfj/zEhkmOMBBu0NSAtN0KUfLNuJYP/+/VqQOi75H/4f3fgyAxwQSZgnUEnm
         CP6zjW0qrSr9g==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 01/37] kbuild: refactor subdir-ym calculation
Date:   Mon,  1 Jun 2020 14:56:55 +0900
Message-Id: <20200601055731.3006266-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Remove the unneeded variables, __subdir-y and __subdir-m.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0d931cc0df94..748e44d5a1e3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -39,16 +39,14 @@ ifdef need-modorder
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
 endif
 
+# Subdirectories we need to descend into
+subdir-ym := $(sort $(subdir-y) $(subdir-m) \
+			$(patsubst %/,%, $(filter %/, $(obj-y) $(obj-m))))
+
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
 # o if we encounter foo/ in $(obj-y), replace it by foo/built-in.a
-#   and add the directory to the list of dirs to descend into: $(subdir-y)
 # o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
-#   and add the directory to the list of dirs to descend into: $(subdir-m)
-__subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
-subdir-y	+= $(__subdir-y)
-__subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
-subdir-m	+= $(__subdir-m)
 ifdef need-builtin
 obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
 else
@@ -56,9 +54,6 @@ obj-y		:= $(filter-out %/, $(obj-y))
 endif
 obj-m		:= $(filter-out %/, $(obj-m))
 
-# Subdirectories we need to descend into
-subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
-
 # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
 multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))), $(m))))
 multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))), $(m))))
-- 
2.25.1

