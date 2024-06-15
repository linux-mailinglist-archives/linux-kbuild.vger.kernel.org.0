Return-Path: <linux-kbuild+bounces-2133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C8A909664
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Jun 2024 08:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 517F2B22425
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Jun 2024 06:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1008DDBE;
	Sat, 15 Jun 2024 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSxfJrbX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8397A17BA2;
	Sat, 15 Jun 2024 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718434040; cv=none; b=qxRBsPwvkU8To/axC2KHtDuWt9ccEQQ0jqDIgggdU96JeCKK73ClpxtgboDsPQ2o1pB9l5iBACz/qyy5TWusmFjbU7RIziR/StafwgzwesiOGWAZVuw0fFx2pCCATuBvhhIyOYCJlHMtDrMQDqHAGGPpXR++z2ngPmRCw8g0eHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718434040; c=relaxed/simple;
	bh=p/xtcz5Zfjr2rjF6BXmRtqfio6pwf6KhYflXRTHt1eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXwmSV23ORBms3NETqRGS28hTsit/8RHqJw6/LzlBDXX1EKbzT+b3ekMtBciFpW0WyX4M5EGszI4ohVSF0shicjljoG+qfH962ixgSHAjInjITd194xwCbslUJ9UqOnLQlCplp0DVCEZJ7UEwuU40kHZKSqUhii+NudYBAKg5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSxfJrbX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015C8C4AF52;
	Sat, 15 Jun 2024 06:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718434040;
	bh=p/xtcz5Zfjr2rjF6BXmRtqfio6pwf6KhYflXRTHt1eY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YSxfJrbXQs7VvMyQTLqtQ5YhXmtoILwJxyqFQ7h3NtnV5o6qUS4UtA3aFfU4depvv
	 wTN+tbnrXHaZ4Rr9k9ftTGQFKB2FP59OPbNEdnQDMkRRPH6LQfoKAvaMWxjI+gxRdT
	 1KHh4VSesNzVS+IjJuXXlPQqxXyZlo1tYfdLjF8L51gX2KiaYtYrIlwufIMTH5+owV
	 IRtLTqUtVyV85iD/Jr79CQWxhBfHx4sxLD3Kf2H5zxDqDkAsfubo4g0GmWF2v8BhJj
	 NLkx02yRhSJrANA06kZGVyX1lCwZo8cSNdGS5j4bhci3qy0/oH5MxwsPQmJ9YnKFx2
	 tx2tcF6GQuDzg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso33885401fa.3;
        Fri, 14 Jun 2024 23:47:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQkKJVRWu+ckuLQDda67xh2u5BNBot/ODbPX6O/B7hu79/S8s2RgDJGjfRTpWSDrO94tvCCVOquffE+3QU+ck7L6CsrDt0l+LBU1pRhRYCAUE5+EX3Rmwifcre/mCr4ZMPw/DXBD8VfyCK
X-Gm-Message-State: AOJu0YwOJOk5RH8kQ2g6U82qG73N6LYiKMs63d8OzPCmnrVlxsiT2yw+
	ox8t22k1n+rytmILvjRpYrwoua4L4mYN3ZjozzlfcUwoWAYOUP9/ovKuFLXOZhxaDG3pBUlzv6U
	/UDvmtXD01oqe4RQuDVV+mubcHpQ=
X-Google-Smtp-Source: AGHT+IF5l3I9kMurR1b3vVy9boTsub8hbvlIGSMTfxR33A+iV9pXhqtpQ0+m54/NLE0K80eh+7skxGcZmKahGPF1tGY=
X-Received: by 2002:a2e:8e8c:0:b0:2ec:1deb:5620 with SMTP id
 38308e7fff4ca-2ec1deb565amr8276111fa.3.1718434038583; Fri, 14 Jun 2024
 23:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611205900.2145880-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20240611205900.2145880-2-u.kleine-koenig@baylibre.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Jun 2024 15:46:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR16nV-cVxGT-6i-+NBeGaS25=Dn=-rBrMA56exurh9Uw@mail.gmail.com>
Message-ID: <CAK7LNAR16nV-cVxGT-6i-+NBeGaS25=Dn=-rBrMA56exurh9Uw@mail.gmail.com>
Subject: Re: [PATCH] modpost: Enable section warning from *driver to .exit.text
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 5:59=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> There used to be several offenders, but now that for all of them patches
> were sent and most of them were applied, enable the warning also for
> builds without W=3D1.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>


Applied to linux-kbuild.
Thanks!


--=20
Best Regards
Masahiro Yamada

