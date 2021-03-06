Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D8832F898
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Mar 2021 07:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhCFGME (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Mar 2021 01:12:04 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:48486 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhCFGLz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Mar 2021 01:11:55 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 1266BSul023625;
        Sat, 6 Mar 2021 15:11:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 1266BSul023625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615011089;
        bh=ZrWB5cwC1ehE12Fu5pfbGL5TXTZUw127tNDi1a75d9M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vPIcySpn0mpMk9I2vTfPOn8I6y6roeYawZxImkZ1pebKP1VjH5F2AsguohB22Yn6C
         jl/z7yxjau/aec7ghh5NyBd/PnAGToGdEgPDYlSoaWj1UDgsiCTurYamlNtvI39uOB
         hWenycapJ7+9Y4QLbO8znl/K4y66WpUoLrD+06UAU0cGSK2onTrhTM8IVFVjn1mOUm
         nlZ9nQhtYVou1qsJqarARcXu1vBK2SyVmOAotpAqnbMDf1dYXzoWqW7cn+XXJNR+uN
         t95qRC/WaXXIlR9AbrlKjewQekkGLJiM9xnJwzaw0OE2ZS4+H3ryhcAKC5uqSYvTDo
         0zcsdJ2LsWEsA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/2] kbuild: move $(strip ) to suffix-search definition
Date:   Sat,  6 Mar 2021 15:11:21 +0900
Message-Id: <20210306061121.2023529-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210306061121.2023529-1-masahiroy@kernel.org>
References: <20210306061121.2023529-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Move $(strip ...) to the callee from the callers of suffix-search. It
shortens the code slightly. Adding a space after a comma will not be
a matter. I also dropped parentheses from single character variables.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index e60be0bddda2..4c0f952da84f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -45,16 +45,16 @@ obj-y		:= $(filter-out %/, $(obj-y))
 endif
 
 # Expand $(foo-objs) $(foo-y) by calling $(call suffix-search,foo.o,-objs -y)
-suffix-search = $(foreach s,$(2),$($(1:.o=$s)))
+suffix-search = $(strip $(foreach s, $2, $($(1:.o=$s))))
 # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
-multi-search = $(sort $(foreach m,$(1), $(if $(strip $(call suffix-search,$(m),$(2) -)), $(m))))
+multi-search = $(sort $(foreach m, $1, $(if $(call suffix-search, $m, $2 -), $m)))
 multi-obj-y := $(call multi-search,$(obj-y),-objs -y)
 multi-obj-m := $(call multi-search,$(obj-m),-objs -y -m)
 multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
 
 # Replace multi-part objects by their individual parts,
 # including built-in.a from subdirectories
-real-search = $(foreach m,$(1), $(if $(strip $(call suffix-search,$(m),$(2) -)),$(call suffix-search,$(m),$(2)),$(m)))
+real-search = $(foreach m, $1, $(if $(call suffix-search, $m, $2 -), $(call suffix-search, $m, $2), $m))
 real-obj-y := $(call real-search, $(obj-y),-objs -y)
 real-obj-m := $(call real-search, $(obj-m),-objs -y -m)
 
-- 
2.27.0

