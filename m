Return-Path: <linux-kbuild+bounces-4261-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B909AC062
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 09:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F2B1F24737
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 07:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F2413D8B0;
	Wed, 23 Oct 2024 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paIbIMYT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13873451;
	Wed, 23 Oct 2024 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729668884; cv=none; b=V/86QVl2eBRoVF009NfiMSlSroO9WY+XQneGs3m8QiYxP0SY0egfSe+3twyjSSVNcVSNKoidgIBneeH2vCCEaui7UHxFa1X2uqxpIIlZVUIl36i6HsnWMAktFW7oe8fPOd12gpPfloEIvelIbgBx/P4a+nrFdIHnYmPVZx4IvdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729668884; c=relaxed/simple;
	bh=7xzrCzy5VH6U2nqMwVSZyjhTzhLPOBIuhFoZjodwtaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bR4qx7Ds+0k4DQfBElmr6QYe4qyONSOgXqanB4LOs2JZtnhPqXTfnzeozS49ISaIc3XVH7L4vgxkVp6GIBbOiPkQsp6PfNnhpe4jAmisT4Ca5dIiykMNPrIo4CuU5YL6tKTWTCiAzlNg0l4FdGHEVNMp5Oj/+VouiZpXKKotMuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paIbIMYT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85B6C4AF09;
	Wed, 23 Oct 2024 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729668883;
	bh=7xzrCzy5VH6U2nqMwVSZyjhTzhLPOBIuhFoZjodwtaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=paIbIMYTL0rVNiQGT3AaTp6qxXGnlx6DweNhG8z75bvAdbKahVTj42xs7+1LyLXnx
	 Bh+pT8vnBV+4o7ojNWwRZFLesOJ3hal4Y6e3G+ihMZsDpQGkiBX/XjEwYdk5C3p7qI
	 vc3M9UL1Xz8mIG/GiKRLFbwB4KkG54sY5MuiLBBJTBFIjQExyVak63gKvHSOLRU6WA
	 kDHsKpRsm7FNA3P8ah7onY/YshxI+mmbeB9nytJ6j6zusqxdA4XUsFwH8lVO6AH3UF
	 +BXU+QkXz35w3oTU5RfwL19/ktzV4I++zAdCnO0R3ikll+PE9drmYop5Sks7jpNWXD
	 BXFVFm4KnY1dA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb518014b9so56278021fa.3;
        Wed, 23 Oct 2024 00:34:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBZDicdWXTQqA/9x4XjJX4JO9pInVmFBtujKuuitKCG7Y+1zAOs0qkvn2gHN8w+Zkam++DyD+eZWKoSROZ@vger.kernel.org, AJvYcCWLyIwmTHKq0km04J0pftmZp1DNWXc2L58Y95xNiELwfddc6hke/39WC0VBUgy5LNGqKEkjKZpIzytIXdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dV/pq8YKpMMd7+MO//5sjvSn+HmlRs4zFExW9kr6Y0OtHI/9
	iQWTksKSNZvzd06DzL0eUfPNAaAHbJMVdXmovLqFEaKfYHf0DFPqqBl/vsx+/rDw+P1o9U2mGWh
	t0HF3UGCfcx+7/s/sAbuI3Q2lPsE=
X-Google-Smtp-Source: AGHT+IFF7PvSyTP8FhnlHp9myDpY8Mnfimp4y1zewVjI7zJpKsYL4RHA5VOJlIWki0Z2tIaMczXJqmrdYSkfQAoU29I=
X-Received: by 2002:a05:6512:15a3:b0:52f:d0f0:e37e with SMTP id
 2adb3069b0e04-53b1a354f04mr656850e87.42.1729668882243; Wed, 23 Oct 2024
 00:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022213708.2116-1-esalomatkina@ispras.ru>
In-Reply-To: <20241022213708.2116-1-esalomatkina@ispras.ru>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 23 Oct 2024 16:34:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQt1AKiRxNCaDKNrGNHjQQFtZyZej082d8aRKT4e8_H8w@mail.gmail.com>
Message-ID: <CAK7LNAQt1AKiRxNCaDKNrGNHjQQFtZyZej082d8aRKT4e8_H8w@mail.gmail.com>
Subject: Re: [PATCH v3] sumversion: Fix a memory leak in get_src_version()
To: Elena Salomatkina <esalomatkina@ispras.ru>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 6:38=E2=80=AFAM Elena Salomatkina
<esalomatkina@ispras.ru> wrote:
>
> strsep() modifies its first argument - buf.
> If an error occurs in the parsing loop, an invalid pointer

I deleted "If an error occurs in the parsing loop," because
this is _always_ a memory leak.

Applied to linux-kbuild/fixes. Thanks.

> will be passed to the free() function.
> Make the pointer passed to free() match the return value of
> read_text_file().
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 9413e7640564 ("kbuild: split the second line of *.mod into *.usyms=
")
> Signed-off-by: Elena Salomatkina <esalomatkina@ispras.ru>
> ---
> v3: Use 'pos' as the moving pointer
> v2: Rename 'orig' to 'pos'
>
>  scripts/mod/sumversion.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> index 6bf9caca0968..9b552c6efb40 100644
> --- a/scripts/mod/sumversion.c
> +++ b/scripts/mod/sumversion.c
> @@ -385,7 +385,7 @@ static int parse_source_files(const char *objfile, st=
ruct md4_ctx *md)
>  /* Calc and record src checksum. */
>  void get_src_version(const char *modname, char sum[], unsigned sumlen)
>  {
> -       char *buf;
> +       char *buf, *pos;
>         struct md4_ctx md;
>         char *fname;
>         char filelist[PATH_MAX + 1];
> @@ -394,9 +394,10 @@ void get_src_version(const char *modname, char sum[]=
, unsigned sumlen)
>         snprintf(filelist, sizeof(filelist), "%s.mod", modname);
>
>         buf =3D read_text_file(filelist);
> -
> +       pos =3D buf;
> +
>         md4_init(&md);
> -       while ((fname =3D strsep(&buf, "\n"))) {
> +       while ((fname =3D strsep(&pos, "\n"))) {
>                 if (!*fname)
>                         continue;
>                 if (!(is_static_library(fname)) &&
> --
> 2.33.0
>


--=20
Best Regards
Masahiro Yamada

