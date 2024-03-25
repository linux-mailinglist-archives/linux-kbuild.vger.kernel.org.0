Return-Path: <linux-kbuild+bounces-1317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D3D88A861
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Mar 2024 17:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8001334280A
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Mar 2024 16:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7566EB7A;
	Mon, 25 Mar 2024 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jScDh8yJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1418D6F06F
	for <linux-kbuild@vger.kernel.org>; Mon, 25 Mar 2024 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711374615; cv=none; b=Dxv4CGQJgELjmTXLqB6GndD/aTDXNLdFqQvtWX4swhTnsMASTNCgKhluajL9FvV56bY72GiCDrB9PbJmKW1lorzOmHMxbJTM5DPpt0XbKzBxmjKKTz3t5ZevLbPSzYeiF5iyJyovhIu9DE0qCi60qirqsJVEUB1jr21N4EyOAV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711374615; c=relaxed/simple;
	bh=Q/O4TzucTAKDX/kg7bNrMLHybrgmo/JFI2rvZKGDjBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emC5okKP7GgAR9rIgA7Kjd/BefRZNnYhR+e6ti6ZwEKBL9bcLPmTmUqHVqr3BpXo1Pj16svDaOw7Tq0su0yzbxGAdt1o0cesrzwQrpRjXB5r9M0bMVqOGtxa5IgENGZbfI9Gtyl7h86nkny0nx3TKL6P+gHdNM/6y0ICYhw4mJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jScDh8yJ; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso4265551276.0
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Mar 2024 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711374612; x=1711979412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xY4s7Y2TDs9zFkoIeirDMHTppdLgQXMLcHGPVUr4u2w=;
        b=jScDh8yJSyXQXu1ywGwkBZCVALCAObT5jLVPpzSwKXYaAuWnlSzgub5700nFX8VmKn
         9BAAF0MS7cdkfr8UjaUDQJrn56t3gbfTtqHMW5/jphkAv0aGkqz276n/JaTyPjPXYPqW
         gNfpAD+HNcfvfk3ygNL6i/F0Yd/FFSQfGnyzb5BQCjijzDKDXigQ7WsNbHcI945iNSpD
         c4H5u5xvI8svMEAxXGr2XN4hDQaaxUVVCkXvKHprOEldPRCmO6npNztMBZe6kDPZ5RjF
         SVzZG8eDhw2Xu5/9Egi/BDtbieCivgDFs5Btr3YKPTVvoX7hfK6q0zMWH+nXmmyWm9CY
         TEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711374612; x=1711979412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY4s7Y2TDs9zFkoIeirDMHTppdLgQXMLcHGPVUr4u2w=;
        b=fsWTnpYMagIWMimDxLfrR3J+znwpOSppK3dQ5bIq4WN+3qqhFQNpt503NrL0I92J4N
         Rh23SR+mhnx/mWpiqbWFgSc2se+FelpjsnK2MyN7fdJUbm7b11m762w0YN9TD/j/Q8Uq
         G68ZAb7XrsUjt7SNEWd5kF711nKLtQtNH1p3JCxeffFTZdpYrVbqvZ5c/GQ9jUvNyHBq
         7Fj7UswLLjflYhwGX+Kq3/d+YUmsKZemd5msOLDnqn4g8NvY80PUFGuLFmDsM4ygAfC5
         yMro1v+6tvxz6c/bwa608eUGHehjaNrNWm6iimLc1lpMGtfB6QbnyhgziT/WpLlS5XwA
         SNRg==
X-Forwarded-Encrypted: i=1; AJvYcCV9DTBqLt3FfrlFQkA4pO8SsINOaVu+mvz1efawSS5s5fPnhwyK1MPM2sD03GstOwcWgd+csBqhbx7C985JcOVMO6a6cr0StKRTACDB
X-Gm-Message-State: AOJu0YxpHh/VhnHaD3rUlOeygk2wi/etdJKpqRzKIJ7ZMMtKQ+HZJC5f
	UI5mJKE3oY3YkyWDza93Emw4nTVm+JVPG1P+4cjiEZy7UAdJoJQ5ADHVj3VjhHRjWSwFbeUlxik
	KrmT1uw2BlJWHD6yMF+PRcAxhCdTpXIGXJk1ZcA==
X-Google-Smtp-Source: AGHT+IHYjl0eFIojoJcLVm6Q3FikVODclbSrKrXlRZtK626pzzHApRK7eCpxDKYvNTGQRZ5CWm9dXvBcGq57I2cLYIQ=
X-Received: by 2002:a5b:941:0:b0:dd0:76e:d630 with SMTP id x1-20020a5b0941000000b00dd0076ed630mr5054565ybq.53.1711374612032;
 Mon, 25 Mar 2024 06:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org> <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
 <CAA8EJppO8zMq5R7hBPG04Zsr9c3-Z9mqpnJQ88Dbjv3uYDbrUQ@mail.gmail.com> <20240325133252.o6taik5ezrsqtl7g@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240325133252.o6taik5ezrsqtl7g@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 15:50:00 +0200
Message-ID: <CAA8EJppK6o0gsashG8yCLrOLbSVFDbHYEgzqBgP5ts65uTWgfw@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 15:33, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sun, Mar 24, 2024 at 12:57:43PM +0200, Dmitry Baryshkov wrote:
> > On Sun, 24 Mar 2024 at 12:30, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > >
> > > On Sat, Mar 23, 2024 at 12:57:02AM +0200, Dmitry Baryshkov wrote:
> > > > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > > > need to push register changes to Mesa with the following manual
> > > > synchronization step. Existing headers will be removed in the following
> > > > commits (split away to ease reviews).
> > >
> > > Is this approach common in upstream kernel? Isn't it a bit awkward from
> > > legal perspective to rely on a source file outside of kernel during
> > > compilation?
> >
> > As long as the source file for that file is available. For examples of
> > non-trivial generated files see
> > arch/arm64/include/generated/sysreg-defs.h and
> > arch/arm64/include/generated/cpucap-defs.h
>
> I see that the xml files import a GPL compatible license, so I guess
> those are fine. The gen_header.py script doesn't include any license.
> Shouldn't it have one?

True. Rob, could you please add copyright / licence header to the gen_header.py?



-- 
With best wishes
Dmitry

