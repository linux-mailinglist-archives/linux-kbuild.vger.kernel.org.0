Return-Path: <linux-kbuild+bounces-2335-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 909FD926421
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 16:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13C82B22F1C
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 14:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154F817DA37;
	Wed,  3 Jul 2024 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1yahi/N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048817DA07;
	Wed,  3 Jul 2024 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018703; cv=none; b=Ca1GvLJjtSN6jJ/84NfxS2rOL1lN4686RAVGX579F/I/386yhYczRvYq4CbM+R4aE9/7xu64qmXE/n1sMeSactT/X57dTqqCWQcBsYmw08RG/eRFOJl23HiFKLcOjfsnpSLolWLL/JDhLqa2SRXZXEiKYIdcjOxMrLPJ3UT6BG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018703; c=relaxed/simple;
	bh=qa7YXYPkWSBjUhMHJjiWb0aSqBHJAQZrfgoUFA+GgQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPokmv6cjSWuUjZjN2TP0emgeZEIJYFTrk/5tryXDbqUSbe620LdTxQr1bAywety7FkpMy8U7XRfNt+s0hAYDsNrGQfEiEA7nNhbfx3YAvKxPLtuGiDFU9ECe8OHbkH3noFUnmPLVMpX3o2RnvV/1UVATqEUGmZs5ZBfULUXySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1yahi/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF6FC4AF0E;
	Wed,  3 Jul 2024 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720018702;
	bh=qa7YXYPkWSBjUhMHJjiWb0aSqBHJAQZrfgoUFA+GgQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o1yahi/NbS7nVvszNnEzw1iQYEogqCgRZYhyNvzB1p4Gire7ZYRgLvDRzohamm9jG
	 c1dYoZKdN8q8AYBkQiXTpwQkGAImP2H3j52bLOONfFQhY6Ef3sa2qNhBdiKHyh+LOk
	 MgVApYzCskevmn8fT4jBMwJYTVHu9656001165TjkT8FDX2wLMvgiS4MjiVOS4GrEx
	 DFMR/1Jiv3j58YYvDzCMIdoMA8UGANVmfvMpSeE3GVvQcXama7kAQLOin95DNZlqMF
	 mgNJg06k8HeQ7bkYwPPTeAunSERAcbdosDu9COwDLSuEoxdOqv5N6nFe9uEsOhgLpm
	 QCWrLckXaAfEg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec58040f39so53125941fa.2;
        Wed, 03 Jul 2024 07:58:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YyCDfhG3a1X8oixHXhwU3BmNiBjwTdrEDjV8HuAPm+F7ZQ9Et3w
	r3hlskVx1I4tAqR54Ktu7QS44KjgTOUL1sw3Ijm2i9H6NJVdD3z2uzXAP93olYv3QPwYYMyTB5Y
	y60h4GmRFDtLtfSq+6xk9WdPaKok=
X-Google-Smtp-Source: AGHT+IHSZZ4epKlkRdl3ElRtcgNGw7rgl0GSRQZ8G36CRua8nl0i0VJzjvqv+0zTLXSlc6KBw6NG+nEzaxgD6dduda0=
X-Received: by 2002:a2e:9c51:0:b0:2ec:1cf1:b74c with SMTP id
 38308e7fff4ca-2ee5e6cd6f6mr66064781fa.32.1720018700920; Wed, 03 Jul 2024
 07:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702180332.398978-1-masahiroy@kernel.org>
In-Reply-To: <20240702180332.398978-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 3 Jul 2024 23:57:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS1jz51ytG1fu3tvUp-iNYk8UzwE+q5ioS1TP0tM7Phkg@mail.gmail.com>
Message-ID: <CAK7LNAS1jz51ytG1fu3tvUp-iNYk8UzwE+q5ioS1TP0tM7Phkg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: deb-pkg: remove support for EMAIL
 environment variable
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Riku Voipio <riku.voipio@linaro.org>, 
	Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(+CC more Debian developers)


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

