Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F16F3EFC65
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 08:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239818AbhHRGZF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 02:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238376AbhHRGYy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 02:24:54 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13683C061764
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:24:18 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id o2so1186339pgr.9
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dkCK961ZyttB0QG+MUzGRc9GbPNZyJOzxDRl3nXU6Gc=;
        b=F3ghc0DUnRIAuSynTOo4HhTisr9dY2clGPt7Tp2ELGFpLUMoqQjF17RYWes7eco0Fp
         HKzP4hJH6W8dElSRC/l4MPe4WbDo+9mFg+K8Li9eyi19QvOkLGzu4axj3QbMT/3x3/oK
         4mFZNJ8jfnCy22ecNEUEUkyyEwRPO3Ye/ohuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dkCK961ZyttB0QG+MUzGRc9GbPNZyJOzxDRl3nXU6Gc=;
        b=Srg7/jMgrgm1WHrpw9/8jJ1xn+S42xaBhpcPs8SpwXB4IJcOGdiy8jWUc3DDMaCunb
         RvD/0Sr3buerloki2r58f2LWmvH4vw+WvV11UlSA7/xI0NByokur8k/BHyizmVdZ/Vij
         pyoKmSI5Gafob8o638s0eRYjJrP9ccihoZI8Pt8n2PMMF9MbDBDd/nUDj6jeNTlL8ZED
         HaDpGMsLGH5Gy5RSXrG9bzfdMl2NB7+MVfSG4/0adJEUi1myPGiE9f+73XyxGwwuzgwe
         ZxZi0740lUWsYuXBtoo+FUzGw5bRGSKQM6z6FMUb84SUMCVNp8NkDPHH/FjyRrjRaeZ4
         w8kA==
X-Gm-Message-State: AOAM532ixG1kY7e/WlCARguEJ+FpTLph5X6CjUvAdEeylWlJHu2x6ZRq
        UQBtPfatK0SsfQ3Ocxipz3EMOQ==
X-Google-Smtp-Source: ABdhPJzB6Fpw5lksE03mTikq/l8Ungtb52rwsKcOwzebsF0lTq2QR4kdwv8iqtPBdlFbyxw6WcuEBA==
X-Received: by 2002:aa7:8c19:0:b0:3e1:4b9e:cf89 with SMTP id c25-20020aa78c19000000b003e14b9ecf89mr7683859pfd.58.1629267857641;
        Tue, 17 Aug 2021 23:24:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t18sm4582599pfg.111.2021.08.17.23.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:24:15 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 57/63] powerpc/signal32: Use struct_group() to zero spe regs
Date:   Tue, 17 Aug 2021 23:05:27 -0700
Message-Id: <20210818060533.3569517-58-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908; h=from:subject; bh=uD1y/xoxNTfC/kMxy1YHPqDr4W4r5gvR6/3LUb/d/+Q=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMqjnaaYE2W2OottJ48+Kv314H+c4/L+2RqMHXv r7V1BciJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKgAKCRCJcvTf3G3AJgmYD/ 4xOx64rrId3koq1dIVBd1c7qtDRXBXq8ocvbv6TiAzQ5OW2IJsAcesmEDGB0aarLTux96zhVYvPuEY ekfg39GKhCgEPeb5jXP+UH57m9qopfeReANE1S4LvEsOJWuHGa5N2yh0MVFMYdstmPHkfTVtOzOdnW 4FpfS36c3/G650GjYZjHYGK93aUv37ocoMf05CH9DSjWcOrGk+21jowTwXALShjZMmIjz5FWSiAPe+ +1eUzjLiqUeJOGZ7Lv40/p3giVTD2/7lEzVVufOf7KMLHvSJmrltr2bLt88CSW+0Qs2cDc8kDwit4g NSusBANylY1K/6uJsrHXOzr8UYkdtB6bsttgeE9V1+wOYhLMeNib3XArxbwXJKppaNHkpLdAyqOc1N hNWxNmFkEb7gLQI+lgaRv2CySpbhIO+o8h7UWzfZ9W2P7Sz8/0+TLD68DRwxBbPxMHy7FpShanbdlR HAvsXrcU8SaCn8kjeuW7pbNPk+pnaYiQiMH5cl3iCfgq1I13gvGVNmMUEdqsNskPE6H1JjH3DkRQLj i7n33M3844UZk+msL24HAJukYQmiAtXqJDGZb3S179NpLnEREMRQveIz0XRN96WDiRCpbvwy644xQe qmxn1RnVllos5p0W46DDS5Z/a2ezsgCPxronRiihYw6gD81m/cUYTrPKHDSw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add a struct_group() for the spe registers so that memset() can correctly reason
about the size:

   In function 'fortify_memset_chk',
       inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
>> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
     195 |    __write_overflow_field();
         |    ^~~~~~~~~~~~~~~~~~~~~~~~

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/include/asm/processor.h | 6 ++++--
 arch/powerpc/kernel/signal_32.c      | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index f348e564f7dd..05dc567cb9a8 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -191,8 +191,10 @@ struct thread_struct {
 	int		used_vsr;	/* set if process has used VSX */
 #endif /* CONFIG_VSX */
 #ifdef CONFIG_SPE
-	unsigned long	evr[32];	/* upper 32-bits of SPE regs */
-	u64		acc;		/* Accumulator */
+	struct_group(spe,
+		unsigned long	evr[32];	/* upper 32-bits of SPE regs */
+		u64		acc;		/* Accumulator */
+	);
 	unsigned long	spefscr;	/* SPE & eFP status */
 	unsigned long	spefscr_last;	/* SPEFSCR value on last prctl
 					   call or trap return */
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 0608581967f0..77b86caf5c51 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -532,11 +532,11 @@ static long restore_user_regs(struct pt_regs *regs,
 	regs_set_return_msr(regs, regs->msr & ~MSR_SPE);
 	if (msr & MSR_SPE) {
 		/* restore spe registers from the stack */
-		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
-				      ELF_NEVRREG * sizeof(u32), failed);
+		unsafe_copy_from_user(&current->thread.spe, &sr->mc_vregs,
+				      sizeof(current->thread.spe), failed);
 		current->thread.used_spe = true;
 	} else if (current->thread.used_spe)
-		memset(current->thread.evr, 0, ELF_NEVRREG * sizeof(u32));
+		memset(&current->thread.spe, 0, sizeof(current->thread.spe));
 
 	/* Always get SPEFSCR back */
 	unsafe_get_user(current->thread.spefscr, (u32 __user *)&sr->mc_vregs + ELF_NEVRREG, failed);
-- 
2.30.2

