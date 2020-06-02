Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41E71EB6B2
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2020 09:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgFBHpc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Jun 2020 03:45:32 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:49849 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725616AbgFBHpb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Jun 2020 03:45:31 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0U-MkiNc_1591083919;
Received: from localhost(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0U-MkiNc_1591083919)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 02 Jun 2020 15:45:29 +0800
From:   ashimida <ashimida@linux.alibaba.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, ashimida <ashimida@linux.alibaba.com>
Subject: [PATCH v2] mksysmap: Fix the mismatch of '.L' symbols in System.map
Date:   Tue,  2 Jun 2020 15:45:17 +0800
Message-Id: <1591083917-63371-1-git-send-email-ashimida@linux.alibaba.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
References: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When System.map was generated, the kernel used mksysmap to
filter the kernel symbols, but all the symbols with the
second letter 'L' in the kernel were filtered out, not just
the symbols starting with 'dot + L'.

For example:
ashimida@ubuntu:~/linux$ cat System.map |grep ' .L'
ashimida@ubuntu:~/linux$ nm -n vmlinux |grep ' .L'
ffff0000088028e0 t bLength_show
......
ffff0000092e0408 b PLLP_OUTC_lock
ffff0000092e0410 b PLLP_OUTA_lock

In the original patch[1], the original intent should
be to filter out all local symbols starting with '.L',
so the dot should be escaped.

[1]. mksysmap: Add h8300 local symbol pattern

Signed-off-by: ashimida <ashimida@linux.alibaba.com>
---
 scripts/mksysmap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index a35acc0..9aa23d1 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -41,4 +41,4 @@
 # so we just ignore them to let readprofile continue to work.
 # (At least sparc64 has __crc_ in the middle).
 
-$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' > $2
+$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( \.L\)' > $2
-- 
2.7.4

