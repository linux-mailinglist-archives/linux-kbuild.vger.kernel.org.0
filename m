Return-Path: <linux-kbuild+bounces-4875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9839D9BC2
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 17:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC64286DB4
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 16:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F61F1D7995;
	Tue, 26 Nov 2024 16:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8NHYhSs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4B137E;
	Tue, 26 Nov 2024 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732639579; cv=none; b=atvznJDSsKCnQ9PIzeoBMc4x70YcZh+O3NDnGXcNBFfPK5e6mnZh/ORTDLzs7dk77iKkGhuN1PydTiIG6Zx/i7OL06xGfU0HqUVEDDojODnfrx4bEVDHLwu6LoC0jZ2YfwyJs1SBcSTlZr1D2lPP+2c+zCGhIVg/m7bjFTnKCDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732639579; c=relaxed/simple;
	bh=yMANaMcesapzJvjCjzbtaXzLfhNw5im5CXYaJ5o+Nbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTy50Oob2mjPUAGJph+RKnMAaPUTGPh4uD9o7peeHKaGOer0N887h9Yu0zgQK3nwUKN3UfL6pyrbiuZ7ifliP/AGZHYY8F7/ZveeNw6R6soYjRtLdbBiek9jx5vfaACrLIdAMsg+ZVhWdUxnnoORIOrlbKTe9tXa2j2IkaCYzpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8NHYhSs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67A8C4CED3;
	Tue, 26 Nov 2024 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732639578;
	bh=yMANaMcesapzJvjCjzbtaXzLfhNw5im5CXYaJ5o+Nbc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h8NHYhSs5KtwyY1Kxj/8MWlOY/MkCKyV42RDAx5yzE0VJdHEeqY1LNcvC3vEeoFCl
	 iJfBPbgw/I6Z2JCOy5/vAP2xuDZm0ab965iMcR5maY9qtefVdhCuB1MO2fdq7Otoz+
	 gpdkN+gkL3sOsAfQslu6VmOtSInmyYPjS+5OfFI70QYu8WulX2R3Uxhy8EEkbEnc6b
	 0tc3QnZjIez1/I9E5H8obTiCoWaRQ302KlUx9BOWk2fwILwdrSEaueDdc4z27sAFqj
	 KfO025j715ObWz4NYDPSPpdTab3occyf6+2ihZLLCVj7r6QSncW48Vy4INmVaqL2sc
	 iVvLSwPvgO6GQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53def60f809so310510e87.1;
        Tue, 26 Nov 2024 08:46:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMdbK7rtIEsHsCqNZ8KPAsb1VrBcMWBdhGl8jjuj7jW83+yDBa8k2P5tgO3mjB1dj2ldzQy7tpDtW0wOA/@vger.kernel.org, AJvYcCWkE+ib4g2Os2DHomiyHYUSuaelU9enisTDNSIeCXMBWbJZPW20eCm0PjOj7+Tz9fxvi9Hin82rnTdJHBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypms172SxE4T/Sw6vuGLpqYbS4H4/SsxlEEeozYwbyAuy53ERe
	VIKsFvnzbaBiA8MdwJeIWci7NtUPd/7H9SX21lZIQrH+TI+uVEHlxoa1xwkLZnksFkWOGryDdCM
	K4+fDG4OOm/Q2wJM7/KAncKtqfVE=
X-Google-Smtp-Source: AGHT+IEP04EDSIK8jQTaVnyziNcXnwJjciZJI+DZnFe7XClLGfTVlqr6Jitbjf5/Jkyre/2NceDR1wHtgUrvSCQrk4U=
X-Received: by 2002:a05:6512:b12:b0:53d:a2a6:ef67 with SMTP id
 2adb3069b0e04-53dd39b5620mr8250403e87.49.1732639577337; Tue, 26 Nov 2024
 08:46:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126155832.15560-1-sedat.dilek@gmail.com>
In-Reply-To: <20241126155832.15560-1-sedat.dilek@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 27 Nov 2024 01:45:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQh1VqXmw=zTJaAbDum0G0CweDHzQZ-eJgfBR6ZinnC6Q@mail.gmail.com>
Message-ID: <CAK7LNAQh1VqXmw=zTJaAbDum0G0CweDHzQZ-eJgfBR6ZinnC6Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Fix names of .tmp_vmlinux {kall,}syms files
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 12:58=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com=
> wrote:
>
> When playing with gendwarfksyms v6 from Sami Tolvanen I noticed:

The gendwarfksyms is unrelated.

>
> $ LC_ALL=3DC ls -alth .tmp_vmlinux*
>
> -rw-rw-r-- 1 dileks dileks 3.1M Nov 22 20:52 .tmp_vmlinux2.kallsyms.o
> -rw-rw-r-- 1 dileks dileks  34M Nov 22 20:52 .tmp_vmlinux2.kallsyms.S
> -rw-rw-r-- 1 dileks dileks 6.5M Nov 22 20:52 .tmp_vmlinux2.syms
> -rwxrwxr-x 1 dileks dileks 101M Nov 22 20:52 .tmp_vmlinux2
>
> -rw-rw-r-- 1 dileks dileks 3.1M Nov 22 20:52 .tmp_vmlinux1.kallsyms.o
> -rw-rw-r-- 1 dileks dileks  34M Nov 22 20:52 .tmp_vmlinux1.kallsyms.S
> -rw-rw-r-- 1 dileks dileks 6.5M Nov 22 20:52 .tmp_vmlinux1.syms
> -rwxrwxr-x 1 dileks dileks  52M Nov 22 20:52 .tmp_vmlinux1.btf.o
> -rwxrwxr-x 1 dileks dileks 514M Nov 22 20:52 .tmp_vmlinux1
>
> -rw-rw-r-- 1 dileks dileks 2.1K Nov 22 20:51 .tmp_vmlinux0.kallsyms.o
> -rw-rw-r-- 1 dileks dileks 6.3K Nov 22 20:51 .tmp_vmlinux0.kallsyms.S
> -rw-rw-r-- 1 dileks dileks    0 Nov 22 20:51 .tmp_vmlinux.kallsyms0.syms
>
> .tmp_vmlinux.kallsyms0.syms is NULL byte - it's a dummy file.
>
> Further looking at the other .tmp_vmlinux syms files:
>
> .tmp_vmlinux2.syms
> .tmp_vmlinux1.syms
> .tmp_vmlinux.kallsyms0.syms
>
> Change the naming of file
>
> .tmp_vmlinux.kallsyms0.syms -> .tmp_vmlinux0.syms
>
> While at this, fix the comments in scripts/link-vmlinux.sh.
>
> INFO: v2 is based on Linux v6.12
>
> Link: https://github.com/samitolvanen/linux/commits/gendwarfksyms-v6
> Link: https://lore.kernel.org/all/CA+icZUXvu0Kw8RH1ZGBKgYGG-8u9x8BbsEkjtm=
4vSVKkXPTg+Q@mail.gmail.com/
> Link: https://lore.kernel.org/all/20241123132237.15700-1-sedat.dilek@gmai=
l.com/ (v1)




I removed unnecessary information.

I left only the following description.

------------>8------------------
kbuild: rename .tmp_vmlinux.kallsyms0.syms to .tmp_vmlinux0.syms

Change the naming for consistency.

While at this, fix the comments in scripts/link-vmlinux.sh.
------------>8------------------


Applied to linux-kbuild.
Thanks.



> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> ---
> v1 -> v2:
> - Add commit description and follow naming consistency
>   as requested by Masahiroy san. -dileks
>
>  scripts/link-vmlinux.sh | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index a9b3f34a78d2..239fe036606f 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -203,8 +203,8 @@ kallsymso=3D
>  strip_debug=3D
>
>  if is_enabled CONFIG_KALLSYMS; then
> -       true > .tmp_vmlinux.kallsyms0.syms
> -       kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
> +       true > .tmp_vmlinux0.syms
> +       kallsyms .tmp_vmlinux0.syms .tmp_vmlinux0.kallsyms
>  fi
>
>  if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
> @@ -231,14 +231,14 @@ if is_enabled CONFIG_KALLSYMS; then
>         # Generate section listing all symbols and add it into vmlinux
>         # It's a four step process:
>         # 0)  Generate a dummy __kallsyms with empty symbol list.
> -       # 1)  Link .tmp_vmlinux.kallsyms1 so it has all symbols and secti=
ons,
> +       # 1)  Link .tmp_vmlinux1.kallsyms so it has all symbols and secti=
ons,
>         #     with a dummy __kallsyms.
> -       #     Running kallsyms on that gives us .tmp_kallsyms1.o with
> +       #     Running kallsyms on that gives us .tmp_vmlinux1.kallsyms.o =
with
>         #     the right size
> -       # 2)  Link .tmp_vmlinux.kallsyms2 so it now has a __kallsyms sect=
ion of
> +       # 2)  Link .tmp_vmlinux2.kallsyms so it now has a __kallsyms sect=
ion of
>         #     the right size, but due to the added section, some
>         #     addresses have shifted.
> -       #     From here, we generate a correct .tmp_vmlinux.kallsyms2.o
> +       #     From here, we generate a correct .tmp_vmlinux2.kallsyms.o
>         # 3)  That link may have expanded the kernel image enough that
>         #     more linker branch stubs / trampolines had to be added, whi=
ch
>         #     introduces new names, which further expands kallsyms. Do an=
other
> --
> 2.45.2
>
>


--
Best Regards
Masahiro Yamada

