Return-Path: <linux-kbuild+bounces-2555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858AF932241
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 10:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DDF1C21BC4
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 08:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986D66F2F3;
	Tue, 16 Jul 2024 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uagCpzEK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC0541A8E;
	Tue, 16 Jul 2024 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119993; cv=none; b=ZirQ0DFTCigiYyHm/kW/QDgXwE59bJygyeX2AvZMWC/849rWJ95AItTdthL+ihvAzja0TTaL8IppH9oZ+BCPkQqRaLxzc6on8klbO6Q1tVAxOUJ+QW34rvC3epOGgE62NuYfoOi1skdoEcMl6SCe2x6WzBOrkwBbR0mXTG9C7yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119993; c=relaxed/simple;
	bh=Duwy6mw0bj8ufU3evyv9PTkwvW86HTH9c2zpDypTFqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPKxsOfGqh1JsMfwbVH5UA4BHw939yaHQ2NBbORDZ72/9geAthyYcdiWVnEcqVWcmQEAgfj1LsR1u0mkmGIKHW9eq3hUQWCJMcgFwjOdZ+099L7VhZjotB1Cj0dPYhBL06BhGYdXaiBLLT5nrIeEIaVPSdnaqe5Jmsbr9y50zaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uagCpzEK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E142EC4AF0C;
	Tue, 16 Jul 2024 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721119992;
	bh=Duwy6mw0bj8ufU3evyv9PTkwvW86HTH9c2zpDypTFqQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uagCpzEKDCCpm9DIVWwkuEkFexjai3nw86k/Eejvvxe6+h+GCstP3KXQle+jb1OZo
	 qzHkqdFXQFiEpTGmMxLKe3qqi24/KhVb4OuoEasnaz/IpZZPjDF/wXHwgAWtb+KZuB
	 9PHRPcxYoTLkzJOw+K1WHY/tHeraxl1boiyoWKkN1SJiwF86677jSujw3s2YaKzhWU
	 MrITVaDt7NeK0mzOXI+URMkDi1J5XjiI/iHl+PD5YNzOEPAYzJt4wHZPk7GDM4T5wZ
	 rpZCytm88YJTJlk1V5YcJ6Z1xP6l8ci7il/MAfP3lusl3Z7/4rHCbN1KrNsiqWCy1M
	 FBAUwOU6pTtHw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea34ffcdaso5540411e87.1;
        Tue, 16 Jul 2024 01:53:12 -0700 (PDT)
X-Gm-Message-State: AOJu0YxNX6GRytg0Lp8xu43RIcF48CFgCDOgRMtr6CneacleQlbaAqge
	0WWmSS6tot+Vfr8fROJjLv7XSXTSk3hatf7AdR+U+SimEHtI2/9hl844WmVHAGTnJNdHbDRUjDE
	ZLgQZjCcZZgexHjMWa2WnR4i0oY0=
X-Google-Smtp-Source: AGHT+IFj725Z/FEy6D+aiS/NVNWOXXBYzw5d9BJ2QS/maRfiQn0JBVu64f1W9vms7vot15OZax+1Th0mAPask/wJhek=
X-Received: by 2002:a05:6512:1293:b0:52c:df9d:7cbe with SMTP id
 2adb3069b0e04-52edf019616mr986801e87.39.1721119991533; Tue, 16 Jul 2024
 01:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531122825.699771-1-masahiroy@kernel.org>
In-Reply-To: <20240531122825.699771-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Jul 2024 17:52:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnLX6xtZRZhNyRUPVSUXixAxTapCOjVvTrTO1gCZid5Q@mail.gmail.com>
Message-ID: <CAK7LNATnLX6xtZRZhNyRUPVSUXixAxTapCOjVvTrTO1gCZid5Q@mail.gmail.com>
Subject: Re: [PATCH] usr: shorten cmd_initfs in Makefile
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 9:28=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Avoid repetition of long variables.
>
> No functional change intended.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  usr/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/usr/Makefile b/usr/Makefile
> index 132ef7e96e6d..75224d927025 100644
> --- a/usr/Makefile
> +++ b/usr/Makefile
> @@ -62,9 +62,9 @@ $(deps_initramfs): ;
>  quiet_cmd_initfs =3D GEN     $@
>        cmd_initfs =3D \
>         $(CONFIG_SHELL) $< -o $@ -l $(obj)/.initramfs_data.cpio.d \
> -       $(if $(CONFIG_INITRAMFS_ROOT_UID), -u $(CONFIG_INITRAMFS_ROOT_UID=
)) \
> -       $(if $(CONFIG_INITRAMFS_ROOT_GID), -g $(CONFIG_INITRAMFS_ROOT_GID=
)) \
> -       $(if $(KBUILD_BUILD_TIMESTAMP), -d "$(KBUILD_BUILD_TIMESTAMP)") \
> +       $(addprefix -u , $(CONFIG_INITRAMFS_ROOT_UID)) \
> +       $(addprefix -g , $(CONFIG_INITRAMFS_ROOT_GID)) \
> +       $(patsubst %,-d "%", $(KBUILD_BUILD_TIMESTAMP)) \


I dropped the last line because it will not work
when $(KBUILD_BUILD_TIMESTAMP) contains a space.





>         $(ramfs-input)
>
>  # We rebuild initramfs_data.cpio if:
> --
> 2.40.1
>


--=20
Best Regards
Masahiro Yamada

