Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25A61F895D
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jun 2020 16:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgFNOob (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Jun 2020 10:44:31 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:54494 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgFNOoa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jun 2020 10:44:30 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 05EEhjq0024323;
        Sun, 14 Jun 2020 23:43:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 05EEhjq0024323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592145826;
        bh=WqbBHTeTcTELu7HZYZJkll6J0fXNCMEhU1vE64ROybI=;
        h=From:To:Cc:Subject:Date:From;
        b=xpYkCjJxeLziMPFOJzjg7ApXaz44bK6GCZaIVP+/fsukFsadvYzfqMxtnCFEsWFys
         pFjy6ZIRuYZPg+qkpJImx9ZBjxWwXhl3BSI4RCN34X+q2gP6T1/3COHiTwqS78RP31
         s6H74dB4O65n0onYptUtbGF8DdKw30Oq2a38bABEHmNIIzPGPD96hz3XvFnOKeNA6x
         cBsHyLIPrgI+mvxizRJjTyoEmByvfHbwWXmkW2/6CeZ2p4scBiZchfOItor8Y+kQIx
         ef/rkj2BqA1/KnuSQdGQrxj+K9B4IA1S9Z5aGk71RM1V+sGM4NxaXdok9tnusRP+1w
         2XCcv4LPFrwtQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: improve cc-option to clean up all temporary files
Date:   Sun, 14 Jun 2020 23:43:40 +0900
Message-Id: <20200614144341.1077495-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When cc-option and friends evaluate compiler flags, the temporary file
$$TMP is created as an output object, and automatically cleaned up.
The actual file path of $$TMP is .<pid>.tmp, here <pid> is the process
ID of $(shell ....) invoked from cc-option. (Please note $$$$ is the
escape sequence of $$).

Such garbage files are cleaned up in most cases, but some compiler flags
create additional output files.

For example, -gsplit-dwarf creates a .dwo file.

When CONFIG_DEBUG_INFO_SPLIT=y, you will see a bunch of .<pid>.dwo files
left in the top of build directories. You may not notice them unless you
do 'ls -a', but the garbage files will increase every time you run 'make'.

This commit changes the temporary object path to .tmp_<pid>/tmp,
and removes .tmp_<pid> directory when exiting. The additional files
.tmp_<pid>/tmp.dwo, will be cleaned away altogether.

When the compiler creates separate build artifacts, their file paths
are usually determined based on the base name of the object. Another
example is -ftest-coverage, which outputs the coverage data into
<base-name-of-object>.gcno

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Kbuild.include | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 0c3dc983439b..5dfd224599b7 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -86,20 +86,21 @@ cc-cross-prefix = $(firstword $(foreach c, $(1), \
 			$(if $(shell command -v -- $(c)gcc 2>/dev/null), $(c))))
 
 # output directory for tests below
-TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
+TMPOUT = $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$
 
 # try-run
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
-# Exit code chooses option. "$$TMP" serves as a temporary file and is
+# Exit code chooses option. "$$TMP" serves as a temporary directory and is
 # automatically cleaned up.
 try-run = $(shell set -e;		\
-	TMP="$(TMPOUT).$$$$.tmp";	\
-	TMPO="$(TMPOUT).$$$$.o";	\
+	TMP=$(TMPOUT)/tmp;		\
+	TMPO=$(TMPOUT)/tmp.o;		\
+	mkdir -p $(TMPOUT);		\
+	trap "rm -rf $(TMPOUT)" EXIT;	\
 	if ($(1)) >/dev/null 2>&1;	\
 	then echo "$(2)";		\
 	else echo "$(3)";		\
-	fi;				\
-	rm -f "$$TMP" "$$TMPO")
+	fi)
 
 # as-option
 # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
-- 
2.25.1

