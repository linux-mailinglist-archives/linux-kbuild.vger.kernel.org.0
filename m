Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DD124E818
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 16:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgHVO5t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 10:57:49 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47425 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728133AbgHVO5M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 10:57:12 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07MEuKVT025434;
        Sat, 22 Aug 2020 23:56:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07MEuKVT025434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598108184;
        bh=xgwPl0sYIxicw/V74mC1zpDsm1aQ6gpJpcgmlt5eG3c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=v16cp4VvoYqhmKEim6nw7wMgeapmhbD/kfC+ecB/OETdOkwANPVAnS9uXYTGJw/Nc
         leII5AGywsBYI+Tl4eAiRJH1w0O9PydEq26Jxv/qA6/mMp5tW41bN9rl8HHw9ukEV8
         AwKwA9ns4VLkWUpqDILogncjI7Vq9qBRfKbujIhhZEANgU6EggMK/CT2tVGY1vQ13I
         Mq7vPNmtszBYFpjZ8XT/XhXKluxKxnA8Oez44+rJJoYCnoIT+vZ3dv5sppG/FAtmNC
         wjIxDgB12Da5iD0CDytmzPplvRV044P7yeCPoxxX9cKTNqW+gt2cKFcDP/cS3aBhni
         8l2aZVRchn1ng==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/10] gen_compile_commands: reword the help message of -d option
Date:   Sat, 22 Aug 2020 23:56:12 +0900
Message-Id: <20200822145618.1222514-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200822145618.1222514-1-masahiroy@kernel.org>
References: <20200822145618.1222514-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I think the help message of the -d option is somewhat misleading.

  Path to the kernel source directory to search (defaults to the working directory)

The part "kernel source directory" is the source of the confusion.
Some people misunderstand as if this script did not support separate
output directories.

Actually, this script also works for out-of-tree builds. You can
use the -d option to point to the object output directory, not to
the source directory. It should match to the O= option used in the
previous kernel build, and then appears in the "directory" field of
compile_commands.json.

Reword the help message.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

Changes in v3:
  - Add the missing punctuation to the comment

Changes in v2:
  - New patch

 scripts/gen_compile_commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index 49fff0b0b385..f37c1dac8db4 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -31,13 +31,13 @@ def parse_arguments():
 
     Returns:
         log_level: A logging level to filter log output.
-        directory: The directory to search for .cmd files.
+        directory: The work directory where the objects were built.
         output: Where to write the compile-commands JSON file.
     """
     usage = 'Creates a compile_commands.json database from kernel .cmd files'
     parser = argparse.ArgumentParser(description=usage)
 
-    directory_help = ('Path to the kernel source directory to search '
+    directory_help = ('specify the output directory used for the kernel build '
                       '(defaults to the working directory)')
     parser.add_argument('-d', '--directory', type=str, help=directory_help)
 
-- 
2.25.1

