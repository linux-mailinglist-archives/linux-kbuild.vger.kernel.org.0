Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA6C512230B
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbfLQERk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:17:40 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:51175 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfLQERk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:17:40 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id xBH4GfU3015071;
        Tue, 17 Dec 2019 13:16:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com xBH4GfU3015071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556201;
        bh=dEOWmF2zF5XiXL5o8aHjRVLSi/pDnppldeUGub5lGgI=;
        h=From:To:Cc:Subject:Date:From;
        b=K+ONjyp1WJpm7fbKXwPIb30gjiFeQZIAmhI9SY5k0w+Tw0anYaGrGh0R4UClw7sd6
         F2FHo2uLcJQxaC5Mk3rFN2ULVd0mombeRavKoBUywxAoE/DhsadjFtb/MBo8IMJX2a
         2/hLOMOu38CpYxz599duKSHTOt2h3PRswFNDv1EPNxOtoXeG3spBbIBYDFmzqYgGVf
         ZwzUVujF9c4km2M1ougcuiEcgSWkZ6xvYowZmoerybfdLQuGbyLE5wA2qvKSeMq4NV
         AGtdLk6DjWC8vy3rv+67eAUhWK1crx0wLAgqTGdfdrthgzklU+/kmJPaLjOqiCzn6+
         A9sZ3lcvn6aHQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kconfig: localmodconfig: remove unused $config
Date:   Tue, 17 Dec 2019 13:16:36 +0900
Message-Id: <20191217041637.29558-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is unused since commit cdfc47950a53 ("kconfig: search for a config
to base the local(mod|yes)config on").

Having unused $config is confusing because $config is used as a local
variable in various sub-routines.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/streamline_config.pl | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 08d76d7b3b81..bbaa1e11a4e9 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -56,8 +56,6 @@ sub dprint {
     print STDERR @_;
 }
 
-my $config = ".config";
-
 my $uname = `uname -r`;
 chomp $uname;
 
-- 
2.17.1

