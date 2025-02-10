Return-Path: <linux-kbuild+bounces-5691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60340A2E397
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 06:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 535D83A18E6
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 05:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D16B189902;
	Mon, 10 Feb 2025 05:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQ+iLFnt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D974418870C;
	Mon, 10 Feb 2025 05:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165060; cv=none; b=NLXj4+UFfdfZ/Oj8Bg94ryC2IOgXzr8IEnkcJVQ2LDKaOBnPPGybaMiT57F0Fig0hSBJkfjWwNH2tITAj5ii9y7hCCRs4xaIdDBrvhfvox/hVWKEA8kPC3NGiPKe9HO1vE4v720wPU9uGLYMUP+VL55xb22MGHRNZ/HnpTMdEWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165060; c=relaxed/simple;
	bh=slNLkWY0bFHIEID4Mp9lw0yhcEf/R6NemEHS+hXwz0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dM2VlE23p4nQNMC4oVHnfLvVQY600IjUjs7oeJJ6q9YhgHGdWTyBKGAJZNpHPdwsOZn+OGIKOLyranYH5IcAhtOwJkUu5KJDhAx/GMuALGlz/u9iHOQeSaEM/pwZAYg0F8jltcze/8un8p5auw5J1xDZs+p4hWfvfvQBnrXvtzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQ+iLFnt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603FEC4CEE4;
	Mon, 10 Feb 2025 05:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739165059;
	bh=slNLkWY0bFHIEID4Mp9lw0yhcEf/R6NemEHS+hXwz0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SQ+iLFntXrzE+ljfbpJvCBcDXQQv3T9WQMMVrEe9Xi7P/2XgH7eZzICTbjcGkADcd
	 zeqpMyJfTZzfv4pNZGNPrFL3diVFReI0byQlT+W9oKLUvDPJqqpDLNJv+Gx8uHT1rd
	 j3wQr2Lw25ivo42uCBiSTIwVruf8lEeIGVYE8RhDOP8S9ELUWEI2ZZh8+bbUxrDhi/
	 eSOVb2GOWRKGcsGk4XZRvnxOox5kZR3VD/YgMoh5lfhCfXHlbUGq1xWtEuyn620RG3
	 ooAfFI1zjZ3rAYiwJOLwJ8lGR5m7gxWOguqzuTAzyDiwsd5/c7sHJ8/LyIRKczveV9
	 9M4C5UuzIkYvw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54506b54268so1133748e87.3;
        Sun, 09 Feb 2025 21:24:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDZxqzQMNWb/wtdipggG9t0vdKJ1X7zlEVA814dN7qItPO5aikhItwozcPetikEYAVdwPddKjwZkpmbn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvwwvpwuERkKwHmcyo0Ba174lbqXhHBGe+dkSLhOFoYLFYB95T
	jQ9B+RSsyAlVvGBDHVXcUgoo8h94wtQrAmgUt2+8e6ziAJewd8vT6+tl4ukWNVjMICrF5JNFgek
	gyFx7C8CMRH2urh2+SeVy7iYt0Ng=
X-Google-Smtp-Source: AGHT+IEGph2wNRGTRrHYgXz+nogRzInpwaYmSpiU9oWEzPx6uYvAF3HFLbeNX4ApB93DtuM+Z4iTyME7+qmV1H985Yg=
X-Received: by 2002:a05:6512:b24:b0:545:e7f:cf33 with SMTP id
 2adb3069b0e04-5450e7fd1f9mr307065e87.28.1739165057997; Sun, 09 Feb 2025
 21:24:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de> <20250108-diffconfig-validate-v1-1-4b3d8ee489da@linutronix.de>
In-Reply-To: <20250108-diffconfig-validate-v1-1-4b3d8ee489da@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 10 Feb 2025 14:23:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQm4v6yNq_EwGhY765f_D302aPgPfyxVDRqYMXpwpx=pA@mail.gmail.com>
X-Gm-Features: AWEUYZnvIgDF4kJbJjF6YHXI-GLzHZ-ODnsjiuAxWD7bqz9EUz_hYrRLoyN0I7U
Message-ID: <CAK7LNAQm4v6yNq_EwGhY765f_D302aPgPfyxVDRqYMXpwpx=pA@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Add kconfig utility scripts
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 9:34=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> There are various utilities in scripts/ which work with kconfig files.
> These have currently no maintainer.
> As most patches for them are applied through kconfig/kbuild anyways,
> add an explicit maintainership entry.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 30cbc3d44cd53e6b1a81d56161004d7ab825d7a9..2bd414fb3e6d6515b57a57a5f=
3d4d735137edcce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12385,6 +12385,9 @@ Q:      https://patchwork.kernel.org/project/linu=
x-kbuild/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux=
-kbuild.git kbuild
>  F:     Documentation/kbuild/kconfig*
>  F:     scripts/Kconfig.include
> +F:     scripts/checkkconfigsymbols.py
> +F:     scripts/config
> +F:     scripts/diffconfig
>  F:     scripts/kconfig/


There are a number of random scripts I am unfamiliar with.

I have never used checkkconfigsymbols.py

I may happen to check patches for such tools very reluctantly
and very lazily, but it is daunting to endlessly extend
my obligations, especially to the point where I lost interest.




--
Best Regards
Masahiro Yamada

