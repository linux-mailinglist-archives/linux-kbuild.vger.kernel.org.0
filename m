Return-Path: <linux-kbuild+bounces-2137-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA24909E1E
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 17:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FD04B21535
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 15:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49CB10A19;
	Sun, 16 Jun 2024 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0naiLHn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B58F17C67;
	Sun, 16 Jun 2024 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718551313; cv=none; b=Qr0v4KO27Nl5qDNDDq1Cpx3mq0n8fs2wvuszO++bYoCg98UhPV/p/W5y7Ck4OFbtubfQeIGJdPeTV3m7/7mskpBSLmRCLb3V85EO62L6oqmZE25l+OyofL2S+DLK0n867jbIJahtUGMeTLntZy77bnhSzfj1+b4z0B1KicZ88tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718551313; c=relaxed/simple;
	bh=NEs054oRZFcHRWUqwHRu4qow5jK+NtbPN+Hc1m2p2AM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQ//AowHy2tt86L65PhCtJ8ZD3ceGaaBOVbFcb7V9W0WQlisaQCZce+7EQEOM3tw5YMPgmuGIaNrmKixY7XoPavSRlSsuaVh99leO1+zHsoBWmJk60n1PCXXRChT10IzsE3s+iF6OBOkh4xdiWKKknJwYFXvIGVsgJpMdKl4hVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0naiLHn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2718AC2BBFC;
	Sun, 16 Jun 2024 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718551313;
	bh=NEs054oRZFcHRWUqwHRu4qow5jK+NtbPN+Hc1m2p2AM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m0naiLHneG0iYR4B9Z1u8hhnq8ti0hwY1ZNCYyYsxPdhZ9O6ck9P0nfVCVPj3T/EC
	 WKRp4+UIQ1QUja6tft7sD+5uda52IknmLycppKiimJpgVruLv1CIemq/A0/Mx68TDv
	 uPJT9ovaDWLw8c+kKzBxW+/t9qjUlLYgYBlb9Abb/hE9lVlVjyP3BeAJ4QWLyzYixi
	 VwuMLw+koGZhauyHclqpxFb7JHra6p9lXU0M37pzTC/q5yOtPZkQr8pH3KxvAH0RU/
	 PjCOslxSAnaxK7SZvWqD7hCMQ7u3CuVWKDWa8Ou1qUuX+o0rCKsgTKqedb6aWAPO6j
	 r1Cyn6mnI6CGQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso3531984e87.3;
        Sun, 16 Jun 2024 08:21:53 -0700 (PDT)
X-Gm-Message-State: AOJu0YzZjU9AsEdB1TxJIgCEDuC/5h7gQpTdgtJiNhHfNRbbVivxx/rt
	K01KCafU9yM2yHeNSmkOgmcNLlfQV+wGfCagMxzH7BtluYQyIlKFaElIKS+DYUb36W+bZYLeGjm
	NI3iZb0cmiwR4PORGe+P2y2DPvH4=
X-Google-Smtp-Source: AGHT+IEt1SPxTG4PEweuJf30U7VJWpA6Ulu1R7NovD9z/yJ/5NNQfyc8XhhePP8HY5lJ6wtLvXusHgf2my8JqeVPgQg=
X-Received: by 2002:ac2:514f:0:b0:52c:7fc7:f40d with SMTP id
 2adb3069b0e04-52ca6e6585bmr4851652e87.21.1718551311755; Sun, 16 Jun 2024
 08:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611160938.3511096-1-masahiroy@kernel.org> <20240611160938.3511096-2-masahiroy@kernel.org>
In-Reply-To: <20240611160938.3511096-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 17 Jun 2024 00:21:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyPRKes7=wNtYXre+nU=5-1oZ-g1uzbjFMFd2e10jFjA@mail.gmail.com>
Message-ID: <CAK7LNAQyPRKes7=wNtYXre+nU=5-1oZ-g1uzbjFMFd2e10jFjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: package: add -e and -u options to shell scripts
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 1:09=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Set -e to make these scripts fail on the first error.
>
> Set -u because these scripts are invoked by Makefile, and do not work
> properly without necessary variables defined.
>
> Remove the explicit "test -n ..." from scripts/package/install-extmod-bui=
ld.
>
> Both options are described in POSIX. [1]
>
> [1]: https://pubs.opengroup.org/onlinepubs/009604499/utilities/set.html
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---



Setting -u needs more careful review and test.


This patch will break 'make deb-pkg'.


./scripts/package/mkdebian: 150: KDEB_PKGVERSION: parameter not set




To set -u, scripts/package/mkdebian needs code refactoring.



I will keep scripts/package/mkdebian untouched.







--=20
Best Regards
Masahiro Yamada

