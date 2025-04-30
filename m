Return-Path: <linux-kbuild+bounces-6811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68404AA51A6
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8B4E9C2CB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 16:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2B8264FA7;
	Wed, 30 Apr 2025 16:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vKLphjPp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC9E264A61
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 16:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030451; cv=none; b=QFZ23IF5OB4KRKF3IXw3xRkj6Rn7/tqTvC7zyVEVD0OwjYG4aeBoo4N4Qpzi7+q+EYPP5B/Bzmk2GF+upr0Pb0ZY49QeNSTOH3kSaFe0gd9PVXS4hvuKK6BBFA2aagdjmUV7CKsC+oKrARpVRXE99gFXdfCnZCphGkpwQWW1T40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030451; c=relaxed/simple;
	bh=GTOg1ysfEG4bdpGS4A571FfqA9HLp7EmYpGHSBXrIcY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QMySTZfj84GNnUKwrShitDjAD9zO2o60214BnuabdjIUJPvLDHDvWrw68vpO+GHlevqTznFG0m99ga5A0Ugmiy5lAbI72g6sVdPlknz3yq4FJXQh1LkPgV+y59ygcNEvB91OQEkEaWtpTD53zcC3zruYZJsRRA5q8cYwAV+NOe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vKLphjPp; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so3258225f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030448; x=1746635248; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=003i/GX+SMhbEk8JM6zOLdGB+5OhPHak3AuWaDpYHh0=;
        b=vKLphjPpkJwmvyo6uVzwsAZvNYttTXkLB+3D/sdywk0oVYVLfDJyypfL9qAFNda8AR
         wWxD53uC3XuHuFH2rOD3xoEci56Rka7JDR/CLvPnkYYF7wvyp65rBWzcu2LZx/nGhaZt
         FcoXoEevE+4tXgn0YWDyRG5cG2AbcxgB3d00bC26Pyctk6avGljZHG4ahP28owfFS6XX
         35csbwwQMRUXTz5oBG7NOUzEDIABeMiIqZjG1XgHHjYUJXVCcglUfhHu2NkSd+Y8/lNp
         galwgB8BTFhGIGFZ85TDBXu8hzDPX79Kf++AWVrYz2XQ2zcSD5xKomBuv/GhSV9/pIlR
         CJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030448; x=1746635248;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=003i/GX+SMhbEk8JM6zOLdGB+5OhPHak3AuWaDpYHh0=;
        b=r+CGgR0glEX+HkG8+YsgctPpN2K3koT1B3O7La23pAPf2Bgl69NEWzELWVA7njqvxw
         nFkparparCHENQA6cNfFQQMQseuiAU3acg0RO+cDnp59/K2oKwPxISHOhrhRBgaZ1KPI
         k4h2YwtM8J8R1Lwexb7oC4ocugcWhIKEb80eUFL+Y0RoP9FpgD7G1xse82vBmOzru9nt
         bymg5bk4KcaTo+pPFO2zF7FGXtZh6kMitXj4ajSeBWZqbW2FEwVWGk8H6flY0bTIn8iZ
         KUNf9kadOgWDPDMqO5PgSRKfWA9iR7o4p4h5IDVUaLEb7/TRFKMfiiwTImrIDsmy/WC1
         TsYg==
X-Forwarded-Encrypted: i=1; AJvYcCXu+qSolMq7LZ2HAi6oI8MNPy5amqkhAOvVJLwmt9OVSjhBOfBOZ8PfbKhO+fGfQvWwsGdZK+FPr6bowHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWSXn/+SarP450h68uSAMj99WU5vsrQWz5wGBAcf+SYmn+5RYV
	EWV0EGXAqCraYuO0AEu8fpO6yJhO4zkaqPebRi8PQW+JbR5qaOzPwcRdRo23xlKH6/xANgMiHhI
	ug0pbG2/qow==
X-Google-Smtp-Source: AGHT+IFmvlkwLxNmZ9CSFJVW5lMLHM9FQhYVBrEhGonj9gK38XYoJ6Wzk9kIHfgZWiH30GqYlq6Z8FTj6W6gdg==
X-Received: from wryv6.prod.google.com ([2002:a5d:59c6:0:b0:391:4999:778e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3107:b0:3a0:7af3:843f with SMTP id ffacd0b85a97d-3a08f761185mr3815578f8f.19.1746030448153;
 Wed, 30 Apr 2025 09:27:28 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:27:09 +0000
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430162713.1997569-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430162713.1997569-3-smostafa@google.com>
Subject: [PATCH v2 2/4] ubsan: Remove regs from report_ubsan_failure()
From: Mostafa Saleh <smostafa@google.com>
To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, 
	ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, 
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas.schier@linux.dev, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

report_ubsan_failure() doesn't use argument regs, and soon it will
be called from the hypervisor context were regs are not available.
So, remove the unused argument.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Acked-by: Kees Cook <kees@kernel.org>
---
 arch/arm64/kernel/traps.c | 2 +-
 arch/x86/kernel/traps.c   | 2 +-
 include/linux/ubsan.h     | 4 ++--
 lib/ubsan.c               | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 224f927ac8af..9bfa5c944379 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1118,7 +1118,7 @@ static struct break_hook kasan_break_hook = {
 #ifdef CONFIG_UBSAN_TRAP
 static int ubsan_handler(struct pt_regs *regs, unsigned long esr)
 {
-	die(report_ubsan_failure(regs, esr & UBSAN_BRK_MASK), regs, esr);
+	die(report_ubsan_failure(esr & UBSAN_BRK_MASK), regs, esr);
 	return DBG_HOOK_HANDLED;
 }
 
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 9f88b8a78e50..4b5a7a1a8dde 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -351,7 +351,7 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 	case BUG_UD1_UBSAN:
 		if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
 			pr_crit("%s at %pS\n",
-				report_ubsan_failure(regs, ud_imm),
+				report_ubsan_failure(ud_imm),
 				(void *)regs->ip);
 		}
 		break;
diff --git a/include/linux/ubsan.h b/include/linux/ubsan.h
index d8219cbe09ff..c843816f5f68 100644
--- a/include/linux/ubsan.h
+++ b/include/linux/ubsan.h
@@ -3,9 +3,9 @@
 #define _LINUX_UBSAN_H
 
 #ifdef CONFIG_UBSAN_TRAP
-const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type);
+const char *report_ubsan_failure(u32 check_type);
 #else
-static inline const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
+static inline const char *report_ubsan_failure(u32 check_type)
 {
 	return NULL;
 }
diff --git a/lib/ubsan.c b/lib/ubsan.c
index cdc1d31c3821..17993727fc96 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -25,7 +25,7 @@
  * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
  * enum SanitizerHandler (the traps) in Clang is in clang/lib/CodeGen/.
  */
-const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
+const char *report_ubsan_failure(u32 check_type)
 {
 	switch (check_type) {
 #ifdef CONFIG_UBSAN_BOUNDS
-- 
2.49.0.967.g6a0df3ecc3-goog


