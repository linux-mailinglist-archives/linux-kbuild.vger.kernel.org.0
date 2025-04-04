Return-Path: <linux-kbuild+bounces-6401-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D9FA7B7B3
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 08:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7510189D220
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 06:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD28F1537CB;
	Fri,  4 Apr 2025 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNW0ofYI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DC12E62B3;
	Fri,  4 Apr 2025 06:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743747511; cv=none; b=TSVHg7au4gZe3VflPCn6NGHdhh7Ci+zsUsQ05ypkw0HivGiOqpdKoVl5QHrYfDmiium43LLQnrITv3zwQ8nmoY/ojPjRPVxQnJeRwTRBIia/FW23WuR+SX4mdfPZMPiR1mSpSJSaqXZdWe9TMjJkHFRIvDL1MeNq3WzGhERJeLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743747511; c=relaxed/simple;
	bh=3p5RNKQynEmmFhTxUyZItzxVy7jBWoLZXalEJ5ewl1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdKuOA1VEhWRbAPoKxAoz1vBxKcUnXUotQiZV7DY80LJ60gJ+MFvEZ6t+0tVURchsWO76ZoUpg8KgwL4d3Sjkn9w/NR1VKvDLyyGHxXCgVQ7lWcv43EMwd+jer6BrbEGeuIUPpbOBb3XgA3WZHuo4IQzXaxR2xogn3GBUAda/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNW0ofYI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256CDC4CEEA;
	Fri,  4 Apr 2025 06:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743747511;
	bh=3p5RNKQynEmmFhTxUyZItzxVy7jBWoLZXalEJ5ewl1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tNW0ofYItsCGfFKgULwKUFWn/IsHIBsv27jrwH9TEpC5G+C8spXXN2kFLc7opQvSC
	 pr1Z/sGeFmA973aKq95qpkXsV688D8QjUT45IJq4qBqOA5+/bdXQiTjVWy4LEHQKXy
	 Kq6JTIbvTN6gRA98RMCdWUTlYk6pxmQpwRQh1yiriSLIW9WKzUhISKukVplZ2pZ25j
	 hP/AVeVovgWBU2DNAvJ67yo3SA2LlPkStna/60NwqsPqQJDe7AUfIQKxsKFQhNobNN
	 67NG5bPVgWn9v9FTyIFJ8UWSTQYXTau3SAFjrlUiSDwE7MurlpOohJFJh5dPNOeiDq
	 4qBVqWTQ1KY1g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54acc04516fso1554864e87.0;
        Thu, 03 Apr 2025 23:18:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQhVyt0pk6l7pFJyWKjAZInzGKgtRGZYggPVxPEybzrZbv6Ply1qVxD7SwoJmkMln29ufh3ln8woMHXT2u@vger.kernel.org, AJvYcCVxpxwoxkaqZjqnQ09sHfwOzGA1DtqcSwnwNvy1lZcAMTrFw5GJeoFzYGewOf52Trkny4HRwqqCjXemfC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwIR+f4450GR226yXVYLaRCVX1FagpHkenMS8EnC4uPTlKmT1
	7UpQMuh2TrjyRaLgjPZRSK8u3XAZoEkzccdAmzXlFMdO3dwiWfp14yIonLec99Zv/6opgCRDdwk
	N+O5vR0sneMFfHaIMnE5D7pOrzxs=
X-Google-Smtp-Source: AGHT+IE2XmXzaXXRt/W18azDyhTg48mW3/EOlXBV7L209Nxgz796Ei03JAtTjXjq/GjtOuzlgopGB7HjhNcXr2yPQss=
X-Received: by 2002:a05:6512:398a:b0:549:8f15:db18 with SMTP id
 2adb3069b0e04-54c232f8267mr313948e87.28.1743747509736; Thu, 03 Apr 2025
 23:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402124656.629226-1-jani.nikula@intel.com>
In-Reply-To: <20250402124656.629226-1-jani.nikula@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 4 Apr 2025 15:17:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
X-Gm-Features: AQ5f1JrOz4H_4S-Z7mgpbDaDA45qEgY5_OEPXah-LKNkWABZ8jBaQbV0gBwl1ms
Message-ID: <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
To: Jani Nikula <jani.nikula@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 9:47=E2=80=AFPM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> Another go at hiding the turds.
>
> In v1 [1] I hid the build artifacts under .hdrtest subdirectories, one in=
 each
> $(obj) directory, but the feedback from Linus [2] was to have one top lev=
el
> directory for this.
>
> This is not possible without turning the whole thing back into a generic =
header
> check facility. Personally, I think this is a good thing. Just look at pa=
tches
> 2-4, it's great.
>
> The main reason we've been doing this in the subsystem/driver level at al=
l is
> the opposition from the kbuild maintainer. We'd very much like for Masahi=
ro to
> support us in our efforts, but without that support, we're limited to hac=
king in
> the subsystem/driver Makefiles.
>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/20250401121830.21696-1-jani.nikula@intel.co=
m
>
> [2] https://lore.kernel.org/r/CAHk-=3DwiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJ=
kaFrjqUdkQ@mail.gmail.com
>
>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>


NACK.

This does not solve any real issue, except making Linus happy
- Sure, he is happy as long as he no longer has to see the turds.

This patch merely hides the turds by moving all the
header-test build artifacts under the .header-check/
and introducing CONFIG_HEADER_CHECK_DISABLE.
Yes, Linus advised us to hide all the turds because he cares
about the TAB-completion.

But to me, from the Kbuild perspective, this is not a solution at all.
What is worse, Jani is pushing his workaround into the common
Kbuild Makefiles, which I maintain, and he is even make this
broken feature widely accessible.

I agree with Jason.
His idea sounds better, although I do not have enough time
for investigating it further or implementing it now.


At least, this patchset is not something we should rush into.



> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: linux-kbuild@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
>
>
> Jani Nikula (4):
>   kbuild: add generic header check facility
>   drm: switch to generic header check facility
>   drm/i915: switch to generic header check facility
>   drm/xe: switch to generic header check facility
>
>  drivers/gpu/drm/Kconfig           |  2 +-
>  drivers/gpu/drm/Makefile          | 15 +--------------
>  drivers/gpu/drm/i915/Makefile     | 14 ++------------
>  drivers/gpu/drm/xe/Makefile       | 10 ++--------
>  drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++++
>  include/drm/Makefile              | 15 +--------------
>  init/Kconfig                      | 25 +++++++++++++++++++++++++
>  scripts/Makefile.build            | 13 +++++++++++++
>  scripts/Makefile.lib              |  7 +++++++
>  9 files changed, 56 insertions(+), 49 deletions(-)
>
> --
> 2.39.5
>


--=20
Best Regards
Masahiro Yamada

