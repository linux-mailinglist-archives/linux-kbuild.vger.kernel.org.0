Return-Path: <linux-kbuild+bounces-7992-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 816B5B02BBE
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 17:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD287168980
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 15:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C9F2236FB;
	Sat, 12 Jul 2025 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJQIV14C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9FCDDBC;
	Sat, 12 Jul 2025 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752335286; cv=none; b=i4Izwn4FITqD66ThM1CvJQMz2b+NUyyL6EbJhDvYjnTCk/CNIGdOrTnIRnJzHi1bjf2NdgawuQb0KDK/lnXKBBH3o4bx6lezUkO8BI9uZgnjQ2h/ZgLVall5GiPFnKXxMSoVHOo+1KuPwO585zW6bOVOPF5XWXHeHuV3NAtLTwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752335286; c=relaxed/simple;
	bh=yR6+K+/xt2bwbAyK+FbK/NzX9qXSQxVGb/CLrbWR07U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HighYYJqKfq40litMFbnumQ7aLJJg1YyppD9dcIWnEVJ93yt1zkON//Pt4ZyII86sVf+AHYk4WgPeKgvxhg0PRKdw7wop/UbUR3JPHr2JeO3LKrfIP7RW+tmlsJLlh/F37i5aTjDXAoPHxy0sPKsEMzhFA4yGbjB/LY9ZC4qeKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJQIV14C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13025C4CEF4;
	Sat, 12 Jul 2025 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752335286;
	bh=yR6+K+/xt2bwbAyK+FbK/NzX9qXSQxVGb/CLrbWR07U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gJQIV14CLha14leo9AStZtajuGJnrysbworl+h7lElAlJMbu0AClOchB1FkRqkUqc
	 1WZvN/p25iXKbcOH8VYqjdvYn0tjYzBCWQQwmk/li9Ai0AC6xfeK9vDfkVYWbOOLAV
	 wDK/MyxTscsWH2vgpLqDZN44t8j/bDa11/qdwq15ZVEAKXDRoyIGvbXl6N5ryRjvgG
	 X1vRT/y27fOIz7JKdGp4bGC+JEOZ364wy0SDmMGo6AwU4eD60RG7UkmVlvy76ZtCpS
	 yksk19n952wjpd0Fs3fkUpBDWYu0OaCaItcPTKCdlS469liEQp8K8eYq+m2M9YzNcV
	 WbMr/aIgcpxkw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so27555501fa.1;
        Sat, 12 Jul 2025 08:48:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuugf8z1hTx6xqAn8e09gRdBLq14VEJWyPY790R0FFeybrEUYDn5GDC7sgJdVsqJaS08Hfb0LlTPSNkxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGK5Lam/ThOBgwaeJfb9SrhT+Cx8CD14tRhUob2ECKT3lI55bc
	g2+8CI2u3qbGChrhMLg6c6n37D9plPId6aeJNt+1vYChQmTJole9udIPG3Fc5px5UtADi96X4Od
	wflhmDEOIL6sBxmSExydg0X1YuSUvkNM=
X-Google-Smtp-Source: AGHT+IHEFQxHjvuLx5GW0KP8Ss6adyVXWOsvXdFJYK1T2ZuLqnHM9WuCWqh3OL7273VpJiuLWsvO+kdF8LBhv9bUIhM=
X-Received: by 2002:a05:651c:154a:b0:32f:3e83:437d with SMTP id
 38308e7fff4ca-33053324cb6mr18470311fa.17.1752335284724; Sat, 12 Jul 2025
 08:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711162605.545514-1-jeremy.linton@arm.com> <20250711162605.545514-2-jeremy.linton@arm.com>
In-Reply-To: <20250711162605.545514-2-jeremy.linton@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 13 Jul 2025 00:47:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQM02RBd4M5QgNTNKNaAYKGaPUSgJRXwq=Pq3OA5dYMRQ@mail.gmail.com>
X-Gm-Features: Ac12FXw77YX-rQwchRCSxixXac5i-EgEnLrBIAycVVpWcrIA4UFzTd5l8wYvcwc
Message-ID: <CAK7LNAQM02RBd4M5QgNTNKNaAYKGaPUSgJRXwq=Pq3OA5dYMRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] scripts: add zboot support to extract-vmlinux
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2025 at 1:26=E2=80=AFAM Jeremy Linton <jeremy.linton@arm.co=
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
> ---
>  scripts/extract-vmlinux | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
> index 8995cd304e6e..049bab337f0e 100755
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
> +       if file "$1" | grep -q 'Linux kernel.*boot executable' \

Sorry for my nit-picking, but I'd like to get rid of this back-slash
by breaking the line _after_ the OR operator, not before.

That is,


    if command1 ||
           command2
    then
         ...
    fi


rather than

    if command1 \
          || command2
    then
          ...
    fi






> +               || readelf -h "$1" > /dev/null 2>&1
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

