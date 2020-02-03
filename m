Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC87150E17
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 17:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgBCQsx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 11:48:53 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:39669 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbgBCQst (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 11:48:49 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 013GlTEe023349;
        Tue, 4 Feb 2020 01:47:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 013GlTEe023349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580748450;
        bh=8mL42oRIQaZwSHKJpmCbjvxiZ9pQrs0tUPVRqgWsB3g=;
        h=From:To:Cc:Subject:Date:From;
        b=Xf6D5Pz8FLxjB0pUEniUL8d6Ed4jC+q9Ida4tAqk5kb10+teGeZ49/u/IwWsuhhWV
         M/jQKoFfkD3fUlYD7ld7oAddTE1/mdPlB0vR/m219WPjLBWMDKeswDdUSZdZlUxx+z
         zZNmN8u9dAXQUksICYcG3dyvsjL8tLXLcKvJT6wM2vTUqxqEhVE89ca1FfJOo7a9bU
         kA8DM2IulFoQrKjEqApSdSgHVSVwFipB/9af0t7BPeOlTUcxLz66xcD01EZgnbn4ZB
         9I2QGjGI6505eg5Qqfi6P7ykfS8FEg8DnRPw3qWP21dchYjW+eOUEjGaQLk0tP11de
         81KZ+ijPKQS0g==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] initramfs: do not show compression mode choice if INITRAMFS_SOURCE is empty
Date:   Tue,  4 Feb 2020 01:47:08 +0900
Message-Id: <20200203164708.17478-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit ddd09bcc899f ("initramfs: make compression options not
depend on INITRAMFS_SOURCE"), Kconfig asks the compression mode for
the built-in initramfs regardless of INITRAMFS_SOURCE.

It is technically simpler, but pointless from a UI perspective,
Linus says [1].

When INITRAMFS_SOURCE is empty, usr/Makefile creates a tiny default
cpio, which is so small that nobody cares about the compression.

This commit hides the Kconfig choice in that case. The default cpio
is embedded without compression, which was the original behavior.

[1]: https://lkml.org/lkml/2020/2/1/160

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Linus,

Will you directly pick up this if you are OK with it?



 usr/Kconfig  | 1 +
 usr/Makefile | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/usr/Kconfig b/usr/Kconfig
index 529caab1a328..bdf5bbd40727 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -102,6 +102,7 @@ config RD_LZ4
 
 choice
 	prompt "Built-in initramfs compression mode"
+	depends on INITRAMFS_SOURCE != ""
 	help
 	  This option allows you to decide by which algorithm the builtin
 	  initramfs will be compressed.  Several compression algorithms are
diff --git a/usr/Makefile b/usr/Makefile
index 18aed2ab98da..c12e6b15ce72 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -8,7 +8,7 @@
 # with unpack_to_rootfs(). Make size_append no-op.
 override size_append := :
 
-compress-$(CONFIG_INITRAMFS_COMPRESSION_NONE)	:= shipped
+compress-y					:= shipped
 compress-$(CONFIG_INITRAMFS_COMPRESSION_GZIP)	:= gzip
 compress-$(CONFIG_INITRAMFS_COMPRESSION_BZIP2)	:= bzip2
 compress-$(CONFIG_INITRAMFS_COMPRESSION_LZMA)	:= lzma
-- 
2.17.1

