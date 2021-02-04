Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A173030F65B
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Feb 2021 16:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237295AbhBDPb7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Feb 2021 10:31:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:54280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237342AbhBDPap (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Feb 2021 10:30:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B000564E50;
        Thu,  4 Feb 2021 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612452604;
        bh=W6Uf5/+lYXubDU7SsF3jtu/Kk3rFPvPhGCQU4C2qxUQ=;
        h=From:To:Cc:Subject:Date:From;
        b=meg6WMXXlWe/K0Jq6mqBAYKDrDIvcg+do2RZs3jUJeNjUa/zLIJKDuN8Ly9qYJ9g5
         R0ocVnX6tTeOgWQXjLEHGUxBNMssSOFdmQ+1jWMvcksHTf+QAwNDdvDqOwPK4SXDkR
         13SiOAHdmC/ycJujjazuaBPIfSg5M7KaXGx4H22PNBXFNUEC6jNwPTNGejT7efQnQo
         k2SOxBNzFq5NzqKQl6B/qMNj80xeRQ0YWZ8gNWKoPIGyBDHWhNnsVdBptj4Yk22O0J
         kj73zqp9yO4KJUEqTWA7/C2lpCbhLfwAeSp0DhVQ7KDDyzsMFSzcnRwhoCwqODQFsR
         z+BPSjrnbt/ww==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, David Brazdil <dbrazdil@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mikhail Petrov <Mikhail.Petrov@mir.dev>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kallsyms: fix nonconverging kallsyms table with lld
Date:   Thu,  4 Feb 2021 16:29:47 +0100
Message-Id: <20210204152957.1288448-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

ARM randconfig builds with lld sometimes show a build failure
from kallsyms:

  Inconsistent kallsyms data
  Try make KALLSYMS_EXTRA_PASS=1 as a workaround

The problem is the veneers/thunks getting added by the linker extend
the symbol table, which in turn leads to more veneers being needed,
so it may take a few extra iterations to converge.

This bug has been fixed multiple times before, but comes back every time
a new symbol name is used. lld uses a different set of idenitifiers from
ld.bfd, so the additional ones need to be added as well.

I looked through the sources and found that arm64 and mips define similar
prefixes, so I'm adding those as well, aside from the ones I observed. I'm
not sure about powerpc64, which seems to already be handled through a
section match, but if it comes back, the "__long_branch_" and "__plt_"
prefixes would have to get added as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/kallsyms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 7ecd2ccba531..54ad86d13784 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -112,6 +112,12 @@ static bool is_ignored_symbol(const char *name, char type)
 		"__crc_",		/* modversions */
 		"__efistub_",		/* arm64 EFI stub namespace */
 		"__kvm_nvhe_",		/* arm64 non-VHE KVM namespace */
+		"__AArch64ADRPThunk_",	/* arm64 lld */
+		"__ARMV5PILongThunk_",	/* arm lld */
+		"__ARMV7PILongThunk_",
+		"__ThumbV7PILongThunk_",
+		"__LA25Thunk_",		/* mips lld */
+		"__microLA25Thunk_",
 		NULL
 	};
 
-- 
2.29.2

