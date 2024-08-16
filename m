Return-Path: <linux-kbuild+bounces-3043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD12954AA3
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 15:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BECFB20DB8
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 13:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D368383A3;
	Fri, 16 Aug 2024 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N67jfhC+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139BC1E4AF;
	Fri, 16 Aug 2024 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723813242; cv=none; b=Ge/puFTWv90iVyzI1aDH6yJsowqAy4md4Elv/vrnktzPVd/DdnM17h6QBlcxoisGMXufy4H+7Q3FM/3gxVURjCCjtXsbLQRyFHvLTp6U5sTojRa2sUKqkfrCeM/A4Ewb4GEe7OP3f/py1j3CogYWe24EmnRWV7l5uq/YlA+8/eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723813242; c=relaxed/simple;
	bh=8ZzCUc0Q4j63qS/946by6MfLfwHV0asep7O2WdEhceU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1WKChJfv4OfvM6T3HT/Y/Yrv0lH+d/rhkW09OuFlj/u4ifTKLjhqIqG2AvhaiYaNF4o5qNquchAB+EpftHM2sFHB3P9P8PCy4GU6d4M5gXi3kdV5M7kF40JZoXFmC1gyGREqK15k6H/QvXhjkZ/Adab7D/LstdIerqWauF0Bfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N67jfhC+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F09C4AF0C;
	Fri, 16 Aug 2024 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723813241;
	bh=8ZzCUc0Q4j63qS/946by6MfLfwHV0asep7O2WdEhceU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N67jfhC+HeM5xBXsOcGfR6xaGfih4MXuMon4uX929X2/ieKQt55D/Aq48AaPcX0ZT
	 HzoVB5IyO7WL5BMmTI8eKMzCX06kwSSBpRtksSDjqvvh6GvYqx2xok+M0N6gSF3tIa
	 BnR1CJGIaDrxPXZ+RomDNg6T3JDydYnmpSbICkgr4dK4+D6BvhoYWAjRTGhnqeIhKd
	 uq1DqWEJGBNL2Bq/lSGNXhl9GlrvBa7GW5mbxMYpUGHM0/JGXyjTmqi3ftD2iTjzvq
	 zqirxCdmhMEzRdwFT6O4CNAvCSIDa6ExC2XKOAeWWXlPP6faChtTYSemZu9zlkJeSM
	 u76UeDm/Qcm1g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52f04c29588so2733448e87.3;
        Fri, 16 Aug 2024 06:00:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0UIAKD2A9QRCFtztFREFROMRnqiHBqr/H7EFogYcKfPTVdTGbBT++V2JTl5n+qiIPTtrKLWQZKaWBeJMbPNkyhW0ZSsB18ABdOSgLJcvi5qtwWYbOmCujrDbayFh/r5pIHeu7pS4/uIJH
X-Gm-Message-State: AOJu0YyT8072rlIbTmSRMdWNAnzDtoaj5oUVYs65xT2qpkzp0Qurea39
	jyDSEEtJ/mKi18oSiL32r8eqywxtaVt1wVGrnGYRxFizt1jp4C4eShGRIBXWmh/ijOH46km61wU
	9KYM/ua1UcKPP3lavtjyW7ymhCko=
X-Google-Smtp-Source: AGHT+IEm9/zx0pqZikdBy5Q7oZpz/U7Kb8zxBTsQd+V5KNtWwPkneipv/spJVmybM2IBpUOF9iPZl955rc70DoLdhk4=
X-Received: by 2002:a05:6512:3ca4:b0:52c:dc57:868b with SMTP id
 2adb3069b0e04-5331c696579mr2037950e87.13.1723813240194; Fri, 16 Aug 2024
 06:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813011619.13857-1-jose.fernandez@linux.dev>
In-Reply-To: <20240813011619.13857-1-jose.fernandez@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 16 Aug 2024 22:00:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmzmAVacXm4yTaa3sRbJ1tQq6OYqYTw_A6HsVG2-pomA@mail.gmail.com>
Message-ID: <CAK7LNARmzmAVacXm4yTaa3sRbJ1tQq6OYqYTw_A6HsVG2-pomA@mail.gmail.com>
Subject: Re: [PATCH V3] kbuild: control extra pacman packages with PACMAN_EXTRAPACKAGES
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Christian Heusel <christian@heusel.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 10:17=E2=80=AFAM Jose Fernandez
<jose.fernandez@linux.dev> wrote:
>
> Introduce the PACMAN_EXTRAPACKAGES variable in PKGBUILD to allow users
> to specify which additional packages are built by the pacman-pkg target.
>
> Previously, the api-headers package was always included, and the headers
> package was included only if CONFIG_MODULES=3Dy. With this change, both
> headers and api-headers packages are included by default. Users can now
> control this behavior by setting PACMAN_EXTRAPACKAGES to a
> space-separated list of desired extra packages or leaving it empty to
> exclude all.
>
> For example, to build only the base package without extras:
>
> make pacman-pkg PACMAN_EXTRAPACKAGES=3D""
>
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>


Applied to linux-kbuild.
Thanks!


--
Best Regards
Masahiro Yamada

