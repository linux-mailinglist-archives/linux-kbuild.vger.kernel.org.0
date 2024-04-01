Return-Path: <linux-kbuild+bounces-1423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B623893718
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 04:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E6101C20839
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 02:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32C4138C;
	Mon,  1 Apr 2024 02:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9rlaU6x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF1385
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Apr 2024 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939372; cv=none; b=aaHcuw2ZGVmob/Gfdr7DZKm6t4JykcDUMcpom8H7Dlen3AwimPmjYcQYrVyZzxy+6zrx8GUVouEqu6XYeQbRT3EMzi6VaSWWp4109LWkDZsIsNP+ipksVhqa3EIqM0pRnb2H9w1XPONdY5MQ0ZKVtV4yZUtPdZOumwulI9gWJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939372; c=relaxed/simple;
	bh=881XkyZQ9/n8GpCrKuMf96tFmrA9L9nekveexQ/+JvE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lcCfNlb8/XH+SfOIOsv4PfLfPRkASOzKBzFpkyz0z5R1tjsKsLiWJNnhp70+Myjpy2V55/qxrwTtpJt6WuKYpomedggBwNffS/zQKtpvRoVzv+PZgS3upRgYunNfNQ9F7Yb3HR1bGOxRt5ZwWDmEFmpd8zAAJvPqeSFW+kVb2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9rlaU6x; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513e25afabaso3894746e87.2
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Mar 2024 19:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711939369; x=1712544169; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tPKH7LjFteyraTs0dKzXgUFuYFhKTHT6MpiaC9lP+VQ=;
        b=a9rlaU6xiim9V9OR450foQ2uDe3mplUm5QTE+P6VNoTkp/Qj6FeMUtyhGpdsLBme5R
         /RED+1czBtC7mh5GPff8T8s3rUdH56dDtwmbjhhcxz9TbLPnbHR6Wl2TMoc3pVa2W7gb
         dQLEVnE/Is76Mb97uot4FfkvqQVfb8oW8yOuGVXdnicbQ9NK1GrTsQc3+LyFpvWv7ywD
         tZ6WLALQlDRl2HfRklhMjFpfZiFvSlA46H65w7G1mCmCsJ/Knuf0OPsonR8G8GwGQcG9
         5FIx1IAwZNWHelZz81tS2ZJXEa7PHtLm2LA9XrxztM5UD+9o4Z1B9bDDv/aZvzf12PQB
         0m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939369; x=1712544169;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPKH7LjFteyraTs0dKzXgUFuYFhKTHT6MpiaC9lP+VQ=;
        b=EAN1bEV5ecrorJDjxXsXXN1QdH56EXgk5AgDJhIfG/FCx+NUtAySeI0WaNEcb3CWM8
         omSxGIUpCfm0WoSYBC2fFGlZKpXXZh0o4fFmhiOJ1mbfbvQyglHA1kLCClVRc7S9GOYM
         HACYFfFWCM2b2nIgqF55BcU2jHrg8bJRgwPOKdywG5RpzJdZoH4+hcm3doJt5z7L+q+g
         VPHMX8uOjkZEgLHtn8/4HrYN37cn2LvmqDHTXsKCTBauV7K2Ja7lJsGL1DUSwLEv0t2b
         hJO+mt3tTUyrovNALC5XEy5UePclreUL7URtoV9aZXJLGsvbZcekLzN30KXTe21zNHvT
         HbEQ==
X-Gm-Message-State: AOJu0Ywp1DHlkhJMIJFu/dncu/YVWvaVRSLeBVmPcSy4m22PQm/Z2JJK
	2nk9IkzheTwE2KmfxVy4BmU8iFHSrr/xw8KhRBGBt+S1hAZYF8trb2Cf/EUCPQs=
X-Google-Smtp-Source: AGHT+IF+g2YmcfaU9qNH8wEnw2WJ9DmCsjeYnPAvod0/4cA0kVgefHOfh5AnR6u06l5w6D3bQ42wcw==
X-Received: by 2002:ac2:5eca:0:b0:513:403c:d887 with SMTP id d10-20020ac25eca000000b00513403cd887mr5405401lfq.38.1711939368775;
        Sun, 31 Mar 2024 19:42:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 19:42:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 00/18] drm/msm: generate register header files
Date: Mon, 01 Apr 2024 05:42:30 +0300
Message-Id: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABYfCmYC/33O3YrCMBCG4VuRHG+WZCaJ1SPvQzxIJ1MbcNuSS
 KhI790oyP4U9vAbeF7mLjKnyFnsN3eRuMQcx6EO+7ER1PvhzDKGugUoMArAyi7I+esicx+niYN
 s/c4jaAocOlHRlLiL8yt4PNXdx3wd0+3VL/p5fafc31TRUsnGta0jROMCHC5x8Gn8HNNZPFsFv
 j3q1SsFqt9ScA0TGQS18vi/x+pVRxqA0ZHFlTc/PODKm+qJvOXG2G27419+WZYHyrCFhm0BAAA
 =
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6793;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=881XkyZQ9/n8GpCrKuMf96tFmrA9L9nekveexQ/+JvE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8k6FqY/QCO1u6Hp6ZKpNOY1dCaC1Hx48bpT
 4I2P1U0VBaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJAAKCRCLPIo+Aiko
 1YjHB/9f5Wyxg03b+ZQKUKwrm9Yd+EEgUYYDknUVk6SkAUW1UMPO0qjQFP142eeV/w4zanid1pG
 KBj5gwCIfHyh5G8We5Cu3SYCh5n0k7QyZi8uqeLmSdr5nWkS1ikDEmFoX25bl7rUmaKPiuLTA8w
 Y63hOrixqwjBufYfbSWxxrp4AiqBfAvEuSEuxZhitIIIfNpqGk1cJEmK1Dcr8dcxGFAFr6zu9w8
 S8cMaiD6+axnqvzt/NmUuUAjjXKRVkHMUCFkchx4Km9KbfOGVFYeYKqcs0EHtng0FJUjdvLBW4m
 lZGyo04z3LkWRwrC0ZVNGnxnWc7lcfJIr0nDD7NqfRKKkJPn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Currently display-related register headers are generated from XML files
shipped withing Mesa source tree. This is not fully optimal: it requires
multi-stage process of the changes first being landed to Mesa and only
then synced to the kernel tree.

Move original XML files to the kernel tree and generate header files
when required. Display-related XMLs are going to be dropped from the
Mesa, with the kernel becoming the primary source. Adreno-related XMLs
are still going to handled by Mesa and should be synced from Mesa to the
kernel when required. The gen_header.py script should also be synced
between Mesa and the kernel tree.

Unless there are any objections, I'd like to consider this a final
revision with the target of it being merged for 6.10. Please review.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Updated gen_header.py to include licence header (Abhinav, Akhil)
- Split the #include rework to a separate patch (Abhinav)
- Link to v4: https://lore.kernel.org/r/20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org

Changes in v4:
- Updated headers, schema and script to the latest version merged to
  Mesa
- Further split of Adreno XML / Adreno headers patches in order to pass
  through more ML filters.
- Dropped the RFC tag
- Link to v3: https://lore.kernel.org/r/20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org

Changes in v3:
- Split XML and git rm patches in hope to pass ML limitations
- Link to v2: https://lore.kernel.org/r/20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org

Changes in v2:
- Removed the _shipped files, always generating the headers (Masahiro
  Yamada)
- Replaced headergen2 with gen_headers.py
- Simplify Makefile rules, making all Adreno objects depend on Adreno
  headers and all displau objects depend on all display headers
- Also handle Adreno registers
- Link to v1: https://lore.kernel.org/r/20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org

---
Dmitry Baryshkov (18):
      drm/msm/mdp5: add writeback block bases
      drm/msm/hdmi: drop qfprom.xml.h
      drm/msm/dsi: drop mmss_cc.xml.h
      drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
      drm/msm: remove dependencies from core onto adreno headers
      drm/msm: import XML display registers database
      drm/msm: import A2xx-A4xx XML display registers database
      drm/msm: import A5xx XML display registers database
      drm/msm: import A6xx XML display registers database
      drm/msm: import gen_header.py script from Mesa
      drm/msm: generate headers on the fly
      drm/msm: drop display-related headers
      drm/msm: drop A2xx and common headers
      drm/msm: drop A3xx and A4xx headers
      drm/msm: drop A5xx header
      drm/msm: drop A6xx GMU header
      drm/msm: drop C++ parts of a6xx.xml.h
      drm/msm: drop A6xx header

 drivers/gpu/drm/msm/.gitignore                     |     1 +
 drivers/gpu/drm/msm/Makefile                       |    99 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
 .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} |    45 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 -------------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
 drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
 drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
 drivers/gpu/drm/msm/registers/.gitignore           |     4 +
 drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
 drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  4970 ++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   400 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2268 ++++
 drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
 .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
 .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
 .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
 .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
 .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
 drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
 drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
 drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
 .../gpu/drm/msm/registers/display/mdp_common.xml   |    90 +
 drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
 drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
 .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
 drivers/gpu/drm/msm/registers/gen_header.py        |   961 ++
 drivers/gpu/drm/msm/registers/rules-fd.xsd         |   404 +
 57 files changed, 22435 insertions(+), 39792 deletions(-)
---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240225-fd-xml-shipped-ba9a321cdedf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


