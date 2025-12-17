Return-Path: <linux-kbuild+bounces-10134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA5CCC72CC
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 11:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF9A130EB67D
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 10:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC243612F9;
	Wed, 17 Dec 2025 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lc1gIa9Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4879F3612F7
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966614; cv=none; b=Mwhpgt72fs0yeNnZQeajmG89r6Ev/JtF3A0ApxKy1n0CoSdvo9eWm61zPT7N/8BaDCsA17eg+4gW69nsJXoIQVFjzS8f1r5b8GYu2ukVZboyb9/b6qQddmHVT4O8NlTffMTgLrQ0gYsXZLb4Pg93ATiut1q5yxI2ABWn5EA9jG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966614; c=relaxed/simple;
	bh=jl5K/60YwsctV6B18Z2lwG/kMWijrh2vuVAL7fW7AFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcDemFh+uIPmwbirKSWwFSK5but7rOquga8/TYetHUcFt3R6C1aC5iTypNiP73R3IMvrfLQ66S6sssJuZqhxl61uAhy6/W5hfIMXK+Z0QoMZextGUImYAoBmFeDUc+xrL4nJNdvgerjtHywFelBSsSFw/VjS5NjbfdAFkJOw/Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lc1gIa9Q; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37b8aa5adf9so38485661fa.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765966610; x=1766571410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UHO2CeadBH4/2oGsKOmkBLgKzqGu3lvRzYfeQSpKSBQ=;
        b=Lc1gIa9Qk6f58unFmulyFFLEFT9hzpvrMFSWkosTKN2ncgsqFOpW83IQg5bxLdZCmB
         t2I5jmCCA7eITobwwfW0K7wfTTn4tFEcv4pYfbEJw3z63OV626CHvrU6MtAuz6qb5Fdk
         lZVFDBJBGuqWdVstdqkljiYhnUn4BTfhcTnbca3v6uxybUm+81fjHUgi/gfYriYCZOoh
         Q8s4OOYNYODgO6L06/yzHRXtVezUJW3d6xp/AeFVtj9Abgd4mSfME4nJDZSGznd+jNB/
         razbOi82YSmZMXJhR1vyLrVym5iE8lzs2FPaJQXiTV7ZfTMpnx83kw2GFuBCNHKdIPaP
         y/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966610; x=1766571410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHO2CeadBH4/2oGsKOmkBLgKzqGu3lvRzYfeQSpKSBQ=;
        b=RtV46K4lzSEJWabNCx20FT/e9vtE7tG5HKZzfH5EmxyMqrQOcJCN94NkARJ96Snss9
         wQkRbRsqy/SjY/bR2onYcOvg3DaWQsImbq5zRybmJHiT36GBCnzx5jVPS8mHnK6xjn0I
         yrm6jDKiPwruyn2zW+9hG6vguae1Fme2nuep9/QjgRCJ2YX4o9BnfQ/r8nPpygXLQXtJ
         9iUOb6Qx08nEutaxtvXH11lsM4h/GHq0mI/m7Xz0JDdu9y8QQsSXg4QO0D3k18YEe8yM
         rOHFhN/0WDfcxQhSqFDkbKsYuwo1JtM/IMxBP8qjVBCYyOkC5egLFqmMkMG84eXl4lXD
         DOKg==
X-Forwarded-Encrypted: i=1; AJvYcCVWkFKdWb/sA7RaKOZhBMqIRcGxaAVZRC9EB7ABwYZ2zSJgAUf1/0tUhccycu2JtNLZxEn+zZWJ2P5vF4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+6O5n1WYJjYm/6ksIWU6exK4YKYfmCgSDVZHPxEmiSg1fLGe
	MNF3rRfbh+7RyYX7khaU8qp9eMD27vwurrPdkPrhjGTAIEYk8LJIpYAKAnw66LruwDD9tM/5WZS
	2GjonVYYo858pZupDNmVcAr5SCdU1An+oTnMQ4JES
X-Gm-Gg: AY/fxX5alRaCaqkS2BrWVjIoLLhPLntxQLyW+ASXKJ/pbpy0W22VTvEtAGXFgLzntmd
	n+rikN+gAYhXzFGlQikJ5yda1A8ZKaGiTb2r/uRu7+L5RV5LXVi+ydrHtOOY0b43z99zQUN2K4N
	Rsy2nF1qEwW4/tKNfX4QurrIZ+irRHqB+8Q3tQ1Nhk1PPjFlRodyuf0Kh31BkjTAaMdLWwC01I+
	sxTElEMAdEXcON+6Cl9p89ki7HCe56B62o2HAcpJaRisAsYpY3/2x5AwZLByH8JOKZKUUBMcbyM
	xIjr02oXma3QUN2/Z2yqYrbMPg==
X-Google-Smtp-Source: AGHT+IF5sj69WaGzrfPHoTGEZY7LaGmmXWDuRatReIDQ/gzW5K84rrZxwpJwxQr0ZW1d0ZtFMElgAdK6zydOy6gfBAA=
X-Received: by 2002:a05:651c:221f:b0:37f:bca3:bd7b with SMTP id
 38308e7fff4ca-37fd08c08b8mr43341361fa.37.1765966609045; Wed, 17 Dec 2025
 02:16:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aS22QhwdrHN24ToD@levanger> <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
 <20251217083202.GA2118121@ax162> <CACT4Y+bsiPfmL-yV99mLCA4n7ukYwS-6E7kTcLg1EOxOQ_cZjg@mail.gmail.com>
In-Reply-To: <CACT4Y+bsiPfmL-yV99mLCA4n7ukYwS-6E7kTcLg1EOxOQ_cZjg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 17 Dec 2025 11:16:37 +0100
X-Gm-Features: AQt7F2qIsTB-mv5gVbaBjUWiSBtHF5HVVZVDVoQFHiCgMULygaXG1kXeigg1BSU
Message-ID: <CACT4Y+aFSLS95qtpWQ0UjVU3wZ+svi2igLh_SoOqQec_Zwg7Mw@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v6.19
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, patso@likewhatevs.io, 
	Justin Stitt <justinstitt@google.com>, eddyz87@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Dec 2025 at 09:39, Dmitry Vyukov <dvyukov@google.com> wrote:
> > > > Pat Somaru (1):
> > > >       scripts/clang-tools: Handle included .c files in gen_compile_commands
> > >
> > > /\/\/\/\/\/\/\
> > >
> > > This commit breaks invocation of clang tools for me.
> > >
> > > For example I now have this fake entry for mock_uncore.c which
> > > pretends to produce intel_uncore.o (along with 2 other commands which
> > > produce the same object file):
> > ...
> > > An attempt to invoke a clang tool using this database legitimately
> > > fails with the following errors (the file is not supposed and can't
> > > compile on its own):
> > >
> > > clang-tool: drivers/gpu/drm/i915/selftests/mock_uncore.c: exit status 1
> > > drivers/gpu/drm/i915/selftests/mock_uncore.c:47:2: error: call to
> > > undeclared function 'ASSIGN_RAW_WRITE_MMIO_VFUNCS'; ISO C99 and later
> > > do not support implicit function declarations
> > > [-Wimplicit-function-declaration]
> > >    47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
> > >       |         ^
> > > drivers/gpu/drm/i915/selftests/mock_uncore.c:47:39: error: use of
> > > undeclared identifier 'nop'; did you mean 'nopv'?
> > >    47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
> > >       |                                              ^~~
> > >       |                                              nopv
> > > /arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
> > >    71 | extern bool nopv;
> > >       |             ^
> > > drivers/gpu/drm/i915/selftests/mock_uncore.c:48:2: error: call to
> > > undeclared function 'ASSIGN_RAW_READ_MMIO_VFUNCS'; ISO C99 and later
> > > do not support implicit function declarations
> > > [-Wimplicit-function-declaration]
> > >    48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
> > >       |         ^
> > > drivers/gpu/drm/i915/selftests/mock_uncore.c:48:38: error: use of
> > > undeclared identifier 'nop'; did you mean 'nopv'?
> > >    48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
> > >       |                                             ^~~
> > >       |                                             nopv
> > > /arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
> > >    71 | extern bool nopv;
> > >       |             ^
> > > 4 errors generated.
> > > Error while processing /drivers/gpu/drm/i915/selftests/mock_uncore.c.
> > >
> > >
> > > What am I doing wrong?
> >
> > Nothing. As you note, ASSIGN_RAW_WRITE_MMIO_VFUNCS is defined in
> > drivers/gpu/drm/i915/intel_uncore.c but it is used in
> > drivers/gpu/drm/i915/selftests/mock_uncore.c, which is not designed to
> > be built standalone. We could potentially move
> > ASSIGN_RAW_WRITE_MMIO_VFUNCS into a common header to avoid this but I
> > think I would rather just revert 9362d34acf91, as I already figured that
> > this was going to be fragile:
> >
> >   https://lore.kernel.org/20251007163338.GA547361@ax162/
> >
> > I would rather discourage including .c files if folks want clangd to
> > work properly since this seems fundamentally unsolvable if developers
> > have written .c files in this manner. I am open to other thoughts
> > though.
>
> I am not sure what other clang tools are doing, and why they need
> this. But FWIW my clang tools don't need it at all. They would index
> all files, get source files from AST (which would include included .c
> files as well), and work with that index. So they natively "see" and
> understand all included .c files.

Yikes! I am trying to workaround this, but this is PITA.
Entries are not in order, + there are now multiple entries for the
same source file (yes, files include themselves). This is plain
broken, and hard to workaround. Even if I find the entry that is
correct, I can't really tell about it to a clang tool since it accepts
just the source file name, and there are multiple entries for the same
file name.

Does anybody see a reasonable way to undo what this commit is doing?

Thinking about this: I think included source files should be treated
as include files by anything, rather than added to the database. They
_are_ include files, and systems should handle include files already.

