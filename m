Return-Path: <linux-kbuild+bounces-6155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3FCA628D1
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 09:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F20C3B5132
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 08:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97E017E473;
	Sat, 15 Mar 2025 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YH/njqrj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA413F43B;
	Sat, 15 Mar 2025 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742026571; cv=none; b=igheBEIyirmOP/53HBStx8gOl8lGqPZSvuVYvB8+dFJa7vQkVDHZjuzuE7N3NSxh7WMka8EHYuet+GtYgJU/SIngtxYuY9QmvUghvDCkj5Cwvoe6y/d1/RghZI7OUwYaxc+ryl90thnzUA2sdZsm4qPlR2zajLzkhBxHYa7LRt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742026571; c=relaxed/simple;
	bh=maUhN+AJnWAR8ns3BwFcLCq65svuJuNcwk2OiHz9Y2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2z+0JzjCGBB0BQmvYsHPH8Si6VlZ/bLU3Bl1T71ZAjaGvLRbxR0PKi408opguno4caNWz2bo5LwRIAYIanbBJfzzqt/P0CvlgbNK4c10HCJYpxwLnuS5xfNJwAnn14z3Lua6xesMMN2XnZw9Bed7qOWPSJI1ckC7Af/U99aU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YH/njqrj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A39C4AF09;
	Sat, 15 Mar 2025 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742026571;
	bh=maUhN+AJnWAR8ns3BwFcLCq65svuJuNcwk2OiHz9Y2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YH/njqrj8bAXy2Z07DQMyqD2bEoj18H9Dx5deMyPl4Ijdnxv2jODOddeGvOqUsDzD
	 S90q2O8mNfjQa52GJwkpVTY49QOhQU9+JPAtaZa0xchzg33P4IXC2wElTC4qbX3p2g
	 lBBFrka1CptEidEAk8QRPzowIX/nhK4iXsIwoTo14kaBFr/eQNEBGNj2UOk/RaiAVe
	 yKyUL7uzL/2LJteTS1qNo+7hVEN5RqE7sLsIF3iriVKz29p0mmfwPdD7dof9jp2M41
	 KLhDIlptW2jAZ43kXVhPJsYvJLP2vtJgfl6vMFo0xCrXJJwnuXLXsN35vKYqHPmwlY
	 dxJTWCWJ61QvA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so28210061fa.1;
        Sat, 15 Mar 2025 01:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6X16vXfmde1FmyZPyfSbtQR2ZM9KOhVQr8W0bztBsNLGH4pCQObh+JIdc0FEZsA0OJZXN9o3jSyv/Ew7P@vger.kernel.org, AJvYcCWipw+4KlvGEXDrCoTJcfcDUljM12UdYEaUBxq07cG249W0FxLYeVtS3VG5zEoeYgi1SCjiNRE2jTnTUrdC@vger.kernel.org, AJvYcCWwkZPs4Hxxao4hx0UmVkF3R8Hseygi9uE2Wqz4QgXdbFTsLnMD6lj1A6BbKMcWumA4lhaywpBqvBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+q+nqq3vgnHcLVnI4lW3Goc4tEVWE2Oq5ydM5Ao0jvxKD0f4T
	QmJxQt4klM3/HY/pLLQdHrApHvonhlhGzxxi4xn8mcj/2dtndPsz/fYfef9IQFCyjiKtyvcWD/w
	lWfiV2bSfVmqUksl2/0wCCevQVyo=
X-Google-Smtp-Source: AGHT+IGmnB4gPS6Yhf1I051zNGKkcqfe/bOTJQsVHygtNFoNmNzIh7SDi0tpWWhkazTubKAuSRwg8cjVes/Ildo/Sbc=
X-Received: by 2002:a05:6512:2245:b0:545:cc5:be90 with SMTP id
 2adb3069b0e04-549c398cf85mr1858047e87.35.1742026569742; Sat, 15 Mar 2025
 01:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net> <20250313-kbuild-prefix-map-v1-3-38cea8448c5f@weissschuh.net>
In-Reply-To: <20250313-kbuild-prefix-map-v1-3-38cea8448c5f@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Mar 2025 17:15:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ695Ur3tvq+W67zgkRuw_wnRJpoAsmpEUgVLyFx8USNg@mail.gmail.com>
X-Gm-Features: AQ5f1Jrvonb-5Mtiicy6dw4ZlrYroUO2Ym6UWmGYhYtF3F3_vYC6MyoBKdEXbtA
Message-ID: <CAK7LNAQ695Ur3tvq+W67zgkRuw_wnRJpoAsmpEUgVLyFx8USNg@mail.gmail.com>
Subject: Re: [PATCH 3/4] x86/boot: Switch to -ffile-prefix-map
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi X86 maintainers,

Is it OK to pick up this to kbuild tree?
Ack is appreciated.



On Fri, Mar 14, 2025 at 12:59=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> -ffile-prefix-map is a more general variant of the currently used
> -fmacro-prefix-map. It is also what the top-level Makefile is using now.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  arch/x86/boot/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> index 9cc0ff6e9067d574488a35573eff4d0f8449e398..f500f82864aae80deb74faa3d=
f9a8b6333d6c4ca 100644
> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -54,7 +54,7 @@ targets +=3D cpustr.h
>
>  KBUILD_CFLAGS  :=3D $(REALMODE_CFLAGS) -D_SETUP
>  KBUILD_AFLAGS  :=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
> -KBUILD_CFLAGS  +=3D $(call cc-option,-fmacro-prefix-map=3D$(srctree)/=3D=
)
> +KBUILD_CFLAGS  +=3D $(call cc-option,-ffile-prefix-map=3D$(srctree)/=3D)
>  KBUILD_CFLAGS  +=3D -fno-asynchronous-unwind-tables
>  KBUILD_CFLAGS  +=3D $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
>
>
> --
> 2.48.1
>


--
Best Regards
Masahiro Yamada

