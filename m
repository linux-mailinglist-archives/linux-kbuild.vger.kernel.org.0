Return-Path: <linux-kbuild+bounces-7407-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABFCAD1654
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 02:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BD601888E3C
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 00:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8536F15E97;
	Mon,  9 Jun 2025 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZ7gTOPF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D0BE5E;
	Mon,  9 Jun 2025 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749429610; cv=none; b=G8FNACUnARCGgKRY7l70Z6/kth4+T3CWF7kLtCpAXiD1/ud5eEpPyRCPPRAe1EhdcPSqjhwCIHLgKn294ZqqrFAmLHqGBrc1O8KFPyLIMAqnpsXN+mIwBx2WdTrpRp3butj2ySpfdDckp/qVBlmfnVBjBSNnj1vmq5/iOIe0wWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749429610; c=relaxed/simple;
	bh=AYQm7+/hFbcmGvpVK2s4F75RUgJ71pWFAycmHWnVxjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSzgua4CSfPfEuurv936hU34rYdtQr270KNR0Z8K+HaXjJwI96poTxjI094Tk1mS7HUUmSh5GbHI3SpK6zk5oSxTO2or/OaSizzKp/hs05OK4Lb2FedC1KtzFlbvUMicKEpRzJh2t0inTlTgqTcXP+M+nDrlT/eOo+6ZSJZ7wUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZ7gTOPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDF3C4CEEE;
	Mon,  9 Jun 2025 00:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749429609;
	bh=AYQm7+/hFbcmGvpVK2s4F75RUgJ71pWFAycmHWnVxjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OZ7gTOPFzFlEfwn3kFiXqhCwj9T2/oKA7LAKrIVi0ZxwToC0g3b0ZziWsiKddhfu7
	 wX90ClfGZCGr+ya8BQwCsYuuYNkb8OfD1xUV8TBNDPGA+jvO7QWJ9V/zGletljKzaE
	 ohWhm4fLwXrY35y23zyJPm+Pj1bC0/rn6B0+lpEiglS0NWTzNYxmYaTqEqr8tBVH8b
	 a0dC9J02KRhXbuOINo8j4a2pBcxEHQr5m7nw4jlo11GR1aG9Tg71l/o1RnYwJ0NP7+
	 U29/4EIytua5FBb/lJ1sj6g3RZg5ryVMtFd1/Gs3GxQ80YgOFC1ybu0yHENtmc8Yy1
	 XPAoB0Bj+vtbw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-551fe46934eso3951330e87.1;
        Sun, 08 Jun 2025 17:40:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOmxJUJ65fZqbpR8AWrJMgVPbpRLpMdejSa0JrRhvR+QfZIrpoQSEpDO+C6rViV6qhGtOlKsjE6pTxHQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYzNnQRctiTB2dB9ZH+4SR4hPgsaVLAQVVIhtDY480cns+W0nd
	ZjwCTfHLrjRKQrJ7p//joyRPUFSQEAsFilN4bv302hH+O9uqIIzydfdtdtiepsRe9htPLed8H39
	B3Lrh4ye7SkAnlzPecuzq9pi675ZL4ws=
X-Google-Smtp-Source: AGHT+IGZroWKXmRyERdhKl/Z5gyx1d3GToM80Z6QzsO3n4nyocOiHOS/jpDdwx5gKtF7wLnd3Pr65HTbFL8f1LMpy48=
X-Received: by 2002:a05:6512:1152:b0:553:2154:7bcc with SMTP id
 2adb3069b0e04-5535d92b41fmr4491488e87.20.1749429608640; Sun, 08 Jun 2025
 17:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608141509.157300-1-chenhuacai@loongson.cn>
In-Reply-To: <20250608141509.157300-1-chenhuacai@loongson.cn>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Jun 2025 09:39:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARQFBuUY2YzUnPuyEdTAVy=B91L5NyYGzhY-kAr3SYsRQ@mail.gmail.com>
X-Gm-Features: AX0GCFuM40A9k8e2D3a-34RtMf0zB68mZ3ppfrFyJU-EHoMdxz9h0AFbVMKL7IM
Message-ID: <CAK7LNARQFBuUY2YzUnPuyEdTAVy=B91L5NyYGzhY-kAr3SYsRQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix build warnings about export.h
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: linux-kbuild@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:15=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=3D1") and 7d95680d64ac8e836c ("scripts/misc-check=
:
> check unnecessary #include <linux/export.h> when W=3D1"), we get some bui=
ld
> warnings with W=3D1:
>
> arch/loongarch/kernel/acpi.c: warning: EXPORT_SYMBOL() is used, but #incl=
ude <linux/export.h> is missing
> arch/loongarch/kernel/alternative.c: warning: EXPORT_SYMBOL() is used, bu=
t #include <linux/export.h> is missing
> arch/loongarch/kernel/kfpu.c: warning: EXPORT_SYMBOL() is used, but #incl=
ude <linux/export.h> is missing
> arch/loongarch/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #inc=
lude <linux/export.h> is missing
> arch/loongarch/kernel/unwind_guess.c: warning: EXPORT_SYMBOL() is used, b=
ut #include <linux/export.h> is missing
> arch/loongarch/kernel/unwind_orc.c: warning: EXPORT_SYMBOL() is used, but=
 #include <linux/export.h> is missing
> arch/loongarch/kernel/unwind_prologue.c: warning: EXPORT_SYMBOL() is used=
, but #include <linux/export.h> is missing
> arch/loongarch/lib/crc32-loongarch.c: warning: EXPORT_SYMBOL() is used, b=
ut #include <linux/export.h> is missing
> arch/loongarch/lib/csum.c: warning: EXPORT_SYMBOL() is used, but #include=
 <linux/export.h> is missing
> arch/loongarch/kernel/elf.c: warning: EXPORT_SYMBOL() is not used, but #i=
nclude <linux/export.h> is present
> arch/loongarch/kernel/paravirt.c: warning: EXPORT_SYMBOL() is not used, b=
ut #include <linux/export.h> is present
> arch/loongarch/pci/pci.c: warning: EXPORT_SYMBOL() is not used, but #incl=
ude <linux/export.h> is present
>
> So fix these build warnings for LoongArch.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/kernel/acpi.c            | 1 +
>  arch/loongarch/kernel/alternative.c     | 1 +
>  arch/loongarch/kernel/elf.c             | 1 -
>  arch/loongarch/kernel/kfpu.c            | 1 +
>  arch/loongarch/kernel/paravirt.c        | 1 -
>  arch/loongarch/kernel/traps.c           | 1 +
>  arch/loongarch/kernel/unwind_guess.c    | 1 +
>  arch/loongarch/kernel/unwind_orc.c      | 3 ++-
>  arch/loongarch/kernel/unwind_prologue.c | 1 +
>  arch/loongarch/lib/crc32-loongarch.c    | 1 +
>  arch/loongarch/lib/csum.c               | 1 +
>  arch/loongarch/pci/pci.c                | 1 -
>  12 files changed, 10 insertions(+), 4 deletions(-)

Thank you for your contribution.

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>



--=20
Best Regards
Masahiro Yamada

