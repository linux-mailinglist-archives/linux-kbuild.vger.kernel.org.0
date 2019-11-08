Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18585F4103
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2019 08:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730364AbfKHHL0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Nov 2019 02:11:26 -0500
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:50807 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728513AbfKHHL0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 02:11:26 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01422;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0ThU5MwV_1573197070;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0ThU5MwV_1573197070)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 08 Nov 2019 15:11:21 +0800
From:   shile.zhang@linux.alibaba.com
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [RFC PATCH v2 2/3] kbuild: Sort ORC unwind tables in vmlinux link phase
Date:   Fri,  8 Nov 2019 15:11:07 +0800
Message-Id: <20191108071108.72132-3-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
References: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Shile Zhang <shile.zhang@linux.alibaba.com>

Sort the ORC unwind tables in vmlinux link phase, only for ORC unwinder.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 scripts/link-vmlinux.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 06495379fcd8..dea7797fcbdc 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -183,6 +183,11 @@ sortextable()
 	${objtree}/scripts/sortextable ${1}
 }
 
+sortorctable()
+{
+	${objtree}/scripts/sortorctable ${1}
+}
+
 # Delete output files in case of error
 cleanup()
 {
@@ -303,6 +308,15 @@ if [ -n "${CONFIG_BUILDTIME_EXTABLE_SORT}" ]; then
 	sortextable vmlinux
 fi
 
+if [ -n "${CONFIG_UNWINDER_ORC}" ]; then
+	info SORTORC vmlinux
+	if ! sortorctable vmlinux; then
+		echo >&2 Failed to sort ORC unwind tables
+		echo >&2 Check what is wrong and try again
+		exit 1
+	fi
+fi
+
 info SYSMAP System.map
 mksysmap vmlinux System.map
 
-- 
2.24.0.rc2

