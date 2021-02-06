Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE29311A83
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 04:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhBFDxW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 22:53:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:48426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232336AbhBFDvR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 22:51:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2538464FC0;
        Sat,  6 Feb 2021 03:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612583436;
        bh=vdUbsg0jJBB/m0KbUGErNoxNFY4AN0g2hqmH/iDRPfs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bFgAnaarWO/LBAljNpMKVguvZiPb3fv3gklcLNwjdmFUwnaEmxcfbeSNhP/cksE6G
         YhTSWC+5B8ZW4A/Ep85WUe+Y2r0s/CxTIstk253oVCmbNuh97wquki3XJI6g3m0a+i
         Ad3+SuMAku3GM1E5Lp+IYVCi+f/iNZYFdbGKtUGZTkmjBrtFYkpOs9fnQ4Fnt72aqk
         VQlTjHM+eDfHyYXTftcTZCdjHsll4BGJ0796KasndduEmbqwc+5TrITgSIfXiJB177
         VP5Sl8tnxNwuj51icXg7vd5WWQ/aBugkJMFYOHrZDesgxkHW5Tl59fpXO5axW7OuEh
         tLgMxVuM2y/bA==
From:   Sasha Levin <sashal@kernel.org>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 2/3] kbuild: clamp SUBLEVEL to 255
Date:   Fri,  5 Feb 2021 22:50:32 -0500
Message-Id: <20210206035033.2036180-2-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206035033.2036180-1-sashal@kernel.org>
References: <20210206035033.2036180-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Right now if SUBLEVEL becomes larger than 255 it will overflow into the
territory of PATCHLEVEL, causing havoc in userspace that tests for
specific kernel version.

While userspace code tests for MAJOR and PATCHLEVEL, it doesn't test
SUBLEVEL at any point as ABI changes don't happen in the context of
stable tree.

Thus, to avoid overflows, simply clamp SUBLEVEL to it's maximum value in
the context of LINUX_VERSION_CODE. This does not affect "make
kernelversion" and such.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 49ac1b7fe8e99..157be50c691e5 100644
--- a/Makefile
+++ b/Makefile
@@ -1258,9 +1258,15 @@ define filechk_utsrelease.h
 endef
 
 define filechk_version.h
-	echo \#define LINUX_VERSION_CODE $(shell                         \
-	expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
-	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
+	if [ $(SUBLEVEL) -gt 255 ]; then                                 \
+		echo \#define LINUX_VERSION_CODE $(shell                 \
+		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 255); \
+	else                                                             \
+		echo \#define LINUX_VERSION_CODE $(shell                 \
+		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
+	fi;                                                              \
+	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
+	((c) > 255 ? 255 : (c)))'
 endef
 
 $(version_h): FORCE
-- 
2.27.0

