Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E53D3F55D2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 04:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbhHXC2T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Aug 2021 22:28:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:36948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232147AbhHXC2S (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Aug 2021 22:28:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B58F6101C;
        Tue, 24 Aug 2021 02:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629772049;
        bh=aJDo0HVHGoQr0fB3L9Ko8UYHdW/Y7I5d2sHOlNYTD7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uXps/PBHE4jMq8jSFhDw/ROwedp7lnbAkneniMWv9TRWiie4rJPjUdwpkNV2JT79l
         oUbOboMUbaqd/fth2dvV6jWYAJ9WRFA79loTXG6kAjFxNuJkTKd2RA9O1/iEN7OAnK
         utAvXGZ+jzyWNZCqseT8+A7Up6cAfNN984liuU3GDDkjQLgZsOW9PQpgQ4fG8Ptjrr
         ptwJyEjgRiGwGaOH56WKPMvgR8fFl+V8HUdb2CVLR2Fx5IYMlfWdUydg+KFdvudaR0
         HrW531bl76/DeSmmIqAyWZM1NJc+7Q7uD9xAZ7W6/lsQ2oD0nJ99wzf9PSajPa+jW6
         ACnL+np9S8uXw==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Cc:     "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] x86: Do not add -falign flags unconditionally for clang
Date:   Mon, 23 Aug 2021 19:26:39 -0700
Message-Id: <20210824022640.2170859-2-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210824022640.2170859-1-nathan@kernel.org>
References: <20210824022640.2170859-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

clang does not support -falign-jumps and only recently gained support
for -falign-loops. When one of the configuration options that adds these
flags is enabled, clang warns and all cc-{disable-warning,option} that
follow fail because -Werror gets added to test for the presence of this
warning:

clang-14: warning: optimization flag '-falign-jumps=0' is not supported
[-Wignored-optimization-argument]

To resolve this, add a couple of cc-option calls when building with
clang; gcc has supported these options since 3.2 so there is no point in
testing for their support. -falign-functions was implemented in clang-7,
-falign-loops was implemented in clang-14, and -falign-jumps has not
been implemented yet.

Link: https://lore.kernel.org/r/YSQE2f5teuvKLkON@Ryzen-9-3900X.localdomain/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/Makefile_32.cpu | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index cd3056759880..e8c65f990afd 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -10,6 +10,12 @@ else
 tune		= $(call cc-option,-mcpu=$(1),$(2))
 endif
 
+ifdef CONFIG_CC_IS_CLANG
+align		:= -falign-functions=0 $(call cc-option,-falign-jumps=0) $(call cc-option,-falign-loops=0)
+else
+align		:= -falign-functions=0 -falign-jumps=0 -falign-loops=0
+endif
+
 cflags-$(CONFIG_M486SX)		+= -march=i486
 cflags-$(CONFIG_M486)		+= -march=i486
 cflags-$(CONFIG_M586)		+= -march=i586
@@ -25,11 +31,11 @@ cflags-$(CONFIG_MK6)		+= -march=k6
 # They make zero difference whatsosever to performance at this time.
 cflags-$(CONFIG_MK7)		+= -march=athlon
 cflags-$(CONFIG_MK8)		+= $(call cc-option,-march=k8,-march=athlon)
-cflags-$(CONFIG_MCRUSOE)	+= -march=i686 -falign-functions=0 -falign-jumps=0 -falign-loops=0
-cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) -falign-functions=0 -falign-jumps=0 -falign-loops=0
+cflags-$(CONFIG_MCRUSOE)	+= -march=i686 $(align)
+cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) $(align)
 cflags-$(CONFIG_MWINCHIPC6)	+= $(call cc-option,-march=winchip-c6,-march=i586)
 cflags-$(CONFIG_MWINCHIP3D)	+= $(call cc-option,-march=winchip2,-march=i586)
-cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) -falign-functions=0 -falign-jumps=0 -falign-loops=0
+cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)
 cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
 cflags-$(CONFIG_MVIAC7)		+= -march=i686
 cflags-$(CONFIG_MCORE2)		+= -march=i686 $(call tune,core2)
-- 
2.33.0

