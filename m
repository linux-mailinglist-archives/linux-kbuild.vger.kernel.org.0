Return-Path: <linux-kbuild+bounces-4659-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C919E9C5F8E
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 18:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81B791F226F7
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 17:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FE02144CB;
	Tue, 12 Nov 2024 17:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WvlPBj8g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F319F21443A
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Nov 2024 17:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731434187; cv=none; b=pobvGlYZkUjN1dY2CHsZfLWaN9ED4sEcS8tiyF5TYz7OyI1dFgYmhzeItkPsOF/qhZM97osnC2c9oMG9v7Coh9rXrj8E9/lqYYc34+VyI6/7Qi1SulQuZO2xS7zu4JyZyby/K4qA0ZRjmSw4h+zELD+Ev9cLnpQs7n6DsQfCPGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731434187; c=relaxed/simple;
	bh=JWSxFmX0mWdW30jemqkQmnNHt0dCtAUSXXk9eh8by28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ij5+kJTnu3QUmD3uVZkAkroDMoR6nqQHJtG1OTOvKyxeGKJeuD21WuxjQbImASesFGzQffXbNDT+u/2Hr3tN5lqC8TGT8MUFwIfjJWm1ImHeXP3Ic6rOmJ1iNPU3kAAbGMq4DQXIbntBOw4SNHvYvNzJnwkefw8Id2DF0nUmcyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WvlPBj8g; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2e2fc2b1ce1so6230288a91.0
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Nov 2024 09:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731434182; x=1732038982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9YTemcNOSBux/pW1rWp64ZP6TCtswrMtsdAWnShfy0=;
        b=WvlPBj8gpdUpj2RvGrbqV4y8B5AM7v3Sta9FZ16aa9T+8GrNTLB52d+xFBATO/S/7F
         44/UTOgIGMyGu97h6M/rlaA6GxZy5n3RMgKaxJJshgS8RoFup9VWCz9dPyjIGgT1P1z/
         w7adBvXCFbpoWwKhRWiMhLgdrUxR1EO2SD1j+/xiIucS/SOEZlv4Z/Kq7QdOTukur6c9
         tD8FWdnEyGez/u3/+fJcgbNxtKcj3c9e4LxFtyfxd8o1s7cCr2x40Lzsq2UpMmo3IVht
         GYfNCcxBviPr+YmoXbOU8msFeo/l8xS3/27n+I3tVl7OxV1kkKcxFNVwe1i1rZ33lBJ+
         FK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731434182; x=1732038982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9YTemcNOSBux/pW1rWp64ZP6TCtswrMtsdAWnShfy0=;
        b=K/e2peGIzNtFp5NrJVScytJtNO5714u76k06yRgCTV6X46Zs+CP0tXg3YOyp7YvdJl
         M3tntmY8/3lpztdQvsaM8Iwce/0g5tcf95nXu0B99dWcQMUHThuBK+zKnMYR3tqG1SIc
         7z4CRj4P36V4ylEI5aOsKNha7oMWfyp9N6FwaQUAy0K6AkxDhgaCcvCPLZDKPrbeV5WM
         T+Zzjc+IDujMtVBnrwJ9ewogiCLPshyYhVd2XKVpn46HNWCEdpkwJDXoHBvcmkJ1q/qC
         r1RuP5Byx5X7FAojg1lFBN4Gu8Z3VoEw3F2vwZxy3z6oXvCVTw1KiYGKz6Mg98GOeuSH
         6GRw==
X-Forwarded-Encrypted: i=1; AJvYcCX64+Ks08DtoTp43+shDdmjRJTmXy8JOdpBDggyBox1MxVjN31TeLht6PMO0wH7yrd6UxGqoL02VZ6DD4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/4QDDFMQ7mvAK6Fj9K5mIbixEXyFlGZz4ZHE7DLiM57rzu8v
	CEcjnSGw3qahetphjlmDOJ92UG9JPI1IBNA/cMti9RKhqJE6SdDpmOkN1Dhj6cza64JyV7LnmSv
	rWA==
X-Google-Smtp-Source: AGHT+IE5WL7h2XGzNj0qvrasZxftY/gxfWOWiXcQjrdbTbO16lDeHCTWuerM/EDIQ9IuAlYE6FEWQVvgFrY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90b:198c:b0:2d8:8f24:bd8c with SMTP id
 98e67ed59e1d1-2e9e493301emr50942a91.0.1731434182424; Tue, 12 Nov 2024
 09:56:22 -0800 (PST)
Date: Tue, 12 Nov 2024 09:56:20 -0800
In-Reply-To: <20241112092023.GL22801@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241111105430.575636482@infradead.org> <ZzKl-ldUQD9ldjWR@google.com>
 <20241112092023.GL22801@noisy.programming.kicks-ass.net>
Message-ID: <ZzOWxC4JlCGe_BTe@google.com>
Subject: Re: [RFC][PATCH 0/8] module: Strict per-modname namespaces
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 12, 2024, Peter Zijlstra wrote:
> On Mon, Nov 11, 2024 at 04:48:58PM -0800, Sean Christopherson wrote:
> > On Mon, Nov 11, 2024, Peter Zijlstra wrote:
> > > Hi!
> > > 
> > > Implement a means for exports to be available only to an explicit list of named
> > > modules. By explicitly limiting the usage of certain exports, the abuse
> > > potential/risk is greatly reduced.
> > > 
> > > The first three 'patches' clean up the existing export namespace code along the
> > > same lines of 33def8498fdd ("treewide: Convert macro and uses of __section(foo)
> > > to __section("foo")") and for the same reason, it is not desired for the
> > > namespace argument to be a macro expansion itself.
> > > 
> > > In fact, the second patch is really only a script, because sending the output
> > > to the list is a giant waste of bandwidth. Whoever eventually commits this to a
> > > git tree should squash these first three patches.
> > > 
> > > The remainder of the patches introduce the special "MODULE_<modname-list>"
> > > namespace, which shall be forbidden from being explicitly imported. A module
> > > that matches the simple modname-list will get an implicit import.
> > > 
> > > Lightly tested with something like:
> > > 
> > > git grep -l EXPORT_SYMBOL arch/x86/kvm/ | while read file;
> > > do
> > >   sed -i -e 's/EXPORT_SYMBOL_GPL(\(.[^)]*\))/EXPORT_SYMBOL_GPL_FOR(\1, "kvm,kvm-intel,kvm-amd")/g' $file;
> > > done
> > 
> > Heh, darn modules.  This will compile just fine, but if the module contains a
> > dash, loading the module will fail because scripts/Makefile.lib replaces the dash
> > with an underscore the build name.  E.g. "kvm-intel" at compile time generates
> > kvm-intel.ko, but the actual name of the module as seen by the kernel is kvm_intel.
> 
> I was wondering about that...  WTH is kvm doing that?

No idea.  The naming has been that way since KVM's inception in commit 6aa8b732ca01
("[PATCH] kvm: userspace interface").  My guess is that either no one noticed, or
those who noticed didn't care.

FWIW, IMO the kernel build system is the one that's being weird.  AFAICT, the
'-' => '_' conversion was added so that spinlocks could be placed into unique
subsections.  Amusingly, it doesn't appear that there are any remaining users of
LOCK_SECTION_NAME.

  commit b5635319d32438ed516568f53013a460ba16e6ee
  Author:     Dave Jones <davej@suse.de>
  AuthorDate: Fri Feb 8 01:43:23 2002 -0800
  Commit:     Linus Torvalds <torvalds@penguin.transmeta.com>
  CommitDate: Fri Feb 8 01:43:23 2002 -0800

    [PATCH] text.lock -> subsection changes.
    
    Make spinlocks etc use subsections of their parent sections instead of
    an ELF section of their own - needed for newer binutils when the parent
    sector is removed.

#define LOCK_SECTION_NAME ".text..lock."KBUILD_BASENAME

#define LOCK_SECTION_START(extra)               \
        ".subsection 1\n\t"                     \
        extra                                   \
        ".ifndef " LOCK_SECTION_NAME "\n\t"     \
        LOCK_SECTION_NAME ":\n\t"               \
        ".endif\n"

#define LOCK_SECTION_END                        \
        ".previous\n\t"

#define __lockfunc __section(".spinlock.text")


> I mean, I suppose you can do: "kvm-intel,kvm_intel" but that's somewhat
> tedious.

This likely needs to be addressed in whatever chunk of code is enforcing the
namespaces.  The s/-/_ behavior (and vice versa!) is *very* baked into the kernel
at this point, e.g. parameqn() will happily parse dashes or underscores for every
kernel parameter.  As horrific as it is, I think the module namespace needs to do
the same, i.e. treat dashes and underscores as one and the same.


More historical amusement:

commit 8863179c65618844379ef90d4a708293042465c8
Author:     Andrew Morton <akpm@digeo.com>
AuthorDate: Sun Feb 2 06:08:27 2003 -0800
Commit:     Linus Torvalds <torvalds@home.transmeta.com>
CommitDate: Sun Feb 2 06:08:27 2003 -0800

    [PATCH] kernel param and KBUILD_MODNAME name-munging mess
    
    Patch from: Rusty Russell <rusty@rustcorp.com.au>
    
    Mikael Pettersson points out that "-s" gets mangled to "_s" on the
    kernel command line, even though it turns out not to be a
    parameter.

commit 326e7842d30d5cfc1089b85a7aa63e5c9f3c0a74
Author:     Rusty Russell <rusty@rustcorp.com.au>
AuthorDate: Sat Dec 14 20:13:11 2002 -0800
Commit:     Linus Torvalds <torvalds@home.transmeta.com>
CommitDate: Sat Dec 14 20:13:11 2002 -0800

    [PATCH] Module Parameter Core Patch
    
    This patch is a rewrite of the insmod and boot parameter handling,
    to unify them.
    
    The new format is fairly simple: built on top of __module_param_call there
    are several helpers, eg "module_param(foo, int, 000)".  The final argument
    is the permissions bits, for exposing parameters in sysfs (if
    non-zero) at a later stage.


