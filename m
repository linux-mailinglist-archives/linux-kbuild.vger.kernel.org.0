Return-Path: <linux-kbuild+bounces-7051-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F24AB06AF
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 01:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1F09986953
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 23:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325D922F3B0;
	Thu,  8 May 2025 23:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN+Uhtc4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06105233129;
	Thu,  8 May 2025 23:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747777; cv=none; b=NOfRLceXacpbfuhbEJuERwc4RHSJW/BfWrfgn/PRPy0iu/YkT9IWoNGiyE9zzfxwcTlOwhytGOkAzbyr1amH/RZQCCx8qTTRVlZISzUq7u80TsmN8y3/cgTajnBng9NFq8Ns3rpH9EDmqDkGIuscIx/hiukdX7ZLY6K4sSwOS9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747777; c=relaxed/simple;
	bh=0HUJOi3Q80Hprk30UXwi1aPiSk0vyf8b/ThO0wu7JTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZQf/BHGwyb4C477hueIAA7s1phBnFS2lHiDjdbQmLei1hLThcmW9cwVsW9GKiZ89hyaUBiWU8pgHpIbvN6dK4k/5ESwJnzpuAjyjap3uZH5n02890P/T8Fum+FzzkQbKbs3bPdPXRqH/66EnmOxK0xtGPShRiFSb+6urdpv/9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN+Uhtc4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E528C4CEEF;
	Thu,  8 May 2025 23:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747776;
	bh=0HUJOi3Q80Hprk30UXwi1aPiSk0vyf8b/ThO0wu7JTU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nN+Uhtc462Hu+w/2C3kAAaTTRqv9Ak/xNFa/6zE1GtbE8Hid/gAx2Lx6ZYddSplug
	 /oe6k6FGX+6ov8SIplmw+8dp6ccDDGtp7VkSmOMcoDRKrAKeIzXRre2QY0CT9GdyJX
	 TsF/5N2bsa5FDw70uGkYZuti1nY610rqNOiWeli5a9gJu5ij2U1IFJZp5WMXfRqZJz
	 Rrv8+ZS0x1l9+MyuXnXgvz3OPtgTQeLXwXsK3yzj0urs9fjPWGOwOXeoA9zLMuRPiY
	 rNeTqq+cMGXtm7sBkHoAc7YqvSZDOmdwZH1ooMsuLld6UwPd6pwPUsr2LXlunSW7ii
	 qOrUUDtKae7Mg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-326c77c40b7so910741fa.1;
        Thu, 08 May 2025 16:42:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUte0B/ItH8UXSHaCnWF08wpHn+tJnjYxHCenqgMDiS3dMupdMtcI/NrCCMCnvj4dBiQHjzFV4BLrs8N7mF@vger.kernel.org, AJvYcCVq31QE4hXYGW7j9WO2ibGMRJNwjDrTe13QdyeaSUr3OrTpcd1pDGE/UfUEq37+lHyEaQHNRwtQ8ivWLhc=@vger.kernel.org, AJvYcCXWJY7mC8vZUaHjjGz+dhK6tkq3vEM93N0+894mcVEWwVi4Mq6sjhDGxClCnyoUYCiSd0GUtyV6W0we8jdRxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMx0rTO9qVv2gVoyuOVXeqfZPycBregYKXouAtDRLdcWjx7ktd
	trV/8pdZ7JCCcvT0YvRnXExcOgsP8XMHyIXNne1Tf7IgYtcq+Uag9OxemgFCT2yjaYSIjX/1wyw
	2LrMJG6Ir4zNWdT1/zrmWXbfI2ls=
X-Google-Smtp-Source: AGHT+IFutgJYGooy1gvSEVR+svX/xeEYLIPC6W5LG+HLCFIxGaiTojj5a8p3cZK/OwyE1rr2/SV0O4b5KV2idQTmwYM=
X-Received: by 2002:a2e:a581:0:b0:30b:e3d9:37db with SMTP id
 38308e7fff4ca-326c46b0e3bmr5332311fa.26.1746747775141; Thu, 08 May 2025
 16:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507231403.377725-7-samitolvanen@google.com>
In-Reply-To: <20250507231403.377725-7-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 9 May 2025 08:42:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATt2hgPZyp_MP8DN=vYJ_TuvUQjU-U33ekbeVsLosE5uQ@mail.gmail.com>
X-Gm-Features: ATxdqUFE3-GdXPp4I15WWFcPl25L6hm_U-yW6eCb7BzZSyDSLNfJ9cyOlThFr1E
Message-ID: <CAK7LNATt2hgPZyp_MP8DN=vYJ_TuvUQjU-U33ekbeVsLosE5uQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gendwarfksyms: Add more kABI rules
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 8:14=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Hi,
>
> While looking deeper into the genksyms hacks that have been
> needed during Android's 5.10 and 5.15 GKI lifecycles so far,
> we found a few instances that are not covered by the existing
> gendwarfksyms kABI stability rules. The first case involved
> appending new members to a partially opaque data structure, and
> the second case completely changing opaque types due to a large
> backport that was necessary for both stability and security.
>
> These patches add rules that allow distribution maintainers
> to deal with structure size changes, and as a last resort, to
> completely override a type string used for version calculation.

Applied to linux-kbuild.
Thanks.


> Sami
>
> ---
>
> v3:
> - Added a patch to drop documentation section numbers based
>   on Masahiro's suggestion.
>
> v2: https://lore.kernel.org/r/20250505212401.3379699-6-samitolvanen@googl=
e.com/
> - Cleaned up type string parsing based on Petr's feedback.
>
> v1: https://lore.kernel.org/r/20250430214049.2658716-6-samitolvanen@googl=
e.com/
>
> ---
>
> Sami Tolvanen (5):
>   gendwarfksyms: Clean up kABI rule look-ups
>   gendwarfksyms: Add a kABI rule to override byte_size attributes
>   gendwarfksyms: Add a kABI rule to override type strings
>   Documentation/kbuild: Drop section numbers
>   Documentation/kbuild: Add new gendwarfksyms kABI rules
>
>  Documentation/kbuild/gendwarfksyms.rst   | 141 +++++++++++++++++-----
>  scripts/gendwarfksyms/dwarf.c            |  14 ++-
>  scripts/gendwarfksyms/examples/kabi.h    |  21 +++-
>  scripts/gendwarfksyms/examples/kabi_ex.c |   7 ++
>  scripts/gendwarfksyms/examples/kabi_ex.h | 101 +++++++++++++++-
>  scripts/gendwarfksyms/gendwarfksyms.h    |   2 +
>  scripts/gendwarfksyms/kabi.c             | 143 ++++++++++++++---------
>  scripts/gendwarfksyms/types.c            | 140 +++++++++++++++++++---
>  8 files changed, 470 insertions(+), 99 deletions(-)
>
>
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> --
> 2.49.0.987.g0cc8ee98dc-goog
>
>


--=20
Best Regards
Masahiro Yamada

