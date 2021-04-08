Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FC2358F30
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 23:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbhDHVcD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 17:32:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:38028 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232158AbhDHVcC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 17:32:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C3A83AFD5;
        Thu,  8 Apr 2021 21:31:49 +0000 (UTC)
From:   Michal Suchanek <msuchanek@suse.de>
To:     linux-kbuild@vger.kernel.org
Cc:     Michal Suchanek <msuchanek@suse.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: dummy-tools: Add elfedit.
Date:   Thu,  8 Apr 2021 23:31:39 +0200
Message-Id: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

elfedit is used in Makefile

 Makefile:GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))

which causes this error getting printed

 which: no elfedit in (./scripts/dummy-tools)

Add elfedit to dummy-tools to avoid this error.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 scripts/dummy-tools/elfedit | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 scripts/dummy-tools/elfedit

diff --git a/scripts/dummy-tools/elfedit b/scripts/dummy-tools/elfedit
new file mode 120000
index 000000000000..c0648b38dd42
--- /dev/null
+++ b/scripts/dummy-tools/elfedit
@@ -0,0 +1 @@
+ld
\ No newline at end of file
-- 
2.26.2

