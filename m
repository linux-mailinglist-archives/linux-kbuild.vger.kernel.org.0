Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8088748BD
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 10:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389007AbfGYIFm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 04:05:42 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:60142 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387586AbfGYIFm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 04:05:42 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x6P85GFC002747;
        Thu, 25 Jul 2019 17:05:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x6P85GFC002747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564041917;
        bh=7BLg13CdKPhyaQ1kBrxCgb7bB9yny46HPZX8sZdYLjk=;
        h=From:To:Cc:Subject:Date:From;
        b=aYQecNMDwtqd1VXqs9tx5rDiHj/U+GzMdzLvjkHp09Lhyt+3+n1+Fzxnd8Osq2jo4
         cjFq75wNGYB8ayoOUlyika0wM2n9P6Mwt8YIjTH3IT2dR8Do84sZUL+20kfBsKm+Sk
         wFhjJNEMleOQdjBa01v0NZ3eLw1euN8X0kO99KRYPrz9nSGA36rAy5zC1i5xWCSZjN
         knADuTqBCKWDl17DXbwrSj9sl7ah0A/2leFfJbxY22ZfLENtR8ZDZf/ZKUdpDm7mlk
         Pech/BCJJ0AYnYS1bFiN1Lc8tFFgD58+Xaw12pCxzYmUiAzUSULWRU710My0n5+cFo
         MQYGvJTlU6RWw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: detect missing "WITH Linux-syscall-note" for uapi headers
Date:   Thu, 25 Jul 2019 17:05:13 +0900
Message-Id: <20190725080513.4071-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

UAPI headers licensed under GPL are supposed to have exception
"WITH Linux-syscall-note" so that they can be included into non-GPL
user space application code.

Unfortunately, people often miss to add it. Break 'make headers'
when any of exported headers lacks the exception note so that the
0-day bot can easily catch it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

This patch depends on the following:

https://lore.kernel.org/patchwork/patch/1105289/

I will turn on the error after all headers are fixed.


 scripts/headers_install.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 47f6f3ea0771..bbaf29386995 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -23,6 +23,12 @@ TMPFILE=$OUTFILE.tmp
 
 trap 'rm -f $OUTFILE $TMPFILE' EXIT
 
+# SPDX-License-Identifier with GPL variants must have "WITH Linux-syscall-note"
+if [ -n "$(sed -n -e "/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/!p}" $INFILE)" ]; then
+	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
+	exit 1
+fi
+
 sed -E -e '
 	s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
 	s/__attribute_const__([[:space:]]|$)/\1/g
-- 
2.17.1

