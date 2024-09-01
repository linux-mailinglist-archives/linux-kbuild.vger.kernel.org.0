Return-Path: <linux-kbuild+bounces-3305-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9EF967644
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 13:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 089B7B20CBD
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 11:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D450D16DC33;
	Sun,  1 Sep 2024 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmTI9fBM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53315E81;
	Sun,  1 Sep 2024 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725190700; cv=none; b=L/yEh+bn1GOHJbvAdWnfneFLPLLHSc9t6pdpKeUPzWUcmgLj7YmS3J03put2B/PXCoFv0KeB6lMzZfEYmGmR+sWO7+qTx0VWrT+gAXQwM47fpFJyD7TnTRXTGHbc5sbataeqgSjf7/NjUcH24oxR8fEfUWY7BmakzneNDlewUDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725190700; c=relaxed/simple;
	bh=jV0qR0FhO2q+COquDkpeVWwny2NqDqy2jS+++Guap14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHHjUTpUf/Mlwx2eQOnV8BGBcUGJ7/eoaJmQmGoyNXN7jh2C98IZmOKmHwMWkFE2hKUZ2aq44Y/amFc8CfewqZt9s/BNEScsjp6Ja4KRM6mzPAhFima715xSxzKMjDJyqgKpdoxFqDBHjE9yGH4Zat1rD0jyBJ+FoA6rhSka9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmTI9fBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248C7C4CEC9;
	Sun,  1 Sep 2024 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725190700;
	bh=jV0qR0FhO2q+COquDkpeVWwny2NqDqy2jS+++Guap14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jmTI9fBM6KavHnub5YetV75LYCUT5BJajLqceG8KCvkqSmmkdqyzs/xLTYpMydtCx
	 lpDs0AFzfEyr4LmoXmV+DnrNjSGm22Wh00NzUfcxAHiPWy2+KxBmr37XA8CaszXOWh
	 6WhiVTSZqaCJZW37PHeEBdIWoPHmc0ANYpK4wOo35oJpxCkEWFXQ67ej1V4syg/g5t
	 m6crEZM0tEYVc+QjL2qK8jOETD0eHLAm/R9EO3ahacSMe7DkOztj2ScPJ5EzQGyOUO
	 xcno9dRP9nIfhg3ZvGvPkhxIEkjGTOl11rGIWeGVzq5QHIY+2hbDly9PI+bGZvBnmC
	 HCm5e6j5RDDuw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f4f5dbd93bso31249301fa.2;
        Sun, 01 Sep 2024 04:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZvqweHiX9i+zj0JCapWxWMWDztooBjgO2k4VMmeHbHs933+P0ontlbaatz5jZbm/Q55w8TytCxFHGuvHT@vger.kernel.org, AJvYcCXE/AhA/snpZjoZlngUNISE9IWYu5wdEI9EHNM+jeOQgSfmHaAInxV1t81S2PMw/tYWbJe3vp2BH1rdCoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpYkcwSPEFVNyADrnrU/yktBT8CtHGnL77JU2u/F/iq/sCI0sa
	9oSk0jYhA6tPunJ/NOWbHZj+r9FSSg92W9xkmrElO15j4z3n1D7WVbzRp+CoE/zBZJvyOzIPg6E
	BqRq+UwJS5yVT1z/YqCozI7SyVKs=
X-Google-Smtp-Source: AGHT+IHUZwW+vV3REwg527kk/wkrTvU3aPq8uoL7q3qwiupBHcUFONc9Jt6JXm9hOsPbZFUrf0WwszLcBRdMRgixGY8=
X-Received: by 2002:a05:6512:230c:b0:52e:fcd0:241f with SMTP id
 2adb3069b0e04-53546b27fddmr5378681e87.29.1725190698831; Sun, 01 Sep 2024
 04:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824220756.73091-1-jose.fernandez@linux.dev>
In-Reply-To: <20240824220756.73091-1-jose.fernandez@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Sep 2024 20:37:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT3J_ExOwHoOq-xx9Uz1KdFtkVUALc_FnWWzs14j9JJUw@mail.gmail.com>
Message-ID: <CAK7LNAT3J_ExOwHoOq-xx9Uz1KdFtkVUALc_FnWWzs14j9JJUw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: add debug package to pacman PKGBUILD
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Christian Heusel <christian@heusel.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 25, 2024 at 7:09=E2=80=AFAM Jose Fernandez <jose.fernandez@linu=
x.dev> wrote:
>
> Add a new debug package to the PKGBUILD for the pacman-pkg target. The
> debug package includes the non-stripped vmlinux file with debug symbols
> for kernel debugging and profiling. The file is installed at
> /usr/src/debug/${pkgbase}, with a symbolic link at
> /usr/lib/modules/$(uname -r)/build/vmlinux. The debug package is built
> by default.
>
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>


Applied to linux-kbuild.
Thanks!




--=20
Best Regards
Masahiro Yamada

