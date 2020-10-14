Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5643728DF9A
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Oct 2020 13:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730477AbgJNLIa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Oct 2020 07:08:30 -0400
Received: from wildebeest.demon.nl ([212.238.236.112]:49680 "EHLO
        gnu.wildebeest.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJNLI3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Oct 2020 07:08:29 -0400
X-Greylist: delayed 351 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Oct 2020 07:08:29 EDT
Received: from tarox.wildebeest.org (tarox.wildebeest.org [172.31.17.39])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by gnu.wildebeest.org (Postfix) with ESMTPSA id 2F12D30291AC;
        Wed, 14 Oct 2020 13:02:35 +0200 (CEST)
Received: by tarox.wildebeest.org (Postfix, from userid 1000)
        id D9CC74000C5F; Wed, 14 Oct 2020 13:02:35 +0200 (CEST)
From:   Mark Wielaard <mark@klomp.org>
To:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Ian Rogers <irogers@google.com>, Mark Wielaard <mark@klomp.org>,
        linux-toolchains@vger.kernel.org, Andi Kleen <andi@firstfloor.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Florian Weimer <fw@deneb.enyo.de>
Subject: [PATCH] Only add -fno-var-tracking-assignments workaround for old GCC versions.
Date:   Wed, 14 Oct 2020 13:01:32 +0200
Message-Id: <20201014110132.2680-1-mark@klomp.org>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <CAP-5=fUT-1-CR-KMMsrpzgw9b3nBooeY05=YU9XKa5enO9SK+A@mail.gmail.com>
References: <CAP-5=fUT-1-CR-KMMsrpzgw9b3nBooeY05=YU9XKa5enO9SK+A@mail.gmail.com>
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
only add it for versions of GCC before 5.0.

Signed-off-by: Mark Wielaard <mark@klomp.org>
Acked-by: Ian Rogers <irogers@google.com>
Cc: linux-toolchains@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Florian Weimer <fw@deneb.enyo.de>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 51540b291738..8477fee5f309 100644
--- a/Makefile
+++ b/Makefile
@@ -813,7 +813,9 @@ KBUILD_CFLAGS	+= -ftrivial-auto-var-init=zero
 KBUILD_CFLAGS	+= -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
 endif
 
-DEBUG_CFLAGS	:= $(call cc-option, -fno-var-tracking-assignments)
+# Workaround https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
+# for old versions of GCC.
+DEBUG_CFLAGS	:= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
 
 ifdef CONFIG_DEBUG_INFO
 ifdef CONFIG_DEBUG_INFO_SPLIT
-- 
2.18.4

