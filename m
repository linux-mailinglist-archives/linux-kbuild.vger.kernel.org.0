Return-Path: <linux-kbuild+bounces-3484-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A1D971D27
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2024 16:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E95781F23F6F
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2024 14:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFA91BAECD;
	Mon,  9 Sep 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXAP1CS8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7D1BB6A4;
	Mon,  9 Sep 2024 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893489; cv=none; b=Wba4F5HZ2BksMblDDbUZWw8DE3zDL/NwUgwJHTVaYtP7PhHeiwkBMp9xijxKMbhqiM0XSDHHJUUfg+fz6GxA/zYI+zP/lT5Y+j+H8hosbhF13soGmofeSRjE8Iycz7kj6VKxUpgBswvw+VRFG3OJ1ROlu+HwmkaXQn7U46I4hFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893489; c=relaxed/simple;
	bh=DF7l0ZAodAlVQRFR8W+bqjUxs6Y6CmKuJNvvpqpBklY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/gNFz1wSute69utHL8BtyOvvTrJPx1BNeKKF7fE1ay92HBrl/NZKLvG2uUFVKRE9GmP9BkNQhK7qay8edTQCvyXvLmcKBBUblb8nMQaA/hcQyzz+rCd0e+vQMylAbw3ZxBU7Z2eB91JF6xNb4BUpSvpuGZXyzP1xm/skgztEQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXAP1CS8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD55C4CECA;
	Mon,  9 Sep 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725893488;
	bh=DF7l0ZAodAlVQRFR8W+bqjUxs6Y6CmKuJNvvpqpBklY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nXAP1CS8qXc4kPy8tX5zb9bA6R2SmBxDE7kO1rVUB+3AnY/NNGz6WQYvCYi2vNu6f
	 1lR29sipFNwB5zcg3ButLgvBmlinpbox08xV5D4coHCSyq7TyMB1GiWL5mkoZsCQHd
	 vwdrjss+qpbLUWBSQEKyrQiFQ3N9GxNfqL5XkGDDpyVWEm40YFcKcwi6h94vYh+4t0
	 ICf6TKk8Ba97qWhwwD5iiyLfplfLcGDHddNsZnPTOdnZoU1Fj7Mwn3t2/xkmlvbYNQ
	 rp+7qc5anI3xVlLdtTS7J5trSp89hMflltseyaUYuJq7HmdmCqXW4j/hLvN7DMTVjT
	 U+1sLYHm5Ishg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso28994331fa.0;
        Mon, 09 Sep 2024 07:51:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUC9Dx9BGoQbGK9AOVe497TC6dgdw8PFZ7mhbxAc7gzmPEf6bQiOfIvWXINTGhw/SLI7wpCR6yfYBWrGMc=@vger.kernel.org, AJvYcCX4Lfaj5b/aP8mtPlh6PGIM3YNZdLAJO3RE0XTJjp4ugUHscTouzATyXVasY3a2kpFgCxbflzBlkSUyB3V/@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1BMbhBVgFL9MlyoA5eX9vp1/A+3wAsUlchTf+cuHW5mDnRbn
	Y0T7+/3lqECZPpVU8V4Zke+CX1bhBmNtcm+6Uuxw+AlhJNEFhuf099W0OCnC/cpmJjC07ccEpuA
	WCS/8AgEnc/z1aY/odLz88mIuyRE=
X-Google-Smtp-Source: AGHT+IE8pINKv0/+6etqVWidVRKRETE7Mb9FU22ejdEQDy/MtDTOc5W4qZYxq+IQbv5et6y/4g6QZY6In2LHNnu4uoU=
X-Received: by 2002:a2e:be0e:0:b0:2f7:5d53:7198 with SMTP id
 38308e7fff4ca-2f75d5375cfmr55585491fa.7.1725893487246; Mon, 09 Sep 2024
 07:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908-kbuild-cmd_ld_ko_o-v1-1-a4afc3c2d47a@weissschuh.net>
In-Reply-To: <20240908-kbuild-cmd_ld_ko_o-v1-1-a4afc3c2d47a@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Sep 2024 23:50:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS98Jy9mHm5yXaZuvJLFn9W2Nz4uEo0q0Z55tcC4=S-Zg@mail.gmail.com>
Message-ID: <CAK7LNAS98Jy9mHm5yXaZuvJLFn9W2Nz4uEo0q0Z55tcC4=S-Zg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove append operation on cmd_ld_ko_o
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 8, 2024 at 10:26=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> The append operation was introduced in
> commit b1a1a1a09b46 ("kbuild: lto: postpone objtool")
> when the command was created from two parts.
> In commit 850ded46c642 ("kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG")
> however the first part was removed again, making the append operation
> unnecessary.
>
> To keep this command definition aligned with all other command
> definitions, remove the append again.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Applied to linux-kbuild.
Thanks!



> ---
>  scripts/Makefile.modfinal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 6b1b72257b29..1482884ec3ca 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -34,7 +34,7 @@ $(extmod_prefix).module-common.o: $(srctree)/scripts/mo=
dule-common.c FORCE
>         $(call if_changed_dep,cc_o_c)
>
>  quiet_cmd_ld_ko_o =3D LD [M]  $@
> -      cmd_ld_ko_o +=3D                                                  =
 \
> +      cmd_ld_ko_o =3D                                                   =
 \
>         $(LD) -r $(KBUILD_LDFLAGS)                                      \
>                 $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)              \
>                 -T scripts/module.lds -o $@ $(filter %.o, $^)
>
> ---
> base-commit: 4dda2081d84398248af60da1d519840a5d6e3390
> change-id: 20240908-kbuild-cmd_ld_ko_o-25bd49b384e8
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>


--=20
Best Regards
Masahiro Yamada

