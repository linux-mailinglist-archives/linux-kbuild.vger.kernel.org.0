Return-Path: <linux-kbuild+bounces-6288-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C52CA6CA80
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 15:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D09FF8816D6
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 14:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862842288D2;
	Sat, 22 Mar 2025 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hduwZF69"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21A21C9ED;
	Sat, 22 Mar 2025 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742652860; cv=none; b=Toz3Nj9VtWTXrroapIEAkU4J6xcNoQhkz7645cDTNgdKL9Img/Y+SIacKKqKKKVVbJrlbqGngN7rR0pLxoSXjx1moKCL2azJ/8HM578FbXV7agV5KAzyghktiathziTZuTbSHMEwp/HPjbuYz1BAtOgrHoNoK9SFPmK4gShclJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742652860; c=relaxed/simple;
	bh=2/I+ifHCeyc3ztAOzHg2b1CVHMxoWNOt777MV8FaN9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjKwLdyHEDM27HQHbski81PKhZm9nwLi5wcvfOx3PFX2kReeb4wHCVUEOVM+qSL18K0ZqcMi6VXcMMD0v4lhlVXv5DBXxLvoP3asFkxWiAleM+c3XRDsXxjVEgeYl5ml7W3l5PQVqmUtxjkHOToGA+PVEQNDSvQ0BROIY7ePACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hduwZF69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DEEC4CEE4;
	Sat, 22 Mar 2025 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742652857;
	bh=2/I+ifHCeyc3ztAOzHg2b1CVHMxoWNOt777MV8FaN9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hduwZF69Z4xVDrg7+YA7fBvHjKj0+rMSvTjUfph/YkwUDhZhb7X+8OPMkrjPTzyIj
	 KUpmIGFr7EhcG1qy1cDWAhzkYZVqGZFkXI8PKR07QbFktXNbtMuBrSgSGivuKChntn
	 QXM8eJfZpsCtqtV1i/cAaCsOZRv5Fz5p6Nm+44WjU0K4Elm04RAb2MnheQnnF6Bjnd
	 RVajOd1jg/Dya3kjHxuEjUUcvPt0PqI3TQK377lX8x7oFKUACbIV8pqZBmz7zwTsWs
	 /1BprP1QPtJtE3JaKaL/0DymhBgomF2glTb4JNLrqt2M+72RWLVxZTbVKeBc8wK+SU
	 +xZkFTVWWhgqA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf8f5dde5so27506101fa.2;
        Sat, 22 Mar 2025 07:14:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAUj+CIRwkK6KetFr+rJf8WZCvQkSeccQx73vwKeD1Bov9BjJLTtcQ7hJma7dz6TkVFHJhVL5h7PTJYKhC@vger.kernel.org, AJvYcCUqjusJ6KTyPenLtlq3GTEHKVum77PDXgRyicq224VTWvsmuzt75pZ7Fm8hTMo0KOwAOvnniu+v8rH9lU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUWrtwXsCfa5O17lqu+MwuN2C3Mdtusa7HRCkGFaDECmSwLoR
	Pd7UHj/99k1YsybW1TR9QmQHlUZsS5wznSbo9kihSDwQ2BRla7ursRhHV/wRGClOs6v+DUMASbv
	1OaUIWGx7IL6sUNaQJK/a/NTbnQQ=
X-Google-Smtp-Source: AGHT+IH3iqMuFs4UxlHOoFjkohsH4uQNVhrAcTEMU1dyt6W6OYuxer+kS649OEw/sGqqcKAL2f6BdyspafqX6uxjSMY=
X-Received: by 2002:a05:651c:230a:b0:30c:12b8:fb9e with SMTP id
 38308e7fff4ca-30d7e2bba45mr26606251fa.37.1742652856024; Sat, 22 Mar 2025
 07:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322-asm-prefix-map-v1-1-ffe92c80b4d4@weissschuh.net>
In-Reply-To: <20250322-asm-prefix-map-v1-1-ffe92c80b4d4@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 22 Mar 2025 23:13:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNATEn2n9Brt6oKnywuUh_Hyu8xhsW04fdp=3yevpwXY5=g@mail.gmail.com>
X-Gm-Features: AQ5f1JonEy20HAVwcDGt7y6RxrxjDzNWOSyzEyvjL0qfYM5VxA13hRUgXnLyQ-g
Message-ID: <CAK7LNATEn2n9Brt6oKnywuUh_Hyu8xhsW04fdp=3yevpwXY5=g@mail.gmail.com>
Subject: Re: [PATCH] kbuild, x86: drop unnecessary prefix map configuration
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 6:03=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> The toplevel Makefile already provides -ffile-prefix-map as part of

I replaced -ffile-prefix-map with -fmacro-prefix-map

> KBUILD_CPPFLAGS. In contrast to the KBUILD_CFLAGS and KBUILD_AFLAGS
> variables, KBUILD_CPPFLAGS is not redefined in the architecture specific
> Makefiles. Therefore the toplevel KBUILD_CPPFLAGS do apply just fine, to
> both C and ASM sources.
>
> The custom configuration was necessary when it was added in
> commit 9e2276fa6eb3 ("arch/x86/boot: Use prefix map to avoid embedded pat=
hs")
> but has since become unnecessary in
> commit a716bd743210 ("kbuild: use -fmacro-prefix-map for .S sources")
>
> Drop the now unnecessary custom prefix map configuration.
>
> Link: https://lore.kernel.org/lkml/d250e864d6d81cc02e2599f710872f72d58a3c=
29.camel@decadent.org.uk/
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Intended to go through the kbuild tree.
>
> It would have been nice to have this before
> "kbuild: make all file references relative to source root",
> but I guess it's really not worth a rebase and the complexity.

OK, I inserted this before the previous patch.
Thanks.





> ---
>  arch/x86/boot/Makefile            | 1 -
>  arch/x86/boot/compressed/Makefile | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> index f500f82864aae80deb74faa3df9a8b6333d6c4ca..75e7a76deee1541ffed05953e=
b0574f14fe193a9 100644
> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -54,7 +54,6 @@ targets +=3D cpustr.h
>
>  KBUILD_CFLAGS  :=3D $(REALMODE_CFLAGS) -D_SETUP
>  KBUILD_AFLAGS  :=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
> -KBUILD_CFLAGS  +=3D $(call cc-option,-ffile-prefix-map=3D$(srctree)/=3D)
>  KBUILD_CFLAGS  +=3D -fno-asynchronous-unwind-tables
>  KBUILD_CFLAGS  +=3D $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
>
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed=
/Makefile
> index ad324978b2e5b1b6f8be82647769c99db8257ac7..4d3f714ad8717db2235a70726=
9d26565a9671187 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -38,7 +38,6 @@ KBUILD_CFLAGS +=3D -fno-stack-protector
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, address-of-packed-member)
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, gnu)
>  KBUILD_CFLAGS +=3D -Wno-pointer-sign
> -KBUILD_CFLAGS +=3D $(call cc-option,-ffile-prefix-map=3D$(srctree)/=3D)
>  KBUILD_CFLAGS +=3D -fno-asynchronous-unwind-tables
>  KBUILD_CFLAGS +=3D -D__DISABLE_EXPORTS
>  # Disable relocation relaxation in case the link is not PIE.
>
> ---
> base-commit: 1a78774bb35068bb143d2299da3f8a0b87807cdb
> change-id: 20250322-asm-prefix-map-028f044d87b3
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>


--
Best Regards
Masahiro Yamada

