Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2773526522D
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 23:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgIJVKK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 17:10:10 -0400
Received: from condef-05.nifty.com ([202.248.20.70]:48209 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731166AbgIJOen (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 10:34:43 -0400
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-05.nifty.com with ESMTP id 08ADsiG3031431;
        Thu, 10 Sep 2020 22:54:45 +0900
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 08ADpSIw001308;
        Thu, 10 Sep 2020 22:51:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 08ADpSIw001308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599745891;
        bh=wXl8du5fQhGV7mBkLY962W3rgMjpZxKVsM/SEXRS3J8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JyBBb5kLp2N76xsz+5D18ojWUBSRwP4DCXi86XTh0zqLNtsGHqeIIEmEVKl+H09p+
         GUcZSK5FrUXi/dTaPwmIWCKA8e7OMFkG9Gf89WeJJngR+kuUgVBrKjRxX9fSQDD+J7
         IZerFkkD+a4EEkhuMsDXOo4bqa7tJpaBcKxNrqD8v5b/N/5GPBIAClGAgGFKc79Qie
         Ypm9vcgmPWiu3FlJzM7z5WPL7HfYdtOGgzT4bL7On/7bufH0d3IF8nhpsvCZ3nMvMN
         jdjLpldSliX52wzsZYCQJpr/AxfmlrZsO2ovZWzJE9l1HX6RbPJg82DZX+FxZL7bXM
         a+Qr2TTs61ULg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ingo Molnar <mingo@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] kbuild: remove cc-option test of -fno-merge-all-constants
Date:   Thu, 10 Sep 2020 22:51:18 +0900
Message-Id: <20200910135120.3527468-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910135120.3527468-1-masahiroy@kernel.org>
References: <20200910135120.3527468-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.

Here is the godbolt:
https://godbolt.org/z/8T4177

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 059b36f2ea53..1b6abecc5cab 100644
--- a/Makefile
+++ b/Makefile
@@ -927,7 +927,7 @@ KBUILD_CFLAGS	+= -fno-strict-overflow
 # clang sets -fmerge-all-constants by default as optimization, but this
 # is non-conforming behavior for C and in fact breaks the kernel, so we
 # need to disable it here generally.
-KBUILD_CFLAGS	+= $(call cc-option,-fno-merge-all-constants)
+KBUILD_CFLAGS	+= -fno-merge-all-constants
 
 # for gcc -fno-merge-all-constants disables everything, but it is fine
 # to have actual conforming behavior enabled.
-- 
2.25.1

