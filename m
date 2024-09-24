Return-Path: <linux-kbuild+bounces-3693-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A889A983BA1
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 05:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CD401F21BBB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 03:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A4118E1F;
	Tue, 24 Sep 2024 03:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsxV5sMW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3274818D;
	Tue, 24 Sep 2024 03:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727149551; cv=none; b=RbRfsjI+LOYF01MjQrVkd/EYjzYQa81RSEU3Y/NiTgKhee9YlLPk1d/pdWuzwi/0FI+JWrIpfl1wKuo8ubPQqVPmxHebqxup6Uw3xrEEB+4QSRam3tA2nHFhpt9jMZqEw9R6zi/DF4ESmd6Oxr3lLal0NYJSVNn19QEr4BiQsSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727149551; c=relaxed/simple;
	bh=cJVd9whhQgDlLPzOIzpUix7GLADxCGQwJAV2g4rhswA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+5Oj+H0m8yLe/Z98fmVKjs1cpWuG60ybsIeGYndF7kFdCg5zrdp8xwQ4wMoN3P+kxGYn2rezfBUVYHEgyraFAoT22djapjoXxCjH+pDoUDMFkRtPMN/Aws5/JBNjJ7MJ0Rg1EPDQ6h9nHBdLtQu2Sup+7nv0H3tExIYP6ivKSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsxV5sMW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997AAC4CEC4;
	Tue, 24 Sep 2024 03:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727149550;
	bh=cJVd9whhQgDlLPzOIzpUix7GLADxCGQwJAV2g4rhswA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SsxV5sMWB8BCCyTGqOdmmW4N3BPYOrSr4VIBp735xE86zt4thPQPBvWKcS7CptaqE
	 7RA+zUtfn1v7GktsT3b/h34p/ddkp74CAaEF8tRS8F8Dip35PguHG0WXUc4LXGRGbo
	 zklYIj1zkENIOSD0YL+KoeoUk1b7J2k2SA+3HLLpBBsWxyulwAkW4fF9NezW/Arocd
	 3mvEVlRT7rmxsmXfFo4DmUA7HAw8q6JoCMOoXxlq23Q+sZoW/+QrjiqbGAQgGDpAZz
	 BKjLlcX9KO73/sVZxdN4so+YwgeoJwgZ3Dv+bT9Tu2PitnPuGjKVIbZSs1peHLSMYV
	 ug6XRdVbnnU2A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365cf5de24so6146815e87.1;
        Mon, 23 Sep 2024 20:45:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAQLp7O6tn6CaM5SPtyxp07a0c9+rvJ6Zuk0mU88LiTp/HIarBBOtNVeqv0VwcIacUaSuEZ1pcPSfLvm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeHHZWHcAUe1qwxDo/qYx5wo51IT8Is6vCguT/+tVQJOeJlEq0
	+D4ZTpqEox5kqD62KczdlmWQCKalX/iYE5BdfxcEMmch2d7Gvz3s9pe9rdMEnOaIMrwIo1MzH7q
	t5qNFYDbl32JzUD1DwY22pgfa67g=
X-Google-Smtp-Source: AGHT+IFeZjWHkMSBMG3jkf2b0/kliWSpFR6DS7PTuVwgxV8s+V/GDZOYUbCSp1tRFV8veuKsnaw+8//+pUbRXb9OJIc=
X-Received: by 2002:a05:6512:3c99:b0:52e:97dd:327b with SMTP id
 2adb3069b0e04-536ad17e97fmr7555793e87.23.1727149549327; Mon, 23 Sep 2024
 20:45:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913171205.22126-1-david.hunter.linux@gmail.com> <20240913171205.22126-5-david.hunter.linux@gmail.com>
In-Reply-To: <20240913171205.22126-5-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Sep 2024 12:45:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARdzUro3A00wU7XScXa=582vtY+nZ5-zkN89_3mS70Fag@mail.gmail.com>
Message-ID: <CAK7LNARdzUro3A00wU7XScXa=582vtY+nZ5-zkN89_3mS70Fag@mail.gmail.com>
Subject: Re: [PATCH 4/7] linux-kbuild: fix: ensure selected configs were
 turned on in original
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 2:12=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Ensure that only modules that were turned on in the original config are
> turned on in the new config file. When ensuring that the config
> dependencies are met, turning on the config options in the new config
> leads to warnings and errors later in this script, especially for badly
> constructed original config files.
>
> One example could be a config option that is depended on by a module
> needed in the new config but is not turned on in the original config
> file. If this config needs to be selected, warnings will show up in the
> standard output.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
>  scripts/kconfig/streamline_config.pl | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index bb1f19a1ab5e..26e544744579 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -459,7 +459,9 @@ sub parse_config_depends
>                 next;
>             }
>
> -           if (!defined($configs{$conf})) {
> +           # This script does not turn on any modules, so make sure the =
config
> +           # options are on in the original.
> +           if (!defined($configs{$conf}) && defined($orig_configs{$conf}=
)) {
>                 # We must make sure that this config has its
>                 # dependencies met.
>                 $repeat =3D 1; # do again



I believe defined($orig_configs{$conf} is always true here
because it was already checked a few lines above.


    # We only need to process if the depend config is a module
    if (!defined($orig_configs{$conf}) || $orig_configs{$conf} eq "y") {
        next;
    }


If $conf is not present in the original .config,
the 'next' statement skips the current iteration.






--
Best Regards
Masahiro Yamada

