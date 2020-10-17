Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09122911BD
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Oct 2020 14:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437800AbgJQMCK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Oct 2020 08:02:10 -0400
Received: from wildebeest.demon.nl ([212.238.236.112]:35340 "EHLO
        gnu.wildebeest.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388231AbgJQMCH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Oct 2020 08:02:07 -0400
Received: from tarox.wildebeest.org (tarox.wildebeest.org [172.31.17.39])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by gnu.wildebeest.org (Postfix) with ESMTPSA id 873AA30291AC;
        Sat, 17 Oct 2020 14:02:03 +0200 (CEST)
Received: by tarox.wildebeest.org (Postfix, from userid 1000)
        id E2344401658F; Sat, 17 Oct 2020 14:02:02 +0200 (CEST)
From:   Mark Wielaard <mark@klomp.org>
To:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Ian Rogers <irogers@google.com>, Andi Kleen <andi@firstfloor.org>,
        Mark Wielaard <mark@klomp.org>,
        linux-toolchains@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Florian Weimer <fw@deneb.enyo.de>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH V2] Only add -fno-var-tracking-assignments workaround for old GCC versions.
Date:   Sat, 17 Oct 2020 14:01:35 +0200
Message-Id: <20201017120135.4004-1-mark@klomp.org>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20201014110132.2680-1-mark@klomp.org>
References: <20201014110132.2680-1-mark@klomp.org>
X-Spam-Flag: NO
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on gnu.wildebeest.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some old GCC versions between 4.5.0 and 4.9.1 might miscompile code
with -fvar-tracking-assingments (which is enabled by default with -g -O2).
commit 2062afb4f added -fno-var-tracking-assignments unconditionally to
work around this. But newer versions of GCC no longer have this bug, so
only add it for versions of GCC before 5.0. This allows various tools
such as a perf probe or gdb debuggers or systemtap to resolve variable
locations using dwarf locations in more code.

Changes in V2:
- Update commit message explaining purpose.
- Explicitly mention GCC version in comment.
- Wrap workaround in ifdef CONFIG_CC_IS_GCC

Signed-off-by: Mark Wielaard <mark@klomp.org>
Acked-by: Ian Rogers <irogers@google.com>
Reviewed-by: Andi Kleen <andi@firstfloor.org>
Cc: linux-toolchains@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Florian Weimer <fw@deneb.enyo.de>
Cc: Sedat Dilek <sedat.dilek@gmail.com>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 51540b291738..964754b4cedf 100644
--- a/Makefile
+++ b/Makefile
@@ -813,7 +813,11 @@ KBUILD_CFLAGS	+= -ftrivial-auto-var-init=zero
 KBUILD_CFLAGS	+= -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
 endif
 
-DEBUG_CFLAGS	:= $(call cc-option, -fno-var-tracking-assignments)
+# Workaround for GCC versions < 5.0
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
+ifdef CONFIG_CC_IS_GCC
+DEBUG_CFLAGS	:= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
+endif
 
 ifdef CONFIG_DEBUG_INFO
 ifdef CONFIG_DEBUG_INFO_SPLIT
-- 
2.18.4

