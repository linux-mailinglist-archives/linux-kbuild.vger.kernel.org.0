Return-Path: <linux-kbuild+bounces-1075-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C98687C9
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Feb 2024 04:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95E92283C11
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Feb 2024 03:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353E21B27D;
	Tue, 27 Feb 2024 03:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ax96dnXx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3DE12B75;
	Tue, 27 Feb 2024 03:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709004587; cv=none; b=q5/w+aKImzvzfbjr9jqe7LJQAXDEquoXrKPezsJx7D/hP+BfBF7VrOAb03P08wDFf8WgMldezMeNZNFI6LLlAMgpHMl5lqPN7ZAI8usEMg5rwc1d3USE3VydjhnBpZ58PPFjP5nNqqxrg59671i3C9aA7RKdJo7/qh5ZRS20Aa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709004587; c=relaxed/simple;
	bh=PbO3bY7v829gg1IDZCPUZSdq4KzbKx2n62G+pK1sFDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzsOUqLvl3Dkht8qyQb7yWO8oqMjPx3OJpLkQA9uSpZq+aO7ITix/abdLH4hf+bWHTmZku5dX5KeVufDlOPOiDnc44EOaZwiN/qsF7B867KfZ/uzERwg3m94yQVBULKCcfoXF4QQ4Xhv37ffsQrs2dHgc4RbGZaigojiCIGLzEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ax96dnXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7A5C43394;
	Tue, 27 Feb 2024 03:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709004586;
	bh=PbO3bY7v829gg1IDZCPUZSdq4KzbKx2n62G+pK1sFDI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ax96dnXxkxu8RHIhyoshWA9FfATjtaSk3DhZT3/qR9Skj6FA4aKfp6EIR71GOzDoq
	 EeS0LvagwoVql7+JFIkzthyvX+pIGLO1uXak5Ua9va20+RFdvM2R1Ys4CZH+F186/5
	 kFVTbsVHaCZjaMffNdGdFHpzf4u/Jo8rTmh+mZkw3Og/s8p45+iGBfYCkVIgK3BPQp
	 QCs1JTowZKml5nIzR8iPlstsbXU5H/KD0XFttphrkc9cG+1mb0Z1sDppKvSJbXTHxz
	 9cIZC1L1sc3H5IRpvWzqABMEL+/qAYEuPP6NqJiu9lBSHMkci3UNM7R6ayHHC88Gdh
	 5lgeHDWLlOzPw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d29111272eso14222601fa.0;
        Mon, 26 Feb 2024 19:29:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRzojpZw90iUcyDay+AMEFTwxjB9Aq0GdXSxu4k9kqW9kbtOV8mmzcCXlcEtPS+NCM2gfsTZHM86Q/kehTuxxeiRahHz2W7j6v6/Lg8fdLjh8zHY4GYjbFUNML3Vv+NoDx5sqRxv8FOKn8WQ==
X-Gm-Message-State: AOJu0Yw1PLILXI0mTuP1CoSWaReRq6Um40dTNxYgIUVwK86ElV4sXW8L
	UVGw7EmR2d30V85uCY2RGSVmr5o/DE1PACcc3IPRO9XxD2KOIKhST0HkDby2kHdEN8nR4ML7ktm
	B9RnKUyh3K2wqNDJUF7YnCMoTVxQ=
X-Google-Smtp-Source: AGHT+IEN5BN0+IfYhtY5KkvP3G7KdFLbDw6kvjAQ7IBhqxFHBEWQjHjvlLnOT09TheBp+TnxJKyTZut06ED13DYqfMA=
X-Received: by 2002:a2e:3316:0:b0:2d1:26f0:8167 with SMTP id
 d22-20020a2e3316000000b002d126f08167mr5270312ljc.35.1709004585013; Mon, 26
 Feb 2024 19:29:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
 <CAK7LNAQDhpAirfbb1zExH1auWkMPzncA9XpSrkv4odXOWZdQzA@mail.gmail.com> <CAA8EJpotuep1MDmNvNAYAC98peK9GFUVeUJ8G-GBwunSPrsUGQ@mail.gmail.com>
In-Reply-To: <CAA8EJpotuep1MDmNvNAYAC98peK9GFUVeUJ8G-GBwunSPrsUGQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 27 Feb 2024 12:29:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATwM_8imfbYZKEL5WjvxgAgu1bY3p74CiP69H4QxO9B1w@mail.gmail.com>
Message-ID: <CAK7LNATwM_8imfbYZKEL5WjvxgAgu1bY3p74CiP69H4QxO9B1w@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] drm/msm: add support for regenerating shipped
 xml.h headers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 7:49=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Could you please specify how you tried to compile the code? I can see
> warnings from headrgen2, but I'm really puzzled by the errors from the
> MSM driver itself.



I applied this patch set onto v6.8-rc6.


masahiro@zoe:~/ref/linux(testing7)$ git log --oneline  -15
40eb59f162cc (HEAD -> testing7) drm/msm: sync shipped headers database
ae850f45f243 drm/msm: tie regeneration of shipped headers
45401d4034ef drm/msm: import XML registers database
491e4d41308e drm/msm/headergen: generate _shipped files
6766c628c097 drm/msm/headergen: don't output full file paths
e48e9a8eaf21 drm/msm/headergen: use asprintf instead of custom aprintf
b12d6fb5d2a0 drm/msm/headergen: import source files from freedreno/envytool=
s
4699358f5c5b drm/msm: use _shipped suffix for all xml.h files
295fcf923852 drm/msm/dsi: drop mmss_cc.xml.h
a15c0faba637 drm/msm/hdmi: drop qfprom.xml.h
6811afe14414 drm/msm/mdp5: add writeback block bases
feee4929582e kbuild: create destination directory for _shipped handling
d206a76d7d27 (tag: v6.8-rc6, origin/master, origin/HEAD, master) Linux 6.8-=
rc6
e231dbd452a7 Merge tag 'bcachefs-2024-02-25' of
https://evilpiepirate.org/git/bcachefs
5197728f8182 bcachefs: fix bch2_save_backtrace()


I see the build errors with arm64 defconfig.

[build step]

  $ git clean -fdx
  $ make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- defconfig
  $ make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-  -j$(nproc)






As I commented in 05/12, -I$(srctree)/$(src) is lost.


I was able to build it with the following fix-up.



--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 ccflags-y :=3D -I $(srctree)/$(src)
-ccflags-y :=3D -I $(obj)/registers
+ccflags-y +=3D -I $(obj)/registers
 ccflags-y +=3D -I $(srctree)/$(src)/disp/dpu1
 ccflags-$(CONFIG_DRM_MSM_DSI) +=3D -I $(srctree)/$(src)/dsi
 ccflags-$(CONFIG_DRM_MSM_DP) +=3D -I $(srctree)/$(src)/dp






Better fixes would be to use #include "" properly.
It should be relative to the source file.






diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 592b296aab22..cf878490abd0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -9,7 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/notifier.h>
 #include <linux/soc/qcom/qcom_aoss.h>
-#include "msm_drv.h"
+#include "../msm_drv.h"
 #include "a6xx_hfi.h"

 struct a6xx_gmu_bo {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..3a109453db31 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2,9 +2,9 @@
 /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */


-#include "msm_gem.h"
-#include "msm_mmu.h"
-#include "msm_gpu_trace.h"
+#include "../msm_gem.h"
+#include "../msm_mmu.h"
+#include "../msm_gpu_trace.h"
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index bc14df96feb0..007788bf38ce 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -12,7 +12,7 @@
 #include <linux/firmware.h>
 #include <linux/iopoll.h>

-#include "msm_gpu.h"
+#include "../msm_gpu.h"

 #include "adreno_common.xml.h"
 #include "adreno_pm4.xml.h"









--=20
Best Regards
Masahiro Yamada

