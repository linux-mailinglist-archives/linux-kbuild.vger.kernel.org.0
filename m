Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F348B1E9DA4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgFAF5y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:57:54 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39165 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgFAF5x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:57:53 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLi023694;
        Mon, 1 Jun 2020 14:57:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLi023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991059;
        bh=kdojAnTCQvKdlZFcTjZtYl2v8pRFRZskOxn0SX8gFdM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EUbnlPCwTq+NNqpaJUFS4zgLOjFFvIsECtUQPulfR7WSfeg45XC24oQYlYizKgc6s
         c73HoQleQcESd25QvEl6dpVPLuQEqILLooeZmW+7qRN1FBlHVuHMqq4IqM0FRmr9sK
         o/bzqOp4OR05ibUuX+85Iq+dSu3R7A2nClQawm1S5VqeIG9GeLMZWLwPmYWWE+edW7
         IaiU+8dp1o/JV+mA2dT03+9EDMIyrzIcB3qfDZ/AwXw5r/NqkEkWxkOxwHqsaB1YZo
         SH9av17nCYdu2yTWDmlCyBj9Bttvx0nNJhhmhrPnns17hcdBhynQQMuaEwnWPepAQa
         g5KhxW11lZktg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 05/37] kbuild: refactor KBUILD_VMLINUX_{OBJS,LIBS} calculation
Date:   Mon,  1 Jun 2020 14:56:59 +0900
Message-Id: <20200601055731.3006266-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Do not overwrite core-y or drivers-y. Remove libs-y1 and libs-y2.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index c0c086d06753..0416760aeb28 100644
--- a/Makefile
+++ b/Makefile
@@ -1069,19 +1069,18 @@ vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
 build-dirs	:= $(vmlinux-dirs)
 clean-dirs	:= $(vmlinux-alldirs)
 
-core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
-drivers-y	:= $(patsubst %/, %/built-in.a, $(drivers-y))
-libs-y2		:= $(patsubst %/, %/built-in.a, $(filter %/, $(libs-y)))
+# Externally visible symbols (used by link-vmlinux.sh)
+KBUILD_VMLINUX_OBJS := $(head-y) $(addsuffix built-in.a, $(core-y))
+KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(filter %/, $(libs-y)))
 ifdef CONFIG_MODULES
-libs-y1		:= $(filter-out %/, $(libs-y))
-libs-y2		+= $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
+KBUILD_VMLINUX_OBJS += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
+KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 else
-libs-y1		:= $(patsubst %/, %/lib.a, $(libs-y))
+KBUILD_VMLINUX_LIBS := $(patsubst %/,%/lib.a, $(libs-y))
 endif
+KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(drivers-y))
 
-# Externally visible symbols (used by link-vmlinux.sh)
-export KBUILD_VMLINUX_OBJS := $(head-y) $(core-y) $(libs-y2) $(drivers-y)
-export KBUILD_VMLINUX_LIBS := $(libs-y1)
+export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 export LDFLAGS_vmlinux
 # used by scripts/Makefile.package
-- 
2.25.1

