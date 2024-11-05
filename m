Return-Path: <linux-kbuild+bounces-4516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B03EF9BD974
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 00:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E24531C2276C
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2024 23:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0639216A0B;
	Tue,  5 Nov 2024 23:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmv4zGu2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F4F216A06;
	Tue,  5 Nov 2024 23:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730847972; cv=none; b=U9AsnQZ8G1TQB57DDNF/A4+a6XHXvWVaA7mAA09VhFPKc6EZByCgeF/tUQdPPJ4zQ7ftf0E/clmm7HL92uP/3aHa/+9mhXGHUiy60odb8mTpi9foDZ75RFEcuzzixzwq5RAsX3WSvEHI0/OOnY+Cl7VUhnCYgD5lIUpNFpXpD/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730847972; c=relaxed/simple;
	bh=fWyIVQYeO9LFOt/x+1Gvacl48Hax2bB46VZgQtVWuSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUsH+8cD7gbWlV3un49YlN6es5jYPrZvWwP90vh+XimmTiq7AsXVps3vn7o1HPb2fptC6k7hfK7e1UdUiOzCNBHD5wT/JNFh12dGQaA8Njuo/wzJsIco9SlXcnYGWB87t7rLm3CzipOo8qjiVvV3GXYlnTerHeMB2RKvpf5P0/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmv4zGu2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B53C4CED7;
	Tue,  5 Nov 2024 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730847972;
	bh=fWyIVQYeO9LFOt/x+1Gvacl48Hax2bB46VZgQtVWuSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hmv4zGu2sfloqdMmcxRnuYoZbUjDOENtwXSynXnuYfN1EYJCj/PfqmGEk6YZGHkvM
	 2LMWDosmCGjTH7Rsuw/UxsOqXot/Z5ppKBGtVmnCvB1eEJpXj8Qm0tM6J715E5vXe4
	 Am1dT9vKqpLSgWYvzCsYgMEdtpliaJxc9LWbfW0/2YtVH7JFwCmk3lnki6RjprEGzC
	 Bi5dPwioNxSgBdfREjRF9yozRuk/OA0qQ8GFTbMVCr3/O0/VZEVnahLNEMj6ve46G1
	 vEb73e/ayqe5JFndVzBrJLeCNmsB+Qyq6ykqORA/b+79lb5swI/dYjMMsLP1zkMWDP
	 E3GQPffwcSalg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539eb97f26aso3962561e87.2;
        Tue, 05 Nov 2024 15:06:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/2RyMDbeXzS55p7fO3x9piRDW2ftB7LgNBvKwUU6ojfl1OrzXNMmRWwGGP8ZMNm36y4bh26kxUGenwms=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDRi16e23Bk3OAlCAspvc5BM+8hYyqMHMIF/Z1Vkvtse4XWWuf
	7pLyujJalrLuwsNHhB4meSaWe2vs+giFZ13h4xxRVqjd//X/TSXQrf4ztyvTaI1qB/PLpohQtZ2
	53z1G99j8zVkkK49O3yR5ikInQZ8=
X-Google-Smtp-Source: AGHT+IEt7dvUIEHdCd8ucRt6ZkTTXaRFuxWOKHrcHFtfM391VlsqQ9KP3PDZPdwmEhDaLJxNCnekOJ1yz1Eu2kMIRA4=
X-Received: by 2002:a05:6512:23a0:b0:539:e58a:9704 with SMTP id
 2adb3069b0e04-53b7ecf3f43mr13284780e87.33.1730847970854; Tue, 05 Nov 2024
 15:06:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com> <20241014141345.5680-3-david.hunter.linux@gmail.com>
In-Reply-To: <20241014141345.5680-3-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Nov 2024 08:05:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNARPGur7bYwL2VnQR+rfBM=B5AZAHZBn9rSHU5_EnYRf0A@mail.gmail.com>
Message-ID: <CAK7LNARPGur7bYwL2VnQR+rfBM=B5AZAHZBn9rSHU5_EnYRf0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] streamline_config.pl: ensure all defaults are tracked
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:14=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Track default options on the second line. On the second line of some
> config entries, default and depndency options sometimes appear. In those
> instances, the state will be "NEW" and not "DEP".
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
> V1 https://lore.kernel.org/all/20240913171205.22126-4-david.hunter.linux@=
gmail.com/
>
> V2
>         - changed the subject
>         - changed the condition to be more in line with the script style
> ---

Applied to kbuild with the typo fixed.
Thanks.



>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index a85d6a3108a1..85f4712e2bf3 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -220,7 +220,7 @@ sub read_kconfig {
>             $depends{$config} =3D $1;
>         } elsif ($state eq "DEP" && /^\s*depends\s+on\s+(.*)$/) {
>             $depends{$config} .=3D " " . $1;
> -       } elsif ($state eq "DEP" && /^\s*def(_(bool|tristate)|ault)\s+(\S=
.*)$/) {
> +       } elsif ($state ne "NONE" && /^\s*def(_(bool|tristate)|ault)\s+(\=
S.*)$/) {
>             my $dep =3D $3;
>             if ($dep !~ /^\s*(y|m|n)\s*$/) {
>                 $dep =3D~ s/.*\sif\s+//;
> --
> 2.43.0
>

--
Best Regards
Masahiro Yamada

