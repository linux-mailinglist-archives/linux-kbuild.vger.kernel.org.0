Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E997E39473C
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 May 2021 20:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhE1Sr0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 May 2021 14:47:26 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:22722 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhE1Sq6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 May 2021 14:46:58 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 14SIibCo014551;
        Sat, 29 May 2021 03:44:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 14SIibCo014551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622227480;
        bh=ldEXN72R4ZQPqoN770mx5epfuTtmbUuSqubynOtJnH0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jx3HmzBTmRuFXHwp2jTaBcC6mdAbK2SjbLdSEgG4jzFDVPH4iDPS/5F8jeEUVXMnx
         /nH5QBsXiR6E5egGiEx1kaW86fLnKPAJjEcGLbUEAxH5aAqbW5HrUoWicu0pTfh5i5
         drRCv1nS3H8jq7SyAM8n/bZABJOxTPSgPWwodypKHyt7Mc1KZXpya7QG79fjycr89i
         OwzQ/xQMYQt7VboM0zEtKQpzaNvsN/ow/YJZk+lNSW77h1cIDCph0IV4xZF71LIbIA
         ZCIKqCNhhZGIjBJSYYZMrksAH5+JrhQlIcoyUiX4IiBlr9HLpDL16YY49eMGZ4EtbC
         o7LX1tPTphmQQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] block: move CONFIG_BLOCK guard to top Makefile
Date:   Sat, 29 May 2021 03:44:35 +0900
Message-Id: <20210528184435.252924-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528184435.252924-1-masahiroy@kernel.org>
References: <20210528184435.252924-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Every object under block/ depends on CONFIG_BLOCK.

Move the guard to the top Makefile since there is no point to
descend into block/ if CONFIG_BLOCK=n.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile       | 3 ++-
 block/Makefile | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 88cb5b59109c..055dcf5a2704 100644
--- a/Makefile
+++ b/Makefile
@@ -1095,7 +1095,8 @@ export MODORDER := $(extmod_prefix)modules.order
 export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y			+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/
+core-$(CONFIG_BLOCK)	+= block/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
diff --git a/block/Makefile b/block/Makefile
index 8d841f5f986f..99f0757a3aa5 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the kernel block layer
 #
 
-obj-$(CONFIG_BLOCK) := bio.o elevator.o blk-core.o blk-sysfs.o \
+obj-y		:= bio.o elevator.o blk-core.o blk-sysfs.o \
 			blk-flush.o blk-settings.o blk-ioc.o blk-map.o \
 			blk-exec.o blk-merge.o blk-timeout.o \
 			blk-lib.o blk-mq.o blk-mq-tag.o blk-stat.o \
-- 
2.27.0

