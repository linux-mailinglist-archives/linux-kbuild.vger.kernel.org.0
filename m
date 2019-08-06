Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6230882F6A
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 12:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732696AbfHFKD7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 06:03:59 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:35533 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732584AbfHFKD6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 06:03:58 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x76A3QP6032264;
        Tue, 6 Aug 2019 19:03:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x76A3QP6032264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565085807;
        bh=hqrexllHfLZTAkJJn6Gw3NY0h4befaHZw0q0NAO9avI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mkb1F4nTNsDMbt5jCGEYav0ufh9ooFndRQLs3DeFxQbPRzQT3R7QeZXB5q+tAVi8g
         UVTHRRvR6fE5617epVKueSGkKKO7kcDi4c4uHzKH+5W8Z4b/ACBIP9StpIsTjewyoN
         SGJ0HWCy6q7faVRDVH88uD+aH+1kA8kkeF/crWUZctBTHTm4ixp30miVLnyNEJ2KPR
         kurpyioaRYJ6IrYUV8TLiEl2X+lpi3Grh0isGNKMMtANi+DSUZQlGAqXZIXnS17EEQ
         zk39qweoc69ntZmQbR0yQnGfYJVL7I9D6+dauY+aDXALbvTQAcDzuPAw2Lytm2lJmi
         IX4R6nJL8zVHw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/3] kbuild: generate modules.order only in directories visited by obj-y/m
Date:   Tue,  6 Aug 2019 19:03:22 +0900
Message-Id: <20190806100323.22919-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806100323.22919-1-yamada.masahiro@socionext.com>
References: <20190806100323.22919-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The modules.order files in directories visited by the chain of obj-y
or obj-m are merged to the upper-level ones, and become parts of the
top-level modules.order. On the other hand, there is no need to
generate modules.order in directories visited by subdir-y or subdir-m.
They would become orphan anyway.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3fe0c73e002c..37a1d2cd49d4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -488,7 +488,8 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
 PHONY += $(subdir-ym)
 $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
-	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1)
+	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1) \
+	need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
-- 
2.17.1

