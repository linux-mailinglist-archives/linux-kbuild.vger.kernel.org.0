Return-Path: <linux-kbuild+bounces-2510-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE5930B26
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 20:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C31E1F211D9
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 18:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58FC131736;
	Sun, 14 Jul 2024 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+bjXC2W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F672E3E4;
	Sun, 14 Jul 2024 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720980287; cv=none; b=PllCHtKXm0kf/UFb/TZ1wQNMBsvvuPUL1hKSZNWevlMiFIIBBei9zozPQakJwDQmMShy1dFdJd+aXlN3PClwdNqM48wxforoKDpxinpIYiDn4QcVZIN989cYWEVl7vCL2jjgRDJntbGk9F4OgGMLUqnCABf1RweXXXjBMvBC/nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720980287; c=relaxed/simple;
	bh=9RxT7dyfYpi2MD4Eb3n7xs8RFGVVX/IklHlE/8jn2qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHO0YXrvXipcyH8ac1akUMpXGEZu0DQsp7p6fWxRPO2TcnuAWFGlQc8fbhb9UAGTGlFIIPi8ly48ZodBQJDjwLwO5PYO9OmBi4nuZ9/qLU806moGnQD9GcCUa72wBYbxRA+W6rzyO/svi4CrkZZwvpj1JqMBErbapNR1fzPUvZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+bjXC2W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36139C116B1;
	Sun, 14 Jul 2024 18:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720980287;
	bh=9RxT7dyfYpi2MD4Eb3n7xs8RFGVVX/IklHlE/8jn2qc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K+bjXC2W8h9I0BHHT/jg23pzt0GgLkuXt7bxNa4IVzQ4WGUOqdlGdyYhaiwVcQBWy
	 7epFXeSpKfcGqF1oOwFy6+gNGnyXg/1gjOsjbRt9WstykdNLG0hA1nQbChUF3Za+YN
	 e0akTbxyYSwCu/183EzQpCBVxAcq26nFy2fUzhUD6Yx6EPhOvY4wYW7m1/+hIsjtZL
	 /xd/stE12t4qLG2P61d4zQsXXYZ79WRFEHEVS9ye1arXFkHk/a/GIOxCTVDDE43x+1
	 WEw4XSsaOQK3CliO9yD8MuRQ95D3dp03pdALqTZ3gqECPuQRqz3ZowTpx0HgJosKt4
	 wKOZ6t2Aqf/SA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso6239497e87.0;
        Sun, 14 Jul 2024 11:04:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmuxj8jH0CCYTGkDhHOKloTUH74p1m2ETyKLrnRc6p91DR+Vdud00FM7jW7oFkHl4OvehUzVfepMZCCtyrW0bTzazkfEmR9L/IfDfDYHl9PKgDPLFE2QMKsfbAsJbA1gzVcrI2AMz+FjRU
X-Gm-Message-State: AOJu0YynC9zEUZDyG7GOyjvgRKfOs4/Jxc1jEQypa+kxz+KPwaBXRL1W
	BKHUcK9vEU/H4WuYUBh+kt5S8/gvG06XryubXN7EjRbrl+t2G3kMoyeU6OSD0Zk8sZovXRAH8xU
	xWsHkft0kMuPsh5Q4iCdNYUT7srE=
X-Google-Smtp-Source: AGHT+IHvTIEIq63jIFfaQjh4ZNeh8Ywh37Hyz0Jvf+baBC1/OhklzsOIP/x+7lTgd3q9QrwLEzJ2oHThDSMNYvj80PQ=
X-Received: by 2002:a05:6512:3190:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-52eb9759439mr15190588e87.0.1720980285890; Sun, 14 Jul 2024
 11:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711164935.1369686-1-jtornosm@redhat.com>
In-Reply-To: <20240711164935.1369686-1-jtornosm@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 03:04:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8WS80JmkF5_VhYoq-ENf0sSYx6upKvL4vTfM=u7tSbQ@mail.gmail.com>
Message-ID: <CAK7LNAQ8WS80JmkF5_VhYoq-ENf0sSYx6upKvL4vTfM=u7tSbQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: avoid the warnings with dtb's listed twice
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 1:49=E2=80=AFAM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> After 8d1001f7bdd0 (kbuild: rpm-pkg: fix build error with CONFIG_MODULES=
=3Dn),
> the following warning "warning: File listed twice: *.dtb" is appearing fo=
r
> every dtb file that is included.
> The reason is that the commented commit already adds the folder
> /lib/modules/%{KERNELRELEASE} in kernel.list file so the folder
> /lib/modules/%{KERNELRELEASE}/dtb is no longer necessary, just remove it.
>
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---


Applied to linux-kbuild.
Thanks!




--=20
Best Regards
Masahiro Yamada

