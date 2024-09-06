Return-Path: <linux-kbuild+bounces-3454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 850C596FB4A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 20:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4438728197E
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 18:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755DC13C3F2;
	Fri,  6 Sep 2024 18:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="QW9sDR5I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAAF823DF
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725647863; cv=none; b=msBOltvO3W8pH30IWWYB1WliNYhlllQQMq/AymzbLlGoHFuSzg3UeX96fEqUd0PWbup83aD/vmNfdWbh1sTbMd+aJToyAR2WIf8EN5hhKrOJvTZBECORQiwYcAO+rzDNxtgsfUMfbj3Hl7DbO9DM8H/2XrtxClBphnh/YUpM7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725647863; c=relaxed/simple;
	bh=3R86fHaAC7ic+4gC2wPebPEUbI7Ky+xk03VpQbVcoms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjlwFO2w6zBjkTQN2D75HsMOCgQ/m/UA1BAFSKdSRVUS7lJjNkISNQ8kkw5HHpmevZ19T9kMyIWqJZQ9h8jY64Oix35ueJqfyMJeZMmzG7hxhTCZAesETeTc/xAyk60Lh2fRs7DwW6NP7QvrLuqwJZ1L5q3y0oTMrGCvIqQQYWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=QW9sDR5I; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e1d4368ad91so266052276.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2024 11:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1725647861; x=1726252661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcE46SBOgSHYzKXpHvBrm582CvYA5FJmYgYbFncHkHM=;
        b=QW9sDR5I1U9qxU4CvBhIRlZe5OB/ssJWg2elznAdit0i19iMBOOxk28fwUDNqLLAlQ
         hLPR8xX1T1IZ9mrB5QCoXVUEeTiZjFWdsrHhUTuCfMVbDSyBt/bf4vcLOOvI2Tfexx3a
         T6RjloefbGCxXZoGgyMl+b/kZ4MdrSR4WocI83HkYwTuiKHoVacjtOYa5/JCQMYrVaO/
         aiUhMrtE1Yk1nCEZJ/FG+7/0iEkG85hyQVWV95CxAE+/TlpOPP2V35qajv7v8WaZPW+U
         m+H2oi1YbTgCWjF6MpMwOnxJqpHg2i1OK+3ujChFe+b8ag2ep69VPcyGLMP+Bvvf0vjd
         9kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725647861; x=1726252661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcE46SBOgSHYzKXpHvBrm582CvYA5FJmYgYbFncHkHM=;
        b=qBt5z8ejAZSIN8U0s+2HjlGsZcvU7EPY39LVg01Ey1zUBqTIaGQoM3Pp3bI7qx8Tou
         LL3fRCkcg806oA0h2a0ctMG08oBGVILll+L4/tKAm2lHmbgPaHrTN2fUa3n58q6flfUb
         Cs9t8ti9Tni5GihDgbCZCCjZeqCU9wIUV8//6Hi+OuNFT/mR9T2S5VVJidkjCau6HRBD
         f2MRfCp8HbEItB4NPnGzzi1des4sH5gk/ALHs3Vlxpx+lx11WdtGsEeajgIvFrcxic2j
         T/GmHhdVtnJROrpQH7kQz/PXSYSfOwFe4IDAZHrHb0O2XZycQVY2XCUNyGjgt0GZi3oi
         OjPA==
X-Forwarded-Encrypted: i=1; AJvYcCX6jrIBimJWKARdUJ5KhYJrOz+7699m1MAAoUbg0lAwAj3mf/a8I25bg8CupmfAkQIHlQEoqOBU9n8YwSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjuTdj8R71qj2a/M6H6m1QazyPGULRKinV3s0GTjVnOcALwhJo
	65Un/a6lyoazqDjeMzDv5XXkBm7eng5Elzr7vAvKosNx3JvtU0KciEJLTYFR7ynww2qgdADLLo5
	gAlnfF/9Abv67FwrFENRc4kTdDtBre0hc0xTg
X-Google-Smtp-Source: AGHT+IGHKzx8grp+TLiTddlEC2JyfObLVgpXE3jF+k0MX2S4nWZSrCRBhx/aoPnCn6G1NU7NrT4hzTfw+xovgEnB/qs=
X-Received: by 2002:a05:690c:6609:b0:6d7:3c0d:3adb with SMTP id
 00721157ae682-6db442a66a5mr33551717b3.1.1725647860717; Fri, 06 Sep 2024
 11:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906172934.1317830-1-masahiroy@kernel.org>
In-Reply-To: <20240906172934.1317830-1-masahiroy@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Sep 2024 14:37:29 -0400
Message-ID: <CAHC9VhS=5ohpS18kkXUKaE4QR5HfGZ-ADbR14WPQPor3jeFSuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] selinux: do not include <linux/*.h> headers from
 host programs
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	selinux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 1:29=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> The header, security/selinux/include/classmap.h, is included not only
> from kernel space but also from host programs.
>
> It includes <linux/capability.h> and <linux/socket.h>, which pull in
> more <linux/*.h> headers. This makes the host programs less portable,
> specifically causing build errors on macOS.
>
> Those headers are included for the following purposes:
>
>  - <linux/capability.h> for checking CAP_LAST_CAP
>  - <linux/socket.h> for checking PF_MAX
>
> These checks can be guarded by __KERNEL__ so they are skipped when
> building host programs. Testing them when building the kernel should
> be sufficient.
>
> The header, security/selinux/include/initial_sid_to_string.h, includes
> <linux/stddef.h> for the NULL definition, but this is not portable
> either. Instead, <stddef.h> should be included for host programs.
>
> Reported-by: Daniel Gomez <da.gomez@samsung.com>
> Closes: https://lore.kernel.org/lkml/20240807-macos-build-support-v1-6-4c=
d1ded85694@samsung.com/
> Closes: https://lore.kernel.org/lkml/20240807-macos-build-support-v1-7-4c=
d1ded85694@samsung.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Reword the commit description
>   - Keep the location of CAP_LAST_CAP
>   - Include <stddef.h> for host programs
>
>  scripts/selinux/genheaders/Makefile              |  4 +---
>  scripts/selinux/genheaders/genheaders.c          |  3 ---
>  scripts/selinux/mdp/Makefile                     |  2 +-
>  scripts/selinux/mdp/mdp.c                        |  4 ----
>  security/selinux/include/classmap.h              | 11 ++++++++---
>  security/selinux/include/initial_sid_to_string.h |  4 ++++
>  6 files changed, 14 insertions(+), 14 deletions(-)

This looks much better, thank you.  We're currently at -rc6 which is
later than I would like to merge patches like this (I try to stick to
bug fixes or trivial changes at this point in the development cycle),
so I'm going to hold on to this until after the upcoming merge window
where I'll merge it into selinux/dev.  See the below doc for more
information on how the SELinux tree is managed:

https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git/tree/RE=
ADME.md

--=20
paul-moore.com

