Return-Path: <linux-kbuild+bounces-5635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD498A295AE
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 17:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B23B03A7F0A
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 16:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DCC18A6D7;
	Wed,  5 Feb 2025 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTAtV9IL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37421519B1
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Feb 2025 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771550; cv=none; b=kxIj58eJQ5puK4USGSGPFPVnk8IaBBZ/8K3Ll+RF4Qr09O5GbjF6Fc5dOYiNaHLhCc0X2XoZGNB2n8M137Df4nRslGVyLE5pKPX5MsDTb4vG1jnqfOUK87ZUPwNIaiYOeVJUlZ4e2uUIUeeq+OFebnG3JMiPVXKZc2HsoqMiJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771550; c=relaxed/simple;
	bh=gbmT0tJy1aUFma/ssk9PB9ktu6AaZmho3Falza0F7UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvzuzYqPcoVt2b1y6Sh7QdPsEFLifk9a8Eq3jUFs03Fz2jn2CBXixwPIe4PubZSWkROJJiuTvmAmEtN5URN3n/wBjIZ0dpVCfZ0XCrr5vi50a6tWbgSGg8w4UXZW7ZfaLSxiheoheYAfdL2cu1bnqbJ7y6yzb8qPDCzNupkYf5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTAtV9IL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58ACDC4CEDD
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Feb 2025 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771549;
	bh=gbmT0tJy1aUFma/ssk9PB9ktu6AaZmho3Falza0F7UU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WTAtV9ILtjKKp/DxeWtQm9Q6XO2m6oeIfKI92AVSJP29OiVJTIp2SB3bIoeatVs4m
	 cE0lJgcExy5zgRHnCh8hQNpNZTE8o5LN4MLXPrmE+P+CkBOXDwHCiH5MzJNePKQbty
	 +PTyHg4EFBn6PvWe76JQ2D4iYRhGjEuxvks6qe/ijw5+IhH2cyU60ABENlsWROr7nT
	 bYn2E8pZoxTAyTF1beNsesb+u3eeSfmi9jcO+UolU32r2GlwLxHZ4PuxsD4eG3t+hc
	 sYHE5fOP6M7DftmzULXi4PbUGJPwZ52SB0rItiOse22henZtZWbBfyePI9xODkzaBu
	 8nGE0Ut7I8xXQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53f22fd6887so6997659e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Feb 2025 08:05:49 -0800 (PST)
X-Gm-Message-State: AOJu0Yx88W9dEMFugi12Cdmfgiywc9RuQT2a5QFEIrHpNb1y5nPiQ94H
	APbUpC+EJhKtyG8gpEWkzLQWkCX76wlSUQvqYi+xiAhRxQSskcQR7/3mUCl9VIR8QMSWPFjqekn
	PNbSBzphSEWoSL5WM+fuqCd/2Hv4=
X-Google-Smtp-Source: AGHT+IHgOAiTF0/D7otDEj+CvnSQLFWHgjUKL1NMObRaOgW2E/hHXu36ihFdgvJm1/eLbZIO8P/2HcExmk9KKEx6bmg=
X-Received: by 2002:a05:6512:132a:b0:540:353a:df8e with SMTP id
 2adb3069b0e04-54405a44cf5mr1217043e87.39.1738771547894; Wed, 05 Feb 2025
 08:05:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204052004.5583-1-lesorubshayan@gmail.com> <20250204052004.5583-2-lesorubshayan@gmail.com>
In-Reply-To: <20250204052004.5583-2-lesorubshayan@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Feb 2025 01:05:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARVWB_GSPWcAxkKR4sx7AbGv8R6tf_2O246ixdH31bk1A@mail.gmail.com>
X-Gm-Features: AWEUYZnH_wQSyRvnvynlN1dn150lRmVO_3qsI2xNHtuhPLJz3KzP5qpmydaxTTA
Message-ID: <CAK7LNARVWB_GSPWcAxkKR4sx7AbGv8R6tf_2O246ixdH31bk1A@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: fix misspelling in scripts/Makefile.lib
To: Oleh Zadorozhnyi <lesorubshayan@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 2:21=E2=80=AFPM Oleh Zadorozhnyi <lesorubshayan@gmai=
l.com> wrote:
>
> Signed-off-by: Oleh Zadorozhnyi <lesorubshayan@gmail.com>
> ---

Applied to linux-kbuild/fixes.
Thanks.


--=20
Best Regards
Masahiro Yamada

