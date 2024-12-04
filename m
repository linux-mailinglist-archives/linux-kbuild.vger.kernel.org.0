Return-Path: <linux-kbuild+bounces-4987-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11AA9E34EE
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 09:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA12D168B7A
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 08:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BD5155C97;
	Wed,  4 Dec 2024 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+UqW5mw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7591FA4
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Dec 2024 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733299598; cv=none; b=sVQ4CVN1sYxjJFQJvQnBU+6aWUes3LOjundttmnM4OuGUxFrNY8dEnfZ5u507ibm6hysx30qb3gs5cH6UrjvzktiKUs94AkB0uL9bX2gd/R8jbac/UcheJ2cmRkpfyem143dnjPuECvr/m/q9z0iNEOf7Mc9g3Cj5ytC5pm0zuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733299598; c=relaxed/simple;
	bh=AnL9Ek96nRN0MLAvsm/ADR+dxGhbyNbBzW2jia4EP4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Upw/DUkxfqvzhHTwbawoG+qu75onlfeZxX4rumihBmnHQGKN+eiWC2CKSEZ/1qSNJGCgzowF1P9X3hzZePOA2qRLeteYjTN/X6N9s8KSLvl2NpaG/A5LQSHY0ildWU6hjpzglKgxvT2+I5XF7Q5rWk1yh93GPM8A82JsfzlTp/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+UqW5mw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD79C4CED1
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Dec 2024 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733299597;
	bh=AnL9Ek96nRN0MLAvsm/ADR+dxGhbyNbBzW2jia4EP4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r+UqW5mwZaU8tg0FmSV5VhMD2hQ6T6bQOPYMWavmwbW9Rw4Lyo3l5p1Ugs8BzcNvy
	 jM5wGtubVKtKOh4M3BDwhawO1Qz1Qh8tW63KIg8JcDKnEuEtwpDrc/BYrQp8cdPIVG
	 GevLGcCiFbWfRiorPLQZdhSKLYDOZ6KwuYFcJhrlYRxsWd5qUTHf3haLpHJUseC1vg
	 7cpfUmRFHMoGl1YSCtAs4K0LI/OSoYaRFT3tr11L1X1sHNPrkmcoaPR7/OOJfT5xXH
	 CSI4gg8e+V1PjPcxlDRWJNwCL7sg+SAZW9ZqBnFrB3nnbFvABnGQWK22uLIt2Xy9E8
	 GMKnehb9ssmgg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so6458951e87.3
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Dec 2024 00:06:37 -0800 (PST)
X-Gm-Message-State: AOJu0Yzx8Y/5wFKactC8F/DGUSIIRseSEcJnMzrO5tbw9wm8awjStTg+
	j9tBTwORYaNcN+udicY//JyGOMzbgyWQeW4fCNPUrmbWGaf9koKCxxgRK9tFJhlbaHbBr828NKf
	yAbNn6ZMpYXlSEKGRqaNCCNgd8bU=
X-Google-Smtp-Source: AGHT+IEZmkm9QwqgJkJMx2DxA4qB5GsI+sFZcOGPjgItUIGOx6SH1tLAIlju+NhmnCeRtrK2HC95zksCpIrUSW/70Bc=
X-Received: by 2002:a05:6512:2815:b0:53d:dbc4:3b8f with SMTP id
 2adb3069b0e04-53e129f187fmr3015667e87.13.1733299596305; Wed, 04 Dec 2024
 00:06:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATQ6Gu6D6gpH3htJS=e136zPBQbCxtMLZU3YZx_bkWiLg@mail.gmail.com>
 <20241203161735.2411494-1-josch@mister-muffin.de> <20241203161735.2411494-2-josch@mister-muffin.de>
In-Reply-To: <20241203161735.2411494-2-josch@mister-muffin.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Dec 2024 17:06:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTAKJDG5X5TfTYdoVe1rwAV+njyLSG1h73JJ6zcL57KQ@mail.gmail.com>
Message-ID: <CAK7LNARTAKJDG5X5TfTYdoVe1rwAV+njyLSG1h73JJ6zcL57KQ@mail.gmail.com>
Subject: Re: [PATCHv4 1/1] kbuild: deb-pkg: allow hooks also in /usr/share/kernel
To: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 1:17=E2=80=AFAM Johannes Schauer Marin Rodrigues
<josch@mister-muffin.de> wrote:
>
> By passing an additional directory to run-parts, allow Debian and its
> derivatives to ship maintainer scripts in /usr while at the same time
> allowing the local admin to override or disable them by placing hooks of
> the same name in /etc. This adds support for the mechanism described in
> the UAPI Configuration Files Specification for kernel hooks. The same
> idea is also used by udev, systemd or modprobe for their config files.
> https://uapi-group.org/specifications/specs/configuration_files_specifica=
tion/
>
> This functionality relies on run-parts 5.21 or later.  It is the
> responsibility of packages installing hooks into /usr/share/kernel to
> also declare a Depends: debianutils (>=3D 5.21).
>
> KDEB_HOOKDIR can be used to change the list of directories that is
> searched. By default, /etc/kernel and /usr/share/kernel are hook
> directories. Since the list of directories in KDEB_HOOKDIR is separated
> by spaces, the paths must not contain the space character themselves.
>
> Signed-off-by: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
> ---

Applied to linux-kbuild. Thanks!




--=20
Best Regards
Masahiro Yamada

