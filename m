Return-Path: <linux-kbuild+bounces-10358-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FC1CE872B
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 01:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A6A1301141E
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 00:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD66F27FB21;
	Tue, 30 Dec 2025 00:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9GPUvyh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948EA2DCBEB
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Dec 2025 00:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055832; cv=none; b=fb6aPERc+xIYYiDiG8FR2aC4OG1WNns13fVpmM6XAXIDqDOHX05eoQo9awO0elvfYQ2yT7ZPTLIMNCD1rZXAehA0hzbEEDBg1Yvm2xbXAmX+oFBjmXl0ESTvkSFjiq3Gt7jmSTpn6xHwUTNS//QW5F7tbaqtno1S9s4UnQ0pzYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055832; c=relaxed/simple;
	bh=8HTj28uuZFMxzEEKfVTXaF6eYTrr+djzclMLdY33CsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVnNkqMyLUl9+OzLo3FnYQ4U6e/P+vCfStek2BUBd2Bl7yCA+MuHUkjNiXpvyQBnJk+6Y+TOkYkJQWlEXZxeraqiEzzPTgT4RSljkdTsUhoZPeZ1D9oxU/TrLNeL5ulowMoUKmFBUijWMUHb+7hdfKc2JDJN8uLVbzlukF3HpBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9GPUvyh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4327555464cso2006352f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Dec 2025 16:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767055829; x=1767660629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u5F/h588+teHhjrEaUKubm9KpGJAzuYhElAZ43Nr7U=;
        b=A9GPUvyhNhLa/gtCc/WeMz98AW7Wwu6WxaU9smLMWXeZKopx5lsw7qYMjJVb2+bfCF
         qIcPoSch1wvE0QVo7ifHpXsE+ZOl7WHc3cIKzGYWDsfffYEmHpo8OZBIStvdGaAVkfQn
         MO24vm7IS+grL2XjwVN/HXXsV4S1vZW7l1lV4Mkumds1/pk2ZCWc1IfCALgf8XXQrIz9
         cB5kRq/J61kEK7jp4ZcDn+Pk9cD3J/9hqxeqYZa8WT2JcfYZtqfFapCM0XFPSOq99hIJ
         8qUsgL1M0K8AJk55vQpyZwNV02CdjRUXxVPDR9aQgNBla78gsbmcyrrseumVQP8X7l8L
         DYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055829; x=1767660629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7u5F/h588+teHhjrEaUKubm9KpGJAzuYhElAZ43Nr7U=;
        b=RerFVaIMiDesw2AqKE/F92ktUBTfJ1tE6MJf8Dz5GQMGSJeO7TufIGlj8lVE+phT39
         Lq5nISTrjCF83WdcQE9THhV8vQ2LlJsB2cxUHB6CIYSxEQHvCKCTq2s+5ATWS1K7H0Cf
         nbJMN3euWUdfr7nhIgyGKNpGBCHRhfLU55+yjdCUbmf05M7dMRAsOVd6PrNnOHIQq1A6
         fyE8+T0RuKk+Bj/HZLccVj40xaDeEPeKpsISZF6kaM8PTey5AGrXYisxUvt32xLRQIbm
         4GHM6kr0L4696VikeCM7b/W/ofx+uf5Vnw2M0O00m/1I/xQ5UOgoe2VFHY0x+XBkJAQD
         J32Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk+uDfte1lbeB00Zt36bkEcmMkzRKisEsvNlbNX5rDZrh9+aFHjjZ580y9bZteNUFAwgbD2KFEZq/2neU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgZvuE4r7AM+vDm0cgyRF9P6CoG4hO76yDJifDPM1K7zzUoVde
	6czZbgdVj7GtvApK/aRmlWL+UynIeIQlHd8OH3AozkQsBJUgFQfBM/tysccqiRSUe0c4YVDQZBT
	VpIn49rBcqNpG9gQp3jjUXKx2p7IujGk=
X-Gm-Gg: AY/fxX70MFfB8aV6yIkTbIrNM1PPoQgn4IIUJOLfrT7aeRRrZ/m1LArTEwJ8+/d34s9
	QFGlbCT+eFqZMRuPg7MtZRegFNAQ9gp+7brCn6BzBkpqvM7t76LhlxiQ1uGcsLj9BRpk1x6boKb
	0UfW1PGUtTKrv/UNVIoA+iyuXR2h+sIYRaUXqUXJlOnmC0EvhLo1B4POcdUmvl7+/Yq/fuPHYa6
	glB3xO2bx9y9Tfq3hMtfXCYTKSryMaK8YmAF6HUfeQ0PWN5lAnsqesLg39rs+IyeIYSdT8zqW0/
	FgRlvgTtlBAS5j+SQMDgSHlbOWS4
X-Google-Smtp-Source: AGHT+IFfbljJEjZGZaAGma/kW2cY81yE6KzZkQrbO/d2ra2hmJAhD+ryGHCY6WopWTwemcaEQOy6bHLLV8D1VgAvhCQ=
X-Received: by 2002:a5d:5f85:0:b0:431:6ba:38bd with SMTP id
 ffacd0b85a97d-4324e4c715fmr42639014f8f.10.1767055828728; Mon, 29 Dec 2025
 16:50:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224005752.201911-1-ihor.solodrai@linux.dev>
 <9edd1395-8651-446b-b056-9428076cd830@linux.dev> <af906e9e-8f94-41f5-9100-1a3b4526e220@linux.dev>
 <20251229212938.GA2701672@ax162> <6b87701b-98fb-4089-a201-a7b402e338f9@linux.dev>
In-Reply-To: <6b87701b-98fb-4089-a201-a7b402e338f9@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 29 Dec 2025 16:50:17 -0800
X-Gm-Features: AQt7F2rm6FvvD5ZuZdGGJE9pNl2iGxXtYswxUDVcAyVM8QB1E7NaWycGUyO1_1U
Message-ID: <CAADnVQ+X-a92LEgcd-HjTJUcw2zR_jtUmD9U-Z6OtNnvpVwfiw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] module: Fix kernel panic when a symbol st_shndx is
 out of bounds
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>, linux-modules@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 4:39=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 12/29/25 1:29 PM, Nathan Chancellor wrote:
> > Hi Ihor,
> >
> > On Mon, Dec 29, 2025 at 12:40:10PM -0800, Ihor Solodrai wrote:
> >> I think the simplest workaround is this one: use objcopy from binutils
> >> instead of llvm-objcopy when doing --update-section.
> >>
> >> There are just 3 places where that happens, so the OBJCOPY
> >> substitution is going to be localized.
> >>
> >> Also binutils is a documented requirement for compiling the kernel,
> >> whether with clang or not [1].
> >>
> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/Documentation/process/changes.rst?h=3Dv6.18#n29
> >
> > This would necessitate always specifying a CROSS_COMPILE variable when
> > cross compiling with LLVM=3D1, which I would really like to avoid. The
> > LLVM variants have generally been drop in substitutes for several
> > versions now so some groups such as Android may not even have GNU
> > binutils installed in their build environment (see a recent build
> > fix [1]).
> >
> > I would much prefer detecting llvm-objcopy in Kconfig (such as by
> > creating CONFIG_OBJCOPY_IS_LLVM using the existing check for
> > llvm-objcopy in X86_X32_ABI in arch/x86/Kconfig) and requiring a workin=
g
> > copy (>=3D 22.0.0 presuming the fix is soon merged) or an explicit opt
> > into GNU objcopy via OBJCOPY=3D...objcopy for CONFIG_DEBUG_INFO_BTF to =
be
> > selectable.
>
> I like the idea of opt into GNU objcopy, however I think we should
> avoid requiring kbuilds that want CONFIG_DEBUG_INFO_BTF to change any
> configuration (such as adding an explicit OBJCOPY=3D in a build command).
>
> I drafted a patch (pasted below), introducing BTF_OBJCOPY which
> defaults to GNU objcopy. This implements the workaround, and should be
> easy to update with a LLVM version check later after the bug is fixed.
>
> This bit:
>
> @@ -391,6 +391,7 @@ config DEBUG_INFO_BTF
>         depends on PAHOLE_VERSION >=3D 122
>         # pahole uses elfutils, which does not have support for Hexagon r=
elocations
>         depends on !HEXAGON
> +       depends on $(success,command -v $(BTF_OBJCOPY))
>
> Will turn off DEBUG_INFO_BTF if relevant GNU objcopy happens to not be
> installed.
>
> However I am not sure this is the right way to fail here. Because if
> the kernel really does need BTF (which is effectively all kernels
> using BPF), then we are breaking them anyways just downstream of the
> build.
>
> An "objcopy: command not found" might make some pipelines red, but it
> is very clear how to address.
>
> Thoughts?
>
>
> From 7c3b9cce97cc76d0365d8948b1ca36c61faddde3 Mon Sep 17 00:00:00 2001
> From: Ihor Solodrai <ihor.solodrai@linux.dev>
> Date: Mon, 29 Dec 2025 15:49:51 -0800
> Subject: [PATCH] BTF_OBJCOPY
>
> ---
>  Makefile                             |  6 +++++-
>  lib/Kconfig.debug                    |  1 +
>  scripts/gen-btf.sh                   | 10 +++++-----
>  scripts/link-vmlinux.sh              |  2 +-
>  tools/testing/selftests/bpf/Makefile |  4 ++--
>  5 files changed, 14 insertions(+), 9 deletions(-)

All the makefile hackery looks like overkill and wrong direction.

What's wrong with kernel/module/main.c change?

Module loading already does a bunch of sanity checks for ELF
in elf_validity_cache_copy().

+ if (sym[i].st_shndx >=3D info->hdr->e_shnum)
is just one more.

Maybe it can be moved to elf_validity*() somewhere,
but that's a minor detail.

iiuc llvm-objcopy affects only bpf testmod, so not a general
issue that needs top level makefile changes.

