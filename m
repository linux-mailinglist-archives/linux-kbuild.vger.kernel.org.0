Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38B024E81B
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 16:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgHVO5v (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 10:57:51 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47411 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgHVO5M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 10:57:12 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07MEuKVQ025434;
        Sat, 22 Aug 2020 23:56:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07MEuKVQ025434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598108182;
        bh=95U6Fk7JxWZcBC6emSKUXU+RPpgimScrngM3/3sca3M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kn4xDBCCwLj7T9hZXgeNdDZx9dRv46QZyU0AzvXPdaLSOCSt5AIVBC6GvSMqXxZjb
         WniWd+hSDKcCrWCR6rhfdq1srppx93gY5comjtWcvDFykJq2NI1XEXe46mjGziJFL0
         UY+3cHGXXt1qyIo3n1dS+Ghm+n+fOA0oHMxA9zzrlSnkREngWIUefgMnoQG2bCz97I
         Oi+yUPRDn0SLawTDdDhRrEeVNXT5EG/YmKPRIRN7b1hEh1XcVjT2mA7jp78TGsvwAB
         PqtPeZugYxm049U/Mu7hNAK7k3WNUHGIt7/ts8w9RJIunFJQKFGr/zDM8SccwzL54z
         Jhav+pwhUUWkQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/10] gen_compile_commands: parse only the first line of .*.cmd files
Date:   Sat, 22 Aug 2020 23:56:09 +0900
Message-Id: <20200822145618.1222514-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200822145618.1222514-1-masahiroy@kernel.org>
References: <20200822145618.1222514-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

After the allmodconfig build, this script takes about 5 sec on my
machine. Most of the run-time is consumed for needless regex matching.

We know the format of .*.cmd file; the first line is the build command.
There is no need to parse the rest.

With this optimization, now it runs 4 times faster.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
---

(no changes since v2)

Changes in v2:
  - Remove the unneeded variable 'line'

 scripts/gen_compile_commands.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index c458696ef3a7..1bcf33a93cb9 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -125,11 +125,8 @@ def main():
             filepath = os.path.join(dirpath, filename)
 
             with open(filepath, 'rt') as f:
-                for line in f:
-                    result = line_matcher.match(line)
-                    if not result:
-                        continue
-
+                result = line_matcher.match(f.readline())
+                if result:
                     try:
                         entry = process_line(directory, dirpath,
                                              result.group(1), result.group(2))
-- 
2.25.1

