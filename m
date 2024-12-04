Return-Path: <linux-kbuild+bounces-4988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 281089E353B
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 09:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04EB282E6B
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 08:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92440192D6B;
	Wed,  4 Dec 2024 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2XIrpyJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971D192B8A;
	Wed,  4 Dec 2024 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733300788; cv=none; b=Va2II2TWuPHCjC7y/FERJD8L+wFduJb50YrcHHjrWjIvGrA2Jz5R/IAHoGQi8RBKvOKwq0Toyrv8nTjSmdNzS8atboNYk4ZzPL/6VKgNOnMDwpHEtwAB/siU0x+g1y04+nQV/0rHqLw1ODHmZreA0zNOrUkuUd/IAVXuXB1WVwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733300788; c=relaxed/simple;
	bh=ZZmLxNdmeT3wRoc3WOPkvn9PlOHWxCMiMT7V1nkTTy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYfJU2CbuzLPCvTwytB/G1htwXCTHpzY7KqybXTUfNByrwW4csESk/obwlrkahY29TELrRggYglyeRmEmCELTrXtnl+0Wd1whb9R22Sv9IPvsClVjkK0TLbIMLSeCsVuXO4qOW0vVUPyo5Mtu4698wklIjknaxh79gPZmMjzgkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2XIrpyJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02940C4CED6;
	Wed,  4 Dec 2024 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733300788;
	bh=ZZmLxNdmeT3wRoc3WOPkvn9PlOHWxCMiMT7V1nkTTy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T2XIrpyJTCRKwBw1Ex2CyBQ/CPGlB9IuXS88doFK3QsvSzwD5SpuIMh6pEdrwMtjJ
	 2cbElYUXMWjSxBESK2KZZKw1L5ZPf7Pso8rvx8zwuJjIBnHQUY1qIfPVcgYnYuOD1U
	 frDNuHz3fsa6Q6jYVzT32OQ9XeKoWP6T1snczSHkGCOzEdyjKgpc+RcXTl5qEtlCa7
	 HdD6WK7m7DL5b6b2hpjhd7BZpYXK7Wousu4lWhxODM9H5MO4D0BPBrU/Gy+5ZwBUbg
	 X7Ghhte2cbB5+V0v5sNgxWvgS3prK+RqtYMhVrLPVZRPcHyl5FIlrhWAI2uFQLZxEt
	 V2EBnl9hpkJWA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e1be0ec84so1076519e87.1;
        Wed, 04 Dec 2024 00:26:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDQ8odoLalKE/e2SMbEHIXSvAVwraEZd790JlwnnqcceqULzpAKpSvvHNmYFCm93kwoGfCRqU85J2TYBPj@vger.kernel.org, AJvYcCX2tIawWnwGxQENxlofvJYo/sWXuCY83NzlUhZC862UEfcn3UbMN0NLUkaRnIwvIhLcw4ULYfalcZfRPYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YystJ53RerfITfvjrbyItaRyM8r/Cl1G4QtDyC7/aJ/ZzCUHDkU
	K5yUyZdw4SlFGRaXFtuD1wfqfa5bjcDpM1D0shfnV1ceAHWepg2xYhiYLYSJQjvETlv8YAZJyIA
	SM8Itxm8Q2/HUWhbpCkOjDNVerIM=
X-Google-Smtp-Source: AGHT+IFiA0kFZtrMuM/VGW7BrLd2SssYmTfcCkZUoXo0qXJqOjjL8WbQDECxi4ads6oXPvHlKe9Gn+/TmGwB7G6knq8=
X-Received: by 2002:a05:6512:e8c:b0:53e:1c7e:2837 with SMTP id
 2adb3069b0e04-53e1c7e288bmr868883e87.42.1733300786667; Wed, 04 Dec 2024
 00:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>
In-Reply-To: <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Dec 2024 17:25:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNATU2OKEWh6p9QuUXtYmYmqTkN5nspBq9DbCh9yUjqW5xA@mail.gmail.com>
Message-ID: <CAK7LNATU2OKEWh6p9QuUXtYmYmqTkN5nspBq9DbCh9yUjqW5xA@mail.gmail.com>
Subject: Re: [PATCH rdma-next] kbuild: Respect request to silent output when
 merging configs
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 10:55=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Builds with -s option (silent) are supposed to silence all output
> which is not an error. It is the case for target builds but not
> for configs. These builds generate prints like this:
>
> =E2=9E=9C  kernel git:(rdma-next) make -s defconfig debug.config
>  Using .config as base
>  Merging ./kernel/configs/debug.config
>  #
>  # merged configuration written to .config (needs make)
>  #
>  ...
>  Value of CONFIG_FUNCTION_TRACER is redefined by fragment ./kernel/config=
s/debug.config:
>  Previous value: # CONFIG_FUNCTION_TRACER is not set
>  New value: CONFIG_FUNCTION_TRACER=3Dy
>  ----
>
> Let's honor -s option and hide all non-error output.


Is it necessary to add the --quiet option to every script?

Kbuild already provides a generic way to suppress the stdout
with 'make -s'.

The following code works for me.
'make defconfig debug.config' is as verbose as before.
'make -s defconfig debug.config' is really silent.



diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index a0a0be38cbdc..fb50bd4f4103 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -105,9 +105,11 @@ configfiles =3D $(wildcard
$(srctree)/kernel/configs/$(1) $(srctree)/arch/$(SRCARC
 all-config-fragments =3D $(call configfiles,*.config)
 config-fragments =3D $(call configfiles,$@)

+cmd_merge_fragments =3D $(srctree)/scripts/kconfig/merge_config.sh -m
$(KCONFIG_CONFIG) $(config-fragments)
+
 %.config: $(obj)/conf
        $(if $(config-fragments),, $(error $@ fragment does not exists
on this architecture))
-       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh
-m $(KCONFIG_CONFIG) $(config-fragments)
+       $(call cmd,merge_fragments)
        $(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig

 PHONY +=3D tinyconfig





--=20
Best Regards
Masahiro Yamada

