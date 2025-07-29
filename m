Return-Path: <linux-kbuild+bounces-8238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93283B14DD3
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 14:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E23DE18A1B08
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 12:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9B611187;
	Tue, 29 Jul 2025 12:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haltdjNU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1CCA4B;
	Tue, 29 Jul 2025 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793137; cv=none; b=dEAKEvTVDnNDqrusHzjMd/e5ElyilV9mLhKYjl1N3qmnz0EC7UbPARFwfLPJrHw28jqiyaj7QzJAud+B6yc3kOZOIwsuv/wMtVV5jEuXqIUwOQu9LE8J1AZ9/4hANRagRxhTCwR9e1H4dMkMkEMoRB2IRAMICYGmebQs7cukVHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793137; c=relaxed/simple;
	bh=AbHyqcbtThoLuMnv9gV71j+F5RVMs7RR+VxwmsE/dkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMfILX1tF6GAHorGJltLCWcAg2nMVaaldiRL6QsEnsr5sQFUdtGwazK/NwtscSKiBvca7Nh8/55FqO1EKC6Y1HnHngcGqGU2gjYYnMkm5RnJyJQRbBtuXCcAQXISp9kLuzUFS5hjKMBACok2mHBGDDkbo8bsfQHeE1/NZtfCF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haltdjNU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1C9C4CEF4;
	Tue, 29 Jul 2025 12:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753793134;
	bh=AbHyqcbtThoLuMnv9gV71j+F5RVMs7RR+VxwmsE/dkw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=haltdjNUjOiUcYidB6zkvuHBOyt48Kxbsps8kV5HJkT2QcfTCj+WDQ5dUzGYiwmr4
	 n3LRQySAeOEJeHIFPdbsz4E8q3hmb7p0iqx2s1861atQZnNOKa2Wec/iKwjSb7neh8
	 vnEWiXrUQGEHRuGeSK2Px2uaPTLB8Oh3DQnPVuoY5EXuHY2EAwTqk4xnUWHX1GLRtP
	 TAhVUoqNhdOFE4ir/8TgJFQy7Kr1Y8ZxF7yy0d2zAsnE9ra/+zB1ff0szSWh5LQTg7
	 YSJcKlRFld+lXn9i7p1FVjTdcH8KF/5thDNEF19SF5B3Ib31/tlq5o9Mam4vZXi3ak
	 JY6Rc4Z/Tt30Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso59526171fa.1;
        Tue, 29 Jul 2025 05:45:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0hppi0XWp9Q+CZhHjO2bQGSRzuD+DguEdnm52lTvwykG1pqoM+mHRcOz6xKoxqsbt/a9/5RaVnmqE5RRU@vger.kernel.org, AJvYcCV3GcwLPrXQ3OwFP9hs/duXdNIUBYI7TnaKtUdhF7zcE11Hc7+X/7m7xd96FDUUt0spbzkmmfobIfKeSBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNlraOUlLNRhprnL5AM0ziC1BVy9bBhnfBCQH0rxfdhfCHrlK8
	iSRNjHVtHP1nzEuPzMPVeRP5yLjpA5Sc92+9eWc9qGvKmF6C0UfPWhu/hBlV87LSnPTfU+OyXtV
	Isfg2ptscT89bYTYBRtFPsdncDt8MeTE=
X-Google-Smtp-Source: AGHT+IGjEESUhG0HukhEKL6uQ7G7+vrNPRv07Lv3sUD6JQGaJn0nl6V69OqQn2WkjhPsu9jIi65WkJWM1mIHy/Nd6dE=
X-Received: by 2002:a2e:a592:0:b0:32b:7ddd:279e with SMTP id
 38308e7fff4ca-331ee750d23mr40360031fa.14.1753793133241; Tue, 29 Jul 2025
 05:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726151030.142548-1-mgorny@gentoo.org>
In-Reply-To: <20250726151030.142548-1-mgorny@gentoo.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 21:44:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATotYMHVgNHkQcT33qQK+fdZAjoQpdJqtKKWT18uJcPXg@mail.gmail.com>
X-Gm-Features: Ac12FXxZGSPydf8hCmkGrSH8AzQfrTRfP037fo-qR0qabrThFnNDS4BaRomRcQc
Message-ID: <CAK7LNATotYMHVgNHkQcT33qQK+fdZAjoQpdJqtKKWT18uJcPXg@mail.gmail.com>
Subject: Re: [PATCH v3 kbuild-rebased] kheaders: make it possible to override TAR
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Sam James <sam@gentoo.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 12:10=E2=80=AFAM Micha=C5=82 G=C3=B3rny <mgorny@gen=
too.org> wrote:
>
> Commit 86cdd2fdc4e39c388d39c7ba2396d1a9dfd66226 ("kheaders: make headers
> archive reproducible") introduced a number of options specific to GNU
> tar to the `tar` invocation in `gen_kheaders.sh` script.  This causes
> the script to fail to work on systems where `tar` is not GNU tar.  This
> can occur e.g. on recent Gentoo Linux installations that support using
> bsdtar from libarchive instead.
>
> Add a `TAR` make variable to make it possible to override the tar
> executable used, e.g. by specifying:
>
>   make TAR=3Dgtar
>
> Link: https://bugs.gentoo.org/884061
> Reported-by: Sam James <sam@gentoo.org>
> Tested-by: Sam James <sam@gentoo.org>
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Micha=C5=82 G=C3=B3rny <mgorny@gentoo.org>
> Signed-off-by: Sam James <sam@gentoo.org>
> ---
>  Makefile               | 3 ++-
>  kernel/gen_kheaders.sh | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ba0827a1fccd..081d494d037a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -543,6 +543,7 @@ LZMA                =3D lzma
>  LZ4            =3D lz4
>  XZ             =3D xz
>  ZSTD           =3D zstd
> +TAR            =3D tar
>
>  CHECKFLAGS     :=3D -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>                   -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
> @@ -622,7 +623,7 @@ export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RU=
STC_OR_CLIPPY BINDGEN
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX=
 YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> -export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
> +export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD TAR
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS KBUILD_P=
ROCMACROLDFLAGS LDFLAGS_MODULE
>  export KBUILD_USERCFLAGS KBUILD_USERLDFLAGS
>
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index c64e5a00a3d9..59ec52f62c52 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -31,7 +31,7 @@ mkdir "${tmpdir}"
>
>  # shellcheck disable=3DSC2154 # srctree is passed as an env variable
>  sed "s:^${srctree}/::" "${srclist}" | tar -c -f - -C "${srctree}" -T - |=
 tar -xf - -C "${tmpdir}"

Please replace two more 'tar' with ${TAR} in this line.


> -tar -c -f - -T "${objlist}" | tar -xf - -C "${tmpdir}"
> +${TAR:-tar} -c -f - -T "${objlist}" | tar -xf - -C "${tmpdir}"

Please replace one more 'tar' with ${TAR} in this line.


I think ${TAR:-tar} is distracting.

I think ${TAR} should be OK because we have ${XZ} instead of ${XZ:-xz}
in this file.


>
>  # Remove comments except SDPX lines
>  # Use a temporary file to store directory contents to prevent find/xargs=
 from
> @@ -43,7 +43,7 @@ xargs -0 -P8 -n1 \
>  rm -f "${tmpdir}.contents.txt"
>
>  # Create archive and try to normalize metadata for reproducibility.
> -tar "${timestamp:+--mtime=3D$timestamp}" \
> +${TAR:-tar} "${timestamp:+--mtime=3D$timestamp}" \
>      --owner=3D0 --group=3D0 --sort=3Dname --numeric-owner --mode=3Du=3Dr=
w,go=3Dr,a+X \
>      -I "${XZ}" -cf "${tarfile}" -C "${tmpdir}/" . > /dev/null
>


--=20
Best Regards
Masahiro Yamada

