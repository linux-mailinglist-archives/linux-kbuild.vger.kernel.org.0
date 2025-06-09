Return-Path: <linux-kbuild+bounces-7406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4AAD1652
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 02:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 017453A9900
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 00:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F385AEAD0;
	Mon,  9 Jun 2025 00:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQDX7zkK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C331911185;
	Mon,  9 Jun 2025 00:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749429557; cv=none; b=Vtu3FNH/iJeE2lZ/YYVjYGp1SoNlLViN4G/PqYu/9y8o0aBjKGXi7eAxJIEsUHub5HdX0bM9wW31YS5OjICAWsvrLns0Ej+qCup5OmX3JAKvFVTOxdHPTHIcs45IXlYsRP+tdOcOTtPHAI2KJNaI5wT7hMsWeY4xVY6NldZtRZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749429557; c=relaxed/simple;
	bh=JVn2p/DOukt6MdIMXqYFhWzO3ZLA2yCp1Wi2vYVnstU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olKQDn29Dhg/8r38OmXk220wrb4L9M1I5AOevMi/odN2Ev6paH2QZ5EbtnGaSADIQy4DrTEv9q+UhE+Hv9OlmILIsq8nPOdjL2+a1CW8iv8y3CY3TJDkVHzAEBmGfqxymlvZP2FJSP0B3cL7lan0dxX7cc4E8KLErru8hzRNQrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQDX7zkK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E78C4CEEE;
	Mon,  9 Jun 2025 00:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749429556;
	bh=JVn2p/DOukt6MdIMXqYFhWzO3ZLA2yCp1Wi2vYVnstU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tQDX7zkKhmq30JMPReVhM3QEmttw76a44yZgVue2m3L3937ogxZgYWDSQufNhzw1I
	 fWZxMVCIRkZ1kb4dOxT8aUOFnqk2u8QonuCuAkfi8lpdioUYaajV1kLDUKYvH92PXo
	 eY1gFfZh6wYzGnBs/haf8vGSa6+CL/bYFwJ5d8pulPoV6Yzq8a2hzgbe0REpZHdh2b
	 aL1idE+3Cd2CMJ7p4XcpeJwtj5AehzBHo9nmueAN6KrHVcA10gmxgWFKDyLsW8PI90
	 X/LGMBINQCl7zjX4w8fAx+HbSL+Hq6rkzCru8VDo7N3X5JF26Wt0rVFZUQ7ZnPx+99
	 ubcUP1gR45L/w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso4062309e87.2;
        Sun, 08 Jun 2025 17:39:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEqNIViFNAT6f1iU1ib9BFlE9S0lWjfVQ9Cr69QCP99XUFufkVYmPMm1l5aWFSA8aT4smIUyKsrD2d7GM=@vger.kernel.org, AJvYcCXFljV7T9E4U0DGXa2MtztH9oDKcuFdFXpcYSs+WqbUInzB0SNfuX2D/K+lRrMxeawj0s+ue9VeMur2C6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7w1EnZg7VTFmytrTNJMeLkie7DL4McoRUwzAvbMFxGyXm/hlL
	APqydRjla+ZuPDIfAUM9ri6wbCNO7PesQ+Yda0rKMs4NUMo6+rSU90IPRWbx9Jf+Km/gKanEkiJ
	BZIDEXgLrR14IzX1tpVXpMyOcj5tyHTA=
X-Google-Smtp-Source: AGHT+IGqVARft2TYYa+6T9yYG/WuZGNFqU+b6fS5l1/WPY/oHwSWtDlykGIeEjkIK+DWT1ClbDqcxkWe66OyJ4e50q0=
X-Received: by 2002:a05:6512:3e0f:b0:553:267e:914e with SMTP id
 2adb3069b0e04-55366bd0e82mr2971642e87.1.1749429555011; Sun, 08 Jun 2025
 17:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608142737.168829-1-chenhuacai@loongson.cn>
In-Reply-To: <20250608142737.168829-1-chenhuacai@loongson.cn>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Jun 2025 09:38:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAREbns8J8QV0SHSvgu21tcUPoxNmGaig9yueOmSOt5_oQ@mail.gmail.com>
X-Gm-Features: AX0GCFtaA6qH1gDKXaSx7uF6m4SsiJMJhIU62CV9PNl0D0e6ozT7rt0W875uef8
Message-ID: <CAK7LNAREbns8J8QV0SHSvgu21tcUPoxNmGaig9yueOmSOt5_oQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: loongson: Fix build warnings about export.h
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: linux-kbuild@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:27=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=3D1") and 7d95680d64ac8e836c ("scripts/misc-check=
:
> check unnecessary #include <linux/export.h> when W=3D1"), we get some bui=
ld
> warnings with W=3D1:
>
> sound/soc/loongson/loongson_i2s.c: warning: EXPORT_SYMBOL() is used, but =
#include <linux/export.h> is missing
>
> So fix these build warnings for ASoC/Loongson.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---


Thank you for your contribution.

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>

--=20
Best Regards
Masahiro Yamada

