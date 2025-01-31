Return-Path: <linux-kbuild+bounces-5583-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17AA242CF
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 19:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5881884798
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 18:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0F41F03ED;
	Fri, 31 Jan 2025 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Je+OZp+s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE90C7081F;
	Fri, 31 Jan 2025 18:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738348543; cv=none; b=FASHWEOwHQMIeJdEjzcLTQRsjtOn8KSfa4kxzuCzPHMdDWaRL+UStuM5LqrZR7jK7QZEYlwj9ZEkFSozd44jxlSVoGMa7qhcfLEHjfgju0oao1sI1VsBnh+yZGhz8KE1iKME/d/xD52smXPPBLBqBvRpQFZA1EOPCGa51A8MZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738348543; c=relaxed/simple;
	bh=EaMcjhb4HCyABF3C5By3MXJbUDe+AyJi93ipbLgmkSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bT38FY9AHfMwhKdD/3NvXxH24bzXkHpae3KNaCX8LBjAQK4HZmcpgU6iWQCpzkQCj4pPKWJ3B2DiHd/Y9UQIogQV9JFJIN4Ay7Df5tyeZTPm2Vei3ir3wZRucF2sl1pS63CIwt0pVhCy/5OkAo//guQurqLxx2V2H8Y3rAJ6f/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Je+OZp+s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398C2C4CED3;
	Fri, 31 Jan 2025 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738348542;
	bh=EaMcjhb4HCyABF3C5By3MXJbUDe+AyJi93ipbLgmkSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Je+OZp+sMzZ8y8eJXBCGnqLSG3d7RO0OYZcVR/+Y6NMTcnvthl70g+5BmF80QBAY3
	 ICTten8cPB0EQ8mggyhvGjsUwZOdGpDit5rzhBV+Y0gShH3F/VsxzAw1WBOuddrD5J
	 68plw8Iyr/8u2la3flX78eJSYqw2/ANiI1/e0AwhCclp7ypgf7A1D89AumEmdm71lp
	 FGn0FS3sMNCaMZ10cIbYCAealI+d7gN1AO7qYaZK4fjt5l45CN3OqRDlrERk/fsSCN
	 F5RWpt0R91SRxGTkLqbLrXUgeSQ7fT0+6UMTHuChbP2uKCkXL8QUxtjkrMKYO9Lie0
	 2zzsnvUI2Pmuw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30762598511so23474691fa.0;
        Fri, 31 Jan 2025 10:35:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9VMqCQMPCki9EZ6tRnJPTXLThaepGVSjOcaFlrUjVsFCeC8EZoEq7dncSMLP3VD0VVlYAbMi/XZDciiU=@vger.kernel.org, AJvYcCVOi7rV/iuauBd9UJY4kCAPcuRUGBFPh682VnEXbaltYLFcM738JAMHGamY1ieC9TLoBdcGZ81vdvFMFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypIORFwOOb03CThEn8UnxBsRBY8pHYMIw5GZ1xWualMufmcDb1
	o0aV7NZglzg3mDVXCmnSC7aHokCAuYK2RIgYySMFKBBgncswKl4fhCrFBX50GVEf6QS3pffzx6w
	3EIDOgzrtw/eEkfdO/mbeG+XF2R4=
X-Google-Smtp-Source: AGHT+IF/PkjaeYBFmgnvEk7vgpn8JvoIm/XXwf59wvtHOUK2C9lacjjTkP+Om+I3FP91kPVHYBT64zI31JRRVCpFHYs=
X-Received: by 2002:a2e:a548:0:b0:307:2bc6:5eb9 with SMTP id
 38308e7fff4ca-307968c0568mr47983691fa.4.1738348540790; Fri, 31 Jan 2025
 10:35:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com>
In-Reply-To: <20250113155306.1922992-2-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 03:35:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
X-Gm-Features: AWEUYZk_UMjgJBjWnjAjhexeeD2YPTkmaB1_Gb4gNChcZ5GhchP6_vEDlKvItsE
Message-ID: <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:53=E2=80=AFAM Ard Biesheuvel <ardb+git@google.co=
m> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them.


Dumb question - why can't you rename the section 'runtime*' to '.runtime*' =
?

.rel* matches to sections that just happen to start with '.rel',
which may not be REL or RELA.





> This results
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
> Cc: Ron Economos <re@w6rz.net>
> Link: https://lore.kernel.org/all/CAHk-=3Dwjk3ynjomNvFN8jf9A1k=3DqSc=3DJF=
F591W00uXj-qqNUxPQ@mail.gmail.com/
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v3: put back missing 'endif' to fix the RISC-V build
> v2: add missing include of scripts/Makefile.lib
>
>  arch/riscv/Makefile.postlink |  8 ++------
>  arch/s390/Makefile.postlink  |  6 +-----
>  arch/x86/Makefile.postlink   |  6 +-----
>  scripts/Makefile.lib         |  3 +++
>  4 files changed, 7 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> index 829b9abc91f6..750d2784f69e 100644
> --- a/arch/riscv/Makefile.postlink
> +++ b/arch/riscv/Makefile.postlink
> @@ -10,6 +10,7 @@ __archpost:
>
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>
>  quiet_cmd_relocs_check =3D CHKREL  $@
>  cmd_relocs_check =3D                                                    =
 \
> @@ -19,11 +20,6 @@ ifdef CONFIG_RELOCATABLE
>  quiet_cmd_cp_vmlinux_relocs =3D CPREL   vmlinux.relocs
>  cmd_cp_vmlinux_relocs =3D cp vmlinux vmlinux.relocs
>
> -quiet_cmd_relocs_strip =3D STRIPREL $@
> -cmd_relocs_strip =3D $(OBJCOPY)   --remove-section=3D'.rel.*'       \
> -                                --remove-section=3D'.rel__*'      \
> -                                --remove-section=3D'.rela.*'      \
> -                                --remove-section=3D'.rela__*' $@
>  endif
>
>  # `@true` prevents complaint when there is nothing to be done
> @@ -33,7 +27,7 @@ vmlinux: FORCE
>  ifdef CONFIG_RELOCATABLE
>         $(call if_changed,relocs_check)
>         $(call if_changed,cp_vmlinux_relocs)
> -       $(call if_changed,relocs_strip)
> +       $(call if_changed,strip_relocs)
>  endif
>
>  clean:
> diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
> index df82f5410769..1ae5478cd6ac 100644
> --- a/arch/s390/Makefile.postlink
> +++ b/arch/s390/Makefile.postlink
> @@ -11,6 +11,7 @@ __archpost:
>
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>
>  CMD_RELOCS=3Darch/s390/tools/relocs
>  OUT_RELOCS =3D arch/s390/boot
> @@ -19,11 +20,6 @@ quiet_cmd_relocs =3D RELOCS  $(OUT_RELOCS)/relocs.S
>         mkdir -p $(OUT_RELOCS); \
>         $(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
>
> -quiet_cmd_strip_relocs =3D RSTRIP  $@
> -      cmd_strip_relocs =3D \
> -       $(OBJCOPY) --remove-section=3D'.rel.*' --remove-section=3D'.rel__=
*' \
> -                  --remove-section=3D'.rela.*' --remove-section=3D'.rela=
__*' $@
> -
>  vmlinux: FORCE
>         $(call cmd,relocs)
>         $(call cmd,strip_relocs)
> diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> index fef2e977cc7d..8b8a68162c94 100644
> --- a/arch/x86/Makefile.postlink
> +++ b/arch/x86/Makefile.postlink
> @@ -11,6 +11,7 @@ __archpost:
>
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>
>  CMD_RELOCS =3D arch/x86/tools/relocs
>  OUT_RELOCS =3D arch/x86/boot/compressed
> @@ -20,11 +21,6 @@ quiet_cmd_relocs =3D RELOCS  $(OUT_RELOCS)/$@.relocs
>         $(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
>         $(CMD_RELOCS) --abs-relocs $@
>
> -quiet_cmd_strip_relocs =3D RSTRIP  $@
> -      cmd_strip_relocs =3D \
> -       $(OBJCOPY) --remove-section=3D'.rel.*' --remove-section=3D'.rel__=
*' \
> -                  --remove-section=3D'.rela.*' --remove-section=3D'.rela=
__*' $@
> -
>  # `@true` prevents complaint when there is nothing to be done
>
>  vmlinux: FORCE
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 7395200538da..f604f51d23ca 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -374,6 +374,9 @@ quiet_cmd_ar =3D AR      $@
>  quiet_cmd_objcopy =3D OBJCOPY $@
>  cmd_objcopy =3D $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>
> +quiet_cmd_strip_relocs =3D RSTRIP  $@
> +cmd_strip_relocs =3D $(OBJCOPY) --remove-section=3D'.rel*' $@
> +
>  # Gzip
>  # ----------------------------------------------------------------------=
-----
>
> --
> 2.47.1.688.g23fc6f90ad-goog
>


--=20
Best Regards
Masahiro Yamada

