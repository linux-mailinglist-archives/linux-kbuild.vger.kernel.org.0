Return-Path: <linux-kbuild+bounces-5980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F89EA549D9
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 12:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 951D517441F
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 11:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2796E202F60;
	Thu,  6 Mar 2025 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uce4HYjC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D72209F2E;
	Thu,  6 Mar 2025 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741261399; cv=none; b=AuQPp1sW9BiddIzmTfBZF+Xfv5R7ZuPWidlbs5e9IXdzECZQCFEdMe7ZcAgHTQrpqoBtdurt+paQimKhoGMXO4Cipi/Twdkoyn9heMRQUN7ojynexkjwzJMP0n1NNoccc98kq+YczbSv3NhBCSKJPFfRBfsM3xd5iDY5nxoUp8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741261399; c=relaxed/simple;
	bh=73Kz4vOyVWj227Yhemy+fCXD4RhBV9RiNDvIfbtbyg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/3r/cPcGUb8C5E9ZiiZlZG1hMkAF67LUyw4bJfabmPh/0DIfiO1j0k8+MRcjLqCParL5pMCHVkCt3LLEHZIeIyxpjyG1Cem+Ev1pRuH6Xoz+XRet4Xnw7qXJaxJDNUorMYIWrLqO6IiZbGUfbD9cBVNcf3VXzGW6GqtbQDIiRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uce4HYjC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F77C4AF09;
	Thu,  6 Mar 2025 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741261398;
	bh=73Kz4vOyVWj227Yhemy+fCXD4RhBV9RiNDvIfbtbyg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Uce4HYjC07XO/Sz5dW8TQqhJX2EitPyPsP3UjhLHGnupAn4YZzyAQoB9RkIKZbcmX
	 SJDaotMoRKOVJK7X3ZrLKDPfa0Z1OyUsyZHJ2QP6tB47QYTIGa0QR4GZs3vbdfisz8
	 UzHIFuglt8eTOpJJvgaOLOnbwkpfAcdXSMVlgyPG1Uflf8cL97iKSCf7A9F6O58nXH
	 ldHcEka7E+0JQ53sV1rjSDDXsLejy2csM4qRM6Q6wcx+Xk1eH/Ea/A/ENi5fdIgUoe
	 QAEFEQdr6BUJsnEwYOlNYCdJZgH/8FprOk5f6nU/aAn+dMda/y2l8UBoGAzfcimiLl
	 x6hcqy9dRWlGw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so5639181fa.1;
        Thu, 06 Mar 2025 03:43:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/Eoz2ONBltjo/FayhknD27S2/y7Dw3UNxHHxkXubYjapVteluSC47xSSv0ddNfp1bTyEbtcDWUNCFxyAz@vger.kernel.org, AJvYcCXda+gQddA/3y+cjHwfLWemkT1d/J+vg31NAhqZ7tEMjSlwp1c/iW2DwzQnew8pJJPhiWwIyYaq/Sl8G28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2zXKiV1UGA+y4CrW02481jR750IaDxAJz1ohTHrKFUY7OLtr4
	HOam2gCmo9333bYlw650uphrM5mfi4t9epk+6MfZhcNUgjW4He1EWnQQzUKDvXJN9gjReh26lvH
	W0mMmV7I7W453OPgxVBPHjno8M1E=
X-Google-Smtp-Source: AGHT+IGjMAa/qEtJfjdpD+WVYbFqmh4clT7SUIZ4FQL0tXvQgzBuTlv+GSTeL/cczv6ZTNTeeXGzYV05x2rIzp9bUgU=
X-Received: by 2002:a05:651c:b10:b0:30b:f138:1b9f with SMTP id
 38308e7fff4ca-30bf138602emr523701fa.17.1741261397493; Thu, 06 Mar 2025
 03:43:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306063952.1029900-1-inochiama@gmail.com>
In-Reply-To: <20250306063952.1029900-1-inochiama@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Mar 2025 20:42:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAToVPMYpF9HdP=Fr2nkE9Edjog2LrqPBy19zsS4PZhfww@mail.gmail.com>
X-Gm-Features: AQ5f1Jq7-KwG0MixZESszoCiBT7onWhRWaAvLA1RyjSsMLY7V5_URHxYdUsf7WE
Message-ID: <CAK7LNAToVPMYpF9HdP=Fr2nkE9Edjog2LrqPBy19zsS4PZhfww@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: install-extmod-build: Fix build when
 specifying KBUILD_OUTPUT
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 3:40=E2=80=AFPM Inochi Amaoto <inochiama@gmail.com> =
wrote:
>
> Since commit 5f73e7d0386d ("kbuild: refactor cross-compiling
> linux-headers package"), the linux-headers pacman package fails
> to build when "O=3D" is set. The build system complains:
>
> /mnt/chroot/linux/scripts/Makefile.build:41: mnt/chroots/linux-mainline/p=
acman/linux-upstream/pkg/linux-upstream-headers/usr//lib/modules/6.14.0-rc3=
-00350-g771dba31fffc/build/scripts/Makefile: No such file or directory
>
> This is because the "srcroot" variable is set to "." and the
> "build" variable is set to the absolute path. This makes the
> "src" variables point to wrong directory.
>
> Change the "build" variable to a relative path to "." to
> fix build.
>
> Fixes: 5f73e7d0386d ("kbuild: refactor cross-compiling linux-headers pack=
age")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
> Changed from v1:
> - https://lore.kernel.org/all/20250223011944.902904-1-inochiama@gmail.com=
/
> 1. fix shellcheck warning C2086


Applied to linux-kbuild/fixes.
Thanks.


> ---
>  scripts/package/install-extmod-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/install-extmod-build b/scripts/package/insta=
ll-extmod-build
> index 2966473b4660..b96538787f3d 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -63,7 +63,7 @@ if [ "${CC}" !=3D "${HOSTCC}" ]; then
>         # Clear VPATH and srcroot because the source files reside in the =
output
>         # directory.
>         # shellcheck disable=3DSC2016 # $(MAKE) and $(build) will be expa=
nded by Make
> -       "${MAKE}" run-command KBUILD_RUN_COMMAND=3D'+$(MAKE) HOSTCC=3D'"$=
{CC}"' VPATH=3D srcroot=3D. $(build)=3D'"${destdir}"/scripts
> +       "${MAKE}" run-command KBUILD_RUN_COMMAND=3D'+$(MAKE) HOSTCC=3D'"$=
{CC}"' VPATH=3D srcroot=3D. $(build)=3D'"$(realpath --relative-base=3D. "${=
destdir}")"/scripts
>
>         rm -f "${destdir}/scripts/Kbuild"
>  fi
> --
> 2.48.1
>


--=20
Best Regards
Masahiro Yamada

