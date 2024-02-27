Return-Path: <linux-kbuild+bounces-1074-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF04E86879C
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Feb 2024 04:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E9E41F248E0
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Feb 2024 03:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B421EEEA;
	Tue, 27 Feb 2024 03:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ssg/Qxyh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5F51EB5F;
	Tue, 27 Feb 2024 03:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709003662; cv=none; b=rcbUNJEx3dKrHPTaRFrFfGnmed5IGUi5rvdsZaDTCM0NRhItZFiGxGOtuxrlqUa/pFNs4aW/8heARld0vCyh/vrp37Ey7RmhUW5MpeXzrG87wjjeWTsJPXaaWUENpoc1H63Jd2Mpd/Vks86csQS2xlc1clyXQ/AsxoOjF6i5+OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709003662; c=relaxed/simple;
	bh=+NW+lDyow4SyOhdect9IQeTUOPcisVXIrgGQDYWrvvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPiI5Y7w0BpoPRJBvseKjbZAsefscBLMSinfFkE6EX0FEtznZPpTNxBL7rKmAJq5oRfi3dFJwXvmOrTMp/hiaHdzQsQ8LmloWd4SPecMOo01GSaWn8WhmYchXnsnXEoCMDktxHGoMCcH5EP8xlzhEHoaoMRJ5CtyHAdbITWZsYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ssg/Qxyh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF34C43394;
	Tue, 27 Feb 2024 03:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709003661;
	bh=+NW+lDyow4SyOhdect9IQeTUOPcisVXIrgGQDYWrvvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ssg/QxyhOJaeXFkrLJMUmAPDsXzwnBE39E8CbEID4AG+W2Lrcs0+nNu7jmx0PXCxF
	 cnbeHjJ2SUUMjwauBStXvT5oqhuwl+v6R7c/65O4crURWAjGoIG22VNzPM5wlYBxTC
	 8RNm0ixH0fdmzjPZFx1ToA7AKAsoY7v3onj4O/PjhYzQ+pV5nQ5FCM06JVhiW9BLgM
	 fvqymuS0NHMjw1uv4TldwG+GVT0efutR1R4XYCijr5OQwgzD9PrSXMr3PBctISK76m
	 VwAAeuTulVMVcsczI1+bN8+PB7Fop1CuC2BNuBppAYaGyzdqBqcX27lC0FvJQze6GK
	 RW9Tp/Cv4uYqA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d2991e8c12so2330241fa.0;
        Mon, 26 Feb 2024 19:14:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXTGVCFJYMynt5t1J926V+Io5eFQGskml6PQBfWIKRGBdIzJxL8O70t2GkDt/lFBDJ7ehvI6TtP4s5QqC+I+3f+J1FX7xU4JR6i02jubAf733+zoq2v7XlY9VsYXYpBR+Ujo376N3ZzbQw5A==
X-Gm-Message-State: AOJu0YyosyE1lyGXQ6STsjcnw91VXEib2ykMBmudAJrxTJdjZ2GUQl+y
	ru97x6jkKy8tpv4Yx2J7esA5DrOdow5dLGhGjpeaKxGmyhnGB5oDWdwzE2uhx1wrxvxxnkJ7rJ3
	YKgMFbnDENVJOSuNjBl7W5cVzxyw=
X-Google-Smtp-Source: AGHT+IHZR4anyPKBr3MB8qJcW7vCCqkYdpYN/Q5FVYBf6CE/Thk6VlcOx5h6wQFjPwPvyD+a8+DWJDi/ANHG223b+SE=
X-Received: by 2002:a2e:712:0:b0:2d2:8051:3248 with SMTP id
 18-20020a2e0712000000b002d280513248mr2491810ljh.18.1709003660412; Mon, 26 Feb
 2024 19:14:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org> <20240226-fd-xml-shipped-v1-5-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-5-86bb6c3346d2@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 27 Feb 2024 12:13:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNARi+VwYKfVy3c2B4NKJq_VxMKQE8t8fWBF4qXJfNYA4JQ@mail.gmail.com>
Message-ID: <CAK7LNARi+VwYKfVy3c2B4NKJq_VxMKQE8t8fWBF4qXJfNYA4JQ@mail.gmail.com>
Subject: Re: [PATCH RFC 05/12] drm/msm: use _shipped suffix for all xml.h files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 11:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Move non-GPU xml.h files into the ./registers subdir and add the
> _shipped suffix. The GPU files are left intact for now, since they
> require processing via a gen_headers.py, while display headers are
> regenerated using headergen2
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/Makefile                       | 53 ++++++++++++++++=
++----
>  .../{dsi/dsi.xml.h =3D> registers/dsi.xml.h_shipped} |  0
>  .../dsi_phy_10nm.xml.h_shipped}                    |  0
>  .../dsi_phy_14nm.xml.h_shipped}                    |  0
>  .../dsi_phy_20nm.xml.h_shipped}                    |  0
>  .../dsi_phy_28nm.xml.h_shipped}                    |  0
>  .../dsi_phy_28nm_8960.xml.h_shipped}               |  0
>  .../dsi_phy_7nm.xml.h_shipped}                     |  0
>  .../hdmi.xml.h =3D> registers/hdmi.xml.h_shipped}    |  0
>  .../mdp4.xml.h =3D> registers/mdp4.xml.h_shipped}    |  0
>  .../mdp5.xml.h =3D> registers/mdp5.xml.h_shipped}    |  0
>  .../mdp_common.xml.h_shipped}                      |  0
>  .../sfpb.xml.h =3D> registers/sfpb.xml.h_shipped}    |  0
>  13 files changed, 43 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 543e04fa72e3..89c9f5f93b85 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  ccflags-y :=3D -I $(srctree)/$(src)
> +ccflags-y :=3D -I $(obj)/registers


This accidentally overwrites ccflags-y defined above.
So, "-I $(srctree)/$(src)" is lost.



It should be

  ccflags-y +=3D -I $(obj)/registers



I see several build errors.





--=20
Best Regards
Masahiro Yamada

