Return-Path: <linux-kbuild+bounces-4862-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC79D90F3
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 05:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0814D166F36
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 04:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB2212CDA5;
	Tue, 26 Nov 2024 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQTECpwG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB042A80;
	Tue, 26 Nov 2024 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732594392; cv=none; b=HFKhKPTDnXr6RsmdmoXwhR8D5M7vC98h4G3ZeTiN4eLsfwY8XIfj5xqDjq2nTceARoTEvfmpeQ+Yzc7hGGATtNESLrf4dwoRGRSMghFrlDPifRduKwHDMw2xuiggEyjGjdU2oKTeFri1bAoAUiL+7G6UYfqhuSJ/io7+/H+sn1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732594392; c=relaxed/simple;
	bh=wvE1j6jYlustZGPgO4za1DJpvm8S+eQ4rSParDa6Lgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubKQbR0FPLhCecU31WHHpShmcYEufta14YzKuvKj7tyTQjoyNgMwlzXeDT/AeoQWJCyToSKgqF7NIjjGc0XGhZVnai1lD/2Z5PSDfChBZidB3K0NyoGtDjmMAguB8e9CZW3JA9lUrQ8amuBCg/2XtC4Dr/+wMzd+G39aqss7ckE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQTECpwG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FB4C4CED7;
	Tue, 26 Nov 2024 04:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732594392;
	bh=wvE1j6jYlustZGPgO4za1DJpvm8S+eQ4rSParDa6Lgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uQTECpwGCtXvgW65bmiUP/yGxJvz0r7mVGsCCqF/XcRfiIuZv42jYE+QPSuePckeG
	 dVbnsZ00LE3d97xJR0ePFq8U2Yna8qZuuLQRvwb8eQI1wxd3k/KmMWjdEoDku2wqsM
	 5TBjzWODkEd91uKinwhXClwNwOgrMStAMcYizAy7nilQEqoHOb5j+YoNl+se83vScv
	 +42ovPaLlv1+IrKOuv6MgCjlDvHiXubKEt15Twjb9yqSSaQbJexzFs2nkEel1m063j
	 NmiD8mcuO+uw07c8qlCBNtJ2U/ke+no1KjokLVaCPMMy7AyeXY4qgL1/BNNqPb5+Jm
	 gINg2xT+7LbPQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffced84ba8so1223721fa.2;
        Mon, 25 Nov 2024 20:13:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV36tjH5IWTg9U+yoJeP5cYMlIP0nOgwTMW9TM8ZRlRdHhacAvVHb2TomybLNz2KJCh1l+FmUmxZCCILk5G@vger.kernel.org, AJvYcCWiMo8rBXeRyO5pFfoVRCDqxRRNdbQIgAuAaUds1NqNU+jl3LJBlZvVL7EJP5EvlxLY4tLOwobeLMA8p69O@vger.kernel.org, AJvYcCWtm+xh8j5ZfA3+nzo23vWjc8319gOuzC7GRtjOiCI1XnbYDIAtyVub5qN9UetOcmkFuof5rysE8j3PjhJX@vger.kernel.org
X-Gm-Message-State: AOJu0YxVR/6jAzLqJhdnCWtxqPC/69VG8h1t4z1SKm/CAdD6ZzXSLUZo
	di+BFhvig6VY1Uz11gVSBVQkAAeYyyjwuEHFn7ckVEKmLDxkN2OJ2rO3sLOUb+C2yxFmBDBDCGk
	tKjkyg8AXVKVvUwfawyIwynHGVRM=
X-Google-Smtp-Source: AGHT+IGax4HC8zIQqLB8xrI0moZd82uV5VPNJpszQ12dMOodNR4A+EElpdPN8bJ83seoA/fkNz8n4WUh6BTdRHvKAZE=
X-Received: by 2002:a05:6512:b86:b0:53d:d0f0:ad0d with SMTP id
 2adb3069b0e04-53dd39b55bemr7255517e87.46.1732594390702; Mon, 25 Nov 2024
 20:13:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz> <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik> <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
 <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com> <20241122204157.GA125569@pevik>
In-Reply-To: <20241122204157.GA125569@pevik>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Nov 2024 13:12:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARDWAw6Yo9HdO-Sba=G_bohr_0uXuKtgNZSr1YLeQE2ug@mail.gmail.com>
Message-ID: <CAK7LNARDWAw6Yo9HdO-Sba=G_bohr_0uXuKtgNZSr1YLeQE2ug@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Petr Vorel <pvorel@suse.cz>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 5:42=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> > On Thu, Nov 21, 2024 at 10:49=E2=80=AFAM Rob Clark <robdclark@gmail.com=
> wrote:
>
> > > On Wed, Nov 20, 2024 at 5:17=E2=80=AFPM Petr Vorel <pvorel@suse.cz> w=
rote:
>
> > > > > On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.c=
z> wrote:
>
> > > > > > It will be used in the next commit for DRM_MSM.
>
> > > > > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > > > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > > > > ---
> > > > > > Changes v3->v4:
> > > > > > * Move definition to the end of the file
>
>
> > > > > I prefer to not check the tool.
>
> > > > Ack.
>
> > > > > Why don't you install python3?
>
> > > > Everybody installs it when it's required, the question is how to in=
form about
> > > > the dependency.
>
> > > > There build environments are minimal environments:
> > > > * chroot (e.g. cross compilation)
> > > > * container
>
> > > > These are used by both developers and distros.
>
> > > I don't think py3 is an _onerous_ dependency, but it has come up as a
> > > surprise in minimal distro build environments at least once.. so I'd
> > > be a fan of surfacing this dependency in a predictable/understandable
> > > way (ie. I'm in favor of this patchset)
>
>
> > "once" is a keyword here.
>
> > "/bin/sh: python3: not found" provides sufficient information
> > about why the compilation failed, and you know what to do
> > to fix the problem.
> > This is good.
>
> > If you hide CONFIG_DRM_MSM silently
> > due to missing python3, you may scratch your head
> > "why drm/msm was not compiled?".
> It's not on the list, but still visible in help (via search).
>
> > This is worse.
>
> I'm ok with this being refused. Yes, it's a trivial thing to find that py=
thon3
> is not installed. I wasn't sure myself if this is really better. Having
> something like "requires $(PYTHON3)" would be best solution (e.g. not dis=
able
> the config, but exit before starting to build), but of course unless this
> feature is needed for many modules it does not make sense to have it.
> It's because kernel mostly contains everything (unless languages like pyt=
hon
> or any other dependency starts to be added). For this reason I like that
> mconf-cfg.sh warns when missing ncurses devel files (even suggesting pack=
age
> names).
>
> Just to explain what was my motivation. CONFIG_DRM_MSM in in arm64 defcon=
fig,
> thus it will affect anybody who uses the defconfig (any distro will need =
to add
> it).


arch/arm64/configs/defconfig is a multi-platform config.

If CONFIG_DRM_MSM exists in arch/arm64/configs/defconfig
and if you want to build arm64 defconfig, you need to install
all necessary tools for that.



>
> It's needed only for Qualcomm arm64 devices only. But only for these devi=
ces
> which are mainlined enough to really use CONFIG_DRM_MSM (many of them are=
n't in
> that state).
>
> postmarketOS is the distribution which supports Qualcomm. It stores kerne=
l
> config for each device and devices often have individual maintainer. E.g.=
 175x
> "once" :).


If you do not want to be bothered by unnecessary drivers,
you need to disable the relevant CONFIG option.
(e.g, scripts/config -d  CONFIG_DRM_MSM)


This is the standard way we have for many years.



--
Best Regards
Masahiro Yamada

