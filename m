Return-Path: <linux-kbuild+bounces-3694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EFF983BA3
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 05:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344C01F21C6F
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 03:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABA3C152;
	Tue, 24 Sep 2024 03:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1+jksQX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A301218D;
	Tue, 24 Sep 2024 03:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727149610; cv=none; b=MRMJ+2QzO78VoBP9/SF0eWoVxOMa8l+5XhZVkPkblnBXmYOi1gjTVDXqf2S2keLu+3PlYf2ambNVAxozZwP463GXqySn3KCKVov9yoEUIh1kLrqzA417yztSQepfcbNNsdz6LHjB2pUq0UT7/bXcN2V44JrDEgfxyr3D4hHEZu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727149610; c=relaxed/simple;
	bh=0iiuYDlYpssZtIgwrPIrBH6EgwbPgwP/TNZ1USii7m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dfy824biEBDY44KD4H6G6eGS+PMYFK64/t/lAz2u7nJgvKqVtIULdJGGxHAXJSNDb6LaCpRXV3VJM5sUwqOXXgetlmvkP3g+LrJ3P6/dZQcmzpTPA9jVg0P2mQrzHBMNjS0SOlnD21nqnBdcFAFt95CczNQfR7Sjq8hsydPjl/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1+jksQX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7012FC4CEC6;
	Tue, 24 Sep 2024 03:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727149610;
	bh=0iiuYDlYpssZtIgwrPIrBH6EgwbPgwP/TNZ1USii7m0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r1+jksQXOlnApEsqETqAMKM/42YCBu8+YRm6/vTxPlc86IL1i1bdH70sFI9ky1AF4
	 w+8Is5p25yHloHEwmIMR7KW///4LI7VBPUzmMblXaKOWMSxkrV2kCvp3VdRo6qL/PY
	 3z4pmEPf3X1zHZkOWCrLMoOGglE7Pfph3O8NTuzATu98fDpjuCRYQ3v+34n41hQyu0
	 KUmvYvh2kkCZsDgfZRDc2dLGMBjUHInOkr0JvOO5uWDEOb0VWJRai4qyt/lt+k3p2q
	 oShlvhkvfDCfuiP9+Zy9NKSt/4KU08SantKGOHHvT1PccShKwjBmgq3l/3lcql3/Gn
	 qjHecn+RDtGVQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5365392cfafso5259780e87.0;
        Mon, 23 Sep 2024 20:46:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOXfdVlgXpppwQrJckwNaUvhWdhBedKCANAITXeNqnZWtWupnSRjzh1Ydzq8m9tdPnwTDCwPUgaPMekgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUgoyWpH3xZELbH1eskCyXOEdf1BKsU0mxVF+Rg/cDFL4g0lec
	5p5VFauCBYB6y1kI8UwZtcQORcunzCum6gmqMqKu3x6js7ojW1BKtuvm+b7wiA9xgHlH+nedOqL
	qYbY33jToR57+zGOpy3k5QAuTccA=
X-Google-Smtp-Source: AGHT+IFzAWQi/wkGLTue6dEeK+Bm/THJ7ebXgxziTtEQ9wYkByG+wl68RGBFf+XY2GXVw1VeWL1bhI1Vq6+7yUiFhYI=
X-Received: by 2002:a05:6512:2254:b0:533:448f:7632 with SMTP id
 2adb3069b0e04-536ac2d6626mr7425702e87.1.1727149609152; Mon, 23 Sep 2024
 20:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913171205.22126-1-david.hunter.linux@gmail.com> <20240913171205.22126-6-david.hunter.linux@gmail.com>
In-Reply-To: <20240913171205.22126-6-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Sep 2024 12:46:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8D4OVT81iTVs8jjrBXX6Zgwc+VJ_vb7hb4J-vCZZN=g@mail.gmail.com>
Message-ID: <CAK7LNAQ8D4OVT81iTVs8jjrBXX6Zgwc+VJ_vb7hb4J-vCZZN=g@mail.gmail.com>
Subject: Re: [PATCH 5/7] linux-kbuild: fix: implement choice for kconfigs
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 2:12=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Properly implement the config entries that are within the choice keyword
> for kconfig. Currently, the script only stops the previous config entry
> when a choice keyword is encountered.
>
> When the keyword "choice" is encountered, do the following:
>         - distribute the lines immediately following the "choice"
>           keyword to each config entry inside the "choice" section.
>         - process the config entries with the distributed lines.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
>  scripts/kconfig/streamline_config.pl | 40 ++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index 26e544744579..593df824ead7 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -162,6 +162,10 @@ sub read_kconfig {
>
>      my $source =3D "$ksource/$kconfig";
>      my $last_source =3D "";
> +    my $choice_activated =3D 0;
> +    my $distribute =3D 0;
> +    my $dist_string;
> +
>
>      # Check for any environment variables used
>      while ($source =3D~ /\$\((\w+)\)/ && $last_source ne $source) {
> @@ -214,6 +218,19 @@ sub read_kconfig {
>                 $state =3D "DEP";
>             }
>
> +           if($choice_activated) {
> +               $distribute =3D 0;
> +               my $config_lines =3D "$_\n" . "$dist_string";
> +               my $tmpconfig =3D ".choice.kconfig";
> +               open (my $FH, '>', $tmpconfig);
> +               print $FH $config_lines;
> +               close($FH);
> +
> +               read_kconfig($tmpconfig);
> +               unlink($tmpconfig) or die "Can't delete $tmpconfig: $!\n"=
;


This is ugly.
Please do not use the temp file.

I believe the only benefit to parse 'choice' block
is to propagate its 'depends on' down to member configs.

See how the 'if' statement is handled.











--
Best Regards
Masahiro Yamada

