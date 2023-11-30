Return-Path: <linux-kbuild+bounces-216-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5D7FF3C5
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 16:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B49701C20F22
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 15:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE36537E0;
	Thu, 30 Nov 2023 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEyUzI9w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C54524A3
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2023 15:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D965EC433C8;
	Thu, 30 Nov 2023 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701358974;
	bh=LhpLwZbqacivXxz4RxHyaTQfxJ302f9kFQFwo/zcAaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WEyUzI9wv89NSYrocNXfNyKhf9x134F1jZhlWvSy8FXmXBA029/ocyYJ9eZd0axdS
	 mWy0RU+Qlmzt+cVSfmDh4B7NPTe0RbdRorURXGLI0b6wj7w53VuNS1dASz7IcmtPtB
	 qR5DQqj5HFk6gZl1EXzpqF/xJ7G7ZDKXxcovixk56nd88Grxxs4wGSEChtYx5Y+dNu
	 5buBY/Zx4oxsjrFx6S/t4z/zfe9z/Ctl8WQpiEIrORxzOr1JlKcvCEXj5epTtcfIHS
	 TQyL49JAaaTuEZ6cGFp1FrnSpiNUixZd++u09FcwRnI2ouNBONUbK2PltJaXkWdRFm
	 jel0NsMBvc6Uw==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1fa8dc2a0bfso522367fac.0;
        Thu, 30 Nov 2023 07:42:54 -0800 (PST)
X-Gm-Message-State: AOJu0YzEfvzA2am7gDAYhdwSMm/MHucaJQI8jyJTko5EReSh+zMDxEII
	g3Y4SlB+Nk0PynCpXhuCLS6ffA21Jnm87QmfchM=
X-Google-Smtp-Source: AGHT+IFjtpj4XRmI0ocet2S05q3ilpcpUA5f2ZQVWiOmactrdPBTCsmdEo5wFea4OF65/ad95IsmlHYUFDQfv5ecgmo=
X-Received: by 2002:a05:6870:a101:b0:1f9:5ce0:5984 with SMTP id
 m1-20020a056870a10100b001f95ce05984mr25352810oae.55.1701358974289; Thu, 30
 Nov 2023 07:42:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122034753.1446513-1-senozhatsky@chromium.org>
 <20231128053443.GA6525@google.com> <CAK7LNAT_Z4TeNzngMskEoNdSTWUH5gGzYm5MfO6C_H8rFcF6ng@mail.gmail.com>
 <20231129041307.GB6525@google.com>
In-Reply-To: <20231129041307.GB6525@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 Dec 2023 00:42:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS8q9eDerwVRbPbqd+AKjNVkEKLOW+NAKaD4duP-gViqw@mail.gmail.com>
Message-ID: <CAK7LNAS8q9eDerwVRbPbqd+AKjNVkEKLOW+NAKaD4duP-gViqw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: WERROR unmet symbol dependency
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Patrick Georgi <pgeorgi@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Reinauer <reinauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 1:13=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (23/11/28 23:19), Masahiro Yamada wrote:
>
> [..]
>
> > KCONFIG_WERROR is meant to turn all warnings
> > to errors.
> > I do not see getenv("KCONFIG_WERROR")
> > sprinkled everywhere in Kconfig.
> > One more thing, you cannot directly exit(1)
> > from sym_calc_value().
>
> We do exit(1) for KCONFIG_WARN_UNKNOWN_SYMBOLS in conf_read().
>
> I can introduce two new helpers that will tell if confdata.c and symbol.c
> triggered any warnings and if KCONFIG_WERROR is set. And then different
> code paths can call them and handle exit gracefully, depending on the
> context (ncurses, menu, etc.).
>
> Something like this


I do not want to patch warnings one by one.


I will take some time to think about it.






--=20
Best Regards
Masahiro Yamada

