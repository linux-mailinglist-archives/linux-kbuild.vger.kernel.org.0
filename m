Return-Path: <linux-kbuild+bounces-5439-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49555A0A03E
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2025 03:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14AB87A478D
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2025 02:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E08405F7;
	Sat, 11 Jan 2025 02:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjUqCiOw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2DF2940D;
	Sat, 11 Jan 2025 02:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736561444; cv=none; b=FPaEoYOvuydGt9MueXt5+9I7O65V1XbOZxyXVfMFCWP0PAxZjfYREkZoB0u0gm4SeeuskcAiYmP7vgltL95WBd9cPc5rmMSrLaxkAmVatl71N5pwdecAMCHRmmZpuqlJ6+APfhKtcrg1ylPMW2pBO9u538R7rgAkSTxdEr3fEU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736561444; c=relaxed/simple;
	bh=mGzRH7uIpM9oP6ps1cDHZR6Jg8yLX1jT4/DSoE7sAso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qN5agEm+eMUIgc85C3TJ6To7EuI/0rf2kKk0tplowYnSJ7xZGk//38QzKNqR04QoPEN8B9uT+Jpt3TLSqDcQkFGxdFDi16D+oq3HFdkp7NTg58doFhv+/OwSw6SiRfUom1Knzk8EUFutJ/151HdZh5WxoONd+u4d+3FKLzOmZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjUqCiOw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB28BC4CED6;
	Sat, 11 Jan 2025 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736561443;
	bh=mGzRH7uIpM9oP6ps1cDHZR6Jg8yLX1jT4/DSoE7sAso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FjUqCiOwMLrWHtelAuzN5edLInpMxwfO8lBENFEYRkTIdscXCLE4yA0F8EEhz9Gzr
	 jrw7NwvuocqB7MlRrzoAePOIbvm0nWGYoS4qOtIQjyXqDoxZVDCEycgQWvhZh7EfhN
	 PGY7lzhR+ZhnGbUWLsR3CtQia/7NKRU0d8WvicGqiplFaah5eSHheIa+6q2Pc6oLiN
	 bYfY4QfNUgDyu1fGqflpenkKev0WuBxfJjuxTVUMlx3eyV9Px3QOU8qvKYvLzp9Ex9
	 qdWoEaUpyPCZO15221CgT4TM4iu2hPZPT1IkGInT/mPKHhiHvvMsL3ncVoCUJ5D3pA
	 +AJd85N0uJNbA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so2706618e87.2;
        Fri, 10 Jan 2025 18:10:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8Yw5yK/1D78g84K73SmtrtsZVueDjg7Vc4ZRw7yUJ6Qu88hj6MSjrv77Pa+6l1qSPClHLTseNSJNi4cg=@vger.kernel.org, AJvYcCXt3VaU7PJOuYwd4pePyTbdIy8ohIMf9IdtZquIBX291WmfCWEX5wumlSs8AqMPUSYvg4ASwL5jfSXpTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzxKHYrcniQqHiUfRsK81jmc5+/UpIC/57j2t1yfA8ATxKpM0V
	QzF9JogfSWEu90qGyBkzEvfeEyM8BmiqlUO2f+wiIBVfLRc6V+S3ded049eqn6oX3IqrrdGSVSp
	0HUaqgq8sARrECE8Ldg3cyaVnN2w=
X-Google-Smtp-Source: AGHT+IFl9WseL/aarJcF6pbUOedSlHG3Cs8TbNE6IpIW0JRKQJ0ZyIW3pWCvnyTLYTj5smM1UXAocMZOhlZBTqLlzZE=
X-Received: by 2002:a05:6512:b98:b0:53e:94f9:8c86 with SMTP id
 2adb3069b0e04-542848162f1mr4040192e87.35.1736561442586; Fri, 10 Jan 2025
 18:10:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com>
In-Reply-To: <20250110082744.457067-2-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 11:10:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtpahFZ+pEWO=XfQMi+19QjspqyL3qexW8U28f7mbojQ@mail.gmail.com>
X-Gm-Features: AbW1kvbrxKRMFTdoeyMM3FkNPmqQKbq6uIxbYC1TBxHZgLOZPTYpsCuRzyt1JLs
Message-ID: <CAK7LNAQtpahFZ+pEWO=XfQMi+19QjspqyL3qexW8U28f7mbojQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 5:28=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them. This results
> in a situation like below, where some sections that were supposed to get
> removed are left behind.
>
>   [Nr] Name                              Type            Address         =
 Off     Size   ES Flg Lk Inf Al
>
>   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50=
 2900f50 000014 00   A  0   0  1
>   [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000=
 55b6f00 000078 18   I 70  58  8
>   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68=
 2900f68 000014 00   A  0   0  1
>   [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000=
 55b6f78 000078 18   I 70  60  8
>   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80=
 2900f80 000238 00   A  0   0  1
>   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000=
 55b6ff0 000d50 18   I 70  62  8
>
> So tweak the match expression to strip all sections starting with .rel.
> While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> single shared Makefile library command.
>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Link: https://lore.kernel.org/all/CAHk-=3Dwjk3ynjomNvFN8jf9A1k=3DqSc=3DJF=
F591W00uXj-qqNUxPQ@mail.gmail.com/
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/Makefile.postlink | 9 +--------
>  arch/s390/Makefile.postlink  | 5 -----
>  arch/x86/Makefile.postlink   | 5 -----
>  scripts/Makefile.lib         | 3 +++
>  4 files changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> index 829b9abc91f6..65652fd6a252 100644
> --- a/arch/riscv/Makefile.postlink
> +++ b/arch/riscv/Makefile.postlink
> @@ -19,13 +19,6 @@ ifdef CONFIG_RELOCATABLE
>  quiet_cmd_cp_vmlinux_relocs =3D CPREL   vmlinux.relocs
>  cmd_cp_vmlinux_relocs =3D cp vmlinux vmlinux.relocs
>
> -quiet_cmd_relocs_strip =3D STRIPREL $@
> -cmd_relocs_strip =3D $(OBJCOPY)   --remove-section=3D'.rel.*'       \
> -                                --remove-section=3D'.rel__*'      \
> -                                --remove-section=3D'.rela.*'      \
> -                                --remove-section=3D'.rela__*' $@
> -endif
> -
>  # `@true` prevents complaint when there is nothing to be done
>
>  vmlinux: FORCE
> @@ -33,7 +26,7 @@ vmlinux: FORCE
>  ifdef CONFIG_RELOCATABLE
>         $(call if_changed,relocs_check)
>         $(call if_changed,cp_vmlinux_relocs)
> -       $(call if_changed,relocs_strip)
> +       $(call if_changed,strip_relocs)

BTW, when if_changed appears multiple times in the same target,
it is always a sign of a bug.

See these commits:

bb81955fd4a49fffdd86d50afd0c1f2eea044c05
92a4728608a8fd228c572bc8ff50dd98aa0ddf2a


Anyway, if_changed does not work in arch/*/Makefile.postlink,
and this is completely broken.








--=20
Best Regards
Masahiro Yamada

