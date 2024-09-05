Return-Path: <linux-kbuild+bounces-3385-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A0296CB85
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 02:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2EC61C222F0
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 00:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C630372;
	Thu,  5 Sep 2024 00:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ST2JlQG2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F124B20E6;
	Thu,  5 Sep 2024 00:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725494539; cv=none; b=IB2n9cKQSLER0l5ltBXHqW3A5yaXoJc79i2sgT2tAWjzZs3tZK7ofyD+ljXNgPk2NXqyS0RvyG5ob2IUL3vIOwpEV7J77FmfURjrDVq1NDZENnW43nuDAusyOozm00SRmY4R266O/y6lItuyLNDwsk5zJlG67t5ma86tbimJqis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725494539; c=relaxed/simple;
	bh=xg8MIiYKlF95wUIp47pyIkMqOEkcE+HD42aQCZA1Wfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U56Cr+FCwCzHkY7W0F3D9DvJG6ZGhARAf+cuA+UxNmfAcYeuD2dLfRYKvoh54UBUdWlXOOSX9WSKKoDrtKuQNzbuZOl1FghDQ9nuyCGXs8KU4h4atCiphJI+2LE4+J2RtbMwHMEXLifZ6xvCTF+PAwthemdqUxgReMG5Of6Igh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ST2JlQG2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A06C4CEC2;
	Thu,  5 Sep 2024 00:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725494538;
	bh=xg8MIiYKlF95wUIp47pyIkMqOEkcE+HD42aQCZA1Wfk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ST2JlQG2B+i5U/pTKMpCj/jY5KvzKeIsz5uKS6NxFx+drLUYFuLfhvKBJGIuTD+G5
	 txbJWgNrtdWuQXAq8Fp+BGOFDmBIMPkrrI1jH5m4lxoTi9cDil0RrpASw4nm1Ig7jv
	 wnhn9WvvOUNlPw2w36lA7kwtJwxzzX1g1+raQJ/bUcdXDoXED04UjHsbH09jXxTIdC
	 YfnZhfm0M9LaX2SL6/3nzTO3mGb3z1Wvjjd+QBhN6FTYS/TGl5HOJqaYUxe1rBj/RL
	 OFgrFMGyzekzuZ/nAgD8yMtaKci4aAEV7SXxAkiNutPMnBSNWhxB92zEOfWXvOR3R4
	 ubjv9hgQHR29A==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f50966c478so1762651fa.1;
        Wed, 04 Sep 2024 17:02:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxcCNOsDNjDkV40JsTE0q4H5dxtSxdApOEBPtPvV/LNhPxocfpQ+ntPfz4c/pkCM5PNexHpUDHbl4=@vger.kernel.org, AJvYcCVU/wXyMX6Hs6ImlUF3M46RKpM28pMkzqTyt/Pst4ToTdeSUU1z3Pw0ZUIwpkpGfaYu/axGvoes+A9NgZ5E@vger.kernel.org, AJvYcCVYKM7fWbxLRpwwOqmAIQ5z6Iqv5CS8n7sWNYmlrUWHEVSvPNxUpped/M0ruhWPnWFECXEn9wZTNe0Qq+9Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ7NRgydBg+QXYXE2fZddLT0+X+ZYCFFXH1RCUyO+5e7P7lCfi
	K5ISHfPdoxD7qgZtcrg/UVU0giPmemw8LHDEc9/lqOjQ7RHuOTwB8S64S8oW8ObJxP4RDhNyaKx
	T08ELWqM4rs7vsdXSoy03XgHhh4c=
X-Google-Smtp-Source: AGHT+IHT+1s0xc0Hi5lnGPQUt4wd8DL9pfqjf9IiZTdDO2v+Pjnq1+dmI+CYrl3Stq8HtTO907KiA9ht8FKA/14ZhGA=
X-Received: by 2002:a05:651c:221d:b0:2f0:1a19:f3f1 with SMTP id
 38308e7fff4ca-2f61e0257a5mr153789281fa.7.1725494537584; Wed, 04 Sep 2024
 17:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823194152.13881-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20240823194152.13881-1-stephen.s.brennan@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Sep 2024 09:01:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNATx=zveh52XYR7BzuskQLPk=oqoqCLUHJou4wKTeggn2w@mail.gmail.com>
Message-ID: <CAK7LNATx=zveh52XYR7BzuskQLPk=oqoqCLUHJou4wKTeggn2w@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kbuild: explicitly document missing prompt
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 4:42=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> There are a few lines in the kbuild-language.rst document which
> obliquely reference the behavior of config options without prompts.
> But there is nothing in the obvious location that explicitly calls
> out that users cannot edit config options unless they have a prompt.
>
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
> v1: https://lore.kernel.org/linux-doc/20240820171000.1656021-1-stephen.s.=
brennan@oracle.com/



Applied to linux-kbuild.
Thanks!


>
>  Documentation/kbuild/kconfig-language.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kb=
uild/kconfig-language.rst
> index 1fb3f5e6193c3..4650daaf5d365 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -70,7 +70,11 @@ applicable everywhere (see syntax).
>
>    Every menu entry can have at most one prompt, which is used to display
>    to the user. Optionally dependencies only for this prompt can be added
> -  with "if".
> +  with "if". If a prompt is not present, the config option is a non-visi=
ble
> +  symbol, meaning its value cannot be directly changed by the user (such=
 as
> +  altering the value in ``.config``) and the option will not appear in a=
ny
> +  config menus. Its value can only be set via "default" and "select" (se=
e
> +  below).
>
>  - default value: "default" <expr> ["if" <expr>]
>
> --
> 2.43.5
>


--=20
Best Regards
Masahiro Yamada

