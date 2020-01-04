Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 026141302CD
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 16:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgADPDI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jan 2020 10:03:08 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:53554 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgADPDB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 004F2gcd018492;
        Sun, 5 Jan 2020 00:02:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 004F2gcd018492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578150171;
        bh=JfnzzywVLoWBKXE/hU2AKnpwcjYAKABwHzUqlzgAHZs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C3hOgILUe9n97Iu8UcWF4jCwx4G434D3SRgnKCrSZP3SyEXOMRYsBQBiYsW9JU/Qf
         6Y6w45AmJpOFnPuXgN8lbKfd6HVDqQ2XFY5VBOAVRKJDH3kqsVc2xMYHc4r5N0qu8/
         EEmKsASetC/NnEAPdMNmpnlDN71Bjc/H3LI3/Et/4SqCnoEq1Tr3JldVPKupFWbozX
         S19Le3fHgX1jQ/LYAsdVfUhF18ETD+L8a1zpKu5eDE2o3Dy+9Po5oa3+i7eSsH/k6A
         UWurkxacpFw1zGZ/v34FAjp+haBtvAfkgsx4wn/fKXYOt4JFEpTn6llKaOf8sM61Ol
         vZkK43n0UgNSQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] gen_initramfs.sh: remove intermediate cpio_list on errors
Date:   Sun,  5 Jan 2020 00:02:38 +0900
Message-Id: <20200104150238.19834-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This script sets the -e option, so it exits on any error, in which
case it exits without cleaning up the intermediate cpio_list.

Make sure to delete it on exit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 usr/gen_initramfs.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 4e6715f8ff7f..8ae831657e5d 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -193,6 +193,8 @@ dep_list=
 cpio_list=$(mktemp ${TMPDIR:-/tmp}/cpiolist.XXXXXX)
 output="/dev/stdout"
 
+trap "rm -f $cpio_list" EXIT
+
 while [ $# -gt 0 ]; do
 	arg="$1"
 	shift
@@ -243,4 +245,3 @@ if test -n "$KBUILD_BUILD_TIMESTAMP"; then
 	fi
 fi
 usr/gen_init_cpio $timestamp $cpio_list > $output
-rm $cpio_list
-- 
2.17.1

