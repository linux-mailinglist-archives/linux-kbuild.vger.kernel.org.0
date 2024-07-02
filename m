Return-Path: <linux-kbuild+bounces-2314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D139239A3
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 11:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B763B240F3
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 09:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45578156675;
	Tue,  2 Jul 2024 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1dm3YN2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0E1156641;
	Tue,  2 Jul 2024 09:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719911820; cv=none; b=ZyXS7l8Su/FAFncSUp5Juhp+oPgULC/1GY3umyJgCfbUqCMn3tVS7WkeJCUxCNrTNBInoC1/6AhreBFn2MektBlvVsEObXhTjspZyYbcx4qgr/aDhg6dT4S7MHeVJjLIzernNLSpqXIR9cdGEZoxTHVEe53HJHE2yIbtqE2tQCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719911820; c=relaxed/simple;
	bh=A95+J/M+hBp0B3YAI/nsGZZXz9ZcUwI13nO0P8PUUhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtFRPO4yLfZd81loLxKMJT3qT497eIDQrDxyI+xt+1LP8PvKJBDyhxYt0OvAEQcbMTKcg1RAVP6pIPStjMuCcX/wb4nH/edimyeN4MA0pDeVngTItAEylXxKZeBpyV+aj2KfIIyIQY/y7fADFfBnCYc5ZV1JnMsHe4J8g4/SRBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1dm3YN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81C6C32781;
	Tue,  2 Jul 2024 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719911819;
	bh=A95+J/M+hBp0B3YAI/nsGZZXz9ZcUwI13nO0P8PUUhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L1dm3YN25lvx78G5TzkZsGCMqktja8XEDagGP2IeUC4rmbQNtSVwGFe9i0vsRVIyR
	 xcumraU8kbp3lDvtZWBJO5bZsW2paPECdkl2jushfX3AFBEoevkDf/SVkukw6chcX3
	 +71HEb7xZTNO7fvRLDTt0j9oto5IurDLdoeNssggzeakXWIRurPHh308arLPrE0BCt
	 DUlIA1bME+UrRWkCpAD4aIdSfqjZMhO9/LkyJGx7bXAFD5g98LM6L58R9OC5AGeRWK
	 DWcilHBmvuiB8XK6Gvm5vZvNlXXE2Y/0eMk65Cm3qNqL8kfLga4In1C9GFSUxrg86W
	 5VBnWEPjdyZVQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso48897991fa.0;
        Tue, 02 Jul 2024 02:16:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSdh2Tqun4lIKjMF0rAvRJHRk9lMAL3exBVHW0lTmBwMjjYGVYPsX18l2XKF6Ec+KC81lJCVUurWMoyyFSx1jTX8JBR3zjy1DCCJJUm0A5tBp+24jokRzi4/jYOOawNO86lh/WE4NWf73z
X-Gm-Message-State: AOJu0Yz8cBZqmTtqB9nsVZXlT6tY1Ro0XiSnkodEkQil1MEcCAEN8bYq
	iY93ianPjtmWQdrOsJ4lTnN4vK0yV1nXM6h7p2wQnnUmDD2b8LwLYwlAJSgRl/Q+B6S08bs4eVt
	hcWKmWvVVLd9lGuW2uUkObthvzSk=
X-Google-Smtp-Source: AGHT+IFfhlmSaAaQmfgNgpWikVPetj7fCvtt1FQlhm049GGmJ6bkGBLCsrBYTswT1MVMx6x56qR9eL7fxZ9oN7jQ3X0=
X-Received: by 2002:a05:651c:154c:b0:2ec:5dfc:a64e with SMTP id
 38308e7fff4ca-2ee5e2a8a4dmr71464391fa.0.1719911818304; Tue, 02 Jul 2024
 02:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613093433.131699-1-wenst@chromium.org>
In-Reply-To: <20240613093433.131699-1-wenst@chromium.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 2 Jul 2024 18:16:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT2i_28f7jojpwQrTsW-h_pYZ1ifraM50RoMmUvdPUbuw@mail.gmail.com>
Message-ID: <CAK7LNAT2i_28f7jojpwQrTsW-h_pYZ1ifraM50RoMmUvdPUbuw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/make_fit: Support decomposing DTBs
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Simon Glass <sjg@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 6:34=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The kernel tree builds some "composite" DTBs, where the final DTB is the
> result of applying one or more DTB overlays on top of a base DTB with
> fdtoverlay.
>
> The FIT image specification already supports configurations having one
> base DTB and overlays applied on top. It is then up to the bootloader to
> apply said overlays and either use or pass on the final result. This
> allows the FIT image builder to reuse the same FDT images for multiple
> configurations, if such cases exist.
>
> The decomposition function depends on the kernel build system, reading
> back the .cmd files for the to-be-packaged DTB files to check for the
> fdtoverlay command being called. This will not work outside the kernel
> tree. The function is off by default to keep compatibility with possible
> existing users.
>
> To facilitate the decomposition and keep the code clean, the model and
> compatitble string extraction have been moved out of the output_dtb
> function. The FDT image description is replaced with the base file name
> of the included image.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Replace OrderedDict with standard {} dict
> - Change short form command line argument to -D
> - Drop [] around "'fdt-{x}\x00' for x in files"
> - Add spaces around '+' in slice argument
> - Split out DTB parsing into separate function
>
> Simon's reviewed-by was dropped.
>
> This is a feature I alluded to in my replies to Simon's original
> submission of the make_fit.py script [1].
>
> This is again made a runtime argument as not all firmware out there
> that boot FIT images support applying overlays. Like my previous
> submission for disabling compression for included FDT images, the
> bootloader found in RK3399 and MT8173 Chromebooks do not support
> applying overlays. Another case of this is U-boot shipped by development
> board vendors in binary form (without upstream) in an image or in
> SPI flash on the board that were built with OF_LIBFDT_OVERLAY=3Dn.
> These would fail to boot FIT images with DT overlays. One such
> example is my Hummingboard Pulse. In these cases the firmware is
> either not upgradable or very hard to upgrade.
>
> I believe there is value in supporting these cases. A common script
> shipped with the kernel source that can be shared by distros means
> the distro people don't have to reimplement this in their downstream
> repos or meta-packages. For ChromeOS this means reducing the amount
> of package code we have in shell script.
>
> [1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@google.=
com/
>
>  scripts/Makefile.lib |  1 +
>  scripts/make_fit.py  | 86 ++++++++++++++++++++++++++++++++------------
>  2 files changed, 65 insertions(+), 22 deletions(-)




Applied to linux-kbuild.
Thanks!



--=20
Best Regards
Masahiro Yamada

