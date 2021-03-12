Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355E833978D
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 20:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbhCLTjg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 14:39:36 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:34172 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234375AbhCLTjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 14:39:19 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12CJcFXc026752;
        Sat, 13 Mar 2021 04:38:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12CJcFXc026752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615577896;
        bh=KzOQgtBNctvqFNx+2UkPEo2bSPIPAf/PVvWEbrcpRPk=;
        h=From:To:Cc:Subject:Date:From;
        b=HHKrvUszzryX2t7rjGBFLOzv7WX5lz9eYcFncoeHvY9qxs0t2SVQY4zDFcfzFE/xW
         +ogqSaaUwte67NWyzs/gfI2drfO8tMMPSKBvCp3yarEHGF1kA6VnjOmJ/nl0sSDrC5
         lFgFYzJ2bq3LxsyE+s8g33foofHpQS3thEtaB0phRx8Y0dZIaak4TRrDnGNNVSISXw
         M7iXmnNjIVMlcJL2vuR5NRD57zaUlqdOR5UKkDaXWi/53VadDBn2pLDgRC+qBoRyyk
         ZHQvO8ZWkDmdExDScWQazWUwK90ejDCoZciIeNGgvsuWtcEWpRpkYTr9ylGnIuoexb
         kXI6AsHWhaBrQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: fix ld-version.sh to not be affected by locale
Date:   Sat, 13 Mar 2021 04:38:14 +0900
Message-Id: <20210312193814.132558-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

ld-version.sh checks the output from $(LD) --version, but it has a
problem on some locales.

For example, in Italian:

  $ LC_MESSAGES=it_IT.UTF-8 ld --version | head -n 1
  ld di GNU (GNU Binutils for Debian) 2.35.2

This makes ld-version.sh fail because it expects "GNU ld" for the
BFD linker case.

Add LC_ALL=C to override the user's locale.

BTW, setting LC_MESSAGES=C (or LANG=C) is not enough because it is
ineffective if LC_ALL is set on the user's environment.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=212105
Reported-by: Marco Scardovi
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/ld-version.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index 30debf78aa09..1bf3aadde9de 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -29,7 +29,7 @@ orig_args="$@"
 # Get the first line of the --version output.
 IFS='
 '
-set -- $("$@" --version)
+set -- $(LC_ALL=C "$@" --version)
 
 # Split the line on spaces.
 IFS=' '
-- 
2.27.0

