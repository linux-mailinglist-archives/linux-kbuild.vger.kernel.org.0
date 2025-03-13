Return-Path: <linux-kbuild+bounces-6113-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BEDA5E9A0
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 03:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C7211897739
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 02:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA15F1C683;
	Thu, 13 Mar 2025 02:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pakt/yVy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4154D8C8;
	Thu, 13 Mar 2025 02:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741831745; cv=none; b=ZLyAOwZI8iqyvWRmBsfFxYh9AkHpIkGqsjqMEeXtbzxJEwHWmE5YNt25pCBm5nKsd93byi0/hlWWlqJopr0/S5Ox1oFi/0QkNDB3XGh4bVsDI7HWUycSqoes4onGlpN+3SArbNZGgqnNwOy85KSI1t6AxUl+hEQ8cSNnyhC3ugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741831745; c=relaxed/simple;
	bh=GngvFBixUC4blVwet87fsiyD246acHkjhZlmbgI45iY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8TsOkgYDKjjXAWi+0rAWzqHonEc/SQaXgDIpYtBMaH6xerRSm6rqxnhhhvNu0Hs6QBavk+gvaW0AQFHpYy1ta6PG6ahDjxVw8/Fo8zm3yv35ryytufwOHvNg3KE9gpt7gk1Jjcp/MsQ8c1IinBUEK8nyUesiO5WsguSerCvfSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pakt/yVy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16BBC4CEDD;
	Thu, 13 Mar 2025 02:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741831745;
	bh=GngvFBixUC4blVwet87fsiyD246acHkjhZlmbgI45iY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pakt/yVyOntTMO64+noyo0RfpzkTor1fq/f1K2nuE2gnj3T1nIS+2lGwhyf/6eX94
	 JRGhmAU4k2zY5c8yga4lIfbpi7agWosgVbwxv5nSF704AUw2KDkevMVt3AnBVNbxHV
	 eMRmu9Ly9xYM07MTwUhuPv31BZH0FMhKGHNdSIPGk467StAi1Bp5/CB93O6KsdSdC9
	 p3OOxTiU6SyiB/ivg9FJCIMnDXzfl1zzQaCtBCLO7glpW2lAqPMqYLaFnZCnmie0xW
	 vJvfBCpQ0tDndS/M5tmbDipfWviqXKeOzTe+h1oEFQw5/but1eweSslC2dqmo0tbzq
	 Ds4y1gUwDHbIw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54996d30bfbso383273e87.2;
        Wed, 12 Mar 2025 19:09:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfs83MwdoEcJcZ5Ym0oL3zu9znUlZB0zGTPwftQSesmr/2SZmnl0W/y/BOgnCDuThrujY8efJ80STh7dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIx2qjbcLD4Skh5/c3X3djwsIPlrC91RC1ei2rdSWthc2UsnVP
	mGA7fd5PZpi3xaAvVVtEExRKwGKLjt+WTNOKNDF/pkg6J7Qxo9OxdZ3/GTIvjuxZHVq8W6CoNMj
	5EPuQB6dqqGIK+yl2KP3jqJ1/t0A=
X-Google-Smtp-Source: AGHT+IFnp+hSv28hh0jo5RO6feHO0dn8GCX7fME6ezbp/fN64DK7Ijlw7+v6mzJ9xFU+XXy/l/7Fn+eJUdqbeCvZLvE=
X-Received: by 2002:a05:6512:a93:b0:545:2fa9:8cf5 with SMTP id
 2adb3069b0e04-549910b7c6fmr10035130e87.49.1741831743668; Wed, 12 Mar 2025
 19:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110616.148682-6-ardb+git@google.com> <20250311110616.148682-10-ardb+git@google.com>
In-Reply-To: <20250311110616.148682-10-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Mar 2025 11:08:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASxNhDnCmpuf7yEW4Lcz-vRtitx8HPeoZnGNWdb-6pEsA@mail.gmail.com>
X-Gm-Features: AQ5f1JoS42g00b7qlbesqtGBrGFfhZQ6QifIEYnappwB45I2PgST6Tm8BEsgSzI
Message-ID: <CAK7LNASxNhDnCmpuf7yEW4Lcz-vRtitx8HPeoZnGNWdb-6pEsA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] x86: Get rid of Makefile.postlink
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 8:06=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Instead of generating the vmlinux.relocs file (needed by the
> decompressor build to construct the KASLR relocation tables) as a
> vmlinux postlink step, which is dubious because it depends on data that
> is stripped from vmlinux before the build completes, generate it from
> vmlinux.unstripped, which has been introduced specifically for this
> purpose.
>
> This ensures that each artifact is rebuilt as needed, rather than as a
> side effect of another build rule.
>
> This effectively reverts commit
>
>   9d9173e9ceb6 ("x86/build: Avoid relocation information in final vmlinux=
")
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/Makefile.postlink        | 38 --------------------
>  arch/x86/boot/compressed/Makefile |  9 +++--
>  2 files changed, 6 insertions(+), 41 deletions(-)
>
> diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> deleted file mode 100644
> index 445fce66630f..000000000000
> --- a/arch/x86/Makefile.postlink
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> -# Post-link x86 pass
> -# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> -#
> -# 1. Separate relocations from vmlinux into vmlinux.relocs.
> -# 2. Strip relocations from vmlinux.
> -
> -PHONY :=3D __archpost
> -__archpost:
> -
> --include include/config/auto.conf
> -include $(srctree)/scripts/Kbuild.include
> -
> -CMD_RELOCS =3D arch/x86/tools/relocs
> -OUT_RELOCS =3D arch/x86/boot/compressed
> -quiet_cmd_relocs =3D RELOCS  $(OUT_RELOCS)/vmlinux.relocs
> -      cmd_relocs =3D \
> -       mkdir -p $(OUT_RELOCS); \
> -       $(CMD_RELOCS) $@ > $(OUT_RELOCS)/vmlinux.relocs; \
> -       $(CMD_RELOCS) --abs-relocs $@
> -
> -# `@true` prevents complaint when there is nothing to be done
> -
> -vmlinux vmlinux.unstripped: FORCE
> -       @true
> -ifeq ($(CONFIG_X86_NEED_RELOCS),y)
> -       $(call cmd,relocs)
> -endif
> -
> -clean:
> -       @rm -f $(OUT_RELOCS)/vmlinux.relocs
> -
> -PHONY +=3D FORCE clean
> -
> -FORCE:
> -
> -.PHONY: $(PHONY)
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed=
/Makefile
> index 606c74f27459..5edee7a9786c 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -117,9 +117,12 @@ $(obj)/vmlinux.bin: vmlinux FORCE
>
>  targets +=3D $(patsubst $(obj)/%,%,$(vmlinux-objs-y)) vmlinux.bin.all vm=
linux.relocs
>
> -# vmlinux.relocs is created by the vmlinux postlink step.
> -$(obj)/vmlinux.relocs: vmlinux
> -       @true
> +CMD_RELOCS =3D arch/x86/tools/relocs
> +quiet_cmd_relocs =3D RELOCS  $@
> +      cmd_relocs =3D $(CMD_RELOCS) $< > $@;$(CMD_RELOCS) --abs-relocs $<
> +
> +$(obj)/vmlinux.relocs: vmlinux.unstripped FORCE
> +       $(call if_changed,relocs)

Perhaps, it may make sense to rebuild vmlinux.relocs
when arch/x86/tools/relocs is changed, but
I do not see such dependency in the other
arch/x86/realmode/rm/Makefile.

https://github.com/torvalds/linux/blob/v6.14-rc5/arch/x86/realmode/rm/Makef=
ile#L61


So, I decided it is ok.
If you mind, you can send v3.



--=20
Best Regards
Masahiro Yamada

