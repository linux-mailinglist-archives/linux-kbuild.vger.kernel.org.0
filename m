Return-Path: <linux-kbuild+bounces-3760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D59E2986311
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 17:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 129A31C2764F
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 15:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A804198850;
	Wed, 25 Sep 2024 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TsAdLtYA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEBF1946AA
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276568; cv=none; b=WE8xBc9SBvUuIItTPWsNR1sLQkHxpVH/iIlb9t1iLWvOXSf03QiLZT/9kZ89sl975KKcKuCSFu2nc9Rz0KIUTprEutIzZpf1z/M20+f0BykXAG5CONtIKRYmsG3NlgQsWelxajewOM/Vf5E7LbfPc/SXpXFIjkbjO8Pjim8x2M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276568; c=relaxed/simple;
	bh=3JGT0Gp6Mz6RRG9jsRwcVhBESThd+LENzWfNaIpsWgo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n5nqr8rXolvN14idCeQwlAYxIhG8alR7VLTcT4qzykVpbB5ypIYo04AqjaRoJ1OStfxLxgtlP6PDvNXcRUk26BeE8KQhrhQ6yKVPZoqanUNmgMuRZVlVJLTVhCZGrK614T5/+wcGKgKlCWWfCTFBnCMETAHHE1BqcYRVGDAm5hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TsAdLtYA; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1159fb161fso9928655276.1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276564; x=1727881364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvnpcmFQxcsGZvvXdDVNifJH/U/gKUWuX4k9X0rnjWY=;
        b=TsAdLtYAaeJGU3uxeCnFRgjYC3zywHtu6kW+6MWpOyRNzrSw08zUCHdh6CU0oPm8gr
         54tOTeHyOuanpEbdNRoeq8LiHt0Ly0sdjAsUk0tK4vAtiLDvGVLI4ChjS1/H1NP68DS/
         wSfZ51QMisCY3gLGmgurQEDRdSja9nk83ak8rOou2KXBBOUOMoZvo6HyUrCUqmKGFclq
         X79FiB7c9maDv32TWuRLLqa01GBzHCXym8JqphMQrvk/vyTCKLoJG/bfAtxBkbCui/JW
         prbpIXqx2mZ0S0rjKfDQ90v+oF35A3ySYc1z/4V/6oMFpYVBD7CNN2WPxnCQcpMGvSPl
         uaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276564; x=1727881364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvnpcmFQxcsGZvvXdDVNifJH/U/gKUWuX4k9X0rnjWY=;
        b=UWzsXaAwqRe8iF7Wiu/WpBhDXQLNoxUdzareRPXbQtjWm+hrsnpgE4U5/GY4fIuh6L
         xgT5Ga6fempOjqOM5dR18nz3FZIQv2AC3ys9tHv+7FYT2mdz3i4qG2HvR6Qoxy/bKtVr
         R0+X+M5lqXl0tBNrWfBWzqDWXkA5XzLzzHSgM3kXDM9OewqHvU6hxEzIHM/lNeVSI8DE
         xuC3qWPlnwT2IG2xVsi7AnpqKc6Qw0/E7uaIKy+nARV1XNGeZoghexjJaDPLOndyGAr+
         Mu1ctMyBumDVNO61xdsfQF4FvPMI21sZtiocj1vFOJgrktT4wEcopQICFO21yWcKaAr0
         5OTA==
X-Forwarded-Encrypted: i=1; AJvYcCW9GjQemtVITi4q0UmHngaIqQGjmtrpwXZ8kdDZ7nvD9JkAP5oJFYARLBfDvRUcBgULTqOgo+osoMfBZZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq8nlpwYaExEvQyyYiKeSyVz8RxciA4jC9CbB6SuBi+JscLoBl
	1uUBRRstXwTe+vf0dJVwv1qoHBkbVY1ABDrEyiLt9v2vxAatVddKmXuBeGtxtAvfUVMlTg==
X-Google-Smtp-Source: AGHT+IG8l7xPrwiQoCJNQ/ba3EMloi9V99YK0VEhh/KbnKIqVODzSQX4+kTe9p6XHA3xEE581cvXY/7/
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:fc20:0:b0:e25:17cb:352e with SMTP id
 3f1490d57ef6-e2517cb37ebmr1573276.9.1727276563646; Wed, 25 Sep 2024 08:02:43
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:21 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665; i=ardb@kernel.org;
 h=from:subject; bh=aFznGPhrIJfcYbFW/zJm7PxtyN4XPqpBJvJpRLs7DOQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6smrOU/sUlwy2LTW237rV4pUONJ8T3XtdLO2DQ3bj
 80/F1nfUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYyyZHhn8LWprti0g+tdKf9
 /bStUjGJXy/+qc4H120n962eP03h1yKG/wHHj7aK75zgynumw7x0V1PPmh2muXNy98WcvvZ74cO kJi4A
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-51-ardb+git@google.com>
Subject: [RFC PATCH 21/28] x86/head: Use PIC-compatible symbol references in
 startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Use RIP-relative symbol references to make them compatible with running
the linker in PIE mode.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head_64.S            | 14 +++++++++-----
 arch/x86/kernel/relocate_kernel_64.S |  6 ++++--
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index db71cf64204b..cc2fec3de4b7 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -182,8 +182,9 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 	xorl	%r15d, %r15d
 
 	/* Derive the runtime physical address of init_top_pgt[] */
-	movq	phys_base(%rip), %rax
-	addq	$(init_top_pgt - __START_KERNEL_map), %rax
+	leaq	init_top_pgt(%rip), %rax
+	subq	$__START_KERNEL_map, %rax
+	addq	phys_base(%rip), %rax
 
 	/*
 	 * Retrieve the modifier (SME encryption mask if SME is active) to be
@@ -314,7 +315,8 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 
 .Lsetup_cpu:
 	/* Get the per cpu offset for the given CPU# which is in ECX */
-	movq	__per_cpu_offset(,%rcx,8), %rdx
+	leaq	__per_cpu_offset(%rip), %rdx
+	movq	(%rdx,%rcx,8), %rdx
 #else
 	xorl	%edx, %edx /* zero-extended to clear all of RDX */
 #endif /* CONFIG_SMP */
@@ -325,7 +327,8 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 	 *
 	 * RDX contains the per-cpu offset
 	 */
-	movq	pcpu_hot + X86_current_task(%rdx), %rax
+	leaq	pcpu_hot + X86_current_task(%rip), %rax
+	movq	(%rax,%rdx), %rax
 	movq	TASK_threadsp(%rax), %rsp
 
 	/*
@@ -346,7 +349,8 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 	 */
 	subq	$16, %rsp
 	movw	$(GDT_SIZE-1), (%rsp)
-	leaq	gdt_page(%rdx), %rax
+	leaq	gdt_page(%rip), %rax
+	addq	%rdx, %rax
 	movq	%rax, 2(%rsp)
 	lgdt	(%rsp)
 	addq	$16, %rsp
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index e9e88c342f75..cbfd0227ea3e 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -106,6 +106,9 @@ SYM_CODE_START_NOALIGN(relocate_kernel)
 	/* setup a new stack at the end of the physical control page */
 	lea	PAGE_SIZE(%r8), %rsp
 
+	/* take the virtual address of virtual_mapped() before jumping */
+	leaq	virtual_mapped(%rip), %r14
+
 	/* jump to identity mapped page */
 	addq	$(identity_mapped - relocate_kernel), %r8
 	pushq	%r8
@@ -225,8 +228,7 @@ SYM_CODE_START_LOCAL_NOALIGN(identity_mapped)
 	movq	%rax, %cr3
 	lea	PAGE_SIZE(%r8), %rsp
 	call	swap_pages
-	movq	$virtual_mapped, %rax
-	pushq	%rax
+	pushq	%r14
 	ANNOTATE_UNRET_SAFE
 	ret
 	int3
-- 
2.46.0.792.g87dc391469-goog


