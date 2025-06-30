Return-Path: <linux-kbuild+bounces-7772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 524DAAED37A
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 06:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72B0B7A60C2
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAA3190072;
	Mon, 30 Jun 2025 04:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TY5sXtUo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD84A23;
	Mon, 30 Jun 2025 04:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751258079; cv=none; b=RsoZRnE9yNQI+FbUqh3yGTTdFtFJiEe1dh3I72wOqPTZn5PwIMvXZRRV5tnT1vSnI9/eguUorh0v2++vdrvtvLagDWShro8wJJ40MeRzI8KsXJJHOa4hZbZjVPGP8rfr8fxeImoQhecvhh2b90a/tfF/mSwQITWY6WzDNXE8l3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751258079; c=relaxed/simple;
	bh=U/Z5Sd07oISMnb9GgjVS1CsZITDPkRHw3GfjdOp7/10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qv3pSU2WXA6LjBwhhBNX2CnLaXXN5ahbZjy4Gbr71r1pYEBiEGtOxbpqkCAk7eYZ1oQI97IkYgKUk4S311lenAcqSLEx3P5GHLbVyuyJJLiWPtRgNXCVdlndF5becRuO+9xbbVbmRP50JMOXJR18bEisxcyhZK+ASj4K+9kS9jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TY5sXtUo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57126C4CEE3;
	Mon, 30 Jun 2025 04:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751258079;
	bh=U/Z5Sd07oISMnb9GgjVS1CsZITDPkRHw3GfjdOp7/10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TY5sXtUoEQpRJJbt2weHVvFd2K0QoWQ1J+MpZ88nxnMcUexOsjjhSWUHo4kDKC/ol
	 jQ1pH1eiEtL+PcCJRKh1rlwjF4q5HDieDPjbAGGv+wLNzVkK7mE+gbePBc7u1Ox+ns
	 HNTceTFDj6YnRqclt6uEoGExybJZxs2VraDA4fSWFdqfPHg4+RslB4ECdZwbsl6Tfr
	 E+ONWazPitmiT6NLKGMC2CyV07Yt6gL1Lsu6o1XyxostDorK6B38i2vQvti5FZuIbz
	 7Z35UM+1AyAeQYUCXALB7ne3KdbOBTIZ8fiMOC/gxMjTTo0yr4lopyG4R721YXKzF9
	 Kepz0rjtwPq5A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b5165cf5so5289951e87.0;
        Sun, 29 Jun 2025 21:34:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YxHJphMBX0rwjFYKXyozRRQsUv/TkR82a7aXviUsUdFQmrsrskg
	QlpZKffy4GdIOJWEQ/x7x/1MsiD6BaONXm18VKYOxzmP6tipDXnMBqnyNz5sRkCO7RtwnwM7Vth
	J0DjJAkrL9SxBSI4/EDp3hkRaf2747oo=
X-Google-Smtp-Source: AGHT+IH0FBlqkBQKwXjr7mZ9yAYLRUa98XOYFPIIcs6sleAHfNF8tgiUpV5Vr0TyeOzQEybWPIJ6hecJDBk4xuvVGUE=
X-Received: by 2002:a05:6512:6d6:b0:54b:117b:b54e with SMTP id
 2adb3069b0e04-5550ba6c08dmr3304549e87.57.1751258078026; Sun, 29 Jun 2025
 21:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629184554.407497-1-masahiroy@kernel.org> <20250629184554.407497-6-masahiroy@kernel.org>
In-Reply-To: <20250629184554.407497-6-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 13:34:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDc8QECUWCiCsMaj7X=YqT4P_mVsEA051+aHYzFwWxvQ@mail.gmail.com>
X-Gm-Features: Ac12FXygIKD-EEt_Y_ZyBXIO0mwd0pJKk_cmUK_q5_vOBFb6AcL9gkoVIT6_xEk
Message-ID: <CAK7LNATDc8QECUWCiCsMaj7X=YqT4P_mVsEA051+aHYzFwWxvQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] kconfig: gconf: migrate to GTK 3
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:46=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> This commit switches from GTK 2.x to GTK 3, applying the following
> necessary changes:
>
>  - Do not include invidual headers

This is a typo.

I will fix it to "individual".



>  - GtkObject is gone
>  - Convert glade to GtkBuilder
>
> [1]: https://docs.gtk.org/gtk3/migrating-2to3.html
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>

--=20
Best Regards
Masahiro Yamada

