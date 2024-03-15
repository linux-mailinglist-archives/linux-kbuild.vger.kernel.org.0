Return-Path: <linux-kbuild+bounces-1245-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C38D987CCAA
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 12:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 399A01F22087
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 11:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3514B19BCA;
	Fri, 15 Mar 2024 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eIIACkX5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E29D1BC4D
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710503192; cv=none; b=Z95za7MNywK9h+D+yQG2eZDx4oCN4YNGnu1SjzGZObPs+xqkUnheXVOuJJi/KSc/oZx8jVdSVbjnWOztHG4hciWPuzjWhZTctndAWhhH0eSNUfzvxaOaISaKrDYqIi7kBxCUiXcw1iZ0ZQgzMcGuIPwEJlXlEE2MjWhzBX8f4hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710503192; c=relaxed/simple;
	bh=9bSTjD6AablTExbFVQTQerY0tTFpkWHBp91hc5H4cUI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l1jX7e70yaloJuRpLQ14gXYfwDCNPJtGrzdoU8ZSiDWvuOcDNzZaBWOQlkPYm93EfYBM9dFsMPNvDWDY8twbvzR5i1j/sDmTjAHrjeY34kleBqQ4CthRc77tyu7ucakj1kaEQ8EJfL/YDjMF1Qa6sbt3jmcKfiyJVJxIuIIuKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eIIACkX5; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51320ca689aso2272304e87.2
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710503188; x=1711107988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxuX+Ti8fZn5m/f6VGuBCXk/rLdBCegJSuZBjwwF710=;
        b=eIIACkX5gFDZdiP8hXym9mohQpTVCT0z2SL69bt6ujOQ65mLqssAnMWJby5TmcqYXS
         ROmtqyvl9QoPJm7Yj8QVWYisCA5u0FjhIB6X7LN5AXAhE8QUuLAIbX0gQReHVsq6PxVV
         U5mM4O+/cIX5dLpbc1pcSE2pzNPXq2aXwnGR8F793dZ1vvjBrt/f8HmuocazukfNagID
         1+9Qu1Fae/RKwad/x0IqpTnx7+FHsfBZt1OTDaosJHcCCrVJ2KB1/o37LVuscJC15bcu
         A+ig5TuFNyBOQSVM+uvydUq9+GPoypv3FZKCPJRntIZqL8MqiXoye34uzVbEmsqxJjvC
         84Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710503188; x=1711107988;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxuX+Ti8fZn5m/f6VGuBCXk/rLdBCegJSuZBjwwF710=;
        b=RxIHM9IdVz1n3r69xDsNY0iY6b8j4XEvII8w4HdsAx69r45nNNRe3cBOvU9AiMSwoX
         biHcb6WoDJpJClIXch3g2otXJLn70XrrQasRtuj+T7Omd0yu8WSb7rgdJH7Ai0rsrNA5
         9Rvlw1aYDj+K+IfMWEbBsvuyd3jhkobIIF0WH8eMkqiOLkbS73pEJqjqXJhvvF7CcoYa
         VWoj7HRGlWhPwmnUnQKsTug0HaivagkkDfYCHf4ZBvFXDqblFQM+jQgQYGQVFLzdcHwn
         WUu90DWON0YSbbFPTyaSW8DX6ksW+WNRH+5FO2vKjO9K0D2+NBvEQQvpm6C1SurGURIq
         6q2A==
X-Gm-Message-State: AOJu0YwLnXYTaOZX8Amy6tq2lEM1IP/BqgYnck1WvByUgaNLYPccMC2W
	kCaWXlCVsUAxmmCwdLublogzFMRHMmD98qw8Vv1jpGwr+F1DmW2agkpjwnrFiRg=
X-Google-Smtp-Source: AGHT+IG9loNuyVc8//m6ic0j8Svp2nfhDtNubUz8f7QGRIjouieDxv551LYQkLnlsit4nPLk8OzCpQ==
X-Received: by 2002:ac2:4902:0:b0:513:ba9b:80ea with SMTP id n2-20020ac24902000000b00513ba9b80eamr1897125lfi.63.1710503188171;
        Fri, 15 Mar 2024 04:46:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l17-20020ac24a91000000b00513b024b232sm619987lfp.10.2024.03.15.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:46:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v3 00/12] drm/msm: generate register header files
Date: Fri, 15 Mar 2024 13:46:22 +0200
Message-Id: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA419GUC/2WOQQrCMBBFryJZG0knNVZXguAB3IqLNJm2A7Upi
 YRK6d0NQRB1+efz3vyZBfSEgR1WM/MYKZAbUpDrFTOdHlrkZFNmIKAUAFveWD7dex46Gke0vNZ
 7LaEwFm3DEjR6bGjKwiu7nE/slo4dhYfzz/wkFrl6+9SvLxZc8ErVtTJSlsrCsadBe7dxvs2uC
 B9eFn97IiR+Z6yq0JhSgvjil2V5AdjevhryAAAA
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5696;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9bSTjD6AablTExbFVQTQerY0tTFpkWHBp91hc5H4cUI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl9DUQ1vnb905j4UscY4QZmZYGeF6jFRsUj0dRE
 RZHB73ol7GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfQ1EAAKCRCLPIo+Aiko
 1UYhCAClgd8Y5INWbu6fvY7IYqDegE8lnXbaciORcH7QIUzQM0yn8mW3EJ1XG/hwCGvvsfH68H+
 GnVaIds3A6UjmImexoUoNOqK+yOfyt8347G1R5nim7gNZTC3IbRiobW1rIbegYp308TWXqUMBZX
 rjBQEa3OG+AZsMC6yZlKQONDH6c6uhBOkbyL5S6LBEA34K5P8XXgtWhfWAIrsM4vMxotWUzf0fN
 9heRihYI9GIe647vpWdv2wCRK7CXpb+mqIJFOWBNxtrbIwng2Fq3VjQIq6yCQhyZCbiyvb2/tmf
 DgbGhhfBfYiaNYYMibJxt0Yx9GRPIpl8JZNN8VjP3lL2Adea
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Currently display-related register headers are generated from XML files
shipped withing Mesa source tree. This is not fully optimal: it requires
multi-stage process of the changes first being landed to Mesa and only
then synced to the kernel tree.

Move original XML files to the kernel tree and generate header files
when required.

NOTE: the gen_header.py script is based on the non-merged Mesa MR [1].
Once that MR lands, I will update the script and commit messages and
send the next iteration.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28193

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
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
Dmitry Baryshkov (12):
      drm/msm/mdp5: add writeback block bases
      drm/msm/hdmi: drop qfprom.xml.h
      drm/msm/dsi: drop mmss_cc.xml.h
      drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
      drm/msm: import XML display registers database
      drm/msm: import A2xx-A4xx XML display registers database
      drm/msm: import A5xx-A7xx XML display registers database
      drm/msm: import gen_header.py script from Mesa
      drm/msm: generate headers on the fly
      drm/msm: drop display-related headers
      drm/msm: drop A5xx, A6xx headers
      drm/msm: drop A2xx-A4xx headers

 drivers/gpu/drm/msm/.gitignore                     |     6 +
 drivers/gpu/drm/msm/Makefile                       |    97 +-
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
 drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
 drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  4969 ++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   399 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2267 ++++
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
 .../gpu/drm/msm/registers/display/mdp_common.xml   |    89 +
 drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
 drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
 .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
 drivers/gpu/drm/msm/registers/gen_header.py        |   958 ++
 drivers/gpu/drm/msm/registers/rules-ng.xsd         |   457 +
 56 files changed, 22480 insertions(+), 39792 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240225-fd-xml-shipped-ba9a321cdedf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


