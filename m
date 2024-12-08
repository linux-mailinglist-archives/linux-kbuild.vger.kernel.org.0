Return-Path: <linux-kbuild+bounces-5036-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 190529E85A3
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 15:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF161884CBE
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 14:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6661482E7;
	Sun,  8 Dec 2024 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYSj6oT9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBA81E489;
	Sun,  8 Dec 2024 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733669390; cv=none; b=EjUXn4yaEwkN6yTHCRGBSHizmJAlJvtbAg6inXcvd7zK6lE1vY6CW+5ToqSWDKPW4EMyrI3UzxbB3FWOHIoef1VsKcqmC6DPwZavky7hltWNWDBASsoP0GL4DjeqxbAO19vqK5Bdgqjt2MvZeK1/7Wr6EeXkJkVnksPJVcb9Rwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733669390; c=relaxed/simple;
	bh=kPtZsDZOFCErVRYwR6yJAFtRqrolY1qYp2Cx+9ipgL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=psbewx/nztTb9kM07CGtjy/T8ssnTzveztUiSrXnAyNGW2f+5QOkI1qiHzQWrJDsxl6ILbP3uPNYhtkNqGQraKbdNdsy7r9bcN4b95VmGmHhsWVUO9l+mmnJjjlAQ9uxeoFL76kLUeexB2l8cgUiGFYgZZDbCeOAxy1y0a6JAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYSj6oT9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF265C4CED2;
	Sun,  8 Dec 2024 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733669389;
	bh=kPtZsDZOFCErVRYwR6yJAFtRqrolY1qYp2Cx+9ipgL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KYSj6oT9dwLWkhOk9ghK108T9hNDg0ZGUCbU3SQzkfM9LQEIz2YHRm8cjDv0+4LR4
	 5znSEJWv4NvzLsG7k/OlVMWMzJaofMCjcanRSpqfVjpVbJyYdox7U/CCo+TWeHzuFk
	 47LDZR9+QXNn0nJvQEGQAxtsaU7OcRdxrKWATi1+nln7xpdSspAFJ1KJR05YjUCqZz
	 tjG9kvx4CDLz8PNDEFvyyIV4vNDgtHiX6WU91u9A330dPDBeVnLgMQmoQDeaB+dsJm
	 eS/6WxV52A33FlDNw5HebOge7qeALC2xkTEhxm5H2EDWO9wUw427qpqWFCt01xjDdZ
	 znVEemBXh/NeA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401ab97206so505783e87.3;
        Sun, 08 Dec 2024 06:49:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgGEAQxwsg+emsedKlhyEao5JaUcT87+eh4Bh6IOcSS4nliqwcMA29NvNUAcS3p0w5lUJHM8yOFiyJ17w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6WRXorpDIC2ISon0//xBPy7P7JZFVk6Plz291/QWoGbW+8vo+
	kjUQsKiTY4ZbhSHRxqsWa4mrD3mk/Z0M4Fgr9axs6uSYjH3fhmgajZfBtM9WfbLpDKBUL245qjx
	MFhZyoTLMFQiL8Wb9iawejzFLQao=
X-Google-Smtp-Source: AGHT+IE2++bMeewqyWrzEia7Ulax3nN2feLYe5c7fUpD58UMA6vpROrvY0/QbPU1aZvMBanqYtqDKRbMeta/icFQrBI=
X-Received: by 2002:a05:6512:2814:b0:53d:a321:db74 with SMTP id
 2adb3069b0e04-53e2c30da48mr2852769e87.50.1733669388507; Sun, 08 Dec 2024
 06:49:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>
 <CAK7LNATU2OKEWh6p9QuUXtYmYmqTkN5nspBq9DbCh9yUjqW5xA@mail.gmail.com> <20241204084943.GM1245331@unreal>
In-Reply-To: <20241204084943.GM1245331@unreal>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Dec 2024 23:49:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGbTxu9cYGfW6FK5VFfJ2+ut_e1dSFOfo+q6CgM4XHtQ@mail.gmail.com>
Message-ID: <CAK7LNATGbTxu9cYGfW6FK5VFfJ2+ut_e1dSFOfo+q6CgM4XHtQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next] kbuild: Respect request to silent output when
 merging configs
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 5:49=E2=80=AFPM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
> On Wed, Dec 04, 2024 at 05:25:50PM +0900, Masahiro Yamada wrote:
> > On Tue, Dec 3, 2024 at 10:55=E2=80=AFPM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > >
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > >
> > > Builds with -s option (silent) are supposed to silence all output
> > > which is not an error. It is the case for target builds but not
> > > for configs. These builds generate prints like this:
> > >
> > > =E2=9E=9C  kernel git:(rdma-next) make -s defconfig debug.config
> > >  Using .config as base
> > >  Merging ./kernel/configs/debug.config
> > >  #
> > >  # merged configuration written to .config (needs make)
> > >  #
> > >  ...
> > >  Value of CONFIG_FUNCTION_TRACER is redefined by fragment ./kernel/co=
nfigs/debug.config:
> > >  Previous value: # CONFIG_FUNCTION_TRACER is not set
> > >  New value: CONFIG_FUNCTION_TRACER=3Dy
> > >  ----
> > >
> > > Let's honor -s option and hide all non-error output.
> >
> >
> > Is it necessary to add the --quiet option to every script?
> >
> > Kbuild already provides a generic way to suppress the stdout
> > with 'make -s'.
> >
> > The following code works for me.
> > 'make defconfig debug.config' is as verbose as before.
> > 'make -s defconfig debug.config' is really silent.
>
> This is exactly what I'm doing. I'm using -s option and added -q to very
> specific merge_config script, because "-s" is already in use in that
> script.
>
> Before my change on 40384c840ea1 ("Linux 6.13-rc1"):
> [leonro@e534d5fa4327 kernel]$ make -s defconfig debug.config
> Using .config as base
> Merging ./kernel/configs/debug.config
> Value of CONFIG_DYNAMIC_DEBUG is redefined by fragment ./kernel/configs/d=
ebug.config:
> Previous value: # CONFIG_DYNAMIC_DEBUG is not set
> New value: CONFIG_DYNAMIC_DEBUG=3Dy
>
> Value of CONFIG_PRINTK_CALLER is redefined by fragment ./kernel/configs/d=
ebug.config:
> Previous value: # CONFIG_PRINTK_CALLER is not set
> New value: CONFIG_PRINTK_CALLER=3Dy
> ...
>
> After my change:
> [leonro@4dd2c2078dff kernel]$ make -s defconfig debug.config <--- silent


Not sure if you checked the attached code diff in my previous reply.

To make my question clearer, does this suffice your needs?
https://lore.kernel.org/all/20241208144622.605523-1-masahiroy@kernel.org/T/=
#u


--=20
Best Regards
Masahiro Yamada

