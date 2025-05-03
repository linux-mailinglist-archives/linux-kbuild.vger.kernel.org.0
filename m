Return-Path: <linux-kbuild+bounces-6909-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A8CAA80AF
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 14:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44C6F5A403B
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 12:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974D222DFA2;
	Sat,  3 May 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DryTNpCN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7AF22D4C5;
	Sat,  3 May 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746275459; cv=none; b=EtyObXXIKBsFubl3v9yoDW82mUPWkW8BWZ2WN6vnIIj3FbZbsotmnauq2vp0ZmTK2l88uQZImTIl+fhbe1/3UcsMgZUDZa1Wh7g/vTAx8oCmU3rWuhaPkGJsw12atujeaeLePK2TKrMpOdZ8iLgGd9f+w5wMDVW1Tm6Ts6JlyPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746275459; c=relaxed/simple;
	bh=F3iwU5W0ytAG5DZzAz0Pko7BcqXYuXoReD9umCq5y9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KK7i9PwMM3jodqkc917vIp23OWNok350YJ9ekW2w3Rhb84YyVgEeZkc/ByYnEoaLZYIVcfRggoW2FzBMRCw7ZOxe1WG1kt/SMlY4cksiVwrpiBz1xlp5VqoDD86QuLkFISvD1lGEZjJDxXgtgNGwU7SGgyTvP7Eq4A+pCvOxF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DryTNpCN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C231BC4CEF0;
	Sat,  3 May 2025 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746275458;
	bh=F3iwU5W0ytAG5DZzAz0Pko7BcqXYuXoReD9umCq5y9I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DryTNpCNV/P8VTvvl0iFClplGzorNqqgJ5PePgMPnpb2RdK9lwYxx4gcoZu77IUHc
	 I8XgbpRwEBPi9R9TDZ8AbqZNUfL7hWLBNKsIMdCBay0/xs4n4LAEPeRCMXAox6PhbL
	 amXWB3M2XgQQoAJKEyfCC8NCbDVliD7qh6tZljhenQfbdOAfOFNyDlqaJlm7F5k2Ex
	 jqGYuzscPmTsXWcyqOl9kkKYXIdNxt+ewcJ2IJyNddKFcMHuuMXwXtVJhHbflawugG
	 CKV65m7rlff6WhZJ4C0QzIkSylaeqT33kdLFH20xVKd1lDrqPlOvRG2/g2+8cRqjP4
	 jxSMMV6lsc/Qg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bee278c2aso43350861fa.0;
        Sat, 03 May 2025 05:30:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpN9Q+unzKZlnj0smO8bPfLklfxde/KRmFz+0CE+ZEaj8bFLydK+4BORaFsTrglblyKLbgmD5XbbyDwGg=@vger.kernel.org, AJvYcCVZwkCUBLA/VprlVHcgTCwikQHcJcFTpgz7TNZHljdqreG15wa0E6toifaeu1yVe741Q9dEcnk77th1EhDgXg==@vger.kernel.org, AJvYcCXlT9Qiyb2tgqQOvVC+7W6ravtVWvUy4pjFJuigYNAN8Sh/v7YMG7q1ANw/ufA45k89YXPLjgfqFBo1zR2M@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc+I7Oe3SidOEhBElrLGuTFEv/CwVLNHa1/DYMwfh0X56LBPMw
	PRN6j6a0+d1R9AC2q7oSFCLx5MEysdYPSzVnIoRxyMK5JO/1RsLzGClkRadupN5IqZJ2rTrkANu
	1UgAgZo10x+VdkC5Q0/VZE/FPnxc=
X-Google-Smtp-Source: AGHT+IHdHYcdxqrU0jxedHiIX/DSHN9bJqdJ17KruC0sSGUND1apkQDk4JNLlIIRBpD12/tqSX1r3rXG1qQEIyd4eEk=
X-Received: by 2002:a2e:bd81:0:b0:30b:ab00:846a with SMTP id
 38308e7fff4ca-320aada845bmr21042721fa.3.1746275457474; Sat, 03 May 2025
 05:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502141204.500293812@infradead.org> <20250502141844.046738270@infradead.org>
In-Reply-To: <20250502141844.046738270@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 May 2025 21:30:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQkRoPNnCuhgXZUhHSFdFp2Uj7tnbw3k4QwuW+LXZ9e=w@mail.gmail.com>
X-Gm-Features: ATxdqUGuUX0K-0vXXSyYkLfKuGao-VeiZU_DoB0ygbRGOceLMoJ2jc2-zfcs2ik
Message-ID: <CAK7LNAQkRoPNnCuhgXZUhHSFdFp2Uj7tnbw3k4QwuW+LXZ9e=w@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] module: Add module specific symbol namespace support
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:26=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Designate the "module:${modname}" symbol namespace to mean: 'only
> export to the named module'.
>
> Notably, explicit imports of anything in the "module:" space is
> forbidden.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/module/main.c  |   33 +++++++++++++++++++++++++++++++--
>  scripts/mod/modpost.c |   11 ++++++++++-
>  2 files changed, 41 insertions(+), 3 deletions(-)
>
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1083,6 +1083,14 @@ static char *get_modinfo(const struct lo
>         return get_next_modinfo(info, tag, NULL);
>  }
>
> +static bool verify_module_namespace(const char *namespace, const char *m=
odname)
> +{
> +       const char *prefix =3D "module:";
> +
> +       return strstarts(namespace, prefix) &&
> +              !strsmp(namespace + strlen(prefix), modname);

Apparently, you did not spend time for per-commit compile testing.

I believe it is a typo of "strcmp()".

I got this build error.

../kernel/module/main.c: In function 'verify_module_namespace':
../kernel/module/main.c:1091:17: error: implicit declaration of
function 'strsmp'; did you mean 'strsep'?
[-Wimplicit-function-declaration]
 1091 |                !strsmp(namespace + strlen(prefix), modname);
      |                 ^~~~~~
      |                 strsep









--
Best Regards
Masahiro Yamada

