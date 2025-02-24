Return-Path: <linux-kbuild+bounces-5888-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBADA42F04
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 22:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A352A188E7F2
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 21:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE971DC9B1;
	Mon, 24 Feb 2025 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRhu8Lee"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D2F1DC988;
	Mon, 24 Feb 2025 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740432335; cv=none; b=LSZtYjx9O9LLDyLArDxvsXeQ1yXO2TtFirALkS+MuKb2hPm6Ve+P1U0A54u0T2nHUYjjzO+2Yw9B7PT94puwc4/sttKJCd7TSbUk0quBEnmmzWEgrFuE3NQnInBMk/NdZfjQ4ZYkWNB/pC5FFsD1wfFJufRZ8OWq05W2I9UeKNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740432335; c=relaxed/simple;
	bh=4f5dzSITboQRQ64Jn+vt+EFxbohswPMI1VV0DipjSPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2c0pxJ7v1T+N68sPlh21GvHYJHhh6f2/vB9fSXLyrNxCkQAHtVNaoR4kbpjtQgoHz1ZdSKR5OkX5Ocsw5s30sHAMdgbkIXK2DPb7yI0YMA1oRxIAAUfYxE7kXOZ0BxpvoYYnCjm+Yhy2uGkdY4GKTMuLchATbVPlbBigehFT7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRhu8Lee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AC0C4AF0B;
	Mon, 24 Feb 2025 21:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740432334;
	bh=4f5dzSITboQRQ64Jn+vt+EFxbohswPMI1VV0DipjSPE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TRhu8LeeMugJHSEDHhYRjwJO/Ej8TLItzzB/rup7y/N4KC41lcCfnQj4A1ntrTjhs
	 lNKqDGb+Z7m/RV5jEavJODwOLpE8UnmvxENeoj0sayxDJKH/rp7xEHm4m5vYkopOoZ
	 YLi4OgEvKnprnunQA29sVX41nviiCf8gMy+Toop2OuJierHeo2s2a8OnBbCcQQH/mW
	 KHIqw3LumDve3uqXfpbK1AZHLPWSs+pQMWCvle4jWCDXMzl/fnqTnOmfnSPZ/tg5Di
	 5hAdVC2nOvvM32DXRCaup/JrfIq9FAmH/cVYgGWjgOxRxqCvc7leWmMNYhD1ER4T0l
	 oVwQSsOUdPCDQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-548409cd2a8so3135853e87.3;
        Mon, 24 Feb 2025 13:25:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFpsmyfSIBVQ6GAxbdcEU0CW5OmDsLpxZ51H1FPnewxa6IXAXxTnMyH8W4kNrpB/eGJDTVpg4sAybrdEk=@vger.kernel.org, AJvYcCXiFpMXXYip2te4TB2NOEXIUUrhvIsK203MWz3vAfB0B+4rxYoRBZWgNXcmYiZTJguw/MkKnhtVqXd7uCLl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2OKHGhj7lnpGsF27wWPvGZlR4TsnwPtvypnbgWb+wrxV9tMNr
	Y+PTHynGTe+dpL9geB15J5zQZPaRkP1eP42qt0Sy7PZRmzoj6hZlNJQcuvkxnscCd1afgqrYrO1
	rtznhChqtGyM8wLGVBGYoEIy+h70=
X-Google-Smtp-Source: AGHT+IFgjYIyT2TgCVvk7h65gsUY+76p68aSEzKrkfMwPy6B59/8CffeYxZQNMuWlfPP7Hr9EbXD+ghEDhK5h9H3Jd4=
X-Received: by 2002:a05:6512:690:b0:545:6a2:e56 with SMTP id
 2adb3069b0e04-548510ecf32mr205578e87.37.1740432333129; Mon, 24 Feb 2025
 13:25:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <Z7y_i-ySL68BfkgQ@gmail.com>
 <CAHk-=wg0=Vh=9z_rUGSJn6p6xH8Z9Wkz0TLPenSt1m-1rHmJyA@mail.gmail.com>
In-Reply-To: <CAHk-=wg0=Vh=9z_rUGSJn6p6xH8Z9Wkz0TLPenSt1m-1rHmJyA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 24 Feb 2025 22:25:21 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF0+-xWqZE4LRF51DSzcpz5MszX1R49mwfSGe8H9f7xxQ@mail.gmail.com>
X-Gm-Features: AWEUYZmc3E3Ssh6J6zxtB1mmx-HIWZuLGFvYgMKSFbY1_oZd-9nC7gzyPD1wuLA
Message-ID: <CAMj1kXF0+-xWqZE4LRF51DSzcpz5MszX1R49mwfSGe8H9f7xxQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2025 at 21:00, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 24 Feb 2025 at 10:51, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > But in terms of justification for upstreaming, the reduction in
> > complexity alone makes it worth it IMO:
> >
> >   19 files changed, 52 insertions(+), 87 deletions(-)
>
> Yeah, absolutely. Our fancy make build rules still have too many of
> the phony forced targets, but this is a few less of them and makes the
> build confirm (more) to the usual rules.
>
> I do wonder if we could just get rid of that
> CONFIG_ARCH_VMLINUX_NEEDS_RELOCS entirely and make it just be how all
> architectures do it.
>
> Yes, it was apparently "just" riscv/s390/x86/mips that did that
> 'strip_relocs' hack, but at the same time that whole pass *feels*
> entirely generic.
>

TL;DR it is not

It is only needed on architectures that use --emit-relocs in the first
place, e.g., to construct bespoke KASLR tables. This is actually a
somewhat dubious practice, because these are static relocations, i.e.,
what the linker consumes as input, and they are emitted along with
vmlinux as output. [*] This feature was (AFAIK) never really intended
for constructing dynamic relocation tables as some architectures in
Linux do.

On those architectures, these static relocations need to be stripped
again, to avoid bloating vmlinux with useless data.

On architectures that rely on PIE linking (such as arm64), the linker
will emit a dynamic relocation table that is more suitable for use at
boot time, i.e., it only contains absolute relocations (as
RIP-relative ones never require any fixing up at boot), and uses RELR
format to pack them very densely, removing the need for our own
special format.

Architectures that do not implement KASLR in the first place have no
need for these static relocations either.

PIE linking is generally a better choice than relying on
--emit-relocs, but it is highly ISA dependent whether that requires a
costlier kind of codegen. On arm64, we don't even bother generating
-fPIE code because ordinary code can be linked in PIE mode. OTOH, on
x86, we'd need full 64-bit PIC/PIE codegen in order to link with PIE,
whereas we currently rely on the 'kernel' code model to generate
32-bit wide absolute symbol references that can only refer to the top
2G of the 64-bit address space.

[*] Using static relocations to describe a fully linked binary such as
vmlinux is problematic because a) it covers all external symbol
references, including relative ones that don't need fixing up, but
more importantly, b) the linker may perform relaxations that result in
the code going out of sync with the relocation that annotates it (this
is not entirely avoidable if the relaxed version of the code cannot
even be described by any relocation specified by the ELF psABI)

