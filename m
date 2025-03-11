Return-Path: <linux-kbuild+bounces-6043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2D0A5B954
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 07:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639C81893CBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 06:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4800B1EDA28;
	Tue, 11 Mar 2025 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lz0Nlr+S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDD7211C;
	Tue, 11 Mar 2025 06:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741675259; cv=none; b=K6WTGcl7/6XSMVJieJa371gGMN2IzVCLOrnT+VNkkLcz6B8xLq0TmgpKI+vgAPnGEZfJHdyGkG/e5SXucs9PtHawZZCipfcIBHsHFcumOn8E0wuaX7iS1q25+VyrMvFEc6WHrkRMpySO8wIk4uL6rf4kEbPwdGvfUUJYG4FalrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741675259; c=relaxed/simple;
	bh=fjXTfswJmAcwIMknoxF0JoD2gSngjlS/aE0LQKtSXc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0gB0OqbDo7ZfWE5B4QTsFkv9OqRwgl1d9Rixd8C9ecGSB5bSL+0hxQRrGZwFV6d1GiTsn9B750MbMXk8cAZkSHqXv7ocn0x8qAcCQkTRnmjSO+vLDUDumc6DfbpTiVizLkm/QkkD7Uuw04OruJ3VBAwwt3iO3gAdN+sZ2shiRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lz0Nlr+S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83202C4CEEE;
	Tue, 11 Mar 2025 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741675258;
	bh=fjXTfswJmAcwIMknoxF0JoD2gSngjlS/aE0LQKtSXc4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lz0Nlr+SsVqdUQQ1wvjr08EcA4eJP8jLMjquPYtYOo3Mo7Y1BetEnmD3/A48JA1Wl
	 cXeb2yt/UL0wHLs/IcPsMLZXszknL5kR47mnzwNxTf4GJwJbbN9w82P5jUb8AtkZJp
	 UHSEj6amarcnCRFwnS5GcO4oULfFuYuHZw9fb+qMlmDq6k17RKCF2H6VZ7xW2t0/VK
	 WBHWw+KVj8+W54AsdLTFsMWynsxr7DASKGZwv0SvArk2Xf5n5+grjloFpxtMTOM1Nc
	 Etez9wMhOM1/HYuTe3OhFejNFILzPDjVRw3qwI+gf3gEPHXPlrbplIDHuMPeD/evrk
	 pAglNUeJPteZA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5499bd3084aso2610271e87.0;
        Mon, 10 Mar 2025 23:40:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUx6NSaW0bI53b0lIxLXX/E1tFUlFxwa+INO5qY8RHByyernQ7SvPMcklkbG24V6Fav4kq+3juf8qdPtM=@vger.kernel.org, AJvYcCXoODO4N14+HZvRl195GjlIphxcUf2VaOjg+un6aHTw8ET1t6enpH0IXBZiu6iVnWbCxwDMiacjEa/M7udP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1iJx2M8SgY3AUDhE8ujITs8tbmwtsWmR4v6ELgldjqoiLyt1+
	9hHoJWgkUrNFKeOhHDQue799cLhFQGawmKp8uhfcp0pQ/hiKyiksZG+jj59h2o1PRRcMOCOJSEX
	kKV7L0nkEt67IemCC1wgUhh7gLVA=
X-Google-Smtp-Source: AGHT+IEO19Fv6fVb2GDf/hekkhvAGpQD/3rc0OvXZQzFfG7zbHqva9ZG9pHBH2QJhcpYQkZCddwhL0UFHU8Wq5chIW8=
X-Received: by 2002:a05:6512:3b14:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54990e3d8cdmr5339604e87.12.1741675256732; Mon, 10 Mar 2025
 23:40:56 -0700 (PDT)
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
In-Reply-To: <CAK7LNATb40pkqXXH+o_CXW6Vf3zavAj8oSeWnpGfXq6SCto4kw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Mar 2025 07:40:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEAw7qqRSPCnKj+sO5QEtWsFQ2P7gkxuNQhssWd3E6S=Q@mail.gmail.com>
X-Gm-Features: AQ5f1Jo1kZe_DM8QuOadC-d9xrQXRs6d246np4bAaj-oqEgAOmIUGP5pWWSXrrA
Message-ID: <CAMj1kXEAw7qqRSPCnKj+sO5QEtWsFQ2P7gkxuNQhssWd3E6S=Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Mar 2025 at 03:39, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sun, Mar 9, 2025 at 6:48=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wro=
te:
> >
> >
> > * Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > > On Sat, 8 Mar 2025 at 17:17, Masahiro Yamada <masahiroy@kernel.org> w=
rote:
> > > >
> > > ...
> > > > I do not think it is broken.
> > > > As I mentioned above, I regard vmlinux.relocs as a byproduct
> > > > of the atomic build rule of vmlinux. This works.
> >
> > Except when it doesn't work, such as when an intermediate linking step
> > fails, and intermediate build products are lost and cannot be recreated
> > easily (or at all without modifying the source)?
> >
> > And the thing is, there should be no such thing as an 'atomic build
> > rule of vmlinux' if it means lost information when the build is broken
> > at an intermediate step. What purpose does it have?
> >
> > > There is no make rule for vmlinux.relocs, and so
> > >
> > > - if it gets deleted, it cannot be rebuilt and even though the build
> > > does not break, the relocation data is missing from the compressed
> > > image, and this could potentially break the kaslr startup code,
> > > - it vmlinux.relocs is older than vmlinux for some reason, make will
> > > not notice and silently reuse the outdated version,
> > > - when creating vmlinux.relocs from vmlinux and an error occurs,
> > > vmlinux is deleted, making it difficult to diagnose the problem.
> > >
> > > I think this is badly broken, but if you think this is all working as
> > > it should, I am not going to debate this further, and you can conside=
r
> > > the patch series withdrawn.
> >
> > That's very sad, as both the simplification is substantial:
> >
> >   19 files changed, 52 insertions(+), 87 deletions(-)
> >
> > and the increase in debuggability is substantial as well.
> >
> > Thanks,
> >
> >         Ingo
>
> When a byproduct is accidentally lost
> (for example, manually deleted), it is not automatically restored.
> Running 'rm vmlinux' or 'make clean' is needed.
>

Exactly. Make cannot detect this situation, and so the build breaks in some=
 way.

> vmlinux.relocs is one such byproduct.
> Another is the map file when CONFIG_VMLINUX_MAP=3Dy is enabled.
>

The linker map is not depended upon by other build targets, and is
typically for human debug consumption, so while not ideal, it is not
as broken as for the unstripped vmlinux.


> I am a bit concerned about having more and more
> intermediate vmlinux.* files, but maybe only me.
> I hope vmlinux.unstripped is the only/last one.
>

Maybe we should not strip vmlinux at all, but only remove any static
relocations when packaging? E.g., tar-pkg, etc

>
> OK, let's do this.
>
> Ard, please send v2 with .gitignore and 'clean' target updates.
>

Thanks, I'll prepare a v2, but in the meantime, can we think about not
removing the relocations in the first place?

