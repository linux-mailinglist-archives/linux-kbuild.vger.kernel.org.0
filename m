Return-Path: <linux-kbuild+bounces-6120-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39816A5F0F4
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 11:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14ED13A79A0
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 10:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE981D88D0;
	Thu, 13 Mar 2025 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s74rCBe2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C503F16BE17;
	Thu, 13 Mar 2025 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861929; cv=none; b=U+96F2K2L3403TqY0IV+xLfoij0ER6bCeLg4eTSj3lmJLcj6sTl/78tZPU6wyPJnCeCkNSIrs6XQJN9Rg1Pk8nxmG3YaKck0lnbOvjo2ZATYaTGU2gD2noBdRYKR1rmtfXzuVluoWpW4cygLkY3AKu2WaO23UxPk/k/8rldj2I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861929; c=relaxed/simple;
	bh=vp6bg26NerLSUUazGPvHxcQQKRGzcjqFPiWbFTYAPUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVgpH3azSYZASpAqg6PrzYKHGKB3qb6SRjbvjwR8EZLpttwrt1f3WpvzrbMamKkCSrzJ7ViaUYKOkqJfVTUtZWirJVZfssWth1dlp4lxpO49+Oh3E0OeooyGo2Gt/xFLEzj/J07Qoff+lefVX4hiO0KxRQ20K7vmSsrYUARzW9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s74rCBe2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE2AC4CEE3;
	Thu, 13 Mar 2025 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741861929;
	bh=vp6bg26NerLSUUazGPvHxcQQKRGzcjqFPiWbFTYAPUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s74rCBe2kZErmamJ64chid1yW8ZYtbFI3u6bw5hIAy0FYbQA2dT2xe+R41Uzxx8Ss
	 IuceNnTx9WoCV20ZCFUKn6kjMBjhGlvOqCyDeUuEgU0d10e10hiH8XDXDLhPibDzXn
	 YDa5KCUVCagPFma868xh1L1m87p6AeLitN4UpdF4wVicLSKDk/bWpnRuQXB322FJ1r
	 5w13FJVyelw+xpMV+h4H0IotkN8R3AqwzlVtowRyFTw8d1yFX9Lvsw8eVy+uRQmxtj
	 90sKWTIhWgDCONEzKBnmRVXdInZtXHxdoLeGGqbic2TWd3qx3cS27erJ/sPM78SWo+
	 J+GVPw3OQEl+w==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499b18d704so816752e87.0;
        Thu, 13 Mar 2025 03:32:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHT1im+F7Z5NfnuOsnxNCzcYmRMd2+C04AiaWVNHMsC/w/tFLyFnq8YHaZK4LSl7wQQuqyQ4dqT71o7bE=@vger.kernel.org, AJvYcCVOcx+C5Ruu5vdu6ksztX6tTvRlhOFgyfxBn4AaDeODkWi3HFi/l+uDHHQ4xQZSnLZcdmORLTe8oduy+sKO@vger.kernel.org
X-Gm-Message-State: AOJu0YzapQROo+rwfvgeHzsSNRbo4yk7eioPJYIBCqWjn/Cl6pOA21ul
	qRNEuN1Bl212v7dS5L44glBGH36H6qw8MBC+vlOZf5kQz8G7m16HNMu2AWfoKd0t8iQlx6qSqLM
	WC7w/BqXvjSfUQU0G9byoxa32FBI=
X-Google-Smtp-Source: AGHT+IF2/LdlU/BnRk012EhhZfmR8/aa57N7syCRBT5UlFEM1Nc/v9y1tqWaAAoouuiCXuBEOM+bLfqRMkDtWuyVRpc=
X-Received: by 2002:a05:6512:3d15:b0:549:78bd:6b9f with SMTP id
 2adb3069b0e04-54990e676damr9169540e87.30.1741861927881; Thu, 13 Mar 2025
 03:32:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
 <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com>
 <CAMj1kXGVe-R7VF1nHmRx+UB4FuhSjiwMU=n_uWCLC99rTTa5ZQ@mail.gmail.com>
 <CAK7LNATkaTvAwPmNM3kSOCkCptW-bo9Ko6asWyFVcGYgu5rHtw@mail.gmail.com>
 <CAMj1kXHCia-gQy7fkVC5SgMyFqz6rRgpVbz6_W7e9jk7ENaQxA@mail.gmail.com>
 <Z81j8EguDyz_uesu@gmail.com> <CAK7LNATb40pkqXXH+o_CXW6Vf3zavAj8oSeWnpGfXq6SCto4kw@mail.gmail.com>
 <CAMj1kXEAw7qqRSPCnKj+sO5QEtWsFQ2P7gkxuNQhssWd3E6S=Q@mail.gmail.com>
In-Reply-To: <CAMj1kXEAw7qqRSPCnKj+sO5QEtWsFQ2P7gkxuNQhssWd3E6S=Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Mar 2025 19:31:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATh=si9Gc6r0_g66YPmoV8qWkqFAbVhLwUbsjTkhRAEbQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpN9yY182aIhb9AHHOX73O0I8d6jIFYZOgavTeL_hQ5Jy5s66K_fuCwmjA
Message-ID: <CAK7LNATh=si9Gc6r0_g66YPmoV8qWkqFAbVhLwUbsjTkhRAEbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 3:40=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Tue, 11 Mar 2025 at 03:39, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > On Sun, Mar 9, 2025 at 6:48=E2=80=AFPM Ingo Molnar <mingo@kernel.org> w=
rote:
> > >
> > >
> > > * Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > > On Sat, 8 Mar 2025 at 17:17, Masahiro Yamada <masahiroy@kernel.org>=
 wrote:
> > > > >
> > > > ...
> > > > > I do not think it is broken.
> > > > > As I mentioned above, I regard vmlinux.relocs as a byproduct
> > > > > of the atomic build rule of vmlinux. This works.
> > >
> > > Except when it doesn't work, such as when an intermediate linking ste=
p
> > > fails, and intermediate build products are lost and cannot be recreat=
ed
> > > easily (or at all without modifying the source)?
> > >
> > > And the thing is, there should be no such thing as an 'atomic build
> > > rule of vmlinux' if it means lost information when the build is broke=
n
> > > at an intermediate step. What purpose does it have?
> > >
> > > > There is no make rule for vmlinux.relocs, and so
> > > >
> > > > - if it gets deleted, it cannot be rebuilt and even though the buil=
d
> > > > does not break, the relocation data is missing from the compressed
> > > > image, and this could potentially break the kaslr startup code,
> > > > - it vmlinux.relocs is older than vmlinux for some reason, make wil=
l
> > > > not notice and silently reuse the outdated version,
> > > > - when creating vmlinux.relocs from vmlinux and an error occurs,
> > > > vmlinux is deleted, making it difficult to diagnose the problem.
> > > >
> > > > I think this is badly broken, but if you think this is all working =
as
> > > > it should, I am not going to debate this further, and you can consi=
der
> > > > the patch series withdrawn.
> > >
> > > That's very sad, as both the simplification is substantial:
> > >
> > >   19 files changed, 52 insertions(+), 87 deletions(-)
> > >
> > > and the increase in debuggability is substantial as well.
> > >
> > > Thanks,
> > >
> > >         Ingo
> >
> > When a byproduct is accidentally lost
> > (for example, manually deleted), it is not automatically restored.
> > Running 'rm vmlinux' or 'make clean' is needed.
> >
>
> Exactly. Make cannot detect this situation, and so the build breaks in so=
me way.
>
> > vmlinux.relocs is one such byproduct.
> > Another is the map file when CONFIG_VMLINUX_MAP=3Dy is enabled.
> >
>
> The linker map is not depended upon by other build targets, and is
> typically for human debug consumption, so while not ideal, it is not
> as broken as for the unstripped vmlinux.

Now you learned this statement is wrong.


--=20
Best Regards
Masahiro Yamada

