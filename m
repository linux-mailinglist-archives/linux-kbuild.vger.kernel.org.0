Return-Path: <linux-kbuild+bounces-4763-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459C9D4572
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 02:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E6E0B22754
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 01:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335C4224F6;
	Thu, 21 Nov 2024 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0hJUQk4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E72309AD;
	Thu, 21 Nov 2024 01:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732153799; cv=none; b=VoHpBvRUNzs9J79LwiMsFbcokKmHB2vDbPCmTOLyd84cvpCm4cIsg2yBLZJovJ27gwRpCZg5h15OGwkL+pK2c3Ziv+bT4cyqCMyGM/56E7VmDx4MBN77f46GO65BO5UVMtjJXZFh/WD8GVB2zi3afUXxucqqiabUFs0WXPQkc7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732153799; c=relaxed/simple;
	bh=9Wzdg2ci85w2wMHXN26WimTxHTAB3AOhmoL4OiOfmAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChqNDRDmdOqC+OXAi2KDNVw4wHLLDvApuyobLtp2CT11oGWGcmnH+W7n0BuT093cSp7WjEQfxTg/Gs6LAZekYhrhjiZqYUVvJBG9B4H6CXbuKOD775Md72VJD3tV3aUiJAwILc6fO+xM+CWkXP0INbfiKk36yAutN/uN7pvVasw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0hJUQk4; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-83abcfb9f37so17438439f.1;
        Wed, 20 Nov 2024 17:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732153797; x=1732758597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWUCvJsSdXoIhC6o2UMOCGwxpjGSWTPIQOwgtRNzfoc=;
        b=m0hJUQk4NPKOT4L0RBpIzSMvbQli7RCM6ClbsBlc+FyapGD9HefuNUfQoJCUPW/2q0
         eAGaftg48W82GZ3gZbksSfaJJuq4yQHDtphQiqn7kRdXo3tk5+TzOtfLA7tnQJgPCxTC
         nk2Dq5E94czpNZ97x9kILNACU3lAFYgK36waTiniYI0kMAyS09Fomq63IqQ7VQEQUvb+
         ijF8VxoHmfFsAXPfgbgaiD6R7flvV6/C50pzcuiM0HsIw0eWgjjo5P8WcFpmFTLs7A6b
         pPd1EySNUVZBwoXUdK5XabLZa6wZUem3Esi5wursYsiABA+SLNW5CN3YLZnleZ48lztg
         Q8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732153797; x=1732758597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWUCvJsSdXoIhC6o2UMOCGwxpjGSWTPIQOwgtRNzfoc=;
        b=PEbQcG++t9TAYbES/EppGDx6blaTbLC8g0PaG4hBPcNreCBck1Z8M2iZ5swU5+94Yi
         2F5NJUQmEFFox4+gyyZfMzU8NINpmIyIGFHpNHnXHjK87cUWRf+723LTR0Q0c3tQEMNc
         6sLzYb+uhbBasaTKBkx5P0WZWCRugaY0XT5+L9fkXqGDzCmXOqwWBrSTa4mTfsoEQkK+
         Jy1tT5JCWiOZjrkoj5vgRSQs/FeBY0B8L388PnJo5u69U72eZfhlM5kW7INeE830dK0w
         YZWAIY5/psFDobeLjtfXMQHYa8R/oErzcB/qWfSCi/37dS37ioxzXAxIMxEHNNKMjei5
         uvXA==
X-Forwarded-Encrypted: i=1; AJvYcCUdHlPtF9EJrqDWHfFRqtNg9sN6Ze4YZEDkK5/XYLEWZxb+4JV2ia1oRKDnv1yfFVMkrmof9O4ZH+OQjr45@vger.kernel.org, AJvYcCVJVKDe/FlinqhyA1eX5obGwlzspDrVOzk5bdMtcvnZWGR84vGyPk2KMcePb03caSItVPNWttrErsrhDmti@vger.kernel.org, AJvYcCXkVAewP31K2Xjn6PH2GvLaawGaBPC2fyBLfs03WKRfmZkKiXuM1urz/YoDbfe4SNroZgqhAjQ/gEzXTv9G@vger.kernel.org
X-Gm-Message-State: AOJu0YzTrQz1rHcb8LjzS834iK2gIBL0HeCoIh8JTCTlUPlqZZw2nD4I
	jxNp3UQlKm1QgWnvIyFrrp8jCTkWo3DIhp8YPTNd0xjjiAMEdFlzQ0P1SPYhH4t+0jtLYcNaGIq
	S67qWaarQhHUpX18CdNgZqsWyauE=
X-Gm-Gg: ASbGncseXm3bzZKe631ulL4yIEGulXawbR5/o3dKUiB3LsoJyzZ50ZTA2Sf+SzvnrRp
	x5aKWDQfcZ4HHdsgjc+B1sQsPP35eDtc=
X-Google-Smtp-Source: AGHT+IFh8SZLjAYfaOvwEHKsujNC4f1OC6rw1sfTwjSfqOhitM4CoORxUcXQ/f2DBftwZf2WYV9HSVnid5nQordIXA4=
X-Received: by 2002:a05:6602:13d4:b0:82a:7181:200f with SMTP id
 ca18e2360f4ac-83eb5ff1397mr521065939f.9.1732153796731; Wed, 20 Nov 2024
 17:49:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz> <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
In-Reply-To: <20241121011720.GA69389@pevik>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Nov 2024 17:49:44 -0800
Message-ID: <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Petr Vorel <pvorel@suse.cz>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 5:17=E2=80=AFPM Petr Vorel <pvorel@suse.cz> wrote:
>
> > On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wro=
te:
>
> > > It will be used in the next commit for DRM_MSM.
>
> > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > > Changes v3->v4:
> > > * Move definition to the end of the file
>
>
> > I prefer to not check the tool.
>
> Ack.
>
> > Why don't you install python3?
>
> Everybody installs it when it's required, the question is how to inform a=
bout
> the dependency.
>
> There build environments are minimal environments:
> * chroot (e.g. cross compilation)
> * container
>
> These are used by both developers and distros.

I don't think py3 is an _onerous_ dependency, but it has come up as a
surprise in minimal distro build environments at least once.. so I'd
be a fan of surfacing this dependency in a predictable/understandable
way (ie. I'm in favor of this patchset)

BR,
-R

> Kind regards,
> Petr
>
> > >  init/Kconfig | 3 +++
> > >  1 file changed, 3 insertions(+)
>
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index fbd0cb06a50a..c77e45484e81 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -2047,3 +2047,6 @@ config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> > >  # <asm/syscall_wrapper.h>.
> > >  config ARCH_HAS_SYSCALL_WRAPPER
> > >         def_bool n
> > > +
> > > +config HAVE_PYTHON3
> > > +       def_bool $(success,$(PYTHON3) -V)
> > > --
> > > 2.45.2

