Return-Path: <linux-kbuild+bounces-1248-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D4587CCB3
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 12:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 301791F216E4
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 11:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569441BC5B;
	Fri, 15 Mar 2024 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LH6oeSl6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343401BDEB
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710503195; cv=none; b=AMkBAM0Uhkx2AGkO/9PMlxL3FXnuqBfgHTzE0/ZxCmV37mj9OYx7mNTRRD4XBznLCvSIjnuyh/iZPxq9m9CjUT5t/ZJPXNmMLvy6FmTYQdYr5GGqqXr1bVlBXmfzau7AU1FlZNa5kzhYWHgpmB1m3cfbTTuFtS8FTA6tYgnwtKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710503195; c=relaxed/simple;
	bh=gqKp1S6/zn30s6BNuSQoNE5FrMLSKTVvFXbaJQz/Q24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aftTjb32nozIbzgea6nPE60W9JYhf0MNEa5FY9cQmQ3MiMb2Of56OdySaZQwGKJ6P9okx3EKduAQtNf9b/nZYDD7XOHsvvjt0jbT7TkTVAk6eXPePQ/MkWlaYv6yczQVHmRg6xMNoC0OC6F5AnEn2FcEwUbgZ1kgzBtHZXYKJuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LH6oeSl6; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513d9176cf9so686579e87.1
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710503191; x=1711107991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbFUU4iMew5gCyNhy6Z/kEtYbNuf40upf3sZEP5LUHU=;
        b=LH6oeSl6ZdVuwQAg84kDJoR1OGuPeVfKHKNChe8m5Lj3iUAoDwbIoeH7XR4bu+uVTh
         nxgCB9PScQsMlcULENSRAPYMCa3AJYNEFoRVmUpV0b5WQTBFcRtNikzBG6RRgXxyk6UD
         JTd2mMKgV5dRYxSz0kt6B1VP2jEjJRNqT9Jhq0JwMoJdrAvPe+2CphI5tYN/BTkLRtO6
         igPe67/SkI5jOy2eb38wb52H0lTmn+Y1F/tC4tnvUw7HOaGdX8QWvijDof5s/zAZvTLO
         PZS/NMmTxAGCQwc1M7NZ9mrhcgUsirT106e2E+gODif+OBWa379UsIQYQPNEHEqT2a/B
         Lndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710503191; x=1711107991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbFUU4iMew5gCyNhy6Z/kEtYbNuf40upf3sZEP5LUHU=;
        b=VccGsYf4pqq6s3H2hx01U8PM983Cfsg0qdLH05wP53BqzG87w8BXasBRzI1FTeA0Lc
         1WVo7zrMMahCu0jUjObSLGVklfXZc/o9QbtEL3fm5KLm1U0+wz+qceKL4q3/DhFnGrEk
         fxmeWKUDZYahF+pC3KyxR3SItB26JzP2wahDF+VgQU4jrRGP0YdRuWILyQAi18GC965J
         CtaqKc8sFZRQ7A3FL2bNDb+ye7SPrFPH18F97NaZ/lWr/8RJfQPuT/fGZgo0Oq49JoRD
         CW3ybotG6NE14xiBWw5cZC7NMisDSU1B/n2LhucYFW9X1Li2iyXnN0RJTf/Ljh7BN8ic
         aPoQ==
X-Gm-Message-State: AOJu0YybCumidhXeYGJE46XMMOAvLSuP5xge8LZ+G5vlbaaclQ7xC7sH
	dFZ8/oeeLXW2O37cp41EAV4xW1KdV6f83+6+UNDkJaZWnlfUp0I2ezK6TbMnm7U=
X-Google-Smtp-Source: AGHT+IEra5GU+8/AOetmK7nxauvnJXf86OMdZiW6kboqGK50veynyAiu1151wcCi1PSc6+ipWlNlCQ==
X-Received: by 2002:a19:a412:0:b0:513:c2aa:6b87 with SMTP id q18-20020a19a412000000b00513c2aa6b87mr2009115lfc.39.1710503191335;
        Fri, 15 Mar 2024 04:46:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l17-20020ac24a91000000b00513b024b232sm619987lfp.10.2024.03.15.04.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:46:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 13:46:25 +0200
Subject: [PATCH RFC v3 03/12] drm/msm/dsi: drop mmss_cc.xml.h
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v3-3-0fc122e36c53@linaro.org>
References: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7249;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gqKp1S6/zn30s6BNuSQoNE5FrMLSKTVvFXbaJQz/Q24=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl9DUQwXRuuCJ9SGGqhEoiK2ohvVDMgtgdXwHCR
 UJ9D+RVRqCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfQ1EAAKCRCLPIo+Aiko
 1VATB/0aasCxWsyUKnPePlKkzVlVFQP3BtA8urkXlcHA6cb01HV+54ZrdjkYzl/neX8Qh2LkAqj
 CKFeTrp9ihCRaa5mzpS7A27P29bQDux/cTxBhuA4N1m9OxubiZo09pdyF0bkftMzoo/NYnkOFYf
 FgrwCTA58jvDGsiFgbQKPV17O6Qe1/AY7u9oVXeeA1ofgq3f+/uwtmd1mlxxLxTTQbP29PlRTqH
 GitXrhXYv6GPPgR5FuqylXGRPpq8SarTCmffy1e6EASQKFYAAAWWKqyT2w7qbQJSrkuCcPm1+I+
 3eXNGIDzn28FFISaBp8gG8PRXnWbxvB46XDMkQ4YOHhpB5GN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mmss_cc.xml.h file describes bits of the MMSS clock controller on
APQ8064 / MSM8960 platforms. They are not used by the driver and do not
belong to the DRM MSM driver. Drop the file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h | 131 ----------------------------------
 1 file changed, 131 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h b/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
deleted file mode 100644
index 7062f7164216..000000000000
--- a/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
+++ /dev/null
@@ -1,131 +0,0 @@
-#ifndef MMSS_CC_XML
-#define MMSS_CC_XML
-
-/* Autogenerated file, DO NOT EDIT manually!
-
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
-
-The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
-
-Permission is hereby granted, free of charge, to any person obtaining
-a copy of this software and associated documentation files (the
-"Software"), to deal in the Software without restriction, including
-without limitation the rights to use, copy, modify, merge, publish,
-distribute, sublicense, and/or sell copies of the Software, and to
-permit persons to whom the Software is furnished to do so, subject to
-the following conditions:
-
-The above copyright notice and this permission notice (including the
-next paragraph) shall be included in all copies or substantial
-portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-*/
-
-
-enum mmss_cc_clk {
-	CLK = 0,
-	PCLK = 1,
-};
-
-#define REG_MMSS_CC_AHB						0x00000008
-
-static inline uint32_t __offset_CLK(enum mmss_cc_clk idx)
-{
-	switch (idx) {
-		case CLK: return 0x0000004c;
-		case PCLK: return 0x00000130;
-		default: return INVALID_IDX(idx);
-	}
-}
-static inline uint32_t REG_MMSS_CC_CLK(enum mmss_cc_clk i0) { return 0x00000000 + __offset_CLK(i0); }
-
-static inline uint32_t REG_MMSS_CC_CLK_CC(enum mmss_cc_clk i0) { return 0x00000000 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_CC_CLK_EN					0x00000001
-#define MMSS_CC_CLK_CC_ROOT_EN					0x00000004
-#define MMSS_CC_CLK_CC_MND_EN					0x00000020
-#define MMSS_CC_CLK_CC_MND_MODE__MASK				0x000000c0
-#define MMSS_CC_CLK_CC_MND_MODE__SHIFT				6
-static inline uint32_t MMSS_CC_CLK_CC_MND_MODE(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_CC_MND_MODE__SHIFT) & MMSS_CC_CLK_CC_MND_MODE__MASK;
-}
-#define MMSS_CC_CLK_CC_PMXO_SEL__MASK				0x00000300
-#define MMSS_CC_CLK_CC_PMXO_SEL__SHIFT				8
-static inline uint32_t MMSS_CC_CLK_CC_PMXO_SEL(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_CC_PMXO_SEL__SHIFT) & MMSS_CC_CLK_CC_PMXO_SEL__MASK;
-}
-
-static inline uint32_t REG_MMSS_CC_CLK_MD(enum mmss_cc_clk i0) { return 0x00000004 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_MD_D__MASK					0x000000ff
-#define MMSS_CC_CLK_MD_D__SHIFT					0
-static inline uint32_t MMSS_CC_CLK_MD_D(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_MD_D__SHIFT) & MMSS_CC_CLK_MD_D__MASK;
-}
-#define MMSS_CC_CLK_MD_M__MASK					0x0000ff00
-#define MMSS_CC_CLK_MD_M__SHIFT					8
-static inline uint32_t MMSS_CC_CLK_MD_M(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_MD_M__SHIFT) & MMSS_CC_CLK_MD_M__MASK;
-}
-
-static inline uint32_t REG_MMSS_CC_CLK_NS(enum mmss_cc_clk i0) { return 0x00000008 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_NS_SRC__MASK				0x0000000f
-#define MMSS_CC_CLK_NS_SRC__SHIFT				0
-static inline uint32_t MMSS_CC_CLK_NS_SRC(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_SRC__SHIFT) & MMSS_CC_CLK_NS_SRC__MASK;
-}
-#define MMSS_CC_CLK_NS_PRE_DIV_FUNC__MASK			0x00fff000
-#define MMSS_CC_CLK_NS_PRE_DIV_FUNC__SHIFT			12
-static inline uint32_t MMSS_CC_CLK_NS_PRE_DIV_FUNC(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_PRE_DIV_FUNC__SHIFT) & MMSS_CC_CLK_NS_PRE_DIV_FUNC__MASK;
-}
-#define MMSS_CC_CLK_NS_VAL__MASK				0xff000000
-#define MMSS_CC_CLK_NS_VAL__SHIFT				24
-static inline uint32_t MMSS_CC_CLK_NS_VAL(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_VAL__SHIFT) & MMSS_CC_CLK_NS_VAL__MASK;
-}
-
-#define REG_MMSS_CC_DSI2_PIXEL_CC				0x00000094
-
-#define REG_MMSS_CC_DSI2_PIXEL_NS				0x000000e4
-
-#define REG_MMSS_CC_DSI2_PIXEL_CC2				0x00000264
-
-
-#endif /* MMSS_CC_XML */

-- 
2.39.2


