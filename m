Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7F912FBF1
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 19:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgACR7y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 12:59:54 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:64930 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgACR7y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 12:59:54 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 003HxSJD022724;
        Sat, 4 Jan 2020 02:59:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 003HxSJD022724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578074376;
        bh=/afvTso/ONcbcPbguDu7doM3beXBGjZKCYuIlhp0xDk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Br4rfbRu5i0gbvU0nzBOzM4der3Qvjcbms4s5AqAy0sws3+s5DJYzqQN4ga7SUmBh
         W4oBcIiUZi1szC+IrjLCglukha9lum7QeLjDHrZhKngvJKVi7fAIyWcCMYDwneWwMH
         VGjxzAv7lgQ3osY8CHPpxollowRMWpACJjwap19wA639Nfs2rPJ0aOF8agtLla5aOZ
         W5rkf8MpvpJw7f4LaSWwl8j76rxRHuzlLamxLvMNWdpkvuaRRMLBZbBvnDDkdiJwgt
         eSUc04v4HQ0mw7tMg6y//l8JYnkk2PYS5lve2V9Y3hxiutclNGixOTCxxQxqWTbl8o
         qozQrpG1E9Nag==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] gen_initramfs.sh: remove intermediate cpio_list on errors
Date:   Sat,  4 Jan 2020 02:59:15 +0900
Message-Id: <20200103175915.26663-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This script sets the -e option, so it exits on any error, in which
case it exits without cleaning up the intermediate cpio_list.

Make sure to delete it on exit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

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

