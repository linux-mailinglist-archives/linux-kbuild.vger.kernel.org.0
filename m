Return-Path: <linux-kbuild+bounces-1357-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6542688D304
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 01:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE0F3212BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 00:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09DB7FF;
	Wed, 27 Mar 2024 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxYQHcbZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C821C10
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Mar 2024 00:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711497868; cv=none; b=BPXqgjA8kd8zMxeGkpptWGZr7GZqEX9tbhWZ9j71TymXz4m+QAdTaSL/MmopEEcSkzC4IYL2UcnhC/Ogxxd5mE3yIf/4iJ/ni5A0zUDocfSWZmMP2gh08tgnHEqPgSvVwOrwBsFompkLKVD18/Rr3wTGNnk8K3AnzZd80QVm2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711497868; c=relaxed/simple;
	bh=g9MvZWErk7nPFpq4LhbhjEehJuwP1hbGVKHQhwQs7mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLSYSD2DJTcL3YjL/ACvpC8HYMIYvtSQ9DUK2/OrB938uQl3WO9ARhW3ZACyuv7iFG1eXq6hXUwGJZUUSwZ8iaQ6O15cK9GMM9TYy/WBXx8N+heWWZ+fqOPEeMRAN1EasKip1P7PiQKhE9QqZfK5slHEQjSxZwisOWCaRrv33Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxYQHcbZ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so6271192276.3
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 17:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711497866; x=1712102666; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cdWwjlLjRKWPoRjlQky5MiZwOYfdmEHMy7nWkUa2pJg=;
        b=FxYQHcbZsF2L8NSlhL1SgeHc1OcuEUmVPZEgzOEA/fYvV7iXRXwEtuo8rWMNZoAuWs
         chEZaXnfM4fHUS5Yb3zYx92KjzCXTvdj89Mgmn5SdZcKKLzR0/QBlb2mMzGdPVAdWeo+
         bPtdUATGRCZEuPDPhHQ8FtEdzEQlDluFcRQ5IfasHvPcSKnyq5WR4WZFzelY5iSatCNy
         3+km2aYHAeEY+FupYx1kOwiKi23QYpbqqutgx4Reh7Gtat+GyKX1+hCywUNvMGKQTam1
         ZMx+goMUf8/k2zCPERRZQVn/ba3QFNgblqQav8cvuFw2IFH/shjXHPBoOfHmMPSF9Dof
         HKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711497866; x=1712102666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdWwjlLjRKWPoRjlQky5MiZwOYfdmEHMy7nWkUa2pJg=;
        b=rkT6sbK7D/+jQNIMh+zZZThvcvv6fGYa/1oL6HLQ2fRj3Hk1Yivwf2byIKWTm6hZVv
         kXFmGNPQOJOO4UaiYr7T6743wmM04ZNDQl+zDT+LZJR7lPvUZFGHhSixBgtVxsadqy6o
         F2jKG+XthGAKlgdi19Zx+GmfNhJd5ffChLTU7Ejys4WdBjAWFYbzrDbmpD9L3lsANibQ
         I739eVcxCZODcSHDnMjbCO1SEQxke0kssoCHuIwgLErDnVZiuxsyuZbsJmfrnnjDQRDP
         ydjgDdJK5xbF34g3jr2vv/FglKqwELX50r9eUu/84CuutGKE/LjfsMa2l8Kbra0KEO1z
         Ti7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAASOz3dS0c6gV9NGvyszXzYWt09XqcLitUNT34LPvXEJmBUKooFKCGJbcukWX5B7oFBvRu0gFuu7jdbuZ8VlhoS9VYGRUnUQAKDVf
X-Gm-Message-State: AOJu0Yzk18FyONtjeu9KJi92TA4Nc/UQauh+Xfi44mgzirJChMFWm0Bt
	LKdCHKWyKKJqeOgtuKoNL6tMBe7a9xbndfWdDWMWLV/86sns1KGFBXv+zxJ99sVhcv0f2xgZs9u
	1KpbP1V8kmFOyk052/9sAOWZYrhJB5ZBYjR23wQ==
X-Google-Smtp-Source: AGHT+IHHf7+YNvPzDN4JuLfBI6UVtPxAG+UoXbABP3viX1ebb038qkns6OH4xyJU4zdD7VxtUJLuinCpZqrd6ZCFyoY=
X-Received: by 2002:a05:6902:4c5:b0:dcf:f525:2b81 with SMTP id
 v5-20020a05690204c500b00dcff5252b81mr2609255ybs.46.1711497866103; Tue, 26 Mar
 2024 17:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org> <8c866d80-f98d-29de-59f5-3055184fa115@quicinc.com>
In-Reply-To: <8c866d80-f98d-29de-59f5-3055184fa115@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 02:04:15 +0200
Message-ID: <CAA8EJppGmUPympav=NR1oYTPGs=b-DKs3a_h3oWs8tToLQOK=w@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > need to push register changes to Mesa with the following manual
> > synchronization step. Existing headers will be removed in the following
> > commits (split away to ease reviews).
> >
>
> This change does two things:
>
> 1) move adreno folder compilation under "adreno-y", move display related
> files compilation undere "msm-display-y", move common files under "msm-y"
>
> 2) changes to generate the header using gen_header.py
>
> Why not split it into two changes?

Basically because there is no difference between object files before
we start moving headers.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/.gitignore |  1 +
> >   drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
> >   drivers/gpu/drm/msm/msm_drv.c  |  3 +-
> >   drivers/gpu/drm/msm/msm_gpu.c  |  2 +-
> >   4 files changed, 80 insertions(+), 23 deletions(-)
> >
>
> <snip>
>
> Are below two changes related to this patch?

Ack, I'll move it to a separate patch.

>
> > +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 97790faffd23..9c33f4e3f822 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -17,8 +17,9 @@
> >
> >   #include "msm_drv.h"
> >   #include "msm_debugfs.h"
> > +#include "msm_gem.h"
> > +#include "msm_gpu.h"
> >   #include "msm_kms.h"
> > -#include "adreno/adreno_gpu.h"
> >
> >   /*
> >    * MSM driver version:
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index 655002b21b0d..cd185b9636d2 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -11,7 +11,7 @@
> >   #include "msm_mmu.h"
> >   #include "msm_fence.h"
> >   #include "msm_gpu_trace.h"
> > -#include "adreno/adreno_gpu.h"
> > +//#include "adreno/adreno_gpu.h"
>
> you can just drop this line

Ack

>
> >
> >   #include <generated/utsrelease.h>
> >   #include <linux/string_helpers.h>
> >



-- 
With best wishes
Dmitry

