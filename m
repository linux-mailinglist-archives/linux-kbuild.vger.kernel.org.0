Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5A8F160E7F
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 10:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbgBQJ3K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 04:29:10 -0500
Received: from foss.arm.com ([217.140.110.172]:60650 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728773AbgBQJ3K (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 04:29:10 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AB2B328;
        Mon, 17 Feb 2020 01:29:09 -0800 (PST)
Received: from a075553-lin.blr.arm.com (a075553-lin.blr.arm.com [10.162.17.32])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CEDC83F6CF;
        Mon, 17 Feb 2020 01:29:04 -0800 (PST)
From:   Amit Daniel Kachhap <amit.kachhap@arm.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Amit Daniel Kachhap <amit.kachhap@arm.com>,
        James Morse <james.morse@arm.com>,
        Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v5 15/17] kconfig: Add support for 'as-option'
Date:   Mon, 17 Feb 2020 14:57:46 +0530
Message-Id: <1581931668-11559-16-git-send-email-amit.kachhap@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581931668-11559-1-git-send-email-amit.kachhap@arm.com>
References: <1581931668-11559-1-git-send-email-amit.kachhap@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Vincenzo Frascino <vincenzo.frascino@arm.com>

Currently kconfig does not have a feature that allows to detect if the
used assembler supports a specific compilation option.

Introduce 'as-option' to serve this purpose in the context of Kconfig:

        config X
                def_bool $(as-option,...)

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org
Acked-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
---
 scripts/Kconfig.include | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 85334dc..374e251 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -35,6 +35,10 @@ ld-option = $(success,$(LD) -v $(1))
 # Return y if the assembler supports <instr>, n otherwise
 as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
 
+# $(as-option,<flag>)
+# Return y if the assembler supports <flag>, n otherwise
+as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
+
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
-- 
2.7.4

