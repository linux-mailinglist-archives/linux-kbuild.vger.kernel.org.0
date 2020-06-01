Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B721E9DAA
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgFAF6V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39996 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgFAF6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:20 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLm023694;
        Mon, 1 Jun 2020 14:57:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLm023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991060;
        bh=0mcughTaNFDCYNzMHI0+9bbxtOVuVTfFQEhpUArACs8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qpyNRWsrZAcnhxytF/UYngtIWRisnQFSmeowoH4BeTJt1jYXEQo0WyPQN6isQ4aZP
         ejnUU+F9GYldxCSZ6vKQys82l4QpgDGei1ZO8dULTb0/Y2HDgN+WkkfSoSugzi1b2L
         cXkhRGjPUhz921kUAqrBRJYsvoP0QRNitpFovB0Cju3VNe8Lk+EBEdHKBIACy/zg+f
         5ekYOHlgkBQKl5hfFn7qHNYCPYsgMEjPOZnaV7WrPV8vH8bF9ADZLB0qNrkqdBNHvh
         Bw/GpCGaCGfGvrX4D5BOWMKN8FroYsi86deMWzSsC7O7ItEKIbMTXPIQmyvDwKDpE1
         7EIGv8JyTQ29Q==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 09/37] modpost: pass -N option only for modules modpost
Date:   Mon,  1 Jun 2020 14:57:03 +0900
Message-Id: <20200601055731.3006266-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The built-in only code is not required to have MODULE_IMPORT_NS() to
use symbols. So, the namespace is not checked for vmlinux(.o).

Do not pass the meaningless -N option to the first pass of modpost.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 95f303a2323e..02d9f08a20a7 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -53,7 +53,6 @@ MODPOST = scripts/mod/modpost								\
 	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))			\
 	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
-	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N) 	\
 	$(if $(KBUILD_MODPOST_WARN),-w)
 
 ifdef MODPOST_VMLINUX
@@ -82,6 +81,10 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
 endif
 
+# modpost options for modules (both in-kernel and external)
+MODPOST += \
+	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)
+
 ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
 MODPOST += -n
 endif
-- 
2.25.1

