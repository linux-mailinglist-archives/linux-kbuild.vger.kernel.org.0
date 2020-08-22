Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D587424E817
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 16:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgHVO5t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 10:57:49 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47417 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbgHVO5M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 10:57:12 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07MEuKVP025434;
        Sat, 22 Aug 2020 23:56:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07MEuKVP025434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598108181;
        bh=2LiED6o4qkC2vTm0VysN7vwIOPonem+/pgLkJUTzcIg=;
        h=From:To:Cc:Subject:Date:From;
        b=bEVRKmPYX1SJG3OnOT2Hc94mgzI08w3jr3hCmng+E8/YQI7x/gClARFEHL64SOhWt
         zhFMN2fqi6Rfu6811QudIqRVPYV6NmJeAfsPwxiGbBQinnDApjXuArYNjf8+n3Pdav
         xgGRrBcrUwwcrxY5ciJfjpwxfaJe2aiS0gxLbzrPAyaTQ6G/v/2lIjbFsdmAT9wDQO
         RroFu4zV47smdlbmKkCLHmD9iVOCzWBSfPMmzomJXf8Mp5eGHtI7LYcsm9ugZTcKHT
         Os5dak0dX5qmh/NOPTSzJGGkm6xF/WXltl81LauKyfaViKFbrMbDW4lbFpjJg6AJ/V
         0H9M3qFyJMNhw==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/10] kbuild: clang-tidy
Date:   Sat, 22 Aug 2020 23:56:08 +0900
Message-Id: <20200822145618.1222514-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I improved gen_compile_commands.py,
then rebased Nathan's v7 [1] on top of them.
To save time, I modified the Makefile part.
No change for run-clang-tools.py

"make clang-tidy" should work in-tree build,
out-of-tree build (O=), and external module build (M=).

V3:
Fix minor mistakes pointed out by Nick
Add a new patch (09/10) to remove the warning about
too few .cmd files.

V2:
Keep the previous work-flow.
You can still manually run scripts/gen_compile_commands.json

'make compile_commands.json' or 'make clang-tidy' is handier
for most cases. As Nick noted, there is 3 % loss of the coverage.

If you need the full compilation database that covers all the
compiled C files, please run the script manually.

[1] https://patchwork.kernel.org/patch/11687833/


Masahiro Yamada (9):
  gen_compile_commands: parse only the first line of .*.cmd files
  gen_compile_commands: use choices for --log_levels option
  gen_compile_commands: do not support .cmd files under tools/ directory
  gen_compile_commands: reword the help message of -d option
  gen_compile_commands: make -o option independent of -d option
  gen_compile_commands: move directory walk to a generator function
  gen_compile_commands: support *.o, *.a, modules.order in positional
    argument
  kbuild: wire up the build rule of compile_commands.json to Makefile
  gen_compile_commands: remove the warning about too few .cmd files

Nathan Huckleberry (1):
  Makefile: Add clang-tidy and static analyzer support to makefile

 MAINTAINERS                                 |   1 +
 Makefile                                    |  45 +++-
 scripts/clang-tools/gen_compile_commands.py | 236 ++++++++++++++++++++
 scripts/clang-tools/run-clang-tools.py      |  74 ++++++
 scripts/gen_compile_commands.py             | 151 -------------
 5 files changed, 352 insertions(+), 155 deletions(-)
 create mode 100755 scripts/clang-tools/gen_compile_commands.py
 create mode 100755 scripts/clang-tools/run-clang-tools.py
 delete mode 100755 scripts/gen_compile_commands.py

-- 
2.25.1

