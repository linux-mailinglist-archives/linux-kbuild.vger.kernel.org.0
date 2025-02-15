Return-Path: <linux-kbuild+bounces-5769-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AF7A3701A
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 19:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B231F188E3D3
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 18:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594151E5B86;
	Sat, 15 Feb 2025 18:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3SeTT7x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A5D197A87;
	Sat, 15 Feb 2025 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739643072; cv=none; b=fTyIqsqMW4eVZWY1TR2UFSD9X5BsqsS7rf1fESiMw+R4ZXW5cL6YvdJ7GEp8C2jk1iUdWHOojYFaPdn5m7JP4xg1lWoJleOgBTOzbnsEGLbmSGawybP7Kq1GUMkln2dZDfFGLq8RPqHfZHhQsZZ2pi+HKxEvUt5kLOyw4i3C4WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739643072; c=relaxed/simple;
	bh=VwiucCmRsHj4WIjXs8qnCxLiQoA41Y/9GZf5q6IhOkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgLrVHbavgZB/TObITpCXQrtETXeGaLp26Lm76C29V4q0NX8F+7pmBFKNSfBdjAFFn7GZ39gdQSmKGzxi1KuFyqvCuYkV/a/pHlLUpphLnDGjcV/4Uw65Y8ERm9vRmTphDpJzt5DOWasWb9y0NCgMQaXWELDnWYAxodEQ1SMBOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3SeTT7x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EEEC4CEE2;
	Sat, 15 Feb 2025 18:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739643071;
	bh=VwiucCmRsHj4WIjXs8qnCxLiQoA41Y/9GZf5q6IhOkU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d3SeTT7xsLBcmBCCbwEsTYMmsO5H+B9aU62Ry9WxlkZtPxRVfQWZaLjQtzEBNRK/8
	 mWmcI/oBs8lsGujeTaP2Il5h2m2Hu8wR6hfwXZ8UKeMwUlcU2fB0bpIYs8jwmydQS0
	 1rA2/FU3x4P+7Doi9WzLpR4PDhOuwy9yNdhshAz/9l8pairy/eDMgsfqp9sah/P6IZ
	 H+bUl6D2PWzC2qHVYiMYcv+afzoOhgwbR0PW5QD1kOLOp1lcW8HO2XHD6TaKpY7O5x
	 WGKxrJ0ZVjQimrRHXEeNRMsm1q96WnyFSXJ1r2WVvZXgPkOQ5VF1mA+WjFC687vatg
	 sMjIVh956VbNQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54529eeb38aso1829783e87.2;
        Sat, 15 Feb 2025 10:11:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU76f3SeWHbuNHX+8sSEsepXZ1Pbtfl8bLybFjQ4hQVGRiPfb5ky983/Rma40CUFJ+aqBRoj9sJzpdrv0CX@vger.kernel.org, AJvYcCUL9nduLKZ23Bgj0ySaBIT7OAnB1ePWLAc0SZB3OGi9ZBjahud/XVh5qjpRa1wjVI1cGOuuCr0DKBVKnkc=@vger.kernel.org, AJvYcCWNCeB9LdBZciU1C3R6VjK86JtWv4vlnv7RylRHJj6kS7DtS1tDoSM2WCvYvLdMPmyTmRxxSZ66@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1LUP4JohoxY4qZyUBxpHTBCQ57cPjjKIVIVY2EDqZstO5ytF
	EFNXrw0LvP7j0vi5td3voXegLtgbAveuVpBmDEGf0vnM7nzgxjUTRlxdo460YHJDzehmU8y/4BS
	zOjCAt4SH2SzZq8J6L2rP78WILn0=
X-Google-Smtp-Source: AGHT+IE0rwwrkKgLzFfRhD+QZGgoJPXVzhh3qODeXXehVd6GVBdQBZy6zuaKggs25GRFT4iSWYp/JPldBTE6dAjsCs8=
X-Received: by 2002:a05:6512:6ce:b0:540:3561:969d with SMTP id
 2adb3069b0e04-5452fe8f8b0mr1371699e87.49.1739643070214; Sat, 15 Feb 2025
 10:11:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de> <20250213-kbuild-userprog-fixes-v1-1-f255fb477d98@linutronix.de>
In-Reply-To: <20250213-kbuild-userprog-fixes-v1-1-f255fb477d98@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 16 Feb 2025 03:10:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPO82Qp_161yGgsRL4hA1XdeoCX6ZgLutmivKorUuLxw@mail.gmail.com>
X-Gm-Features: AWEUYZnbXcOx5HSwO35f-2mNBGhl_Ad3is1i1PF1BQf2JE6Cr9dN8_ACRThMo2w
Message-ID: <CAK7LNAQPO82Qp_161yGgsRL4hA1XdeoCX6ZgLutmivKorUuLxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: userprogs: fix bitsize and target detection
 on clang
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 11:55=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> scripts/Makefile.clang was changed in the linked commit to move --target =
from
> KBUILD_CFLAGS to KBUILD_CPPFLAGS, as that generally has a broader scope.
> However that variable is not inspected by the userprogs logic,
> breaking cross compilation on clang.
>
> Use both variables to detect bitsize and target arguments for userprogs.
>
> Fixes: feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---

Applied to linux-kbuild/fixes.
Thanks!




--=20
Best Regards
Masahiro Yamada

