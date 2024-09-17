Return-Path: <linux-kbuild+bounces-3611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F072E97B18D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E52B1F23F1D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAEA16CD24;
	Tue, 17 Sep 2024 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUVb6Mve"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9009166F25;
	Tue, 17 Sep 2024 14:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726584376; cv=none; b=aJue89ZG4wxLCa+xLDvwqmOhd0Eo1ITX4AXCU56dA9rM+wZUKzRni688+pUoaZgs5Og9010GOHnI16ZV0q/bQ2ndWiRULz32Zt7R5NUj3BcOR1s+b9yskyTiz2hP/QULb2rFej4VYZHfY/J7KwIUOFVk3XMLojrSRvN8F8mObl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726584376; c=relaxed/simple;
	bh=bzGxtk+MIkfByjqW8d00PpgpiKOPF44XfST2Mx7WVCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIRQv3FIh4woHCLUKLZz1Sr6pw9hMTXB379Hj57fMltPw/YJpBRyzsp3shXLXm8rEIKNIjEBSB4Ar2ET85DYTNGv2sZB6l6uiDIUdEIQjf4yu+08uVdJniL104ukcP5ugoFm3Y3pvwTmcQqxsV8FPiKN1pYhXUE8JKUaN4t1wDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUVb6Mve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7673BC4CECF;
	Tue, 17 Sep 2024 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726584375;
	bh=bzGxtk+MIkfByjqW8d00PpgpiKOPF44XfST2Mx7WVCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qUVb6Mvek2Un5RPqAmm0H+c6VU74iuXgcy7KwEDMbJaR0A36puZDPzEqcJYqxLiNH
	 bWalm1aB0Be4rT1FV/7Ev+oigqejq4f+OykWB/9Vic5sq/FyOhfTB1Zy4L7faxBcdf
	 WKWdlY0CDWIPMXikpw08cfyHpTZrKPy8HkiKvWvR5Mi7/VPFz4SfMxm0Tw+MvFnxd2
	 qpM5OP1QcGpYPf1CK3lI37QwsNH5UyOrdfa7+EyXxeq0qQM0t403uzlyvrz0qgyiB+
	 DjJTuftsUB9QZpJdYy1/RT+/s2B20bpjuNASYlCrmkgSoiTz3SRKP3Y66ettC3r1kq
	 tISzE/fZb+4nw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f75129b3a3so61559231fa.2;
        Tue, 17 Sep 2024 07:46:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0a/TdrH79IP+161ojii0sBU8F8rU8HjDu4LjbnmvSwbrzqUQ+uysLYPIVF/IiGmr/TcqCZO5iDwpvTU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7aP6eWFm8XZx+LV4CKcr6b1essuhW0jpe41xESDAR4B7Cq0Rb
	0YSyJUyDpaIDWP5SWTcTo/eJYr9unfM08EefWT7Q6mv6hgUygXMaTZV00cmi54h5X7xJDnvyJ2s
	TYCtVX36/5Q8Qyiziht+yAQwgxwg=
X-Google-Smtp-Source: AGHT+IFDUbCjIACLojUJmRe9YfSF7lIOYMefTjFUQayEeE/cSETzSVLJx5rYk5NhV4f/bWglh+KRaGqwLFBQAozeYNs=
X-Received: by 2002:a2e:be25:0:b0:2f7:7b34:285f with SMTP id
 38308e7fff4ca-2f787ed8881mr95244751fa.20.1726584374098; Tue, 17 Sep 2024
 07:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916142939.754911-1-david.hunter.linux@gmail.com>
In-Reply-To: <20240916142939.754911-1-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Sep 2024 23:45:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbgLrU07dZe+30jzUuP-A1KRfPY8=E2hP9W-Rvzsfg8Q@mail.gmail.com>
Message-ID: <CAK7LNATbgLrU07dZe+30jzUuP-A1KRfPY8=E2hP9W-Rvzsfg8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] linux-kbuild: fix: process configs set to "y"
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(+CC: Steven Rostedt, the author of this script)




On Mon, Sep 16, 2024 at 11:31=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> An assumption made in this script is that the config options do not need
> to be processed because they will simply be in the new config file. This
> assumption is incorrect.
>
> Process the config entries set to "y" because those config entries might
> have dependencies set to "m". If a config entry is set to "m" and is not
> loaded directly into the machine, the script will currently turn off
> that config entry; however, if that turned off config entry is a
> dependency for a "y" option. that means the config entry set to "y"
> will also be turned off later when the conf executive file is called.
>
> Here is a model of the problem (arrows show dependency):
>
> Original config file
> Config_1 (m) <-- Config_2 (y)
>
> Config_1 is not loaded in this example, so it is turned off.
> After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/co=
nf
> Config_1 (n) <-- Config_2 (y)
>
> After  scripts/kconfig/conf
> Config_1 (n) <-- Config_2 (n)
>
>
> It should also be noted that any module in the dependency chain will
> also be turned off, even if that module is loaded directly onto the
> computer. Here is an example:
>
> Original config file
> Config_1 (m) <-- Config_2 (y) <-- Config_3 (m)
>
> Config_3 will be loaded in this example.
> After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/co=
nf
> Config_1 (n) <-- Config_2 (y) <-- Config_3 (m)
>
> After scripts/kconfig/conf
> Config_1 (n) <-- Config_2 (n) <-- Config_3 (n)
>
>
> I discovered this problem when I ran "make localmodconfig" on a generic
> Ubuntu config file. Many hardware devices were not recognized once the
> kernel was installed and booted. Another way to reproduced the error I
> had is to run "make localmodconfig" twice. The standard error might displ=
ay
> warnings that certain modules should be selected but no config files are
> turned on that select that module.
>
> With the changes in this series patch, all modules are loaded properly
> and all of the hardware is loaded when the kernel is installed and
> booted.
>
>
> David Hunter (7):
>   linux-kbuild: fix: config option can be bool
>   linux-kbuild: fix: missing variable operator
>   linux-kbuild: fix: ensure all defaults are tracked
>   linux-kbuild: fix: ensure selected configs were turned on in original
>   linux-kbuild: fix: implement choice for kconfigs
>   linux-kbuild: fix: configs with defaults do not need a prompt
>   linux-kbuild: fix: process config options set to "y"
>
> ---
> V2:
>         - Put in subject.
> V1:
>         - https://lore.kernel.org/all/20240913171205.22126-1-david.hunter=
.linux@gmail.com/
>
> ---
>  scripts/kconfig/streamline_config.pl | 77 ++++++++++++++++++++++++----
>  1 file changed, 66 insertions(+), 11 deletions(-)
>
>
>
>


--
Best Regards
Masahiro Yamada

