Return-Path: <linux-kbuild+bounces-4364-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD39B30FE
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 13:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 229B01C217B9
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 12:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94F91D95AB;
	Mon, 28 Oct 2024 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pcDndwQg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E21D63D2;
	Mon, 28 Oct 2024 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119830; cv=none; b=IcgHOHtF5iUqvsW297scuEOQjBkplZvmZSDuS9JTIMFYiE+45Zm3O9iAHx56pfifhd6ysB3equdrgtI7z2fKzMQVM3dmAXOrAwsB2azYqbG9Mafh4TAKGWI/1Akw39YZCW6kL28+whtNr4DvfDia6yM/zmk86kYsW9BwkpSScFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119830; c=relaxed/simple;
	bh=UAWAyR01I3hYWVt/4e6p7NuejTZKa/FOWee47xPl4BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sibqvtc93d5hJnqj44E3WUMtrWM0Qn0txEwxx1d6ssxOMQ2cbqSnIAr4gD/VW0Hwb0VDB6RwTn4Get8YzXBcgmnQThICfFapQTMTWp1s3C++yE3O+y46skFwQUJPIlXk3oz4GjXFdI2uUS8v1llRM+GJOE7YUUFmmvTyMlWi8L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pcDndwQg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB74C4CEE3;
	Mon, 28 Oct 2024 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730119830;
	bh=UAWAyR01I3hYWVt/4e6p7NuejTZKa/FOWee47xPl4BY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pcDndwQg8DwslK7k3FkLM5FHGL0r/WssvP6HFHi7iq/2sCVfVtbViM/2S7TAimojU
	 Bv0oIr1ft/cNdQPzT73nu4OcHXmuCPV7+A1tW0tREm83LI/RX12FkGooSKQ7hAIDPE
	 NJei1cznLtbVzFYrZ8T+rcLND7gxp84Dsv/IT8dPKjUPg/xDNd/WHH+NK8znt8Zn3+
	 VrIvzrTMdZEE2LgjRj5p/TUT7zMGqmgpRlaCMcDm48O1QTGctxQZWBjxZyfXmkvcwQ
	 tzbkgdZsYLGY6sh+t9zBhCBwPzD7vK022E+3X7rP5UrmVska4RmGgp95XO9I0BYG3r
	 DKbsnQPnm5ExA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so41377341fa.3;
        Mon, 28 Oct 2024 05:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxLes+6ncTGMEozPeFlnaI3MHXaP5KoXLS2WtUuTi8u3u87WwEUs4rDEXwQW1dLU2s46+RzQk6yLk3N5Vc@vger.kernel.org, AJvYcCXZ3cmVKJLya/BwAoD4EryFuLrLui+9WrGl24uF7jA5QqOTBGOGMNZtsrObx8NVour4tG/azFNfrcKaurqGgN/zJ0bZ7Q==@vger.kernel.org, AJvYcCXzLqirmpq+E5tQoyZgsyxJmIIpcmTrE8guPJWMX1PHMG96a0CMJ69aIOOMvoEC8z9TfC5capZoPDzaYcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw36gzv3vRULZFHbxFtnray0ibE/iGJz0wQvcH0R57GOCHIkxKO
	pyvSTb4QwYl4+84oEignp1qwgrgMTM2WCfls+Ee/2ShkD9Vmi2GWqQ6LBQTkMi1nphzL2RgZarH
	oNjv17XqBuNk/hL9P933KPTwAIq4=
X-Google-Smtp-Source: AGHT+IEPH/vsyhlYbZBSQfpt74PIBZDc637XfIO94wliOphfRHhmuxTZpBgQg5TnUQS1pGraTduFLtJ+cheGNO55no0=
X-Received: by 2002:a05:651c:19a3:b0:2fa:c59d:1af3 with SMTP id
 38308e7fff4ca-2fcbdfc5f15mr31251831fa.20.1730119828919; Mon, 28 Oct 2024
 05:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016105950.785820-2-andriy.shevchenko@linux.intel.com> <Zx9uSIWOwTgclmBF@smile.fi.intel.com>
In-Reply-To: <Zx9uSIWOwTgclmBF@smile.fi.intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 28 Oct 2024 13:49:52 +0100
X-Gmail-Original-Message-ID: <CAK7LNAS1xg2CLvTB-9dwGikAGNZRFOhknE_sbkxqyw=f6BNNog@mail.gmail.com>
Message-ID: <CAK7LNAS1xg2CLvTB-9dwGikAGNZRFOhknE_sbkxqyw=f6BNNog@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86: intel: Add 'intel' prefix to the
 modules automatically
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Tero Kristo <tero.kristo@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 11:58=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 16, 2024 at 01:59:51PM +0300, Andy Shevchenko wrote:
> > Rework Makefile to add 'intel' prefix to the modules automatically.
> > This removes a lot of boilerplate code in it and also makes robust
> > against mistypos in the prefix.
>
> > ---
> >
> > v2: fixed obvious typos (LKP), Cc'ed to Kbuild ML (Ilpo), dropped RFC m=
arker
> >
> > Note to Kbuild people: TBH I rather want to have something like this
> > to be available on the level of Kbuild for any of the subdirectories
> > in question.
>
> Anyone, any comments on this?
> This already passed a CI tests without failure so far. Perhaps it's good
> to apply to show the demand of such a feature in Kbuild in the future?
> Because I want to do the same for various */tests/ folders where we have
> tons of test*, *kunit modules effectively duplicating the folder name.


I do not like what you are doing here, but
it is up to you whatever you do in Makefiles you maintain.


--=20
Best Regards
Masahiro Yamada

