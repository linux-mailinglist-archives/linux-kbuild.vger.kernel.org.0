Return-Path: <linux-kbuild+bounces-6393-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ECAA792A7
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 18:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A7807A2E59
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 16:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96802158524;
	Wed,  2 Apr 2025 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="geTaA2Fy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633DE1426C
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Apr 2025 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609992; cv=none; b=WIDRWqPMG8Fve5YEbGJDE0LpcPn/xYrGxsauq1dmQ+bny7kcdmu2d0UtZe5587BtKmuw2hJHxIw4O3JGccCAIo7YMpUA9T90WyT7UXwgED1izVt817WgfnrG/9xMFMYMmmWdYkldbucO+BQ5w9nxIt0P9Wz49MBbXq1UyRwuwGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609992; c=relaxed/simple;
	bh=Je/IsMmBNaOoQ0naVaiKRf0I4qNwygzgp9cFVZaBUvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cb1bfxzmDDlol1V7V/l5goDg5hdrE4gF0lQKM5RC4TYxicdi6Nihsm3HEJE9pvap2Z6+8fWjD73Fbsx+Vz1D5Zdns0EZhXiXu7LBJn2byVv2Fgxb9md2JojatEnT9lKYT3nA2i8vrgaWEvR6YKOV23OaLaCJTIFk+n7ryvpuCVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=geTaA2Fy; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso6534855a12.3
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Apr 2025 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743609988; x=1744214788; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=025ywTe8X2oiiTY/KI73kld6gosblZKwh9c0eIC7QAo=;
        b=geTaA2Fy8Q9HgVWyYO03cGWHGvFIA9MifcRHyWgzFKEJvDTFKQ0nQPeT2EnQGMEvv+
         AKCJO5VW4Lh+PHSFHD0hgYM4WQ4zNtBIrx6fWwbVGUu4CdWA/hIa9zC4qVINEhA233fw
         XuA8E0zOSSnEHEKagdQb3CrBixYorzfwdqx9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609988; x=1744214788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=025ywTe8X2oiiTY/KI73kld6gosblZKwh9c0eIC7QAo=;
        b=QHLD0TwOOimmaO1/wApMbh3WhqnXx5XbwQBUcKU9E2/1dIEHhW9T0Nf5ZYI+2ju5H1
         Kn0A6tFSJet0e5lIU3dJmyxMSfevmOZs1k8hoWpiYhVSi8TBL3TNXp/+YUYBHYtG6ZmQ
         L99UuxJluzU0oMwaFXTdAkaAJJGtBzwlSaQDmr3HRprrX6zpvZjCD6QSuhYdu5SyNnBW
         EHTvtFwxUpAqk4Pz2R5fpet7fEN2Z9zp2dXfuOWiR9mNQe9mX9cQf+Vjc5E5Dp1qtqnH
         s/6APcTKD7G4ykdTiKaEpfOyy5NilCA2kwRWZoE+B0OOATuWZ9JDaMQQBQ2fdAYErNeP
         LjoA==
X-Forwarded-Encrypted: i=1; AJvYcCVmd9fgpNgxkJGgBxHh8zJxdOKbaiCIaiQgBnkQY0LEDXEFPBkHxvrLt8Kf2s8ryFx41y/Dbp7UdDrNJTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDdqGtCRuCeqxV2RdbSJI2qsdpMO0lgFAlMHQZnniKJ+6lc4z
	zHC43KhNqAQcnAKLrfd/zo1x/lNoOeM7WHd6lFttPMHNRWIJxhdQnePjFOhRi31mjqhskjkydFf
	6Dv4=
X-Gm-Gg: ASbGncs28UnDuyysPsXaWvvfBSLcNtJcC0WwLxH0FQ8nI976W5qhVnZ2BeppIghDQiR
	USLDnIIpy0wK9QN0FiuGbc3y10mlKGlw3oqFrc1P4T9lt0dY6oPEk8v0ZMsxibVhdT8iKcShbhv
	HK8nGKRguugHw6fDh8Myhxhg/Nk/pNiEJ1015Yx7i0WCz4wqu58SmOv/pPsJ4lsdXRZx6u6+hGf
	IIxV2GEBCMrrAT9qsl+4vHAYPxpAvc0xeeBoBWyuQ1Qu3fqQJpv6+Gu2osN2Jq5T/3uFWt4Zh+6
	PtrREfrENREeavCZFXGuqLi/zXabDXxZbodHDSl9IFNdRHYCpUKniXpLCbbIY7V2YkRIGeY3Hnf
	WtePZ8zNO/i+/GmFGiYQWmIFsHS5ujg==
X-Google-Smtp-Source: AGHT+IE8vL1+Y0DNjh2GgOlNMQsGQ5B8AhncLySURnvPT1pLQjrzLBdmW5kXgWEpDIvJ7mmuzCociA==
X-Received: by 2002:a17:906:11cb:b0:ac7:391b:e688 with SMTP id a640c23a62f3a-ac7391be99bmr1316947866b.58.1743609988271;
        Wed, 02 Apr 2025 09:06:28 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196caa7csm928856466b.151.2025.04.02.09.06.27
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 09:06:27 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac339f53df9so1204211166b.1
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Apr 2025 09:06:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyhgu4ryN5SgMmbZHC51PL0IMcz2iarHtSke2HyGd8YexVEZNKvrBBBqT6eVtZyoAriHxGkdtPnjYYElw=@vger.kernel.org
X-Received: by 2002:a17:906:dc95:b0:ac7:36c2:aed5 with SMTP id
 a640c23a62f3a-ac738a5aa5amr1649611366b.28.1743609986968; Wed, 02 Apr 2025
 09:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402124656.629226-1-jani.nikula@intel.com>
In-Reply-To: <20250402124656.629226-1-jani.nikula@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 09:06:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkpFR93_rX2Wi5bQErH1-bzFXkWZP2wgBGCRgsFQuOhg@mail.gmail.com>
X-Gm-Features: AQ5f1Jqd6jCqv34VGPiVcJowK6E-xTG9BBy-7Ow_2MxO0m2aPE5XhfB34p0FnyE
Message-ID: <CAHk-=whkpFR93_rX2Wi5bQErH1-bzFXkWZP2wgBGCRgsFQuOhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 05:47, Jani Nikula <jani.nikula@intel.com> wrote:
>
> Another go at hiding the turds.

The patches look sane to me.

I didn't _test_ them - because that's not how I roll - but they look
like they would do the right thing and not interfere with my odd TAB
lifestyle (I say "odd", because apparently I'm the only one who lives
and dies by auto-complete, but obviously my way is never really odd.
By definition).

         Linus

