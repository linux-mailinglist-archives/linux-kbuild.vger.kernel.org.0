Return-Path: <linux-kbuild+bounces-1923-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE368CC1D0
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 15:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09BBD1C22FD1
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 13:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473C213D62E;
	Wed, 22 May 2024 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poDW0loZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F21913D61B;
	Wed, 22 May 2024 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716383366; cv=none; b=VXD5MJTJpe62DVvJvjr7XmtBbOmvnIjONpzv7jLK4xLHN+YoTMhvmz2Hc9qmrjNnMlhHpE2lmYXz5esNy42yM2vkIk+vIpul7S/P/MMHJd0bMDgmZHkumFPKjefkCPzD7aGyigJgEKlOAT3Pc2ycvWnLmzQ4t66qbuV6wTIRVpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716383366; c=relaxed/simple;
	bh=Kv5+WnTaVJBD6IREHmnDXA3uTTWYRvbi1jR7Z1Q9Brk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxiZ3FP0AKf1xPge+S81qGK0v+97jIiFo1twa25FdMgnzPVdl2Uaw2uga68AJgjrJ0Z4J/DAJ/mDggxCbxNg6/MF+ACmNWNZnVYtQX3datJHKp51cRhN6117qptmUSZNww24iszWOeAfURyrdCrHxpaoySedc7ZE66gjYohiPeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poDW0loZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42B5C4AF07;
	Wed, 22 May 2024 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716383365;
	bh=Kv5+WnTaVJBD6IREHmnDXA3uTTWYRvbi1jR7Z1Q9Brk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=poDW0loZeq0Y6t5QLZ1PjgH9v3JwxiaY5ZpielpyoNngiIjx2V7Mb1ZLrb4Q6N3x2
	 RxDQ/Yj6+f9l2d+ot+xWjxUoLN7GO8RwGgrNP5X+84bXAjkUJNov4T6vSCXAk5H0GW
	 PxkNmN3MNXCITPpR5gj5ayEHAbpxqDh3fSVJaQjVYZsVWblRQmsJJfOWbUWXu9FIwA
	 mj/2mLrIRWNfP6kjBbks8BrcA5m5E4og1houhBgmXpmxULsOpEK+Ha+DQR63L29G1D
	 UrCT+XqF3JdDI894eij7Xy3iXhJLFIHju5Q2pxDEAzxG70PX+pgHlU/JqVO6GPfqhR
	 rU7ktbZ2X40IQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso6660311e87.0;
        Wed, 22 May 2024 06:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGXnr38RzBmhsdzV1ddoj9PFRezx67GJh8uichxyj+qTyyI/nLeQFNWW05XdtPA9jixQ7+8rEkfTAlDW9n2F3k62/RulSnVEzI3FFlR77gxllD4NQTFENzriJhCR81rD2Xv3eCJ4rExJ4D
X-Gm-Message-State: AOJu0YwTNbO4wZCGKlWNGQKbDJjpF/yx7Q+w87PjgRhna0Xl+lqhXAvC
	JxZkUb0GRd5MyMpY5rg1l+LHKH9xl2auWyGXQnY2BvuzU65N/B834q+ZLDBuSzYX5KPOGfr5l6d
	OG57tNUQlQznIXojnPREbxXqGnno=
X-Google-Smtp-Source: AGHT+IE3gAzviqWfLTIVrWjs4enKNakVPe+ZmsqABvayKtzYr4xyoqHbcSrBzRRggpKDNlQ0n2ng/B38UW675N5JqFQ=
X-Received: by 2002:ac2:5e85:0:b0:51f:d72:cd2d with SMTP id
 2adb3069b0e04-526bf35cb2amr1185340e87.22.1716383364324; Wed, 22 May 2024
 06:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521065107.30371-1-wenst@chromium.org>
In-Reply-To: <20240521065107.30371-1-wenst@chromium.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 May 2024 22:08:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQC+z51RcaDKqFWs7AmFJvwvpZJ2NO2eKTbPbP-BGuAkw@mail.gmail.com>
Message-ID: <CAK7LNAQC+z51RcaDKqFWs7AmFJvwvpZJ2NO2eKTbPbP-BGuAkw@mail.gmail.com>
Subject: Re: [PATCH 0/2] scripts/make_fit fix and disabled compression for DTBs
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Simon Glass <sjg@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 3:51=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi folks,
>
> Here are a couple changes for the FIT image packing script. While
> unreleated, they are sent together because the change context overlaps.
>
> The first patch drops the compatible string property from the fdt image
> nodes. According to the FIT image spec, the compatible string in the
> (fdt/kernel) image node is used to specify special loading mechanisms,
> and is _not_ for identifying the DTB.

This makes sense.


> The second patch adds an option that disables compression for _just_ the
> included DTBs. This is needed for RK3399 and MT8173 based Chromebooks,
> whose firmware does not support decompressing DTBs, but does need kernel
> image compression to fit the image within their relatively small image
> size of 32 MiB.


Any platform that wants to use scripts/make_fit.py
must implement decompression of DTBs.
(or does not compress anything)

Otherwise, RK3399 and MT8173 cannot use this script.

I will not add any weird knob to it.






>
> Please take a look.
>
>
> Thanks
> ChenYu
>
>
> Chen-Yu Tsai (2):
>   scripts/make_fit: Drop fdt image entry compatible string
>   scripts/make_fit: Add option to disable compression for DTBs
>
>  scripts/Makefile.lib |  1 +
>  scripts/make_fit.py  | 14 +++++++++++---
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> --
> 2.45.0.215.g3402c0e53f-goog
>
>


--=20
Best Regards
Masahiro Yamada

