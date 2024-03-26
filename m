Return-Path: <linux-kbuild+bounces-1349-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2334188D0C2
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 23:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0B0A320D9D
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 22:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538AB13DBBD;
	Tue, 26 Mar 2024 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fhV0Vv/E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B213DBBE
	for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 22:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491933; cv=none; b=IzIuWQLOv1DFxdTf22hzpiFivj+gr3Zj1gTvz3i0hkMGz4VBBkulGZ2qTO1LqBDzjQ0hp9G4TCl2vmwZerpcw786CIB/2Rh60Y3wHnPI+4nM7soOr6BWCnfBU7Z6u4R1zTeTpm8R1ssD3mziksZfuJc1gb2hYd3GuUayz2hwTWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491933; c=relaxed/simple;
	bh=AL2gASsnMwFmP9rsmduNuuLiI6UNYFzfiGZ2TYnbdaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgnu2psZRYkkwR5KTn78hBQmpD1o/wqIiyeZ+7OxEyM4CcwqJaCeziCbWStuL1uOMN0iBSh+17trV7dpkobPhx2WwY3kb31MRZ1BxyZsPMe48OXYYIwHpeNm+Jw1hKgiZcaDQebOlgtEIcioFV+j2/I+vOHs9SOeSCuXVM7VQPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fhV0Vv/E; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so5510161276.2
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 15:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711491930; x=1712096730; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3dOnXvDtR1ZmPGDB+HPKB5I6v7/354f5+TzY/Xk/FFQ=;
        b=fhV0Vv/E2ugjR+zocS2NsU5WKvkOW1sTg46Qr/jm+Wf3NeLSA65+SK5rOXvZyISEBm
         c6b347e40Iw9tsj3y/w4Lkj3nOf0ivDs0IPNr00AYMY8LCky4KFzZ13GGaYPlAruLcvy
         ubima2Z7LBUtetiPNHQuMs6CdQmyqOr5faFjuncTasHUt3INI3ECI3XxFUYLGXJce2iZ
         Uzfl9VwK7zu20T59lU2qelBgbTLVRJlsI7l2no3+xA063CfD4HS/kTzMw6XQ5WXVkvPi
         rpiwcmfTiLOhytvyw+HBi2UovZfpwO52yjLyj8EhL7epbOQOcwwbJxapTCt7PYBVgtPv
         uE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711491930; x=1712096730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dOnXvDtR1ZmPGDB+HPKB5I6v7/354f5+TzY/Xk/FFQ=;
        b=f/Iarvuoc8xGGcr0AcqScZFPw7VaoC0dG3/eKHmVp/G9OvyoF8T7ZDKeXcZj6bGT0I
         pXciwKBvL+efAymMXzzkhZhWfyAhiDGb1S4H/pias8x/bYdGeS0Ea6CxNeD04bsq67Ik
         /IopyUgGXRMIiEooB4N7iXeqkOK5zDixLiz/zvM90l3YXAbHThGTkiggg+Dda5mgJ/Uh
         XNIGl9hRA0YTd7FsqGQFJSsLUZXWD7e6QhCIQkPgvoixF8o0IjMgX19DXXI17K+T/rHw
         tbJS8hJ6L7vWJoN0QqlXbijrXsLbBTkBlAkxUJTGbYjplStZuaUqMrow/irMpVOSO3Zf
         +QUA==
X-Forwarded-Encrypted: i=1; AJvYcCVqHpXtt/X2NAcsD8lRJcQQHm8nbwYAW6lItZWolBEyj3eYsMSANtl6UdLEqgT/ClC9l7CTk2SzRP27Ac3U/9h1yr0SGE+/lE0TSawi
X-Gm-Message-State: AOJu0Yxa5pwgDDjJrGPfp1Pm1VeKNHek3T41caj1HPis6eA9Tcjm3DKG
	QzAxsjy03HqayX4UWNahGwJCOCczpNrZORJabgWv0kxKhHHWaCfb2RWXbqkJLkggnKHWr3NsIZn
	2aDgSo8r0cB/WnH8ZVDsX9MaKzRIjyj1OfoHQPQ==
X-Google-Smtp-Source: AGHT+IHwP/VQYXSJY8boUvlnYpU9XYRDMYCIvQHPAfNdssF4udkpcZrs+Wcd7aiGb0FDo2fOx1SpFfj5CMA+/MWpqcU=
X-Received: by 2002:a25:df54:0:b0:dcd:4878:1f9 with SMTP id
 w81-20020a25df54000000b00dcd487801f9mr1108120ybg.8.1711491930685; Tue, 26 Mar
 2024 15:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org> <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
In-Reply-To: <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 00:25:19 +0200
Message-ID: <CAA8EJpry2dHyBF4wyXeFAyLu+9_tYg3xyP6eAM7RzJzOiOqypA@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] drm/msm: import gen_header.py script from Mesa
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 00:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> > Import the gen_headers.py script from Mesa, commit FIXME. This script
> > will be used to generate MSM register files on the fly during
> > compilation.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/registers/gen_header.py | 957 ++++++++++++++++++++++++++++
> >   1 file changed, 957 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> > new file mode 100644
> > index 000000000000..ae39b7e6cde8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > @@ -0,0 +1,957 @@
> > +#!/usr/bin/python3
> > +
>
> We need a licence and copyright here.

Yes, this is going to be fixed in the next revision. Mesa already got
the proper SPDX header here.

>
> Also is something like a "based on" applicable here?
>
> <snip>
>
> > +import xml.parsers.expat
> > +import sys
> > +import os
> > +import collections
> > +import argparse
> > +import time
> > +import datetime
> > +
> > +class Error(Exception):
> > +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> > +http://gitlab.freedesktop.org/mesa/mesa/
> > +git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > +
> > +The rules-ng-ng source files this header was generated from are:
>
> Is this still applicable ?
>
> Now gen_header.py is moved to kernel.
>

Copied, not moved. So Mesa remains the primary source for Adreno
headers and gen_header.py


-- 
With best wishes
Dmitry

