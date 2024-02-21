Return-Path: <linux-kbuild+bounces-1021-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5DA85E0EF
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 16:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09D891C22A1F
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 15:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661E980626;
	Wed, 21 Feb 2024 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X43WiF5R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19A80604
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529063; cv=none; b=P44BK0qfQ2VTI23sbXN90lslJdDUbyjk87oRlfxW+FDSHFBK7SeY5M2Nw3xrUnnXfSKjL2AJlUYq0Ml2Jku8hUDwPcTRriapHNmtGPjlLcnSXReUMBuOLyxbsvaTa3CZSTLnVt3S6/Dw8H2L6OnWpo6u2WZ59e+RIQpb50+Yx7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529063; c=relaxed/simple;
	bh=G1SI2A6tUC59YrjJyks6t8vsbhf0181tsF0nRbc+Gok=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FomOixFEfgeD4aHBbLZbAOO1GoQfPvL4CaID1zTqHuRLpXsN3x9PMdv5bv4sF9dY3u2VCrpozkmwdnMlSW0GXd+3LwQa07ENYwrs0YkRgyOqHivP5I8XEFfCS7M/bl6i9WQcwedvb654KDtsoCUq90z0ya28XrIklvbT1Tv8c3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X43WiF5R; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256so7421886276.3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 07:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708529060; x=1709133860; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHHzhvHN0kTOVo3wOm3ee1AH8U5eQGWfBAmKM9n5eN0=;
        b=X43WiF5RExkr9EECTADddb6evCbVDhimXJjF9Z8G1tBPIpqd42YzvkWgXqXe0pwiMP
         XvFq8cY20TKg3kTMLcAbc8ZqzGgkm+9WBF4vbuaQ/pJVl8BGWzw3Ev62NzGohQAFDAm1
         BTyeR98Ap8Ovku2X+RUA5RZjqO1UKH/0Rx3cQp71NPWIN/OGRVPBsJhL481LsWlZH/aI
         xDnSkpMoAAnT+hOEr/T4oYJdci78npqM8m+Qb3rJBGTWmrvrHRzEonmfw0AIDghXQ4q2
         zaCcKaaxAHBCf3ojozyQz4NSepuHajT/O3By5RDbtoUi/LqUCzTzeNfS0rirPuDl0vzz
         8TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708529060; x=1709133860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHHzhvHN0kTOVo3wOm3ee1AH8U5eQGWfBAmKM9n5eN0=;
        b=JM9Abq3wDlJw/5Puby8L8NA02OsDOT1eZsKGPI9gWPTxFLvmWPpaJjqvqdKxENSiNh
         HOnpALEOdAFS3KItaIErdBvvKKe7NqLMhMTeYlJcGQ06s/esDbLXq8AtBCeX56h4jSkL
         aliEcikbIjlaEKcMiuLjhMpkAQ9mLY1jx+PhngPxwyQBmjrZ8IWRFbRHG5aOqirG9hc6
         LW7UYlmFlHk+0hH7Bgfe3Ac1B2Evpeagbo+8PGGBX7393c+aLcKIWEBHmOnnmmhcyEnh
         jggnCB7v7J7akgOZ8F1WJbGX+qAtHEavC/1M2PDCua5uLAmPkAJNRL0CqQUM32PS+OSk
         PuTg==
X-Gm-Message-State: AOJu0YyfCA5DhFPMVHaRgkBe620qbxVOA7ZHIBcdTByi6egMXGZZScls
	vWi3MIkqN1cT9t01exnaMVbOuxTfuMZJIkKy3xBSQQNpSWxm6DW4AluRKdVEWVp36FtrqzRKEBz
	W0A==
X-Google-Smtp-Source: AGHT+IHIiqpo182eOydyp2kAE2MyaxiISahNsXsmBtUhUZTch3wVQ+TmxdSEWBoV3EtlCh1QkxcGWISraHk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:114a:b0:dc6:b982:cfa2 with SMTP id
 p10-20020a056902114a00b00dc6b982cfa2mr703388ybu.8.1708529060015; Wed, 21 Feb
 2024 07:24:20 -0800 (PST)
Date: Wed, 21 Feb 2024 07:24:18 -0800
In-Reply-To: <20240217055504.2059803-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240217055504.2059803-1-masahiroy@kernel.org>
Message-ID: <ZdYVouaZX0AQF0V0@google.com>
Subject: Re: [PATCH 1/2] kbuild: change tool coverage variables to take the
 path relative to $(obj)
From: Sean Christopherson <seanjc@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Feb 17, 2024, Masahiro Yamada wrote:
> To maintain the current behavior, I made adjustments to two Makefiles:
> 
>  - arch/x86/entry/vdso/Makefile, which compiles vclock_gettime.o and
>    vdso32/vclock_gettime.o
> 
>  - arch/x86/kvm/Makefile, which compiles vmx/vmenter.o and svm/vmenter.o
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/x86/entry/vdso/Makefile |  2 ++
>  arch/x86/kvm/Makefile        |  3 ++-
>  scripts/Makefile.build       |  2 +-
>  scripts/Makefile.lib         | 16 ++++++++--------
>  4 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
> index 7a97b17f28b7..148adfdb2325 100644
> --- a/arch/x86/entry/vdso/Makefile
> +++ b/arch/x86/entry/vdso/Makefile
> @@ -9,7 +9,9 @@ include $(srctree)/lib/vdso/Makefile
>  # Sanitizer runtimes are unavailable and cannot be linked here.
>  KASAN_SANITIZE			:= n
>  KMSAN_SANITIZE_vclock_gettime.o := n
> +KMSAN_SANITIZE_vdso32/vclock_gettime.o	:= n
>  KMSAN_SANITIZE_vgetcpu.o	:= n
> +KMSAN_SANITIZE_vdso32/vgetcpu.o	:= n
>  
>  UBSAN_SANITIZE			:= n
>  KCSAN_SANITIZE			:= n
> diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
> index 475b5fa917a6..a88bb14266b6 100644
> --- a/arch/x86/kvm/Makefile
> +++ b/arch/x86/kvm/Makefile
> @@ -4,7 +4,8 @@ ccflags-y += -I $(srctree)/arch/x86/kvm
>  ccflags-$(CONFIG_KVM_WERROR) += -Werror
>  
>  ifeq ($(CONFIG_FRAME_POINTER),y)
> -OBJECT_FILES_NON_STANDARD_vmenter.o := y
> +OBJECT_FILES_NON_STANDARD_vmx/vmenter.o := y
> +OBJECT_FILES_NON_STANDARD_svm/vmenter.o := y
>  endif

I'm 99% certain only svm/vmenter.S "needs" to be compiled with OBJECT_FILES_NON_STANDARD,
and that vmx/vmenter.S got caught in the crossfire off commit commit 7f4b5cde2409
("kvm: Disable objtool frame pointer checking for vmenter.S").

"Needs" in quotes because I don't see any reason when __svm_vcpu_run() can't play
the same games as __vmx_vcpu_run() to make stack validation happy, and
__svm_sev_es_vcpu_run() flat out shouldn't be touching RBP.

I'll throw together a series to (hopefully) remove OBJECT_FILES_NON_STANDARD
completely.

But for this patch/series, I think it makes sense to do a 1:1 conversion.  That'll
make it much more straightforward to resolve the eventual conflict, assuming I am
successful in dropping OBJECT_FILES_NON_STANDARD.

Which is a very long-winded way of saying:

Acked-by: Sean Christopherson <seanjc@google.com>

