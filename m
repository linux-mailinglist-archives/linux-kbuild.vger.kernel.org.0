Return-Path: <linux-kbuild+bounces-8015-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D7B06A58
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jul 2025 02:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50E2C1A63607
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jul 2025 00:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA750CA4B;
	Wed, 16 Jul 2025 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnqcTWqm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B9010E4;
	Wed, 16 Jul 2025 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752624896; cv=none; b=Pv17Ssv8YURwD28uC/ePAbPTjAaU4U3mUX24HgANp/w7VBImTJOwN6b5WKdV7Cj44atyt/49+8VS1fkNe1xLfbkAem7Hj7ovw8RC4gp/ACZzUHJ4YpjIZAIKQAH1FxHQ2FGimtk/FUoPd3mpJxFLgSOZ84PM8cwgARDUUFzes8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752624896; c=relaxed/simple;
	bh=k5OvjG9s0R19eoy3cMVHKQqAhl4eqqomEfMHhgz3iD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVe8U0uIPl6zHe8BIQcN7cs/MaiSXM6m+Y0d07c6NNvTD8o+mw0zMZKtQSTd3NhMYBZzo1sO52B2Lbua4NxrY0jNhl6Zd9jfEJjcEZOQQ/y7ZtL11gHIe9uS4ur6DL82dgOFsI7FIH1AQvXYg/a+A+TWhcjv1OkpiCAlMt8h4/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnqcTWqm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4459CC4CEE3;
	Wed, 16 Jul 2025 00:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752624896;
	bh=k5OvjG9s0R19eoy3cMVHKQqAhl4eqqomEfMHhgz3iD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WnqcTWqmRYE8aMLNzExoRV/ovIjjDMvESJktdmkOsMRpeboy7J4ojzwEoMHL+tcY4
	 ka8COuzLwX6WWyMaZOAhuRbpK1F+NXJWgSOlRLx1EZ6LPf3dbmDC3/nSxIyuZ3r4yE
	 Jfr7jfpaaaOUWljAn79a561UBVZyUMCq+flPfEx61JS1V1EN1xMH2filvXkoWHRIL1
	 gOAdRllwluWRdqJBR8o3Kp1CGQ8+afb2beUpCLDnwKSR0lrxixrpBAEVWvDWX15w4E
	 sdGpekn5/WHVikw+EVW67FzTmo47KBXBLKwV1JqG9VN0y1I0InMMeNe9E6Nsjk8OAP
	 zWA3ajczpf/TA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b16a0e38so6292534e87.1;
        Tue, 15 Jul 2025 17:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVK5iO7qlYGR9gclGtGFHNyWjOywv55c2ahLUlCceTZGNNOwmUmtNLtWp29w6kiXvWx7sxtmWhPVnOwRqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMHKewgx8jlD/sAB4KGO0EEi7+rHXf+zgpsT5fpdqaIJ9n2Gqb
	PIwtHsP6UEoqGAP5Kz+qSeERDV57mEilqC7egvIWEpnqUwDoHEC2wiReSym+yzsCmTWukORIAca
	+WjNzHDcDd0gdTvBhp2r42qRSmbt04Bw=
X-Google-Smtp-Source: AGHT+IEk/hpfHMsHqrRmqU/eGEmZQlk/pMIwScWJdRK1TB+ySXraLjnpIZw7kTeuB20TNRIDJEuVmpKroAGsqe58Qqc=
X-Received: by 2002:a05:6512:4024:b0:553:cfa8:dd33 with SMTP id
 2adb3069b0e04-55a2331bac9mr515202e87.19.1752624894935; Tue, 15 Jul 2025
 17:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714222923.1107205-1-jeremy.linton@arm.com> <20250714222923.1107205-2-jeremy.linton@arm.com>
In-Reply-To: <20250714222923.1107205-2-jeremy.linton@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 16 Jul 2025 09:14:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+KBFe2wrfw32PpHHEvko3YkkaPHPPt54Y6VuYt7PHMA@mail.gmail.com>
X-Gm-Features: Ac12FXyofase4ZSfqX3E7g3BtavjOSI98x0jUC5ICQ4Kv3lSuIJ_juHG-qlZDOY
Message-ID: <CAK7LNAT+KBFe2wrfw32PpHHEvko3YkkaPHPPt54Y6VuYt7PHMA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] scripts: add zboot support to extract-vmlinux
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 7:29=E2=80=AFAM Jeremy Linton <jeremy.linton@arm.co=
m> wrote:
>
> Zboot compressed kernel images are used for arm64 kernels on various
> distros.
>
> extract-vmlinux fails with those kernels because the wrapped image is
> another PE. While this could be a bit confusing, the tools primary
> purpose of unwrapping and decompressing the contained kernel image
> makes it the obvious place for this functionality.
>
> Add a 'file' check in check_vmlinux() that detects a contained PE
> image before trying readelf. Recent (FILES_39, Jun/2020) file
> implementations output something like:
>
> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"
>
> Which is also a stronger statement than readelf provides so drop that
> part of the comment. At the same time this means that kernel images
> which don't appear to contain a compressed image will be returned
> rather than reporting an error. Which matches the behavior for
> existing ELF files.
>
> The extracted PE image can then be inspected, or used as would any
> other kernel PE.
>
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>

Applied to linux-kbuild.
Thanks.


> ---
>  scripts/extract-vmlinux | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
> index 8995cd304e6e..189956b5a5c8 100755
> --- a/scripts/extract-vmlinux
> +++ b/scripts/extract-vmlinux
> @@ -12,13 +12,12 @@
>
>  check_vmlinux()
>  {
> -       # Use readelf to check if it's a valid ELF
> -       # TODO: find a better to way to check that it's really vmlinux
> -       #       and not just an elf
> -       readelf -h $1 > /dev/null 2>&1 || return 1
> -
> -       cat $1
> -       exit 0
> +       if file "$1" | grep -q 'Linux kernel.*boot executable' ||
> +               readelf -h "$1" > /dev/null 2>&1
> +       then
> +               cat "$1"
> +               exit 0
> +       fi
>  }
>
>  try_decompress()
> --
> 2.50.1
>


--=20
Best Regards
Masahiro Yamada

