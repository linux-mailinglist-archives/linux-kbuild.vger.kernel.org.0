Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAEF36B00D
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 21:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfGPTre (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 15:47:34 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:51032 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGPTre (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 15:47:34 -0400
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hnTQ8-0001mu-Qj; Tue, 16 Jul 2019 21:47:28 +0200
Date:   Tue, 16 Jul 2019 21:47:27 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Nathan Chancellor <natechancellor@gmail.com>
cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
        Mike Lothian <mike@fireburn.co.uk>
Subject: [PATCH v2] kbuild: Fail if gold linker is detected
In-Reply-To: <alpine.DEB.2.21.1907162059200.1767@nanos.tec.linutronix.de>
Message-ID: <alpine.DEB.2.21.1907162135590.1767@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de> <20190716170606.GA38406@archlinux-threadripper> <alpine.DEB.2.21.1907162059200.1767@nanos.tec.linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The gold linker has known issues of failing the build both in random and in
predictible ways:

 - The x86/X32 VDSO build fails with:

   arch/x86/entry/vdso/vclock_gettime-x32.o:vclock_gettime.c:function do_hres:
   error: relocation overflow: reference to 'hvclock_page'

   That's a known issue for years and the usual workaround is to disable
   CONFIG_X86_32

 - A recent build failure is caused by turning a relocation into an
   absolute one for unknown reasons. See link below.

 - There are a couple of gold workarounds applied already, but reports
   about broken builds with ld.gold keep coming in on a regular base and in
   most cases the root cause is unclear.

In context of the most recent fail H.J. stated:

  "Since building a workable kernel for different kernel configurations
   isn't a requirement for gold, I don't recommend gold for kernel."

So instead of dealing with attempts to duct tape gold support without
understanding the root cause and without support from the gold folks, fail
the build when gold is detected.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lore.kernel.org/r/CAMe9rOqMqkQ0LNpm25yE_Yt0FKp05WmHOrwc0aRDb53miFKM+w@mail.gmail.com
---
V2: Better changelog
    Use the proper check as pointed out by Nathan
---
 scripts/Kconfig.include |    3 +++
 1 file changed, 3 insertions(+)

--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -35,5 +35,8 @@ ld-option = $(success,$(LD) -v $(1))
 $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
 
+# Fail if the linker is gold as it's not capable of linking the kernel proper
+$(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
+
 # gcc version including patch level
 gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
