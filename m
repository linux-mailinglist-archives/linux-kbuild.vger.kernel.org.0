Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB55A265305
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 23:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgIJV1R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 17:27:17 -0400
Received: from condef-04.nifty.com ([202.248.20.69]:29600 "EHLO
        condef-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731080AbgIJOJt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 10:09:49 -0400
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-04.nifty.com with ESMTP id 08ADsjMN032624;
        Thu, 10 Sep 2020 22:54:45 +0900
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 08ADpSIx001308;
        Thu, 10 Sep 2020 22:51:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 08ADpSIx001308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599745892;
        bh=GfWXsevD+/JY+AqdR3iC3oPYU2Z7Pjb6F8wdpSkfPC0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IwK2cMh39J9rOU6iXiFeF+EX6KMfOKNDrFuPTU9GwJWA4caRNJr9dSGq/Ruh2vaLy
         Khd3KqlsFN0VJm26UgMrOrZvhmsLUey9YdRp2tI7/ZafSb3+Bw0CgFNhiB10ErJePx
         hoRpqJ8vM29aGVyIB9p68vzSk1WdVT1zxdYoOt51bw/cSa2Yd/Ube9u3Cig8SQDoVI
         t4EnwukTTHdxQko1FX1FhGJnK12xwC6Unpb0CHllIXHw7uUuIILPDXqBJlQpsvXHT1
         wM8a+Om0gB0CVPljU8Z4UIntzifK8gaKCeIoNHtAEp8/Fv9bYjDZIV7JHsFuIKQ+dN
         N8Ptvnr02at/A==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ingo Molnar <mingo@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] kbuild: remove cc-option test of -fno-stack-check
Date:   Thu, 10 Sep 2020 22:51:19 +0900
Message-Id: <20200910135120.3527468-3-masahiroy@kernel.org>
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
https://godbolt.org/z/59cK6o

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1b6abecc5cab..5102c89d3167 100644
--- a/Makefile
+++ b/Makefile
@@ -934,7 +934,7 @@ KBUILD_CFLAGS	+= -fno-merge-all-constants
 KBUILD_CFLAGS	+= $(call cc-option,-fmerge-constants)
 
 # Make sure -fstack-check isn't enabled (like gentoo apparently did)
-KBUILD_CFLAGS  += $(call cc-option,-fno-stack-check,)
+KBUILD_CFLAGS  += -fno-stack-check
 
 # conserve stack if available
 KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
-- 
2.25.1

