Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8EC633229
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2019 16:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbfFCObr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jun 2019 10:31:47 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:61231 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729008AbfFCObr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 10:31:47 -0400
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hXnzq-0003wA-Ns from George_Davis@mentor.com ; Mon, 03 Jun 2019 07:31:34 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-01.mgc.mentorg.com
 (147.34.90.201) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Mon, 3 Jun
 2019 07:31:32 -0700
From:   "George G. Davis" <george_davis@mentor.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        <linux-kbuild@vger.kernel.org>, Qian Cai <cai@lca.pw>,
        Andrew Morton <akpm@linux-foundation.org>,
        "George G. Davis" <george_davis@mentor.com>,
        Breno Leitao <leitao@debian.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] scripts/checkstack.pl: Fix arm64 wrong or unknown architecture
Date:   Mon, 3 Jun 2019 10:30:39 -0400
Message-ID: <1559572240-18706-1-git-send-email-george_davis@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The following error occurs for the `make ARCH=arm64 checkstack` case:

aarch64-linux-gnu-objdump -d vmlinux $(find . -name '*.ko') | \
perl ./scripts/checkstack.pl arm64
wrong or unknown architecture "arm64"

As suggested by Masahiro Yamada, fix the above error using regular
expressions in the same way it was fixed for the `ARCH=x86` case via
commit fda9f9903be6 ("scripts/checkstack.pl: automatically handle
32-bit and 64-bit mode for ARCH=x86").

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
---
v1:
- https://patchwork.kernel.org/patch/10970393/
v2:
- Updates as Suggested-by: Masahiro Yamada
- Update commit subject due to moving the fix from Makefile to
  checkstack.pl
---
 scripts/checkstack.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index 122aef5e4e14..371bd17a4983 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -46,7 +46,7 @@ my (@stack, $re, $dre, $x, $xs, $funcre);
 	$x	= "[0-9a-f]";	# hex character
 	$xs	= "[0-9a-f ]";	# hex character or space
 	$funcre = qr/^$x* <(.*)>:$/;
-	if ($arch eq 'aarch64') {
+	if ($arch =~ '^(aarch|arm)64$') {
 		#ffffffc0006325cc:       a9bb7bfd        stp     x29, x30, [sp, #-80]!
 		#a110:       d11643ff        sub     sp, sp, #0x590
 		$re = qr/^.*stp.*sp, \#-([0-9]{1,8})\]\!/o;
-- 
2.7.4

