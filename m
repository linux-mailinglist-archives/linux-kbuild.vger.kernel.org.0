Return-Path: <linux-kbuild+bounces-2337-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886C926635
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 18:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D82AE2839FA
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 16:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C88181CF8;
	Wed,  3 Jul 2024 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZYqVMuf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC2178CE4;
	Wed,  3 Jul 2024 16:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720024456; cv=none; b=ltLlZn7QvMPtrVhq5wdjzPOQe0mUEgL/P1ICnpiF+YXphS6NALEjuavSZL7dZerTnNcCe+sOnYfv6G3msxkCaVhDvG5w9o/uPbgjF2ZNkt6NqOf9CUZGsYDfWcO+mVhnuoErSsL7t8K1TL8cn39Tm5VvLTp9I7cc4L4VCefAMb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720024456; c=relaxed/simple;
	bh=UsH0uyFFJuWMRA8h4UVWxmUODotXvc/FJav4ihKlVOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StHC2vDAiJkoNufLYgcfMdgsVsG8HPikf1uFJoKKgVEXp0xs8UPZcJl4DDfTxWNLT753p/ySinnBbwy7gF5nBgT34x20/mlWprgDPIhL4HBSXSRONEjYZmmlchOA9JPkCdttJ8TEB3xts34ZQ+P+LGdwvwRJ1my35JDSDM1GoWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZYqVMuf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5487CC4AF0C;
	Wed,  3 Jul 2024 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720024456;
	bh=UsH0uyFFJuWMRA8h4UVWxmUODotXvc/FJav4ihKlVOU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JZYqVMufvh99j8ThjCupNDbAJORlRC3Q89+5Blws8LCNnJwJJ7cCUwnBAJt2Uwe1o
	 IMMDQamSOCfBC7d8G+cJ+T02notAkIZv5DMQk6pDr4+9Gc9HwR3rBHWQ6fvWXQ8ajm
	 Kq263ijCO6x/V2FqFQMOLZ3K3hRbfoG9HeeOUBUOXrJy2ndAVQrZvw3ECKrfZsDq7y
	 P3S67QYRrg7GKcxDhRywNFOx4YFbNFe+qdJ7C/33vqefP1OISTgGU4+FWs3sT7FL+s
	 1nXZ4Dxl8nqI0OydKEVkGZepXUEpZ/ItUjRjfP5+p9DSa7sajOqw8gSltIKg4XlS/o
	 9vrFLaQOMrUkw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so68528391fa.3;
        Wed, 03 Jul 2024 09:34:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YzKd36v5jpiDXyKz6IvkpGo0ufTQd6Xo4OWSv6axsQtuD11WRU2
	i5R4QSOSouKMHV0J9h+n62kSj8MnlJmx8A2hAKBsiaz1HCefwsggIgDwNM+zjiWGm2XPBc0WhE2
	5j88grAfAq4scdBnuDhJO4F9jck0=
X-Google-Smtp-Source: AGHT+IE/s7Hv5eS6S99soa6W1JF08EOjFSL7T15BweSOghruoKv0ZG+qomq0Gfo5/efe3sTnf7lt1FcO9Nkb7u7rhuo=
X-Received: by 2002:a2e:a989:0:b0:2ec:54ec:1741 with SMTP id
 38308e7fff4ca-2ee5e36d166mr97983931fa.18.1720024454985; Wed, 03 Jul 2024
 09:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702180332.398978-1-masahiroy@kernel.org>
In-Reply-To: <20240702180332.398978-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 4 Jul 2024 01:33:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNASw=_hbZ3LfyfRpdD=igBJxAm5kh1A8_Fv2XvNjGA9_6w@mail.gmail.com>
Message-ID: <CAK7LNASw=_hbZ3LfyfRpdD=igBJxAm5kh1A8_Fv2XvNjGA9_6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: deb-pkg: remove support for EMAIL
 environment variable
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, riku.voipio@iki.fi, Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+CC


On Wed, Jul 3, 2024 at 3:03=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Commit edec611db047 ("kbuild, deb-pkg: improve maintainer
> identification") added the EMAIL and NAME environment variables.
>
> Commit d5940c60e057 ("kbuild: deb-pkg improve maintainer address
> generation") removed support for NAME, but kept support for EMAIL.
>
> The EMAIL and NAME environment variables are still supported by some
> tools (see 'man debchange'), but not by all.
>
> We should support both of them, or neither of them. We should not stop
> halfway.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>  - New patch
>
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index b9a5b789c655..589f92b88c42 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -125,7 +125,7 @@ gen_source ()
>  rm -rf debian
>  mkdir debian
>
> -email=3D${DEBEMAIL-$EMAIL}
> +email=3D${DEBEMAIL}
>
>  # use email string directly if it contains <email>
>  if echo "${email}" | grep -q '<.*>'; then
> --
> 2.43.0
>
>


--=20
Best Regards
Masahiro Yamada

