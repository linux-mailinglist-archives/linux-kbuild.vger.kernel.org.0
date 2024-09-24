Return-Path: <linux-kbuild+bounces-3695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D9983BFF
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 06:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6421F229E7
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 04:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D38128F3;
	Tue, 24 Sep 2024 04:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9ILyjp5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EEE40879;
	Tue, 24 Sep 2024 04:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727150941; cv=none; b=AdW699mVBuBq9ZwtuAlFD1D1aIOovfsPOoVdCYSaOFoTS2xVGpqr7Pn12aKTDvjX9pAp4n47FvkDLTd1DX3o5HHMNbT+MV4/zyjSDRVs+K3JCD4Pqlglw5uV4cdmSXaF9qqs3fn7GEYMMfyFOMove/N1DnfMgM6vhrLdf875GLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727150941; c=relaxed/simple;
	bh=VSg+xYwh7vuATm3RgZoGtJJQ6JPcfXKhzrjI28R9qDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPZk8enqtn6ENucz0M4Im1U2UhZFvKsDOWiLspb3pB4SLnDf539kRbqzyWAt2JvvjKPExVyOWunvozgfbUPRiUauvg/0pPPeXVNl+m3QV0yaC4RIZIn4ZqRElbZWyCdSf7ya8tUN1QjhaFqwCABG8Cg9mtOWek0RPn7bYQvnelQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9ILyjp5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866B7C4CECD;
	Tue, 24 Sep 2024 04:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727150940;
	bh=VSg+xYwh7vuATm3RgZoGtJJQ6JPcfXKhzrjI28R9qDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S9ILyjp52jT29UAWwXRwCEMcX7NnP2Agxzt2AzxxofsGzDLVoAYebWFa22QkX01OZ
	 6pv3YaBq3z0NrXYU+9eNOqDVRXJmz81BpjtkHJXlPQ6OLP2r1rLGFR70Xy2uJAKJeu
	 kMsjEPRjtEIH7yzfAVpe/wy8Fe3YmJpwXiSDyc0buy9sukC6n93xHFQfKWD0+qUBgi
	 rRh5TfFU21UmPvGyMshHKS5J9gF0hfxakrfnNPWSy4TqVrD39ruxW3IPFWdFGFW94m
	 a9mKYGHwcCQ2ER6jydE10cdhaG4MXaUvEbNXCGmVZp3tf17DnGdkOd0K6n4OF24eik
	 lczv2kySANTIw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so6345298e87.1;
        Mon, 23 Sep 2024 21:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6nyHbQ6yhXnrGBZwXhIdz5iexi3/vmjpS9EIUSas6+iqqniIwlkt7o382iQqDyMLNfD1gGf7XhnsHv0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpKICyC0ZYssY3+NoCAn6tmBUwPlNZv/invPMASsxdg9gFW5HN
	OU80WiBNS3tAv/Anrtfzui22tB4bc7TXlJYBlYfetqteZFhU0KVrs1QoCZod9Yy39N0KOES4KiF
	5gx5TgU2TDww+Kss6X4P3sLh183w=
X-Google-Smtp-Source: AGHT+IGQSFHEKGlRq3xI5Rkg/U68fHFp7vBIKsPDQpCfNHVhossCvHjHYghMtOgzUeeJYnXSPYaI58qsAWhv8jDBP0s=
X-Received: by 2002:a05:6512:3d86:b0:536:54c2:fb83 with SMTP id
 2adb3069b0e04-536ac2e0ecbmr7141665e87.23.1727150939223; Mon, 23 Sep 2024
 21:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913171205.22126-1-david.hunter.linux@gmail.com> <20240913171205.22126-7-david.hunter.linux@gmail.com>
In-Reply-To: <20240913171205.22126-7-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Sep 2024 13:08:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNARNteNvrbTeNTz71XTFjjL4XjLC-CT2UjVsGRpP_ToPKg@mail.gmail.com>
Message-ID: <CAK7LNARNteNvrbTeNTz71XTFjjL4XjLC-CT2UjVsGRpP_ToPKg@mail.gmail.com>
Subject: Re: [PATCH 6/7] linux-kbuild: fix: configs with defaults do not need
 a prompt
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seems fine if you fix the subject prefix
and reword it in imperative mood.



On Sat, Sep 14, 2024 at 2:12=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Ignore process select warnings for config entries that have a default
> option. Some config entries have no prompt and nothing selects them, but
> these config options are okay because they have a default option.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
>  scripts/kconfig/streamline_config.pl | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index 593df824ead7..948437aac535 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -144,6 +144,7 @@ my %selects;
>  my %prompts;
>  my %objects;
>  my %config2kfile;
> +my %defaults;
>  my $var;
>  my $iflevel =3D 0;
>  my @ifdeps;
> @@ -239,6 +240,7 @@ sub read_kconfig {
>             $depends{$config} .=3D " " . $1;
>         } elsif (($state eq "DEP" || $state eq "NEW") && /^\s*def(_(bool|=
tristate)|ault)\s+(\S.*)$/) {
>             my $dep =3D $3;
> +            $defaults{$config} =3D 1 ;
>             if ($dep !~ /^\s*(y|m|n)\s*$/) {
>                 $dep =3D~ s/.*\sif\s+//;
>                 $depends{$config} .=3D " " . $dep;
> @@ -561,8 +563,16 @@ sub parse_config_selects
>
>      # If no possible config selected this, then something happened.
>      if (!defined($next_config)) {
> -       print STDERR "WARNING: $config is required, but nothing in the\n"=
;
> -       print STDERR "  current config selects it.\n";
> +
> +       # Some config options have no prompt, and nothing selects them, b=
ut
> +       # they stay turned on once the final checks for the configs
> +       # are done. These configs have a default option, so turn off the
> +       # warnings for configs with default options.
> +       if(!defined($defaults{$config})) {
> +           print STDERR "WARNING: $config is required, but nothing in th=
e\n";
> +           print STDERR "  current config selects it.\n";
> +       }
> +
>         return;
>      }
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

