Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B626A120036
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2019 09:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfLPIsl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 03:48:41 -0500
Received: from foss.arm.com ([217.140.110.172]:45594 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726808AbfLPIsl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 03:48:41 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86B461007;
        Mon, 16 Dec 2019 00:48:38 -0800 (PST)
Received: from a075553-lin.blr.arm.com (a075553-lin.blr.arm.com [10.162.0.144])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DE0B3F6CF;
        Mon, 16 Dec 2019 00:51:48 -0800 (PST)
From:   Amit Daniel Kachhap <amit.kachhap@arm.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Amit Daniel Kachhap <amit.kachhap@arm.com>,
        James Morse <james.morse@arm.com>,
        Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
        Mark Brown <Mark.Brown@arm.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v3 14/16] kconfig: Add support for 'as-option'
Date:   Mon, 16 Dec 2019 14:17:16 +0530
Message-Id: <1576486038-9899-15-git-send-email-amit.kachhap@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576486038-9899-1-git-send-email-amit.kachhap@arm.com>
References: <1576486038-9899-1-git-send-email-amit.kachhap@arm.com>
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
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
---
Changes since last version:
* None.

 scripts/Kconfig.include | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index d4adfbe..cc465dd 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
 # Return y if the linker supports <flag>, n otherwise
 ld-option = $(success,$(LD) -v $(1))
 
+# $(as-option,<flag>)
+# Return y if the assembler supports <flag>, n otherwise
+as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -E -x assembler /dev/null -o /dev/null)
+
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
-- 
2.7.4

