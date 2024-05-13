Return-Path: <linux-kbuild+bounces-1847-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A18C4A09
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 May 2024 01:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4A93B22E31
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 23:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0E485923;
	Mon, 13 May 2024 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvIyA/X9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C558563F;
	Mon, 13 May 2024 23:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715642909; cv=none; b=fFL/6gHA3EWv03PZFHb9EHM7LT1A/ACtzzforCtiaRjBc+yLky7CncmLaUC0pKzSUOcv+9HV1nO0bqarYhCqOnN0fDRZbCBNnvdwoEEB2skUAzqM56eU+gMBUO2VNlIef/f+8esMSNve/MfWR61Q0buL7YQfp0kkbAUcfnCir7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715642909; c=relaxed/simple;
	bh=8Gh1hcIWN4rcXBwDSbtnP1I9GK4gJY14SknicU3V5gA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdqQzNASyDxFJcZLA6HZ8WWWHiFkejbHevct64WYN2Tr7a1CBuFIQzBSU+Ae/imw2Gubq/4dnLph52Kwni/UAnWIAVKJfgT1jH97kk0+KpeBzHw/cqHJQucZh98DuiNWuZ5e1mYpbm4M9l7j6HMNb0IseDpA9VQg2QskiaWP01g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvIyA/X9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F9DC32786;
	Mon, 13 May 2024 23:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715642908;
	bh=8Gh1hcIWN4rcXBwDSbtnP1I9GK4gJY14SknicU3V5gA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VvIyA/X9utfx2ueiwihtps00cAc/lwD7Bzt8kFx9+7zrMD+48lrfqYPOGqkIJzCAr
	 oMdqRX+QzXfdIjt4adW/+Az0p7i89T6OCR904Y1JLcZRaj3uXA7ovuhJLrCRPmEVe8
	 jGUjCazkGFl4siUqhFTIasgY7O+jsxbpME5mNM7r2ezPiigfZ7C4R2yI53fI0lBXUD
	 cFweqZPHdYnCh3EvnYGQJj3OcpRZY/AMog0Bq7Ex5b7q3gQpXpVK0kJYZxhn+1PNnp
	 2DljDtcfVrkOF/WmmU5KcTr/AoNeO3I4IFUcxd78OBeDfzlBT9QnAOkuJ90g2N7JvK
	 qglQhyEP8i2Pg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e3e18c240fso54544811fa.0;
        Mon, 13 May 2024 16:28:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YxBHBz7m9jeCIDOu/4Ua7wQa/2Y6ulHq529ltZKtSfgQb0+pYF3
	v5V1QYP6Au+UUG1adadaFKye3FaH9RVbSfyUMLy6EDHGZPhBt5ebw3baPALWVUzKquAjcWzgSj7
	bHf8gPqW6mh4fXtYFd/LkHxAWjzw=
X-Google-Smtp-Source: AGHT+IF9j8e043DkOiSrOVWoiLzHywRaJqPk8A8PajaIWmL3pmtY7IbuS8+0heTiyQSFt+7KF4lC2hFhRKR/f8Ugois=
X-Received: by 2002:a2e:9bcd:0:b0:2e3:9350:a7ca with SMTP id
 38308e7fff4ca-2e51fd3fdaemr109449691fa.6.1715642907412; Mon, 13 May 2024
 16:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511000953.11181-1-masahiroy@kernel.org>
In-Reply-To: <20240511000953.11181-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 14 May 2024 08:27:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNASKANEH6mCvz-5uUcne_x5+M8bWwOyy7fw6SEY7Oz6bww@mail.gmail.com>
Message-ID: <CAK7LNASKANEH6mCvz-5uUcne_x5+M8bWwOyy7fw6SEY7Oz6bww@mail.gmail.com>
Subject: Re: [PATCH] rapidio: remove choice for enumeration
To: linux-kbuild@vger.kernel.org, Matt Porter <mporter@kernel.crashing.org>, 
	Alexandre Bounine <alex.bou9@gmail.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To: Rapidio maintainers


I applied this to linux-kbuild.
If this change is not OK, please let me know.



On Sat, May 11, 2024 at 9:10=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> This is the last use of the tristate choice.
>
> This choice was introduced a decade ago by commit a11650e11093
> ("rapidio: make enumeration/discovery configurable"). Since then,
> RAPIDIO_ENUM_BASIC has always been the sole member.
>
> There was no need to have this choice block.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  drivers/rapidio/Kconfig | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/rapidio/Kconfig b/drivers/rapidio/Kconfig
> index b9f8514909bf..f1d742ac8f7c 100644
> --- a/drivers/rapidio/Kconfig
> +++ b/drivers/rapidio/Kconfig
> @@ -59,26 +59,13 @@ config RAPIDIO_DEBUG
>
>           If you are unsure about this, say N here.
>
> -choice
> -       prompt "Enumeration method"
> -       depends on RAPIDIO
> -       default RAPIDIO_ENUM_BASIC
> -       help
> -         There are different enumeration and discovery mechanisms offere=
d
> -         for RapidIO subsystem. You may select single built-in method or
> -         or any number of methods to be built as modules.
> -         Selecting a built-in method disables use of loadable methods.
> -
> -         If unsure, select Basic built-in.
> -
>  config RAPIDIO_ENUM_BASIC
> -       tristate "Basic"
> +       tristate "Basic Enumeration method"
> +       depends on RAPIDIO
>         help
>           This option includes basic RapidIO fabric enumeration and disco=
very
>           mechanism similar to one described in RapidIO specification Ann=
ex 1.
>
> -endchoice
> -
>  config RAPIDIO_CHMAN
>         tristate "RapidIO Channelized Messaging driver"
>         depends on RAPIDIO
> --
> 2.40.1
>


--=20
Best Regards
Masahiro Yamada

