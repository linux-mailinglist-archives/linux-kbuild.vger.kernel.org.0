Return-Path: <linux-kbuild+bounces-4513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5269BD968
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 00:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74963283F6E
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2024 23:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8468E216447;
	Tue,  5 Nov 2024 23:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPWk57fV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A99E383;
	Tue,  5 Nov 2024 23:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730847835; cv=none; b=hebF6R1mADK5rGyVeKRMMn0x1UaBGUohnNdZucJAgKThFLOwOoRY8iNVxC8J06ygKGKmlP0y7qlwFTAMwYg4A0sVskvi1sg7MUZNdDNlzusxRFwR+6G4VKFY2i9o5ZrKaZ+ADcjnEaJDoPo3IOzUQwAZuahUJJiEXNA4KtyjRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730847835; c=relaxed/simple;
	bh=4L9KSUpADr4fMrhh20gwsFIcXLi7CtBT3pd3TAduXWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+scAcGmIHWbLX4DWj+/MdGazFpn0AOezAuusef6K6LqLvlDMyIsuLN43j3msS+sJbzEI6OsKJs6Db8ONCJno2tNjOuHRTsJkzVEAX0bqgvdP80DOq881Jnv6ylc6SszLW6zhEjJgJOS3h8pFIftYZYUv6POscbrYWrz8IHenXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPWk57fV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0415C4CECF;
	Tue,  5 Nov 2024 23:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730847834;
	bh=4L9KSUpADr4fMrhh20gwsFIcXLi7CtBT3pd3TAduXWU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nPWk57fVd5tVuYyLMRN+dISfRUnFLoLRgYr6VCRFdfsx4p7nwe3GGCPYuI4DkHXF9
	 x2gWR+cpM4yx9QNvKjQX/KL7nGiIPKaGye2BdgAFnRq0WVaxVJiF0SkcA4f/aKTAb4
	 e8y68crsKFZHp2wV0IHTTGR7eShbN+pC2NHj3FYeFP+VIlESo+7TUDqjyCWluBaKS/
	 wCYtrFHZUW40mmYrLP1lvwv6xjzy9BlugWp1kStMhUSJ+wiOnymloL6qWM5/Aj9hor
	 8LJAVSfrznUY54ISf419LY42eUXugTG8dsqXYeag+iZ4h2LWTjune4Nuxe826aQm46
	 yzWudznv4A5gA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so9489926e87.2;
        Tue, 05 Nov 2024 15:03:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6T0PiZtU/57ms9fkkKU0nwYod1LFOg0/Oz5KqfG5XoqDAg4vLzHMd7w0eK9qpWaRGSbOhVa6vnCCdLLm+@vger.kernel.org, AJvYcCX0fMaA0kHf4RZ82f2avuxWFdk//6Nrcb2iiDPbPbFC8rK9sUBd+65FVcPq9VTOn4pTvAW9M+j5oNEV0GY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxetbycUIYIjYn+qioYJJrseeVeyaQEJoCfeYNpmS5WBLhWlFPn
	Gt6FSW9MsP9WvMw79cPMXM4gG3i9lL+Pio1TI8wln4tYwVQm0/tVsPF9MQj5qEPJDL+ESZXpltX
	lM8jUtXrcODkjZKBwf+kFCKMgt+U=
X-Google-Smtp-Source: AGHT+IGjzSdAMB0KqmGo0rxZrGOP6NLWVz129nHAVY/Jt2nh/EJQpUQ/fHF7bZAE5Fw3ysBOCHTeTx4tw1ffCYb9UKM=
X-Received: by 2002:a05:6512:12c7:b0:536:53e3:feae with SMTP id
 2adb3069b0e04-53d65dca682mr13995972e87.11.1730847833552; Tue, 05 Nov 2024
 15:03:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105205658.349180-1-matt@readmodwrite.com>
In-Reply-To: <20241105205658.349180-1-matt@readmodwrite.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Nov 2024 08:03:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT0TaQ+ynuww2VY2NaDN+7mGDsYyxe2TdYV7QBT+QyS6w@mail.gmail.com>
Message-ID: <CAK7LNAT0TaQ+ynuww2VY2NaDN+7mGDsYyxe2TdYV7QBT+QyS6w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: deb-pkg: Don't fail if modules.order is missing
To: Matt Fleming <matt@readmodwrite.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Matt Fleming <mfleming@cloudflare.com>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 5:57=E2=80=AFAM Matt Fleming <matt@readmodwrite.com>=
 wrote:
>
> From: Matt Fleming <mfleming@cloudflare.com>
>
> Kernels built without CONFIG_MODULES might still want to create -dbg deb
> packages but install_linux_image_dbg() assumes modules.order always
> exists. This obviously isn't true if no modules were built, so we should
> skip reading modules.order in that case.

Good catch.

> Fixes: 16c36f8864e3 ("kbuild: deb-pkg: use build ID instead of debug link=
 for dbg package")
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
> ---
>  scripts/package/builddeb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 404587fc71fe..9739b0429337 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -96,6 +96,11 @@ install_linux_image_dbg () {
>
>         # Parse modules.order directly because 'make modules_install' may=
 sign,
>         # compress modules, and then run unneeded depmod.
> +       modules_file=3Dmodules.order
> +       if [ ! -s $modules_file ]; then
> +               modules_file=3D/dev/null
> +       fi

This leaves a possibility to pick up a stale modules.order
in incremental builds without 'make clean'.

(1) build with CONFIG_MODULES=3Dy
(2) disable CONFIG_MODULES
(3) 'make bindeb-pkg'


(3) picks up an unrelated modules.order
in the previous build (1).


>         while read -r mod; do
>                 mod=3D"${mod%.o}.ko"
>                 dbg=3D"${pdir}/usr/lib/debug/lib/modules/${KERNELRELEASE}=
/kernel/${mod}"
> @@ -105,7 +110,7 @@ install_linux_image_dbg () {
>                 mkdir -p "${dbg%/*}" "${link%/*}"
>                 "${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
>                 ln -sf --relative "${dbg}" "${link}"
> -       done < modules.order
> +       done < $modules_file

Please enclose this block with CONFIG_MODULES.

if is_enabled CONFIG_MODULES; then
         while read -r mod; do
                 ...
         done < modules.order
fi





--=20
Best Regards
Masahiro Yamada

