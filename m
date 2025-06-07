Return-Path: <linux-kbuild+bounces-7390-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96229AD0E68
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 18:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57BE5189131B
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 16:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F3C1E412A;
	Sat,  7 Jun 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gR0DQVGX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E487B184F;
	Sat,  7 Jun 2025 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749312323; cv=none; b=HM5U0HhWq498C+UQyw0/ogCwUUG3+zt+ELfV1bpLHudhxI4F/QFe/vHtZbB9PgAE796Hjpur7KfhckoaiaPR9i/2ShjUA6grGb4B7m2/kmRG6vJmZUeHzPTyYjBR1KYhtNsTBAwAsMmvIeXGCAeCK48c45DQiStPr80ejt0Pn/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749312323; c=relaxed/simple;
	bh=5UuRKP/GED7Ma9tEc7DBrUHi85LOEHSI5EExSladv38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gk/Upnu5OvgEYbhtCalt4rzKUisTHCVCyNTu4QBTa5vC0xCxEmgSnXy8ifefgX61P6owN3L7hSq0FINUChWWZmEBGT/+3c4ut4vh97MSQIuBsw1PyrYjV/63qYsQlMl4tL1keZNHz/GzgknuQ/hfkkXhxZGVg84oiTxRIPhm1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gR0DQVGX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBC0C4CEEE;
	Sat,  7 Jun 2025 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749312322;
	bh=5UuRKP/GED7Ma9tEc7DBrUHi85LOEHSI5EExSladv38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gR0DQVGXYehoTtiJ01YlpFGsebRY24rV65x0SNs8hzlsVAi6qineppTZPgjW0DLcq
	 ZYxf8B5Q6J+mzJ/WgEBj9wOvoS3ZiRNPjzZT2t7umZj+DryF30aguiIbcN8AyXLXUD
	 XHBZKSoWlQytxHTzmK90p46i8BA0N4Z4kqfmTc6yLtwvDK2TtPGeoF4rMmf7uSA5mL
	 5f+c20/YPMFDgXwX4QvNk4QHCwZOjkw4Gf+pcY7d7TfwHuxRD5dljTvsNi0eyvBcF4
	 /rdPbFxwcfJVaEVukjHD3l9QHXrYxgwqnN6iHRZr/7bGn54WLUhgOc6XD+k4pGPrfr
	 eNavS/FNRI2CQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5533302b49bso3223960e87.2;
        Sat, 07 Jun 2025 09:05:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa9Yna8mYz/167//pky+DxIusnMHIM6Qc2vGMD1jbB+q+mKjDWH4lw/JFVgvUBjtF1Pxo6f8/A2DDbnsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUQxGf2jrO9/RmSUHVXA87ru/i9rbScWaoj8CeyWMnbsxM9OZ
	RxwMS6wjTpcOQ4YVQZayuvkXzo4Wlmq03Hgk+K5reMQ0LTWbI1yU2hJJUVnDTvDg7Gl9EKgA7ws
	Hz7a1YhX9NCFcT45lrsM7znNFSXRMjBs=
X-Google-Smtp-Source: AGHT+IFnUzUfmJf8+6n/k+t7BODZMuPZ4kU2DTxCVevpBuFh0eoT48KXlVV8PMha4QdyhDNOvE002Ws8z+7nmRag8cI=
X-Received: by 2002:a05:6512:39c3:b0:553:5135:69fb with SMTP id
 2adb3069b0e04-55366bdca22mr1947220e87.10.1749312321095; Sat, 07 Jun 2025
 09:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522172941.1669424-1-jeremy.linton@arm.com>
In-Reply-To: <20250522172941.1669424-1-jeremy.linton@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Jun 2025 01:04:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQzkh+DO7ZBVEgLu63k0H5qB-etV_jpo67k+itLWGAosA@mail.gmail.com>
X-Gm-Features: AX0GCFu0RkuGqzGc1uMYQcW9V9XAt0tYFrCsHUnK_xgj9T68jkZERZQKNUnNhdU
Message-ID: <CAK7LNAQzkh+DO7ZBVEgLu63k0H5qB-etV_jpo67k+itLWGAosA@mail.gmail.com>
Subject: Re: [PATCH] scripts: add zboot support to extract-vmlinux
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 2:29=E2=80=AFAM Jeremy Linton <jeremy.linton@arm.co=
m> wrote:
>
> Zboot compressed kernel images are used for arm kernels on various
> distros.

Are you talking about arm 32 bit here?
(arch/arm/boot/zImage)

> extract-vmlinux fails with those kernels because the wrapped image is
> another PE. While this could be a bit confusing, the tools primary
> purpose of unwrapping and decompressing the contained vmlinux image
> makes it the obvious place for this functionality.
>
> Add a 'file' check in check_vmlinux() that detects a contained PE
> image before trying readelf. Recent file implementations output
> something like:
>
> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"

Are you talking about arm64 here?

I am confused, as arm64 adopts a simple-compressed image.


Apparently, this patch did not work for me.

$ ./scripts/extract-vmlinux  arch/arm/boot/zImage
extract-vmlinux: Cannot find vmlinux.

The 'file' command says, it is "data".
Is my 'file' command too old?

$ file arch/arm/boot/Image
arch/arm/boot/Image: data


> Which is also a stronger statement than readelf provides so drop that
> part of the comment. At the same time this means that kernel images
> which don't appear to contain a compressed image will be returned
> rather than reporting an error. Which matches the behavior for
> existing ELF files.
>
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> ---
>  scripts/extract-vmlinux | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
> index 8995cd304e6e..edda1abe226c 100755
> --- a/scripts/extract-vmlinux
> +++ b/scripts/extract-vmlinux
> @@ -12,10 +12,11 @@
>
>  check_vmlinux()
>  {
> -       # Use readelf to check if it's a valid ELF
> -       # TODO: find a better to way to check that it's really vmlinux
> -       #       and not just an elf
> -       readelf -h $1 > /dev/null 2>&1 || return 1
> +       file $1 |grep 'Linux kernel.*boot executable Image' > /dev/null
> +       if [ "$?" -ne "0" ]; then
> +               # Use readelf to check if it's a valid ELF, if 'file' fai=
ls
> +               readelf -h $1 > /dev/null 2>&1 || return 1
> +       fi
>
>         cat $1
>         exit 0
> --
> 2.49.0
>


--=20
Best Regards
Masahiro Yamada

