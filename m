Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E608E1DDCE2
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 04:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgEVCA2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 22:00:28 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:37247 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgEVCA2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 22:00:28 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 04M205UZ009585;
        Fri, 22 May 2020 11:00:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 04M205UZ009585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590112811;
        bh=eAVYzp2qo7mR9QsAot69dvdfW1xfxnf150PWTQtQKAM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hu49JF02RKIrGrDIo8TjQv1YBzNoVA40iBGPiB+KDSvhxHIPwQB1sX9+8bwOaCLAF
         V98Zf4w1ni744haIWqkAuJojJ8bvP+Ubs/icMh02rr8v1T/G+Qi5QUnrktrulQ1XHq
         wKnm80ZgDY91yD8f0qh6ev/GzWBiZXu6fwZPCp6gudJUs2v/QB2i3/apj2a7I86tXS
         N7coM1KliTqTEdbdfaCpbkasNAkRPHoX/rWHPGSX+bosaFd1zE4stl4z3h3gQiBPMG
         pTLBcZml1nXND2bHQF1U3sghf99LIq1mLy6obmuO0ljyDWwPEIu8vbI1n223WG9a+e
         HpmVt/hbJl3vg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] kbuild: move subdir-obj-y to scripts/Makefile.build
Date:   Fri, 22 May 2020 11:00:00 +0900
Message-Id: <20200522020002.504506-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522020002.504506-1-masahiroy@kernel.org>
References: <20200522020002.504506-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Save $(addprefix ...) for subdir-obj-y.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 2 ++
 scripts/Makefile.lib   | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f46d25441804..ee283efc1b45 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,6 +69,8 @@ endif
 
 # ===========================================================================
 
+subdir-obj-y := $(filter %/built-in.a, $(real-obj-y))
+
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
 lib-target := $(obj)/lib.a
 endif
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 52299d5dba28..a41a4bbd20e2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -62,10 +62,6 @@ multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m
 multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))), $(m))))
 multi-used   := $(multi-used-y) $(multi-used-m)
 
-# $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
-# tell kbuild to descend
-subdir-obj-y := $(filter %/built-in.a, $(obj-y))
-
 # Replace multi-part objects by their individual parts,
 # including built-in.a from subdirectories
 real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
@@ -91,7 +87,6 @@ targets		:= $(addprefix $(obj)/,$(targets))
 modorder	:= $(addprefix $(obj)/,$(modorder))
 obj-m		:= $(addprefix $(obj)/,$(obj-m))
 lib-y		:= $(addprefix $(obj)/,$(lib-y))
-subdir-obj-y	:= $(addprefix $(obj)/,$(subdir-obj-y))
 real-obj-y	:= $(addprefix $(obj)/,$(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/,$(real-obj-m))
 multi-used-m	:= $(addprefix $(obj)/,$(multi-used-m))
-- 
2.25.1

