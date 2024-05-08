Return-Path: <linux-kbuild+bounces-1812-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B2C8C0708
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2024 00:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C341F23050
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 May 2024 22:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0E5132C0E;
	Wed,  8 May 2024 22:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nDogj2yk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D091E89A
	for <linux-kbuild@vger.kernel.org>; Wed,  8 May 2024 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205629; cv=none; b=MhFZmINaMUPO6REl0HSdmyJgEOrNF2RqmhSZ9tGAlyzkbpnHAA7RqRqK8MOwy+iHwUuBViTic4Gv2uW1LIR+HXwxrKNF2cBfBE1m+52HGJjrZ0OEtBg3H/vqfN/hanOW3k10I5NURGVUIV64r3VO0bpJODeoIA2LENvnBn/Mlxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205629; c=relaxed/simple;
	bh=j/kLQd0cbrp1oqeSRoP/JS2lmoMLaylq5Y+PhH7Jb3w=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcooGV9SU7ftii7Pu4r/VhMGUEudXIec/mwRPv3unDNlRy4cZ+X87PkCFy4s7c9dl1vI+dPI3BnwRxROVU1Bm7y9TFBInd2Qe+20T2vqbgMcxetcNOwuLnXhAPmDncF0q14RnILshRFCpCQPKP8yucSCD0rfhldJVW28B4gEfm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nDogj2yk; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-792b8bca915so13413485a.2
        for <linux-kbuild@vger.kernel.org>; Wed, 08 May 2024 15:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715205627; x=1715810427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/kLQd0cbrp1oqeSRoP/JS2lmoMLaylq5Y+PhH7Jb3w=;
        b=nDogj2ykG5WBXYRZxYQUI/bXNGRmJVSxzwhzJuC+a6+x0sZ5N71FiMwUrsORnSBmd3
         6hgDhCggYTfpdCE0SPD9u9RMfc9I6QODWqiXXtkln1sIxQzvJDJ/WxPndGkGIvGxiPCk
         CT/CEVdfm+0POe2OVE44OWC4u6UVvAX9w9WE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205627; x=1715810427;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/kLQd0cbrp1oqeSRoP/JS2lmoMLaylq5Y+PhH7Jb3w=;
        b=vc8ZGZZmFz6g7viwFui6ENiC8lZKfN8F6BlhuS+3jLY5ApJnN37x9rPB/u8NyH+Psr
         uSxtTmex90ryu7qHlDliKHBE6MpS/6h3hXR5GRWWv5JK4m11dsi9jwiELVUX8o0ZjnHU
         krWh55qaagD9nNMZKYNtUFNH807TZ4hp9ExgstsGkbmmjpt/1jXmYcKm4CvJS1vmtTsx
         7aLKWT+ZXCcULs2250a7maITcj8/Ji2jRK+gpm8floeHDHH0iMOnKjWVeyesVLsH0WPw
         yQskzOnqyR9CJinKXJLbjbXtVgAFNlxdyeSFqmqf2Y+0NAlhx537ZGIxZ1Lz8HuBOQ9N
         5P/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkh9/UjT0Gr9xrJbZ4b9x6qYOurKW4xAXeZfOduciFNrEUnL8AFy1uf16ToFLqr9RHg8b/Qremj9UKxS0HaRqhwfN3btG3utnUpmQp
X-Gm-Message-State: AOJu0YxDmg+zcz4lwcB3gmkJxjZt5VTQr/e1wXX5LV+nkA98gZykJwNS
	+ILqE7x9P/jll4VMnQ9+TbRBsAzyOMqHQsJCGe9xEWkxtUxvPNsGR3G2bElBrwVIPsI4LmdzUwe
	3LIlasrA9pVIMKy93wX8c8Ud+4+sTiJHdaowb
X-Google-Smtp-Source: AGHT+IGWqLU1ICb4oSoi/9XAMgJVPuBLEWgl/SHPBap7kXqtX8RC2o95pm9Fnnk+3bonio7wO95HePihNpjGcIn3FZg=
X-Received: by 2002:a05:620a:3721:b0:792:b938:7769 with SMTP id
 af79cd13be357-792b9387953mr305283485a.11.1715205627263; Wed, 08 May 2024
 15:00:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 18:00:26 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87a5l0lmlv.fsf@intel.com>
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com> <87a5l0lmlv.fsf@intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 18:00:26 -0400
Message-ID: <CAE-0n50O22Mn0N4jMUAK6YMRJiDvuW9VhPnLg=TLV-SecS3p6w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org, 
	quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Jani Nikula (2024-05-08 01:43:56)
> On Tue, 07 May 2024, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mesa"),
> > compilation is broken on machines having python versions older than 3.9
> > due to dependency on argparse.BooleanOptionalAction.
>
> Is it now okay to require Python for the build? Not listed in
> Documentation/process/changes.rst.
>

I doubt it is ok. Perl scripts have been replaced with shell scripts in
the past to speed up the build process. See commit e0e2fa4b515c
("headers_install.pl: convert to headers_install.sh") as an example.

