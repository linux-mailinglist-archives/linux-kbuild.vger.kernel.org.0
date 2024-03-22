Return-Path: <linux-kbuild+bounces-1281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F78874FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 23:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BA9A1C22C6D
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 22:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE46C82890;
	Fri, 22 Mar 2024 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8rEuZXP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874E82881
	for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2024 22:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711148222; cv=none; b=Tk7qc0dFgkancs14/1/1Q3sz7y/ZRZV4remTxEv7DrDj2o3g7YmTHBNe4DDTBu24Byj5uIUAdQdDxcX64q+0wruBWc3lOjPoYJQHk9mRXVxA6CmHUvACxT7o7skKLZpdqwW0/FRFXlozh2RefIjN3WT4ozsKXgfbrhgWlETfeuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711148222; c=relaxed/simple;
	bh=SUasj9x+5boQXrGjbbvWEUUrFe45KHm8dnD84tTBZlM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SszBcT4cSXZ9Bz9Px6tugqoAbAYmtVizgtnX24UNSC3hG6gePEWoJZhjZwau7i0n8ekqJjxB22wXSBc9RLUeVApO/DB0Z6yqn/uokyMteZptfyVYf6/40ANkLouYcNEc+/E4q/cvXWcsgoKxYksGZipXdneCjQCStsfBcX1CXl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8rEuZXP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513d23be0b6so3139992e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2024 15:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711148219; x=1711753019; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfjVwt6d+IRd8DOInllyNHPrf4pjD9asCpY8CF5unc4=;
        b=z8rEuZXP4gz+GYdPqUTdVLZXBIYdewM9HGW7mQ7vApMw+bp88JIqOtRSsD+B5RycoS
         J3eJ4UhR6VoXyyE3Wb81w4fzlL+dvIKPT2SkogtEWJ1i1LS/b6mkUR/LGlQ4mcCYW3YT
         a4L4hXR2ijwjXOJ1t8EfekrmWYLemb4Iu/YJzXZyAcivTk9VHJIVHSgNChv48v7mGIUl
         7/XKJ87CMOF/RwAmzPVVn721bfmeKrSIOuMHZb7WQJk9nFmYkcXQGmzsEukQN9F0QukH
         Bn4UeB/lOR7fvs65Wab79Wo8KLZXFnOyJ+lHMXwyuYKpk67RGpgeicE3loQtfxQ0UU1O
         6M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711148219; x=1711753019;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfjVwt6d+IRd8DOInllyNHPrf4pjD9asCpY8CF5unc4=;
        b=oHFMch1aYMpnXxruFzVwj5hgyrr2a8eMZNQasrvSLA4YtC5pzgQSC2WOZahRAcuBU5
         /M3iCUMOApxm29UKAKn8+WQskC+SfO5IsHAJKz7njDW6gooKOzPP5zjR3AAyH6WsZVuY
         oRbl2AC3wFHQyQLhiss2mZiZoawScL2wftIPvSXVCSGKJVdWzOLAEkz/vanm9QbowgP+
         c0XgreOu5HEWb09a4cBpqSVbAXYDhLSTlQri98Vptob0aR3LKX//fPr7SlV+81R/cYCU
         brMnkvh3hnpeDUeX3bugL46BcCyLDUBbT8yYTLz79sKdIe0iJOnRN//mHowqpQM6ChTN
         BNvQ==
X-Gm-Message-State: AOJu0YyWaQ4FeRL17FgB840LYQnwzVGyDj4TYn8lZuvWV/RrhIkwchdX
	cB1AmylkNxXE2fb6sn8cU3yu6RVwLNy9qkkcKZLWmQzYbqcS9BobAHCUkYYK9bU=
X-Google-Smtp-Source: AGHT+IFHVlDi96VVX9QQGQSp36xeTVVK2YAOFfU9flowpUO64lBi5C0OuNMJrS/SE1YaXbH3CXQNLg==
X-Received: by 2002:a05:6512:32a3:b0:512:f657:122d with SMTP id q3-20020a05651232a300b00512f657122dmr586259lfe.12.1711148218316;
        Fri, 22 Mar 2024 15:56:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 15:56:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/16] drm/msm: generate register header files
Date: Sat, 23 Mar 2024 00:56:52 +0200
Message-Id: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQM/mUC/33O0QqCMBTG8VeJXbfYztFlXfUe0YVuRx2Yky2GI
 b57U4goocvvwO/PmVggbymw825inqIN1vVpZPsd023ZN8StSZuBgEwA5Lw2fLx3PLR2GMjwqjy
 VCFIbMjVLaPBU23ENXm9ptzY8nH+u/SiX6zulflNRcsELVVVKI2bKwKWzfendwfmGLa0IH49y8
 0qE5I/aqIK0zhDExuN/j8mLWksAQqVz/PLzPL8A0skSuS0BAAA=
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6362;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SUasj9x+5boQXrGjbbvWEUUrFe45KHm8dnD84tTBZlM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/gy1GAeGsSVMy2dItc8Eim/HYejhaCYx4nzxi
 6x2n0RnrtGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf4MtQAKCRCLPIo+Aiko
 1RouB/0RA0EXl8cWAvvhz4VFY1azOhyepALjUsAfJ+HobFciLte50m06U+7me+dFHP9WN6ry1zx
 mn9I4DasJ0PZ58Q/Td8thBaDEY2/cyQWTZ57tk+zNEHTieUQMstkzZWvKl1X48h7uJ5waNI3cmn
 Lziqtd2tgGqENF8TirzbiznPDeATIliXcuT6minaEbnwh3FvWSQdYE61Tyc7Q8TgI9h4oUcoaxN
 F4HmPtkmAbQiWhCoSaAE7zi7wrYXlnpGai9caKSr7CiU/rZerbdjNkc6tFIyEtxWpZIjS7lWGAn
 Tc84BNWJwSn8frUVT0U9n+F5x6CSpng7jUd5iLNgnJQ3oF6i
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
kernel when required.

Unless there are any objections, I'd like to consider this a final
revision with the target of it being merged for 6.10. Please review.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
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
Dmitry Baryshkov (16):
      drm/msm/mdp5: add writeback block bases
      drm/msm/hdmi: drop qfprom.xml.h
      drm/msm/dsi: drop mmss_cc.xml.h
      drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
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
      drm/msm: drop A6xx headers

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
 drivers/gpu/drm/msm/registers/gen_header.py        |   957 ++
 drivers/gpu/drm/msm/registers/rules-fd.xsd         |   404 +
 57 files changed, 22431 insertions(+), 39792 deletions(-)
---
base-commit: 226d3c72fcde130a99d760895ebdd20e78e02cb5
change-id: 20240225-fd-xml-shipped-ba9a321cdedf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


