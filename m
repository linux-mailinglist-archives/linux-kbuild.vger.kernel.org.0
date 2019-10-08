Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9B4CF949
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2019 14:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730751AbfJHMGz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Oct 2019 08:06:55 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:28280 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730727AbfJHMGn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 08:06:43 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x98C6133021176;
        Tue, 8 Oct 2019 21:06:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x98C6133021176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570536362;
        bh=5sMplte1orpkOBofj2bSvoYhmGY/7D1FKE2MtMgI2c0=;
        h=From:To:Cc:Subject:Date:From;
        b=IOQ7bFgeGXun0TVQbxqC2WiLnBmTXZJ29pNWIZOiuQ4PdzzSneeEoT/1cYhD4lEX6
         OrpTDrJxbx2/LOImspUh8yHQKHPo3r+UdwAI8j2kzXBV8S3lSN9Il+xqjGQG3iCL0L
         m/qA3wQQNmanGuxtEkXuWfQIKvenYeGMNTwdijJj5sWX/npbg4KyZAIG/NpL7zvoPD
         XhreK5JkAxhlNBLmDyDosTRUC4cYbAaORTr+MpQlB62yDTOGpHneft7FLJX/smuXJs
         hKZraK5ERsohMeC7TbYfm6w0++8827zMXqB3fYmd5c8fDS78xiTkUIFAf1gMDosYHp
         W/RBZl3FlCcew==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] kheaders: remove unneeded 'cat' command piped to 'head' / 'tail'
Date:   Tue,  8 Oct 2019 21:05:52 +0900
Message-Id: <20191008120556.4263-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The 'head' and 'tail' commands can take a file path directly.
So, you do not need to run 'cat'.

  cat kernel/kheaders.md5 | head -1

... is equivalent to:

  head -1 kernel/kheaders.md5

and the latter saves forking one process.

While I was here, I replaced 'head -1' with 'head -n 1'.

I also replaced '==' with '=' since we do not have a good reason to
use the bashism.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 kernel/gen_kheaders.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index aff79e461fc9..8aa6d3c37ba7 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -41,10 +41,10 @@ obj_files_md5="$(find $dir_list -name "*.h"			   |
 this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
 if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
 if [ -f kernel/kheaders.md5 ] &&
-	[ "$(cat kernel/kheaders.md5|head -1)" == "$src_files_md5" ] &&
-	[ "$(cat kernel/kheaders.md5|head -2|tail -1)" == "$obj_files_md5" ] &&
-	[ "$(cat kernel/kheaders.md5|head -3|tail -1)" == "$this_file_md5" ] &&
-	[ "$(cat kernel/kheaders.md5|tail -1)" == "$tarfile_md5" ]; then
+	[ "$(head -n 1 kernel/kheaders.md5)" = "$src_files_md5" ] &&
+	[ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$obj_files_md5" ] &&
+	[ "$(head -n 3 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
+	[ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
 		exit
 fi
 
-- 
2.17.1

