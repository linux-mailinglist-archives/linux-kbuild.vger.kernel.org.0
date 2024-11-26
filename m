Return-Path: <linux-kbuild+bounces-4868-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF98A9D986B
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 14:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F12F3B2317E
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 13:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373DE1CEE96;
	Tue, 26 Nov 2024 13:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mz4JcFNn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEB92F32;
	Tue, 26 Nov 2024 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732626749; cv=none; b=b9/I1BgVGy44Fxyrb6AGGKYBQS5aY8fn3WnJQOq1MjoO6oiik+uqwWh3J4Ha+UiXviofw3KEZeHjt/ovb122fPUOiU/cuHHoH8uI52kVmrzxfE4MhbgDIyqxFELKXpDXBXzWZyLEmDOIpe+qFbyc8QRYxHqqwpDILARfT06Uwgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732626749; c=relaxed/simple;
	bh=G4wUSGauyhAMvLF3pLjxp2GZ8HCctx3no+tBdJmHKWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWong9av/Ed3qHvkSXhKWiw7hCSU+kD2baF9y3ZP2t/CZCuGIcKqMLzJR3njzj7BhZuGtOYEmZyfGayVwIqJdCGilWqolwhG7drg44DVv7aRKSLdRIlaE7TpxP3ud1yj6gDaKIvrJf596JCbtNLZB6AfLumkx6lG2GcmpLoxSf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mz4JcFNn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B5EC4CED2;
	Tue, 26 Nov 2024 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732626748;
	bh=G4wUSGauyhAMvLF3pLjxp2GZ8HCctx3no+tBdJmHKWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mz4JcFNntuKg3Iu7TL+VkHX8sfThalAdZtcAyE7DbIrtVX4Y6rX1go+D+Pw0+NtF2
	 hiVSZHbnZXe4CYUOjpw3C7QRm+EdmmaheDLMs7qaNgollTeeYqt1HRZOX4W0gR2UwE
	 Uyi1r9rG1pvl3QhYctvR1U0GRBpUB+SjPyZbE8m0xTj+vCbzlIshloa9YpM/54F0wZ
	 lOq6f0CLZXBegXSO1dYGCqMpVfwPT5B2Y+TNE/DogrgO6VRXvm71QWgNlDgC32vmrX
	 cyNCliqccjNQhN5s5cSzwFyWhuV9aXHvXP05NuULc0LxpGaG8ZRLAL8LPN1WL1DtiQ
	 H9qSGedT+yiNA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53ddd4705f8so2759151e87.0;
        Tue, 26 Nov 2024 05:12:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAjSAJA2ucSPOscLSI7xwuk75NYuQMsRUyJ6FKxvz93BH4KuLDkkasUwmW3gflgbCXFXTNUQLYYdhxkmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaNhnNMZqdhXBJ7JbAyCeKiDlIfB7Ijgget2sjN/kPFDyeC0uL
	bovj/vENdJ3rzPPhjkAK9rh1/DCXSdMseF+HULLzp4F2z0Q3auyjVgscAlGj+8xCpEXVhAooiSA
	80gneGOZu60XK+jjKuE5ys8jeJh0=
X-Google-Smtp-Source: AGHT+IE3Dn+Yo2zByeVPccdEmnF5bqhwyWsDMynSomfVmJB0Ufc3MCz0qpj6tpbevOsCMYZowd9QG6cD5FG2U8GfQYY=
X-Received: by 2002:a05:6512:3408:b0:53d:e06d:47b with SMTP id
 2adb3069b0e04-53de8818aa5mr1236764e87.11.1732626747210; Tue, 26 Nov 2024
 05:12:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118231534.1351938-1-masahiroy@kernel.org>
In-Reply-To: <20241118231534.1351938-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Nov 2024 22:11:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNARPv45324nwrFV9n22WiDVEasnPhDCjFdSMvA3kPBTB+Q@mail.gmail.com>
Message-ID: <CAK7LNARPv45324nwrFV9n22WiDVEasnPhDCjFdSMvA3kPBTB+Q@mail.gmail.com>
Subject: Re: [PATCH] setlocalversion: add -e option
To: linux-kbuild@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 8:15=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Set the -e option to ensure this script fails on any unexpected errors.
>
> Without this change, the kernel build may continue running with an
> incorrect string in include/config/kernel.release.
>
> Currently, try_tag() returns 1 when the expected tag is not found as an
> ancestor, but this is a case where the script should continue.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.



> After '[PATCH v3] setlocalversion: work around "git describe" performance=
',
> I need to remove "|| return 1" statements anyway, as it is not suitable
> for the -e option.
>
>   if []; then
>       ...
>   fi
>
> is more consistent with the existing code.
>
>
>
>  scripts/setlocalversion | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/setlocalversion b/scripts/setlocalversion
> index 5818465abba9..28169d7e143b 100755
> --- a/scripts/setlocalversion
> +++ b/scripts/setlocalversion
> @@ -10,6 +10,8 @@
>  #
>  #
>
> +set -e
> +
>  usage() {
>         echo "Usage: $0 [--no-local] [srctree]" >&2
>         exit 1
> @@ -34,7 +36,9 @@ try_tag() {
>         tag=3D"$1"
>
>         # Is $tag an annotated tag?
> -       [ "$(git cat-file -t "$tag" 2> /dev/null)" =3D tag ] || return 1
> +       if [ "$(git cat-file -t "$tag" 2> /dev/null)" !=3D tag ]; then
> +                return
> +       fi
>
>         # Is it an ancestor of HEAD, and if so, how many commits are in $=
tag..HEAD?
>         # shellcheck disable=3DSC2046 # word splitting is the point here
> @@ -43,12 +47,12 @@ try_tag() {
>         # $1 is 0 if and only if $tag is an ancestor of HEAD. Use
>         # string comparison, because $1 is empty if the 'git rev-list'
>         # command somehow failed.
> -       [ "$1" =3D 0 ] || return 1
> +       if [ "$1" !=3D 0 ]; then
> +               return
> +       fi
>
>         # $2 is the number of commits in the range $tag..HEAD, possibly 0=
.
>         count=3D"$2"
> -
> -       return 0
>  }
>
>  scm_version()
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

