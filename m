Return-Path: <linux-kbuild+bounces-2136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6110909CCE
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 11:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9898C1F214D3
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 09:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20236161924;
	Sun, 16 Jun 2024 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mg5PHFol"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD4E14AB8;
	Sun, 16 Jun 2024 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718530793; cv=none; b=jfoz2v/X6IuWM/zPzXCFllkS8GYkptXJ8mfrMoYXgdidap1Dls+kjCAW1OHglWOBJId+mUGkSEOxTv0b5JClmbCznQnb+nYT0e3ZXmIFHPowVUQxnL8sskuT6EBeleX3kHa8C2tyj4iXYcDGdh5RGMKIBw5KgPXs1LZ8owStxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718530793; c=relaxed/simple;
	bh=uWXgTRFYGMtbo6aA0cLiFCto7KhwUVK/QLo1YhFqVDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMhD6/usGQpY/fm4FDW5JIQkOo3l1hp8rAauZgywDZIZ8XeYrBq1QW468XRKlADK+dqkSvoShSE4yaEXS37eepBjhl0pO/41TtDXjygcVZgMY1VEshXV9ulkOEmU2tEcxVEdLto4UhSzn4ngwC3sZBzACYQ2NdBrz33jZWiG5CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mg5PHFol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70539C4AF1C;
	Sun, 16 Jun 2024 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718530792;
	bh=uWXgTRFYGMtbo6aA0cLiFCto7KhwUVK/QLo1YhFqVDw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mg5PHFolQu/RQ11aPODW4CvKyxlmTo0qrAtG9NmeyxdcpIASrGC8pdtlRUzO8tVyD
	 dJHD2axGKHrcnskYhMtlBdEnQCcXzyQ53Gm5gRK1RwEg5u6C6xhw36xdz7Z/XBbbxi
	 E7A/BuYDmP2H/3Rv2BAvzWQueaoav+DerOakH6MGaL3ztsySGFl2eiOa9JXJCWFWlU
	 RlqjcpsaOTtm3mvHZrWS/V0N+m/amlrPkA0zHPnnpqvQ9E9ETlYCjwRcLbv+huSiR4
	 o2Kr+i4vLMBPiZN+2Ty0Am8Ok6OUgPrBCpyPp5ctmThmZrAOHXz1iGGpqd85BCT016
	 7SXrIUiy6AKsA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso46658781fa.0;
        Sun, 16 Jun 2024 02:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCNgDph/DZR23cxNntPzeIMAt5FjXWLy6zseiRRQZtW7m3sogP8DF/fvvJtL9JHlmZrE9qMu3lQgEirxuZFbV7drMqPjaIQ1cvcXv5
X-Gm-Message-State: AOJu0YwTkHWXEh+t1RU/Ct3AdMxqY+mY7QWlYm9sozz/kC+Cmk6TYFWw
	HAi31XPYWtOzMrqUvHfdR9r39oberDiva66y8ASjzK/eT6yaKf9WspHWgNAwnbC2Zcva95TlApl
	txZtlVSoT2/fhiiE2QkF5BiyCYLI=
X-Google-Smtp-Source: AGHT+IG6wBxdkDXxiLw+43GSUyefk7fCsnPd3qWG9KRDR7zXhY9l1ymNB/DkCjW3orom3Hi/P0aRVXE5TUanMmXFlXI=
X-Received: by 2002:a05:6512:4cc:b0:52c:8a1c:74c with SMTP id
 2adb3069b0e04-52ca6e9142fmr4582063e87.46.1718530791080; Sun, 16 Jun 2024
 02:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9811ea10d647ff687e140976ec50c5ebbe5ecbe5.camel@mastodonlabs.com>
In-Reply-To: <9811ea10d647ff687e140976ec50c5ebbe5ecbe5.camel@mastodonlabs.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 16 Jun 2024 18:39:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATR8NpxaBoJyPns__=pn8G_-8uOJZuB989R5q=7afO7Dw@mail.gmail.com>
Message-ID: <CAK7LNATR8NpxaBoJyPns__=pn8G_-8uOJZuB989R5q=7afO7Dw@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: Fix build target deb-pkg: ln: failed to
 create hard link
To: thayne@mastodonlabs.com
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 2:34=E2=80=AFPM Thayne Harbaugh <thayne@mastodonlab=
s.com> wrote:
>
> From: Thayne Harbaugh <thayne@mastodonlabs.com>
>
> The make deb-pkg target calls debian-orig which attempts to either
> hard link the source .tar to the build-output location or copy the
> source .tar to the build-output location.  The test to determine
> whether to ln or cp is incorrectly expanded by Make and consequently
> always attempts to ln the source .tar.  This fix corrects the escaping
> of '$' so that the test is expanded by the shell rather than by Make
> and appropriately selects between ln and cp.
>
> Signed-off-by: Thayne Harbaugh <thayne@mastodonlabs.com>


Applied with
Fixes: b44aa8c96e9e ("kbuild: deb-pkg: make .orig tarball a hard link
if possible")

Thanks!

> ---
>  scripts/Makefile.package | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 38653f3e8108..bf016af8bf8a 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -103,7 +103,7 @@ debian-orig: private version =3D $(shell dpkg-parsech=
angelog -S Version | sed 's/-
>  debian-orig: private orig-name =3D $(source)_$(version).orig.tar$(debian=
-orig-suffix)
>  debian-orig: mkdebian-opts =3D --need-source
>  debian-orig: linux.tar$(debian-orig-suffix) debian
> -       $(Q)if [ "$(df  --output=3Dtarget .. 2>/dev/null)" =3D "$(df --ou=
tput=3Dtarget $< 2>/dev/null)" ]; then \
> +       $(Q)if [ "$$(df  --output=3Dtarget .. 2>/dev/null)" =3D "$$(df --=
output=3Dtarget $< 2>/dev/null)" ]; then \
>                 ln -f $< ../$(orig-name); \
>         else \
>                 cp $< ../$(orig-name); \
> --
> 2.43.0
>
>


--=20
Best Regards
Masahiro Yamada

