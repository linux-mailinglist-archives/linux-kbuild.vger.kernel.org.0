Return-Path: <linux-kbuild+bounces-5501-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D08BA16331
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Jan 2025 18:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0231C1885080
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Jan 2025 17:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19EF537E9;
	Sun, 19 Jan 2025 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbPyhswW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B0F433A6;
	Sun, 19 Jan 2025 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737306936; cv=none; b=lknj2lvnrtFmRrI+vkshZKEjT4QGyJEn9elnruojLjRO3AbCOm/kMv8OpnmR6hBfGCCFYikPbbMrjfxZjJjrR2IKz/IG/rpmkgFgNZSmhhymHMyietFkXGPMY8RiJ2m88M3InlJ0TEeFOPmO2neEhufFUNEGqiY6RYy2nt7zmDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737306936; c=relaxed/simple;
	bh=Di4UFK/tpZT8+N85V7hdgzEPZmwUbG7U4GIf9VtxO4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzhgIX9OzaZWg3qi/AaC2N4qIgZBu6NmFsNDJqgKaPybHVeBOdsjHeRXad+I4MIEECGcj8I9Nh4UFnIy3u8mJcE3Dth0axr2NOmCVnhUajvZzqISoDuq0RxcbVfwfmrwgrAg2+S7UdSDC9Qqa27gArs2PJerypF7hVsnEWQHSDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbPyhswW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E503FC4AF09;
	Sun, 19 Jan 2025 17:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737306935;
	bh=Di4UFK/tpZT8+N85V7hdgzEPZmwUbG7U4GIf9VtxO4I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WbPyhswWQhVY3qhkHAsfJ02PiqJgaR/wE7xUZFeJPEAucJbX1DlUp72eqPGYaTF5s
	 n4pAkfhuOVPAXTnrJvlPi5rzpkYr2FH5PaNBkzc2ZkJxXVdMWt3GzJ0MjdbOBF13oJ
	 aPvd4o3g1pdWpU5DQmgm7poMN6xPaRr73HL75Qh4Kr/Y5RkHzWeGE2tDoB8KPD31gH
	 ZL8cfYkPVfInJdEefBkWs/IHtcKgWjjppKPBknjlrI0pD73DBkHJdQVDhlS4RuVS03
	 3oMJRQZ79novBueEYfoFd1yNvVxpQA3MfKCvyre9vEtBBQtPLVTc7CraiZ9okQkVag
	 1s7CusuJUu87A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-304d760f0dfso32179801fa.2;
        Sun, 19 Jan 2025 09:15:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUw92993OuWBrG4hSDy9q/46ar2JUBzNet3dyyji91p4EvvoQwkwoyAeyzSYDh4bStml3QnFaTUL8xtbuYE@vger.kernel.org, AJvYcCW2sSqntp2xdwNm1x/MX7z1gVWFl02WmlLlyjZzQnVVfP+zic+We7dhBp8RV1HrBBL4mXbS6c5kGkC5QEE=@vger.kernel.org, AJvYcCWEa4B6WzUl7dj5ZG8NLkajz4WgbfoowuDHMJR62l8sS6cTobgcDNIKVg6E7liGL4n4uaZ/58AZISWOWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzim3FxEXyFEnuE3eOzf7ezppDs7z+V78nBooSfHGge3qMvh6HE
	nZkVS2dChaOxO6Hm6e3QrxrSmPNLE+wS2ojkgKmW8A6re3SbaVBkI78tHRbwXyDy5x947ttZmrI
	p9Np3N0kLbUYjGKCyrdSV+cs3gI8=
X-Google-Smtp-Source: AGHT+IGr4L2jHUMsDzfNAtLulKH70pYOVCMgNTSvVBpAMXbcnlvC+dHc5ISQezZZpgy6NtG0ZfBs8RijEw/Q1AjhHYM=
X-Received: by 2002:a05:651c:1198:b0:300:3a15:8f04 with SMTP id
 38308e7fff4ca-3072ca74fa0mr26473651fa.15.1737306934250; Sun, 19 Jan 2025
 09:15:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <Z4mB-I5jeGithAQX@ghost>
In-Reply-To: <Z4mB-I5jeGithAQX@ghost>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 19 Jan 2025 18:15:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com>
X-Gm-Features: AbW1kvarTqlSljQ0HcmXnP7VsdnphtVke3R0NZBLnr3k2eZnMIXoHb1qDsjcPk8
Message-ID: <CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jan 2025 at 23:02, Charlie Jenkins <charlie@rivosinc.com> wrote:
>
> On Mon, Jan 13, 2025 at 04:53:07PM +0100, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Due to the fact that runtime const ELF sections are named without a
> > leading period or double underscore, the RSTRIP logic that removes the
> > static RELA sections from vmlinux fails to identify them. This results
> > in a situation like below, where some sections that were supposed to get
> > removed are left behind.
> >
> >   [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
> >
> >   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
> >   [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
> >   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
> >   [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
> >   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
> >   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
> >
> > So tweak the match expression to strip all sections starting with .rel.
> > While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> > single shared Makefile library command.
> >
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-s390@vger.kernel.org
> > Cc: Ron Economos <re@w6rz.net>
> > Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > v3: put back missing 'endif' to fix the RISC-V build
> > v2: add missing include of scripts/Makefile.lib
> >
> >  arch/riscv/Makefile.postlink |  8 ++------
> >  arch/s390/Makefile.postlink  |  6 +-----
> >  arch/x86/Makefile.postlink   |  6 +-----
> >  scripts/Makefile.lib         |  3 +++
> >  4 files changed, 7 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> > index 829b9abc91f6..750d2784f69e 100644
> > --- a/arch/riscv/Makefile.postlink
> > +++ b/arch/riscv/Makefile.postlink
>
> When I compile x86 as relocatable I see the problem that you are fixing
> here, but I don't see it on riscv.

That is because riscv does not yet support optimized runtime
constants. Only arm64, s390 and x86 implement this today but I'd
expect other architectures to follow suit.

> It's probably better to keep around
> this code for riscv, but I don't think it even needs this stripping? I
> am adding Alex since he added this for riscv.
>

If vmlinux is linked with --emit-relocs, the stripping is probably
necessary, or you get a lot of metadata in vmlinux that is not needed
for debugging.

> Anyways this works as expected:
>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
>

Thanks.

