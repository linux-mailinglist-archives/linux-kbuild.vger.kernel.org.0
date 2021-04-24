Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA90C36A104
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Apr 2021 13:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhDXL47 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Apr 2021 07:56:59 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:24613 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbhDXL46 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Apr 2021 07:56:58 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 13OBtxPs016607;
        Sat, 24 Apr 2021 20:56:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 13OBtxPs016607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619265360;
        bh=w4HzL91MSSw/cXPGv1mgATZV/rYqV69z77QHmW7ddEM=;
        h=From:To:Cc:Subject:Date:From;
        b=oNQJqHx54NGWHacxxmOEx7tgiAwOxTjRQibEFiuEo6JFJgzRL0c/9Ms5luzyhH/yx
         BdLpMYEEMiRC0MyjdM0od/dqAVEwFxnZu332sfdGYuUQl41LdZEo7rD9nyCOaB8aPI
         5vUeE9b61mt288TABa0EBUTXlK7CJY3kt5GIuUNIueVb7QM7FmUWtwaBzL3iNd+aZS
         W4/Ff1m9RY5bxYyt0EgYehzOQrJmU3J+xJd3Uc/ARI9Dsj9xY7caZH83Q8m1rmj3d+
         uWhFDTILBfvQnlxY2RPWgzu+/tDZgMgsZd+uGsoT4GTYG2AySw0CYV9W4+hB69Nv1E
         9507u8qvd/AMA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add comment about why cmd_shipped uses 'cat'
Date:   Sat, 24 Apr 2021 20:55:53 +0900
Message-Id: <20210424115553.396516-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cmd_shipped uses 'cat' instead of 'cp' for copying a file. The reason
is explained in the commit [1], but it was in the pre-git era.

  $ touch a
  $ chmod -w a
  $ cp a b
  $ cp a b
  cp: cannot create regular file 'b': Permission denied

Add comments so that you can see the reason without looking into
the history.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=a70dba8086160449cc94c5bdaff78419b6b8e3c8

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index a4fbaf8880b9..1677a7dcd18c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -240,6 +240,9 @@ quiet_cmd_copy = COPY    $@
 
 # Shipped files
 # ===========================================================================
+# 'cp' preserves permissions. If you use it to copy a file in read-only srctree,
+# the copy would be read-only as well, leading to an error when executing the
+# rule next time. Use 'cat' instead in order to generate a writable file.
 
 quiet_cmd_shipped = SHIPPED $@
 cmd_shipped = cat $< > $@
-- 
2.27.0

