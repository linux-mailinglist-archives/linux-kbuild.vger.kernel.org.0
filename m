Return-Path: <linux-kbuild+bounces-6045-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D19A5BCCD
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 10:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 598A31897C04
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 09:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E8B22D7AB;
	Tue, 11 Mar 2025 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePytkQLl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D9F225776;
	Tue, 11 Mar 2025 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686771; cv=none; b=GWfRvwOh9/ZayJ6OdNBmB+jSq1V3cDSm2mbvcRbERXs0jpfDGPp+MFk9T9g9Xc49iFT1/sp7F1WykA/0VOXIQLQqNE/5ix2QAS9rD7hvWJHp3wnyDVQpM6P1U5Lz7rAw+7ZbyNzZt84/jeGCwws8Ac7MK9zMydCa1+9M1ZBh3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686771; c=relaxed/simple;
	bh=mPq4JlVzua4yzFh1NNNJl4UlOm9bg8+UIsXT4ZUQekE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8auBKRM2Jh8UcRAAnWP3OuqpIBVHg3GAoFT1Hi7rjB93sOi9rweg+jlnphjIvOWCeorEGylBSeCvZgEnpeTNAp+Zr7/3m1pKGuJc58lmSJxzmN1Lbmua7whQmykzNjiYExmpYA8UQ+7ATcpLfuxWe/kUYGJvfFEepG9v4Tmh8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePytkQLl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C1FC4CEF2;
	Tue, 11 Mar 2025 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741686771;
	bh=mPq4JlVzua4yzFh1NNNJl4UlOm9bg8+UIsXT4ZUQekE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ePytkQLljKktEzSq4WuTDN2YIKnwA+YstBgG1uJT+DVepSJasylnikQIeQGOgTpH/
	 r1wDf9DHzV6XOAkYHGoml4HagPuWmqaAqclqnZOXaKHI/Ts7yPBMuq/3sjlGdvrpGO
	 ncJjq/+S8slzpP+JfTDoCN05gp3kMoedLMQxrSYwj065axTId4mdQZu0zfPU9MkpaR
	 +7auCu0kK7b166L4OZZo+SjB4i+pNakqx+VgpjVOfXOg3OPJipSEXtb/IA3whzaaud
	 ss9X7dHOPnLIbN34rvHkRRRNcHZ7GZqxT5NmBGXgQzHOZtRoiUQsAWbeNylk2+Bx1j
	 wZPtpQ3CORPcA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499c5d9691so2859216e87.2;
        Tue, 11 Mar 2025 02:52:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHo1RUOfE+lYFtAMcpQ1nKx8Uji25+2r04rRZZgVXnQf0jVlIdXXc2o/9bnD1q8CUN0ZrlttkQWdJeR6wz@vger.kernel.org, AJvYcCVhIuRRcBCM2kviUnG5PyANTldohwS/pa8MuvnCRZsfuGfRps/NJ9fTWmCMLswbpyLK7Ro460eBwl5Vdck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzES+EydBC6G6wEpTqdBscffo6W93+vkMSA4qJHvO++hE1hu3vF
	/ajyF3LmlG4gVedOgUoCN6BHWL80IWDh8za+ciS1MnZUYQIKKAlCWYtkgD/aKXD/M1+P2+5Euec
	7MvUChhDAc5r77Hy4orUDqXKVTBE=
X-Google-Smtp-Source: AGHT+IHk3DfD0lxEQrLyX0Kd/NSo7lFeZ6SZ37YrOVzBPx2qN0PZlB1QgKAq84rh7lAlAYiJ0x3MJ2uVYENGYFub430=
X-Received: by 2002:a05:6512:3e1e:b0:549:8b24:9891 with SMTP id
 2adb3069b0e04-54990e2bfe3mr5761727e87.6.1741686769669; Tue, 11 Mar 2025
 02:52:49 -0700 (PDT)
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
Date: Tue, 11 Mar 2025 18:52:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASE7jn3t23MbB375ma-yJj6FhzqB_Zr+-+8NbeoYxCdmw@mail.gmail.com>
X-Gm-Features: AQ5f1Jro8cIcIaRSbPbpJsCE7AA_bbfqQxJc2emdJtf4t_5qR7I4umYai8FaMeI
Message-ID: <CAK7LNASE7jn3t23MbB375ma-yJj6FhzqB_Zr+-+8NbeoYxCdmw@mail.gmail.com>
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
>
>
> > I am a bit concerned about having more and more
> > intermediate vmlinux.* files, but maybe only me.
> > I hope vmlinux.unstripped is the only/last one.
> >
>
> Maybe we should not strip vmlinux at all, but only remove any static
> relocations when packaging? E.g., tar-pkg, etc
> >
> > OK, let's do this.
> >
> > Ard, please send v2 with .gitignore and 'clean' target updates.
> >
>
> Thanks, I'll prepare a v2, but in the meantime, can we think about not
> removing the relocations in the first place?

OK, let's try this approach.


--
Best Regards
Masahiro Yamada

