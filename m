Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB261E9DA3
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgFAF5x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:57:53 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39169 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgFAF5x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:57:53 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLh023694;
        Mon, 1 Jun 2020 14:57:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLh023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991058;
        bh=+VE+el9BKc5nZ+psUOwHPTqn37gr8MM9TL3PeWQiFbw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tEInk+p2ulAGn/s7FdGHFouGFk6w1++zHuF5etUAsbduzTLmJEvvDjLmpcS4BR8h/
         lUpvCmZcv0ajug4QVsJH4QitdsMepwcpSbDkN73/tafz/KclhaCidLv1qc1zCVOCoB
         uHcnwVwE4tlZSE+CB0ujZ0pO3i+wy1mSVdEwZflg9qUBbIDijkSe0Ejb74kCdf4+Xm
         hdC7y/91wpfKmeED7LAVIy3LGd/IN9r2ZWhcncwQSKALYH8uY6HEXDzDO21+O50vHy
         gmDwGJOwjBE5S/2W7Eh4KeWKIc9zUmVsI8myd/4c0z9Lt+PNWM0zs8HC63QAQT5DeW
         zrwJYCraNLH/A==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 04/37] kbuild: merge net-y and virt-y into drivers-y
Date:   Mon,  1 Jun 2020 14:56:58 +0900
Message-Id: <20200601055731.3006266-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This will slightly change the link order; drivers-y from arch Makefile
will be linked after virt/built-in.a, but I guess this is not a big
deal.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index f9c37045cf64..c0c086d06753 100644
--- a/Makefile
+++ b/Makefile
@@ -646,9 +646,8 @@ ifeq ($(KBUILD_EXTMOD),)
 core-y		:= init/ usr/
 drivers-y	:= drivers/ sound/
 drivers-$(CONFIG_SAMPLES) += samples/
-net-y		:= net/
+drivers-y	+= net/ virt/
 libs-y		:= lib/
-virt-y		:= virt/
 endif # KBUILD_EXTMOD
 
 # The all: target is the default when no target is given on the
@@ -1061,18 +1060,17 @@ core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-		     $(net-y) $(net-m) $(libs-y) $(libs-m) $(virt-y)))
+		     $(libs-y) $(libs-m)))
 
 vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
 		     $(patsubst %/,%,$(filter %/, $(core-) \
-			$(drivers-) $(net-) $(libs-) $(virt-))))
+			$(drivers-) $(libs-))))
 
 build-dirs	:= $(vmlinux-dirs)
 clean-dirs	:= $(vmlinux-alldirs)
 
 core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
 drivers-y	:= $(patsubst %/, %/built-in.a, $(drivers-y))
-net-y		:= $(patsubst %/, %/built-in.a, $(net-y))
 libs-y2		:= $(patsubst %/, %/built-in.a, $(filter %/, $(libs-y)))
 ifdef CONFIG_MODULES
 libs-y1		:= $(filter-out %/, $(libs-y))
@@ -1080,11 +1078,9 @@ libs-y2		+= $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 else
 libs-y1		:= $(patsubst %/, %/lib.a, $(libs-y))
 endif
-virt-y		:= $(patsubst %/, %/built-in.a, $(virt-y))
 
 # Externally visible symbols (used by link-vmlinux.sh)
-export KBUILD_VMLINUX_OBJS := $(head-y) $(core-y) $(libs-y2) \
-			      $(drivers-y) $(net-y) $(virt-y)
+export KBUILD_VMLINUX_OBJS := $(head-y) $(core-y) $(libs-y2) $(drivers-y)
 export KBUILD_VMLINUX_LIBS := $(libs-y1)
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 export LDFLAGS_vmlinux
-- 
2.25.1

