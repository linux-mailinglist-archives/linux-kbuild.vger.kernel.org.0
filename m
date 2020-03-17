Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5641187681
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2020 01:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732989AbgCQAHd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 20:07:33 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:53156 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732932AbgCQAHd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 20:07:33 -0400
Received: from sf.home (host86-151-215-168.range86-151.btcentralplus.com [86.151.215.168])
        (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: slyfox)
        by smtp.gentoo.org (Postfix) with ESMTPSA id EAB9C34F213;
        Tue, 17 Mar 2020 00:07:31 +0000 (UTC)
Received: by sf.home (Postfix, from userid 1000)
        id 128085A22061; Tue, 17 Mar 2020 00:07:27 +0000 (GMT)
From:   Sergei Trofimovich <slyfox@gentoo.org>
To:     linux-kernel@vger.kernel.org
Cc:     Sergei Trofimovich <slyfox@gentoo.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: disallow data races on gcc-10 as well
Date:   Tue, 17 Mar 2020 00:07:18 +0000
Message-Id: <20200317000718.177637-1-slyfox@gentoo.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

gcc-10 will rename --param=allow-store-data-races=0
to -fno-allow-store-data-races.

The flag change happened at https://gcc.gnu.org/PR92046.

CC: Jiri Kosina <jkosina@suse.cz>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Michal Marek <michal.lkml@markovi.net>
CC: linux-kbuild@vger.kernel.org
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 171f2b004c8a..9696eb2cd5a1 100644
--- a/Makefile
+++ b/Makefile
@@ -714,6 +714,7 @@ endif
 
 # Tell gcc to never replace conditional load with a non-conditional one
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
+KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
 
 include scripts/Makefile.kcov
 include scripts/Makefile.gcc-plugins
-- 
2.25.1

