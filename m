Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883083EFBD2
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 08:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239399AbhHRGQC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 02:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238313AbhHRGPt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 02:15:49 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F189DC06122E
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:14:13 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id m26so1084115pff.3
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YsZhptKgT8RdO2UT2M60Q/NccyUdJGsE7yDhN1K90D8=;
        b=AqV5GrGQ6APa9jCXTlZsEv0yNQBd1buoKBsvC1Patiai/MrqWa7b1XmHW51ubErKfR
         FKiWQ3qq8B5Ew32gz8StW83bO7rlDl3YjixVsDHSJA4wz/kFX3VFE/RVvNNLh2rGw6uj
         aLVD1eBZqiJktmYYzr55zSr1HRkW5dhGCex20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsZhptKgT8RdO2UT2M60Q/NccyUdJGsE7yDhN1K90D8=;
        b=UgzB/Y47IMKt3lEIk/tKtEndRTWTnFu6uOl1oPe+zKb/SlUiuMo5wpCDQlFhaNZ1JT
         jTYg2SQrugmuCSKnNvN4exaDVfzMmWhHJkNkLz3CYe5GJWdcW/iwijQR8ZA+O8eH6QyQ
         u0PD/26/KDx5vGVMHMb41ko3Bd9KQJZ66rBtDKv+LQnet8860WiEJciz1W7dK9IuNIAC
         vMn7yzy4zeKKkaevdHui9Y6zbCbgxCrgZqp0v8hpId7GWuYsjRGkTj0HDW9wg253UMs5
         HQhoirOfh8z8/1oH818z7euClUbbG21Z0IqJZiTMzuRU4XKYxzXtJuGm4V/k9KjZLbwR
         5+eA==
X-Gm-Message-State: AOAM533DIJs0EB9sl/d9rbwszasjV6rzlypFDdbEsmgWyz85SSdFM4Fw
        D/JobKXaz+gDU3/XBDZCPbYDZw==
X-Google-Smtp-Source: ABdhPJxPAH0mQ5JRMc8So+cEOoTT47AjgR2xcCPW7BD+067I11NQTK24J7A1TqH0vYvVkR9Q0mkDOA==
X-Received: by 2002:a63:2242:: with SMTP id t2mr7083803pgm.111.1629267253551;
        Tue, 17 Aug 2021 23:14:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u20sm5380627pgm.4.2021.08.17.23.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:14:12 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        kvm@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 53/63] KVM: x86: Use struct_group() to zero decode cache
Date:   Tue, 17 Aug 2021 23:05:23 -0700
Message-Id: <20210818060533.3569517-54-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338; h=from:subject; bh=Ox8odXNGawRcDoEtGWzS1ckYpMUjtDsTTZYtgzhZK3w=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMqj0+1jVnOnluvpSmjVC4NV24/mrWjdCYNGFB9 jwBTeKuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKgAKCRCJcvTf3G3AJvAxD/ 9iMuZIH7PHSmcbrF42uGoRIdS+nUfoKIZhbDR6xmtYDi0vxGbsdnyFZjSwy/XynEIH0Vdlrjpr81jC i9bK6rBJ6rF+TFv4HczlsySW3y3N1xIFaafTX6oJZJQC4gwj1WFe3QmoGDtyXKzIY3V9LTS+crmZ19 PKzynOfjnFyeQ88B1mbEeWil4T6EpIx+uc0Ly+QDT6NMxAjAahBFGnwpD01G5vsMAaUmvcocZEMyl7 7YIHmOz/j/dYDz4RvvjZx/Tcs75qRmaGJF5mD4G1uKSyBTSMrXFMz+xPji8ym/CQJOmxlJncwK1ZeJ 0q5RhAcBUU40d3SC6gNEwZxhqKp/+y9g5sTKSmizT6qqLhtju9XaLkFreo8BocUmC87/U8XumMROux H7hTx08E0OLINGfNct+Ilqcl/d8BtuufZvpRurcgDGLCiLVLOmp2EUpSW3/7zdBVa5/XtPcJMzTFjA lNxvtKUV7fsVvqiI/nL2V5pRPIqiN0Z49mX6zaB2ugX7c6zSuVN8n/lv7Vp7R7Z9ej1ZhByTkOtJJP THc7Uk079v0yMLps1P5flkXnDnRV6bEq0RtAKVLAUn5d/wqA8wB7KtIGzZ6iai9BxNsS1Z4r3pqD7h bI8Pa7iryL+NoaVDaYWVnzlhrUa4TSXPjODvqjZoZfkoykTseBzmuBsI+cpg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add struct_group() to mark region of struct x86_emulate_ctxt that should
be initialized to zero.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Wanpeng Li <wanpengli@tencent.com>
Cc: Jim Mattson <jmattson@google.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: kvm@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kvm/emulate.c     |  3 +--
 arch/x86/kvm/kvm_emulate.h | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 2837110e66ed..2608a047e769 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -5377,8 +5377,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop)
 
 void init_decode_cache(struct x86_emulate_ctxt *ctxt)
 {
-	memset(&ctxt->rip_relative, 0,
-	       (void *)&ctxt->modrm - (void *)&ctxt->rip_relative);
+	memset(&ctxt->decode_cache, 0, sizeof(ctxt->decode_cache));
 
 	ctxt->io_read.pos = 0;
 	ctxt->io_read.end = 0;
diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index 68b420289d7e..9b8afcb8ad39 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -341,14 +341,17 @@ struct x86_emulate_ctxt {
 	 * the rest are initialized unconditionally in x86_decode_insn
 	 * or elsewhere
 	 */
-	bool rip_relative;
-	u8 rex_prefix;
-	u8 lock_prefix;
-	u8 rep_prefix;
-	/* bitmaps of registers in _regs[] that can be read */
-	u32 regs_valid;
-	/* bitmaps of registers in _regs[] that have been written */
-	u32 regs_dirty;
+	struct_group(decode_cache,
+		bool rip_relative;
+		u8 rex_prefix;
+		u8 lock_prefix;
+		u8 rep_prefix;
+		/* bitmaps of registers in _regs[] that can be read */
+		u32 regs_valid;
+		/* bitmaps of registers in _regs[] that have been written */
+		u32 regs_dirty;
+	);
+
 	/* modrm */
 	u8 modrm;
 	u8 modrm_mod;
-- 
2.30.2

