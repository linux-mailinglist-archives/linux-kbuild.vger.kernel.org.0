Return-Path: <linux-kbuild+bounces-4514-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 669969BD970
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 00:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E4CA1F218E1
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2024 23:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01185216218;
	Tue,  5 Nov 2024 23:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUdTCLpT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6CC383;
	Tue,  5 Nov 2024 23:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730847948; cv=none; b=kmt/r7T/TFIOu2U34IRLMMRLU4pWZ8GsGiH7wZ2HXl4mtRPBeIpQ3ZPhBbnUMCxCcr5WRnM03QZNHPD4t7B58NMhHbU9y5mKOZ21XWc26CvqMJpXyTvuBXsIbT9JoEmpNXshMR3RRToWKAREMmdaS8aP1yNqz4sTBoa7Qcv3XN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730847948; c=relaxed/simple;
	bh=5U9SEPlK9+/f4fv5SdPiNew8MYF+Ga3VAqLWMDCrEP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRC8EZWwlKvUaWgmExkGj60uvkrpIUa0Z32ACCKVcnlMKlPTRewj6a6Oi4+BLE8ievrIfD+5XRNPtMeWw9E0l6XCHNeFL+EFLnXV1BEqD63P6oRkiIjzzM/7J+RxMkBoD/h9QoxbyAy67GzqxX4Q7mgKZqXEYySR98nS5JwuyWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUdTCLpT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EEBC4CED0;
	Tue,  5 Nov 2024 23:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730847948;
	bh=5U9SEPlK9+/f4fv5SdPiNew8MYF+Ga3VAqLWMDCrEP4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LUdTCLpTidRwEtr4JpI2dyAwdm5dt7zKtjDoJbUiA3Rdac7aaY0vTv+8Ui+equoOJ
	 JDCmI01mnSdIPfn0Z4Plcj+HZ3nxu2Se1FHnqqXrs6eFyYMKCRuRP0yJ1z6ODQDPY8
	 Qyymtu700JcPbwZ7edsIKiEVIhf/0oHPOnf3IKHEWL+gzSSb6p9sNJ0TgCC1dP3TTP
	 BPYGX92arEH068i01avZqoYNX8U0iPeFwo+6oIrwI84ktiAfcuZvGQ54PmA6HqwgyU
	 acwwWhleT12OpeQPNXX5Vojsj+Il5MWr/Jg3oa6wbZune/FPVw/U7E83h9SUyHVUc8
	 jtWID+jIoN8hw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fc968b3545so59710091fa.2;
        Tue, 05 Nov 2024 15:05:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3sL0zm/F70QAREbh3n9ST8ntwrzMizVpjXsxcOuozc0dPrzUmht0wTDrRMO8Yb6/dcKWq56PXuw/PUdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC3N1ZWb1FRcPYTSjvCVVhzXbJDAzmv7lCGwET1IQSLyYU88Cy
	0IU7d4/6hQZUgmTYXYpSkUhZdwvg+5odhNZkIKEYrKsBl/PBr8sM8UE8bHgfPorMs81LoCZsBxV
	ISDAz9QfHZtqI2HBTnK9VK/dHtgE=
X-Google-Smtp-Source: AGHT+IFCC6RGi1845TUY9FgxABCUhMwyIob9VtEjO9KCDZ5yvJuk4WKsVo6+I/f3A+UM4AlPN5zGgFMfEUkpP3tiZkE=
X-Received: by 2002:a2e:510a:0:b0:2f8:c0bd:d65f with SMTP id
 38308e7fff4ca-2fdec70f586mr66775931fa.20.1730847946961; Tue, 05 Nov 2024
 15:05:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com> <20241014141345.5680-2-david.hunter.linux@gmail.com>
In-Reply-To: <20241014141345.5680-2-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Nov 2024 08:05:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARzJfifSJ7Y_1kMnt_=gEaUug5iPXeB4AaoqBRZriE0yg@mail.gmail.com>
Message-ID: <CAK7LNARzJfifSJ7Y_1kMnt_=gEaUug5iPXeB4AaoqBRZriE0yg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] streamline_config.pl: fix missing variable
 operator in debug print
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:14=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Put in the dollar sign for the variable '$config'. That way, the debug
> message has more meaning.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
> V1 https://lore.kernel.org/all/20240913171205.22126-3-david.hunter.linux@=
gmail.com/
>
> V2
>         - changed the subject

Applied to linux-kbuild. Thanks!


> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index d51cd7ac15d2..a85d6a3108a1 100755
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


--
Best Regards
Masahiro Yamada

