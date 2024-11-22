Return-Path: <linux-kbuild+bounces-4796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4DD9D5FF4
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 14:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82BA01F22B89
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 13:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D98938389;
	Fri, 22 Nov 2024 13:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ak890/A3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68E79443;
	Fri, 22 Nov 2024 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732283366; cv=none; b=ZOjmR+CJikZg/+jSd6CZzo2Pic7y3OuR5HV7DR+DD2Tx/spwEoh28vkNC1pS+5luzxRU2v8YxQGkJZFGv5VEyGpchJ0Hjn4bHaz1a1f1gP5rcbrGpMbwJvXIHygopAHckVbvN5n8yuCM/d4ezkZvDQzj1cHj15HQJ3izGHc+rgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732283366; c=relaxed/simple;
	bh=YZjjtoI7wNILcQPiciRCh2Ad8T4l77X+/OieJbGJVoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFIWHWzxAQbW0XU1m6rXXH2/XbS+23gEROLWjcfxfnDxE9pNw+YVVraMHLq0cCJ5++Q3dur+E8niHLWRgJbZkBMoug+W3RN9WN+BarWsI2PXQoZy+7j21IPDVHq8KCp5Ub7LOUuIN9HB5LmYhbNq5z9bhVOkvI+5MKXV8sDlxPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ak890/A3; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-83ab5b4b048so75174939f.2;
        Fri, 22 Nov 2024 05:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732283364; x=1732888164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zHwlEpS92eh3Y2BEZgdXLuE5s5zxW5BToEL+BkU1JM=;
        b=ak890/A3rpF/7j5TfRrWXoWcnWkhkaLcBHOXiHxATopqRBjNI50a+AEKE/M3rjXPHh
         N3U68lLQ5D+1jEIxE3b0BNvcDYBw4TmTKqcVpjlWOBubNCddw7tCsA0QoSLeQi/Jo4Be
         6RxU/n+Cfiw0oWWde9/5D7hfe9CVL4HxDah2bWGm5uo0LJQWkc6QF7SqXrnJsRLqCDpf
         RBC0AlqoZDAgKtUk2iOFZAuG1sJnS0Bc4uuiuoiiTe5cm/fyLFfwpgKFDPwFQfGdIaLS
         ekNopODpw6M8y+wdey+Rtw26Vp++N+1qorgV3W8WJnOLtHz2EUUQkWSPVx8ON6giB7QM
         oJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732283364; x=1732888164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zHwlEpS92eh3Y2BEZgdXLuE5s5zxW5BToEL+BkU1JM=;
        b=snagT4A65wTJdFox/BbxWq5QjIcdsTqgqETMiidPEXF7nv9FERI3PxPLbb3xBYHIE/
         s8dsfWVv6bT3ZEGEnIgOGG69fYYS0cQtwabNPDDOF0m5e2svaJmuJM62Sb6YHjJXKrlu
         tifbDBhEvQJKbEzEHXqs0Zz9+P9p53lKK4c74bs14ZPDgfrMskhi/y5D5Wfy9ISX/qkj
         6Rf5hHEHPuWC6yNQuqT8yD6LQcm4VWCdHRpUxVwM2G8LS2Hw3he0IuUMOo8OisaOGTjO
         oVYGWJ9HngMzRTKlqqP1/o3Ogug8oSq9ijK31Oq1wn8vEZhg+lkV8lWxgphVNXxKVjhf
         +G2w==
X-Forwarded-Encrypted: i=1; AJvYcCUoGhGr5jDb74ga8z8RdbfmrV/SJij1lre2d0jEnUXg62yz7pbHbCFuXVm00kTlGCy3JL+7yoXSn3+yoKyD@vger.kernel.org, AJvYcCV9daWhCEz38QbLlOCarQPy8o0GriTTP/al6tPCRM5QXf+NNg83bjZsG768xNf2iYavsopkJzZ7IE+qIe/1@vger.kernel.org, AJvYcCVhDQyDC0heMkgyBV7lysd7Oc/f3/wVSKN1UjApI5s9WC/Wl7lQEs0apTbFMJjTO4k0qBPD9GamBIt8rObX@vger.kernel.org
X-Gm-Message-State: AOJu0YyT7GFTw6tVU6F6/8ZVnWWqnIegGF5yV7tdAVsz4ZR+boXn7+ar
	k82lQny5zIfapvNweUJRlw9AfnR+9qbLxo8iDbgC37K63wYSdQYggw9sMQCATfMBSVZdxRH2fsV
	dfwrl3bloZ1Yc61yizzNQZvPYUZEVdA==
X-Gm-Gg: ASbGncvSrmOGotehE8VHPX5g/qw0I68W9jesiWfFIk4Brl81t9FBEuPLOQh+M8TFmE5
	VPfanya614SRu60+tQMii/VhK8txfP0s=
X-Google-Smtp-Source: AGHT+IFGU3sLkbKnqDksmnBuhW3CvoKTG6Z0qIoktztD+JIBkrwwln9lgTfJ0r69wuk6otmhq4HVrqu3lYGmKrJaRbM=
X-Received: by 2002:a05:6602:14d3:b0:835:4402:e2eb with SMTP id
 ca18e2360f4ac-83ecdc60ebemr304797439f.7.1732283363765; Fri, 22 Nov 2024
 05:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz> <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik> <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
 <87h67zzjdc.fsf@intel.com>
In-Reply-To: <87h67zzjdc.fsf@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Nov 2024 05:49:12 -0800
Message-ID: <CAF6AEGtXEcNijTqH+NZ5-8ZX2TnzsxACJQ9XXWC9zGTJGxNv=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 1:51=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 22 Nov 2024, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > Documentation/process/changes.rst
> > documents basic tools necessary for building the kernel.
> >
> > Python3 is listed as "optional" because it is required
> > only for some CONFIG options.
> >
> > If the exact dependency is unclear, it is better to install
> > all tools listed in that table.
>
> I think we're slightly in a limbo with the python build dependency. I
> think it got initially merged a bit under the radar. And I don't mean to
> imply any ill will here, it just didn't get the attention it maybe
> should have. The dependency table got updated afterwards.
>
> Now, what's the status for more modules depending on python? I for one
> would like to use it for i915.ko, but I'm a bit uneasy about it as long
> as it's "optional". Conversely, how many more users would we need to
> switch the status from "optional" to "required"?
>

The way I've been looking at it is, for drm gpu drivers, the
dependency is only a subset of the py that mesa depends on at build
time, and if you are wanting to build the KMD you almost certainly
want mesa as well.  Maybe the situation is different for kms-only
drivers or other subsystems.

I may be biased here, but being able to generate code/tables/etc at
build time is something that python is very useful for, and has been
used to great effect in mesa.  And because of mesa's dependency, it
seems like a reasonable dependency on the kernel side as well.  My
only question is how to make the dependency visible in the least
confusing way for both users and packagers.

BR,
-R

>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel

