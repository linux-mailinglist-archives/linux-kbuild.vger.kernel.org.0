Return-Path: <linux-kbuild+bounces-3691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A13983B74
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 05:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B652282962
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 03:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222A3EAD7;
	Tue, 24 Sep 2024 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JESSQp8b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB6017991;
	Tue, 24 Sep 2024 03:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727147093; cv=none; b=EeB7hVW1sPPPAhkoPTxtgGl0IjN5kKumTiOk8ysTlONa601nQhV39hMNJeCXBFW636pq3NZAtV5s+gHUVoMt2Nzo77Orbkku4FQ0yGZgl7PTV7lapCKhh7DCzKK88zzqXrDrr50O8/gvH+cRdgP0vvdJ+6vICDVB1y7dv9HISfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727147093; c=relaxed/simple;
	bh=BNEXgbQ7QRV54EvqG3RZHSNqL9znPUUtxl3n2Im7ydU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/taPuQMFXeXJJTcf9gKIoHardH/6fYmoUP9kB3vXDlp1ZLgw5Lkl1RScgSP/Y3s8RcD8gPhXzsKlDkRsnfgBzLi2rL+x3gGoahkVszsl+JpIqK3JR2HzubSblTn+lzUxD+H81HfRxHOo6zsId51rxUny00g3n3koDigOnQDJd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JESSQp8b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674B9C4CECF;
	Tue, 24 Sep 2024 03:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727147092;
	bh=BNEXgbQ7QRV54EvqG3RZHSNqL9znPUUtxl3n2Im7ydU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JESSQp8bUlz8/wktkseCVtheMm5r89t+n+MVIxnAwEUe/jR4xsP4BU8uXviFa+gSN
	 8S7gCfajH99ZbvJkT3ZNYKcXR/WSlk4QogTXoXM0w+jSxHpP41FUSeDAm4pvAFFJ1T
	 vOZSjw8cp2FtlqFU40ljMZUWA/5UJB07jTevZvN177fOZ5C/g6+53v5ANr7IiHzCTi
	 nGassdBSTxBVqXW8aT/j0whf66v2oTOiwukgVzE4Sk11Hnvv1Bv2zsYcBUimgsctRT
	 aUlb4jpZm4S1/Veb7T4huMZfDMEVyyCa/I7Wt9jd7E34OEU69+1k7vrcVNmOSfQR7R
	 r6FPmFC/ndKrA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so52270351fa.0;
        Mon, 23 Sep 2024 20:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdkF/xFeSLsUmd0UnsuT8ZEfxjEKa5dU+Q5D4UZsOzMjf06eOz6VWXMJtTtMtXv0ov0VmNGyHw4p6ayvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw73JF424SISqnZhY9buzlXBbTGKoy34O/mVTbVfWqyY0Gs8hDQ
	igvPnQ14FYHfvtWGW7BbOu3P9rUn0nRfgNPC3cAPwEZuAmW+iDDrfUS4E+uk8n96b2CSJQtL7Jt
	TvDHjGTZmnP3qEk17iSPrjycEP/U=
X-Google-Smtp-Source: AGHT+IF5yrNC4KfCXdFMF2YsfUiYjkpDKkzVWHu+f9OOw10/EMJVn2CbSO2MOgoLfmY+6Gtgy4UK4bqKdV5Y/boPfTY=
X-Received: by 2002:a05:6512:3d10:b0:52e:7448:e137 with SMTP id
 2adb3069b0e04-536ac2d657amr7027310e87.6.1727147091075; Mon, 23 Sep 2024
 20:04:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913171205.22126-1-david.hunter.linux@gmail.com> <20240913171205.22126-3-david.hunter.linux@gmail.com>
In-Reply-To: <20240913171205.22126-3-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Sep 2024 12:04:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR7+Z4ZMP7seXRAzednWTdvsbNOef4Oxk75yWPNNwe3Zw@mail.gmail.com>
Message-ID: <CAK7LNAR7+Z4ZMP7seXRAzednWTdvsbNOef4Oxk75yWPNNwe3Zw@mail.gmail.com>
Subject: Re: [PATCH 2/7] linux-kbuild: fix: missing variable operator
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good catch, but please fix the subject prefix.

For example,

streamline_config.pl: fix missing variable operator in debug print





On Sat, Sep 14, 2024 at 2:12=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Put in the dollar sign for the variable '$config'. That way, the debug
> message has more meaning.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index a828d7ab7e26..ddc630f2264a 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -503,7 +503,7 @@ sub parse_config_selects
>
>             # Check if something other than a module selects this config
>             if (defined($orig_configs{$conf}) && $orig_configs{$conf} ne =
"m") {
> -               dprint "$conf (non module) selects config, we are good\n"=
;
> +               dprint "$conf (non module) selects $config, we are good\n=
";
>                 # we are good with this
>                 return;
>             }
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

