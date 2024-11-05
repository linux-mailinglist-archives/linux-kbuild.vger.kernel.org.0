Return-Path: <linux-kbuild+bounces-4518-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B59BD984
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 00:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D4D8B21E49
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2024 23:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EE621620C;
	Tue,  5 Nov 2024 23:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFQ+fvVO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD21D270A;
	Tue,  5 Nov 2024 23:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730848473; cv=none; b=XqMFvo+Rx2q0NRJu1nWaijvMFhZCzVVRseLvhoAzdJG80HM/zSFdvCvcuErjsWukdDMnLTLOyxKsOvJqyt10A192BwfNXhXdrkHa7NuRr9HB9wSajbZLErF4AbeRfclIEiEYT28DYypO6UTmTPOqzQlf37RrZlDEoYh8x5NJ9Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730848473; c=relaxed/simple;
	bh=+voRVJsqASUWCnvpnWD63XH3qZJXH/vo7y1dIWBip1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWi+u65euCtjaEo3KR3GvdQe1tvHN6Zon5pgNeiPouswmlTmwVXIndZ6oicoKlMiPKvMZSiqphtnuJ8C9irr4+Mse4g0wVtSsIPw9TOfE6gOfe9PecuTqUTguUX8KNFjGR8h7SfNaxJkBqmdI4ftSpfSytNBjO1MvpYUsXdgsAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFQ+fvVO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F52C4CED3;
	Tue,  5 Nov 2024 23:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730848473;
	bh=+voRVJsqASUWCnvpnWD63XH3qZJXH/vo7y1dIWBip1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QFQ+fvVO5n3A79FSYsAzxnlQaI1vNsP/jKDfd10EInB2dH1LdK7UKqNlWhH3f+kUZ
	 8xwWxPVELOLS+TZjaankDUNfbdRT01+wTxIQtPbeor/hXMJ+YFrgFcZo8+xr0m1i7M
	 TxLXdYxybnZ7UkB5ZuTSvIh5fnNlKCh7sHe3dCHDc6It98zzWuwsdz68/1z4zpkBXH
	 /Om+pUR7kU9tUKaE09kcTZwwc5Ndy+Xf1uIGhxv1xhf6wQNpn0ADmcqZaoO4fHokfc
	 TuRyBd5WVVkioJJnW0HvT4fNdINqQwscCYJUi4MYx2RXmDtDDBHzG7UEwIVhPE0vK7
	 u/O8TuyhSqBVA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e3f35268so7400809e87.3;
        Tue, 05 Nov 2024 15:14:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWX4Aes2pXsvMfmCfpT+09TLQS72hRpkgeuxLyX3sBOpjBP/1yXjd79FbFT8OwBCV1XxKLZKy6mGhJdRag=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTVf09Tiync3lmAFCskGfqJHjXtXcJgfpq2wuCegFF+XBHmu9+
	jxXi2vk6CMgnnFhaiWsT1kgYeGLLK9Wdt9nJTph04ylC3f6is7w8t9k1o93f68JtgTlFVD4PhLS
	Jcn297b4o8vjSuTVBwDtmQy1Xxc8=
X-Google-Smtp-Source: AGHT+IEM9QJsCPRKdfpax8cGcFMwkaVtHBdpfHiaq0AbyJDrTwxfTmMpNNhNaB36vZcjDyC2BkCgvnPFJZNKcA7przM=
X-Received: by 2002:a05:6512:32ca:b0:539:93e8:7eca with SMTP id
 2adb3069b0e04-53d65e02513mr8807866e87.35.1730848471972; Tue, 05 Nov 2024
 15:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com> <20241014141345.5680-4-david.hunter.linux@gmail.com>
In-Reply-To: <20241014141345.5680-4-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Nov 2024 08:13:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ0xwiaq7vMWRb4xh7tacthTfWwokqjio2vEbtTga+Bfg@mail.gmail.com>
Message-ID: <CAK7LNAQ0xwiaq7vMWRb4xh7tacthTfWwokqjio2vEbtTga+Bfg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] streamline_config.pl: remove prompt warnings for
 configs with defaults
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:14=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Ignore process select warnings for config entries that have a default
> option. Some config entries have no prompt, and nothing selects them, but
> these config options are okay because they have a default option.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---

Applied to linux-kbuild.
Thanks.


> V1 https://lore.kernel.org/all/20240913171205.22126-7-david.hunter.linux@=
gmail.com/
>
> V2
>         - changed subject
>         - put a space between "if" and "("
> ---
>  scripts/kconfig/streamline_config.pl | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index 85f4712e2bf3..8e23faab5d22 100755
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
> @@ -222,6 +223,7 @@ sub read_kconfig {
>             $depends{$config} .=3D " " . $1;
>         } elsif ($state ne "NONE" && /^\s*def(_(bool|tristate)|ault)\s+(\=
S.*)$/) {
>             my $dep =3D $3;
> +            $defaults{$config} =3D 1;
>             if ($dep !~ /^\s*(y|m|n)\s*$/) {
>                 $dep =3D~ s/.*\sif\s+//;
>                 $depends{$config} .=3D " " . $dep;
> @@ -523,8 +525,16 @@ sub parse_config_selects
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
> +       if (!defined($defaults{$config})) {
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

