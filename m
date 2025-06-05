Return-Path: <linux-kbuild+bounces-7373-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC4ACF885
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 22:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A19E318961D7
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 20:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C78154769;
	Thu,  5 Jun 2025 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l12rvYzH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EA617548
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Jun 2025 20:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153791; cv=none; b=PRbngjnEXpFm6fWY/Spl1zQyVFiywuaBooH6ToW+SZcQ1QBjTKNZoFlKY6M8gNfWM1zIIfY4rmdPPGRpGKJ/K+Ttb0mGT4ptan32oQ8+HKRPAQd4NUZsAP4007mmpNZpwMwxgvLtHQuH0LfGsLP7LQdy3OZUzUYw2a1daT74MxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153791; c=relaxed/simple;
	bh=6OnW39RvVPaKW4TiUPeuC0cCUBlmfvD9hYcqehEwIFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WP+cknP4F4UCE4f1kUbgmxggf8sIfU/EdFsj24yHXDyI7xpwivhit2/OQ/5z4M1kNte0iJSsdxf1pE1E3seVNNeYjhHCYNsRMO1bNnuQnWvPGZaZA+vyuJpLT1NruBWV8rXZ9HkRNf7lU1wFscXjEUiu2g3f0cOWFpR1CfG+a5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l12rvYzH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF76FC4CEEB
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Jun 2025 20:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749153790;
	bh=6OnW39RvVPaKW4TiUPeuC0cCUBlmfvD9hYcqehEwIFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l12rvYzHoJ4q6Z8T2YJsPl+8jLQLuQFCkCbuXknZ9HEKo9DpjIa4tQ+33HZWLexIE
	 35hTVuOp2LwRKsjhJ5zsOuVGgk5KwKH6N8J32+4UtKBKZ/UGSzFQu74f/5oyR2sIma
	 N+YS/IhfFDVySupoqZGVNe/ifuoPfBRG4MkkxrJcaYgy3ydGi3qHTyadvZ2DyMo6pG
	 f0C2dRRhRr94GGSw0Ds6UHppJKxHHvrInSM3bXQWRgvP2fGjgzvcrB+j4+H8hF4/4q
	 FCj6P9TI2kG0R6I6NPISj3r3oRRLEBzGkGbvLelHeg9h/h/LqmCxtWhiVDkDDAJ9PQ
	 Y7WBK9tMqDhXA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553246e975fso1586392e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jun 2025 13:03:10 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyd1yJ8LUiB6u8GvsLVSTB3y7fhc8+XB/912uFIhZ6BfIQOOh3r
	6mnPBYo8Eq7ZSHSPYTeb5eVMe1ZpYwVNSGNA/+1nFu3K/ApLT8xpdgtU79Rv3xPga03dsL3t3Yn
	Vm/n7FezUEvrkzEg+KOUhpoR2GoicFAQ=
X-Google-Smtp-Source: AGHT+IFfoaUr8OdJs7VNoLHAFOy/1W2L1Pnra37JWihrw3ZTHnhlQIpaKBHwmA7lIO8d6aMGTLHGZ4j/T1egZCWpPNU=
X-Received: by 2002:a05:6512:3daa:b0:553:28f1:66ec with SMTP id
 2adb3069b0e04-55366bf8794mr116089e87.31.1749153789439; Thu, 05 Jun 2025
 13:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529194633.3029895-1-yamato@redhat.com>
In-Reply-To: <20250529194633.3029895-1-yamato@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Jun 2025 05:02:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASeTNoeWfEh=OVY=yAp0r0psDtEk3OMrspOC=O=HC9+Ew@mail.gmail.com>
X-Gm-Features: AX0GCFsrSPHWeN8Pc5-oeR2ABnTImvaL3xN0ecXaiM3uaQ5kF9fczo_moZIJ1j4
Message-ID: <CAK7LNASeTNoeWfEh=OVY=yAp0r0psDtEk3OMrspOC=O=HC9+Ew@mail.gmail.com>
Subject: Re: [PATCH] scripts/tags.sh: allow to use alternative ctags implementation
To: Masatake YAMATO <yamato@redhat.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 4:46=E2=80=AFAM Masatake YAMATO <yamato@redhat.com>=
 wrote:
>
> Some ctags implementations are available. With this change, You can
> specify your favorite one with CTAGS environment variable.
>
> Signed-off-by: Masatake YAMATO <yamato@redhat.com>

Applied to linux-kbuild.
Thanks.


> ---
>  scripts/tags.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index 98680e9cd7be..99ce427d9a69 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -344,7 +344,7 @@ case "$1" in
>
>         "tags")
>                 rm -f tags
> -               xtags ctags
> +               xtags ${CTAGS:-ctags}
>                 remove_structs=3Dy
>                 ;;
>
> --
> 2.49.0
>
>


--=20
Best Regards
Masahiro Yamada

