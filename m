Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD5C082F63
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 12:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732543AbfHFKDr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 06:03:47 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:35238 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732584AbfHFKDr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 06:03:47 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x76A3QP7032264;
        Tue, 6 Aug 2019 19:03:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x76A3QP7032264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565085808;
        bh=c5fIC9D2pNQf5m9q0GW5G7kSjp5FlUSpKAcjOG6gNXc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SdX9hynWeliTkext6GKcbrRieTQFfibJfmOEdViGw11tEj+aU1Up6XQ5qGBAF8DJ6
         HlRbt+0fzYZJ5O6oK0FHAc3i6QsUKxkPfsIy/c74aW4HmfGcsb+2j3tIJ3nFb9fcF1
         /CEQnOruSqdONzS8CoaZ6whCteVkSdLz0jMHawlPIB9Owu9zdfc/zDbMSRQ1+jTwId
         Lwpp1JQ8EbjkxwM7peDdRuB8UTplVVblIjrRNejV/53F4Qxw/Ri5lSWq1PKcnk1gDn
         ps/caWOsejL1DQ1WyY5a7wGc2QapkO2+sHjhNZQ+MaeN0oR18/PpVPEYW2HNxWJa+q
         Wf0TNLJgf8Jdg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 3/3] kbuild: show hint if subdir-y/m is used to visit module Makefile
Date:   Tue,  6 Aug 2019 19:03:23 +0900
Message-Id: <20190806100323.22919-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806100323.22919-1-yamada.masahiro@socionext.com>
References: <20190806100323.22919-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit ff9b45c55b26 ("kbuild: modpost: read modules.order instead
of $(MODVERDIR)/*.mod"), a module is no longer built in the following
pattern:

  [Makefile]
  subdir-y := some-module

  [some-module/Makefile]
  obj-m := some-module.o

You cannot write Makefile this way in upstream because modules.order is
not correctly generated. subdir-y is used to descend to a sub-directory
that builds tools, device trees, etc.

For external modules, the modules order does not matter. So, the
Makefile above was known to work.

I believe the Makefile should be re-written as follows:

  [Makefile]
  obj-m := some-module/

  [some-module/Makefile]
  obj-m := some-module.o

However, people will have no idea if their Makefile suddenly stops
working. In fact, I received questions from multiple people.

Show a warning if obj-m is specified in a Makefile visited by subdir-y
or subdir-m.

Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 37a1d2cd49d4..4a26c7ed9198 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -52,6 +52,13 @@ ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
 
+ifeq ($(need-modorder),)
+ifneq ($(obj-m),)
+$(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
+$(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
+endif
+endif
+
 # ===========================================================================
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
-- 
2.17.1

