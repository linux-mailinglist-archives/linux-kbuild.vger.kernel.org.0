Return-Path: <linux-kbuild+bounces-5586-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D63A24314
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 20:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676F91889BDC
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 19:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7901F03D4;
	Fri, 31 Jan 2025 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1CT09mU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B91EE7B6;
	Fri, 31 Jan 2025 19:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738350140; cv=none; b=LTb9JWqa6uA/4pGEYAMSijXckRLmWPpNbdWjf+oFW9nSym/qSGQiCDunpXyTQIwa++0lgSLwEDa/Ih0hOrBToBSPjpP9UH4sx7wL7eNJNI/GGMjAM8ZneqCL/uINkiT/wcfqWUZ5ryXJoBs7Ql1EEVIvNOAjn/+xnZWYUVkB1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738350140; c=relaxed/simple;
	bh=6AVpoP/2O64gR7R9RqSs9Cdk8c5iQpPg8cARe9RGlP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJ29IWHN4s0AR44A39Z+PhLM5A0hRvaYx9Gsg03BDz6oN390+lYO5GL/gJ6sW0Pv5H4ShI1gGt9zzn8Jl+8iratFny3e8MJrDNcNEb+n0T7hMjw737TxDZzu6glsOpOJLRf+5DizvevdKoAX9igj0FyzXTIj2LJOA5ewsWBYtqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1CT09mU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E39AC4CEE3;
	Fri, 31 Jan 2025 19:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738350139;
	bh=6AVpoP/2O64gR7R9RqSs9Cdk8c5iQpPg8cARe9RGlP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D1CT09mUJEf8McFk33sHFibQKDqHllP9XYFGOf4EWp8f5MfRpHLLfBEcP3MCQkdwY
	 I9/HMBtAR8eZB9s2Xcns7npwH7WdeJ1GyTMSGKxv2j7dcDT0DdYF+wyRkBdFNqyFDh
	 5PSv66+xD2lYqFjsAByY45E+wKRkDgaWFlTTkysUpPsPmEBJOd8myIV2AI0f/z02UN
	 iYiPIxiRc08n9iuw21DbigQy2Er8DB8m6ufBeT26z7hqwpp2MAZ+kcJD9Zu/2RTVe7
	 Za7PAl/caLvdVPz5a1VAki86NoE1XNmmzo8Bx7MK3QfsnphmitfS7pxqDWqXAV1pK/
	 rir2yli1OFSXQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso3154093e87.0;
        Fri, 31 Jan 2025 11:02:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHk3QOiWMoH9xD4Gl9cJA25W+FMwwaYMInaz9Hx7SmLmmtHUKBVyTXxcuglCvw67iaQ29hLj76HXs0jrg=@vger.kernel.org, AJvYcCXCHx1oGAbA2GudhBKRDIB+mkU60BAjVpKf+xi2jNtKrnmdADXaAzF2JhyyGKYWVXqaxaaREnod/gJYPN01@vger.kernel.org, AJvYcCXCs3IzCHm8JuNyoXJKn8NHYC9udb2CQeQ6QWo26oNlVnW27W6Io/wgQRBV3u5Prg7tMeJdOL+HigAq+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTdBpauY0icXnX0QZ+V/fekjDmjIhBMhiTAS/GFkXFc/UZDA0l
	6T6BCzQZUn/zpGkaKn9/MopgEHf5x2ns/GkK8EDdbV/jOEDZlUEHd5ilEm219PpHIWJ0stELatp
	kcvblskXmyPM3BzJrJ8jYd9/cABI=
X-Google-Smtp-Source: AGHT+IHaNiLPZ0x1/qDe4DXPLTcobvQaN1iClH+Dzh4E1ofSiwuHsKBCOpyx9EK2FpIQJy+A5/aMr0wXo3PrtTM4YzQ=
X-Received: by 2002:a05:6512:ba4:b0:543:e485:815 with SMTP id
 2adb3069b0e04-543f0ef31fbmr1553901e87.10.1738350137687; Fri, 31 Jan 2025
 11:02:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
 <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com> <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Jan 2025 20:02:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHeSnGcWRs1=kvJrqrUxgfsFDKPTAqQne6Le7pmComtYA@mail.gmail.com>
X-Gm-Features: AWEUYZkzScnFkN4gfKp8BOqJS510B4DuLEBHcSAhfZCajq1YQZEhaJs1ZcqtkMc
Message-ID: <CAMj1kXHeSnGcWRs1=kvJrqrUxgfsFDKPTAqQne6Le7pmComtYA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 31 Jan 2025 at 19:58, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Feb 1, 2025 at 3:40=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
> >
> > On Fri, 31 Jan 2025 at 19:35, Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
> > >
> > > On Tue, Jan 14, 2025 at 12:53=E2=80=AFAM Ard Biesheuvel <ardb+git@goo=
gle.com> wrote:
> > > >
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Due to the fact that runtime const ELF sections are named without a
> > > > leading period or double underscore, the RSTRIP logic that removes =
the
> > > > static RELA sections from vmlinux fails to identify them.
> > >
> > >
> > > Dumb question - why can't you rename the section 'runtime*' to '.runt=
ime*' ?
> > >
> > > .rel* matches to sections that just happen to start with '.rel',
> > > which may not be REL or RELA.
> > >
> >
> > That is what I proposed originally [0] but it was shot down by Linus.
> >
> > [0] https://lore.kernel.org/all/20241014125703.2287936-4-ardb+git@googl=
e.com/T/#u
>
>
> Does this work ?
>
> $(OBJCOPY) --remove-relocations=3D'*' $@
>

Only with binutils, not with llvm-objcopy

