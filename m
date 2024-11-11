Return-Path: <linux-kbuild+bounces-4645-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4539C450E
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 19:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D589C286A20
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 18:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661D01AB537;
	Mon, 11 Nov 2024 18:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1RP0KIgH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78041AAE32
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Nov 2024 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731350180; cv=none; b=kF6zjtG0/044j2dCe2JnHXV2xIRLa5TSZeg5BISVl2wcu8ttTqrDa3IJAHtd5eyFXxvGg20akfqvkc73eGIbIUKzToYaDIfCk0hnzgCji0n2pOg1fPPgELgfyv56V+qaq8REHw26kSfmEL3Wabz5iAUW1TsgjTKLnmBIwp9g078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731350180; c=relaxed/simple;
	bh=PV+dFXayKSoza4QKboAoM48LK/FZeCJuiCqWhtXBk0E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iqjxQZaMWL8q9QgbfKamtm0j0swUXkcPFs+P8nK2LFADAt263t9KykIWpimjznguj2pUIg8w5PSZCtsoWItJmX62bz/hX2HbryXOhmzE2SzZFGb33NIAV1pR3wYxPWbJpm+M4t5ZNP0kwZmCmqBkvEdSSlgPng8cdNF9H9omCxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1RP0KIgH; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2e9b71d44baso4017459a91.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Nov 2024 10:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731350178; x=1731954978; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xT65ccAjs8Gh3WkVN2oxehYUfXZk8VYjMpoaHsa33o0=;
        b=1RP0KIgHNyK4Ur5hol+Yu7G4mRLT5tpDqZKDX+teyt5MNs2yBx2OY1QvIMD3BKtJpY
         Tm7AOHxYmRV9NaSxUZZuG3kk5lsUeX1X30ZoixVr4WI1su5YKD/jIl2uSs75SDhMUYQs
         lKnCVRLqS1q1tO8yaRZXNBlm9PKTocDncHCDW6BtCaJjuXPf8e47MmGK79GRt2/HmFHR
         Z8G1z4WKiRi+48GzPgrAwCmIW+5QOhG+Yez/bVR0LSE01QCItXedJdbqOKW4uQdN1hPI
         jmTksgzrW8DUqt8wbXQXMMiMAqUUoBQnAQ5GEZ03tHwNVA69ttUxwWdKfSrxIjHhmjAn
         9bWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731350178; x=1731954978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xT65ccAjs8Gh3WkVN2oxehYUfXZk8VYjMpoaHsa33o0=;
        b=u11M7izFhL/9Q8UrD96XFIZMQmlchhDtRYzQ9/AWeVzVYWUJToLnwW4YUyhNoN7G11
         Ib1rIM/KIZbXKpXIF/+cVkDV23KqEcefKT73dMdHnvNsh0AQgHV8qTKRVU2YN6Cr6crR
         19cVl6xYDpCQiR+eH/9Oyy6hIkIvIYDK74vaXYYuZTgtU9MDAhPKxRUyM9h+JfSm0LSW
         GUEaa/tr/tmsz8jE2w/2c/BolU68l7FNGTlgG9bmbSvtuHMeFIpO/p/7KcVmVainkb9h
         d5bU1VH5yPGxv8RpkrriCzPTlcWAJeAM9exDU6utkci/0WM5t6XXlG+SpPEPta9tQB4b
         in9A==
X-Forwarded-Encrypted: i=1; AJvYcCUNiNYPF002V1z9loZqbN+/XyVM9eyv7JfPLz5M09xYjrVIXXnmOc8h61jFGFX6N4ucNCseSNidOqeBSlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5Y5+zT49CcmthA+vpWNyRf0srLEjL5D+jiMz4k46JBAm2ERl
	IifTVw3WVoLICfu5CoCa0Cx0u549o0khjfvk2tukSqZUQXHiWDhlxB1pBYunjGbQcm7r8hKGu98
	H9Q==
X-Google-Smtp-Source: AGHT+IGsaV/1tgPpIVqWB5Mn7y56a6i4yKq/u3n7iqOCe1NxKLezWYvBI7qvvP2xMM7HdjgqR6IWPDWEFzg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:8306:b0:2e9:9234:2db7 with SMTP id
 98e67ed59e1d1-2e9b16eb06fmr126213a91.1.1731350177740; Mon, 11 Nov 2024
 10:36:17 -0800 (PST)
Date: Mon, 11 Nov 2024 10:36:16 -0800
In-Reply-To: <ZzHsZoYlwYpNx9A5@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241111105430.575636482@infradead.org> <20241111111817.532312508@infradead.org>
 <ZzHsZoYlwYpNx9A5@infradead.org>
Message-ID: <ZzJOoFFPjrzYzKir@google.com>
Subject: Re: [RFC][PATCH 6/8] module: Add module specific symbol namespace support
From: Sean Christopherson <seanjc@google.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, 
	petr.pavlu@suse.com, samitolvanen@google.com, da.gomez@samsung.com, 
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 11, 2024, Christoph Hellwig wrote:
> On Mon, Nov 11, 2024 at 11:54:36AM +0100, Peter Zijlstra wrote:
> > Designate the "MODULE_${modname}" symbol namespace to mean: 'only
> > export to the named module'.
> > 
> > Notably, explicit imports of anything in the "MODULE_" space is
> > forbidden. Modules implicitly get the "MODULE_${modname}" namespace
> > added.
> 
> Btw, I finally remember why I wanted a separate macro for this:
> so that we can also add the config symbol as an argument and not
> export the symbol if the module isn't configured or built in.

That could get ugly, especially in generic code, as multiple KVM architectures
use multiple modules, e.g. x86 generates kvm.ko, and then vendor specific modules
kvm-amd.ko and kvm-intel.ko; and PPC generates kvm.ko, and kvm-hv.ko and kvm-pr.ko.
PPC in particular is annoying because it generates kvm.ko for KVM_BOOK3S_32=m or
KVM_BOOK3S_64=m.

The other quirk is that, on x86 at least, kvm.ko is now built if and only if at
least one of KVM_AMD=m or KVM_INTEL=m, which triggers KVM_X86=m.  I.e. kvm.ko isn't
built if there are no vendor modules, even if KVM=m.

I'd also like to use this infrastructure to restrict KVM's own exports, e.g. so
that KVM exports its symbols for kvm-{amd,intel,hv,pr}.ko only as needed.

So rather than having EXPORT_SYMBOL_GPL_FOR() deal with KVM's messes, would it
instead make sense to have KVM provide EXPORT_SYMBOL_GPL_FOR_KVM()?  Then KVM can
reuse the painful extrapolation of Kconfigs to module names for its own exports.
And IMO, that'd make the code that does the exports much more readable, too.

E.g. for x86, something like:

#if IS_MODULE(CONFIG_KVM_AMD) && IS_MODULE(CONFIG_KVM_INTEL)
#define KVM_VENDOR_MODULES kvm-amd,kvm-intel
#elif IS_MODULE(CONFIG_KVM_AMD)
#define KVM_VENDOR_MODULES kvm-amd
#elif IS_MODULE(CONFIG_KVM_INTEL)
#define KVM_VENDOR_MODULES kvm-intel
#else
#undef KVM_VENDOR_MODULES
#endif

#ifdef KVM_VENDOR_MODULES
static_assert(IS_MODULE(CONFIG_KVM_X86));

#define EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(symbol) \
	EXPORT_SYMBOL_GPL_FOR(symbol, __stringify(KVM_VENDOR_MODULES))
#define EXPORT_SYMBOL_GPL_FOR_KVM(symbol) \
	EXPORT_SYMBOL_GPL_FOR(symbol, "kvm," __stringify(KVM_VENDOR_MODULES))
#else
EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(symbol)
EXPORT_SYMBOL_GPL_FOR_KVM(symbol)
#endif

