Return-Path: <linux-kbuild+bounces-1426-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D07CA893722
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 04:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84E7928161E
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 02:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF40D443D;
	Mon,  1 Apr 2024 02:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVokvBFa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2601FAA
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Apr 2024 02:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939374; cv=none; b=pp32+uNnc8s++eNHq7uwLyPU832DWbZq2H7rAMfbpJX8dCDB/xWZMXHktMfzsPRVYE6OCP/aVXeXObzHUUTYRisMNm4CaziHEfkL8gIuJq4iKNcIUK2T7YZekyarwGbV3WCNsv8Xb+vlw3jeH0DGJ5EbObboyUakbKPMURNJKO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939374; c=relaxed/simple;
	bh=ytSJz6AhN6FbeOhHq/vgke5SMH6v8kgj2BIO88lHfSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=keHWDfjq/6xzTqWuQpF2mCDRRRu4JV2ruT9ZlggcVZHPMRcI9EVcyT+gLxwgDtVJI5MbqiElyB3EF7ZCgeRil8x5syRXz4c6noGM0XL924zwarBOUq8LUjkxFjj3Hqtm3nL4948nzeoFghrA2iTC4QaDvdB91TAn/kwZacNy0yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVokvBFa; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-515d55aaf5aso1149098e87.3
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Mar 2024 19:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711939371; x=1712544171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBZPTVUNM5ptvyED09fYqwGN0UVbfI1rBIpraMYpmcA=;
        b=CVokvBFakhN/UOWy1dYx0vtKM2V/iWISDVUHB03w+ZQAgnICTZ6RMA8llNnjAwlc0g
         TwpgyVuiBNJefpENISx4V95af9Y9BcE0YXLF6jdAr5V7Wq8Abr9P8pcS0zXkAtZF+uro
         45aprtCOp8Zvj3LNjUd9htuErXfAXzShwRnpxAr7wM5F5Y0hAGT15S8VamsSXt+tHGD2
         M6q9pknGYf9wi4djw3D1SvXqOGSzo62g6cR8JI+4JHr0yjQx8xpHtXoQAFscO+mAHBWQ
         CVA5rDJJcp2Z23N3nk/UFYDFbyRULmMeUSJBG8W89rGH8cL6LFWwwEte8dQFhHZg8W/h
         YO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939371; x=1712544171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBZPTVUNM5ptvyED09fYqwGN0UVbfI1rBIpraMYpmcA=;
        b=CPWn/SzLFaoFjaVaCfi9+5zJKWPSSw2xt+hXbEPuFbeIxgzat8O04oe7REZdjkCc+8
         HSkzRYaROFRqY/IAAIS5FP+5WFoNPXRbjIzHSZXoOvpHNdP23MNFSnpBHJ+hYdMtuqyz
         6Bzvr6FYg1oRoAbXNKdAq/qEY310w2jHlzWhEhNO0ieCydcP0scTZVH7Dffkr3YHlB5C
         65slybY1lv1xWRcYaC96j+lb/AwCghe46nEt+L+y4xxZtLw1sB6Nf3bnD7fy2i2ZXUT7
         dcoR1m2GmxhDXDi9yUUDlkrU35pnz20hZQ8F/E4KmjAG611xr6XQAmHpmUqHPJXgKSkF
         Ln9w==
X-Gm-Message-State: AOJu0YxdTYC9OK2m1gtphEFf5RXoQPyytX6mIpUbkhkVJVLmlHvoFrgQ
	ugd38PB/WrPUEHq4LCIE0/BjupActoX4Gl21MsOlx8/xvmy2ZYf0rYvP7hz6EPk=
X-Google-Smtp-Source: AGHT+IFGmTkIQGxtyVsSp45jgKogdD6qRDnbUYxQVlyK07eHyDo9m/vwx7CZ1n7FWXxVOFCyQgizkA==
X-Received: by 2002:ac2:465e:0:b0:515:d100:1650 with SMTP id s30-20020ac2465e000000b00515d1001650mr5155841lfo.57.1711939371035;
        Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 19:42:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:33 +0300
Subject: [PATCH v5 03/18] drm/msm/dsi: drop mmss_cc.xml.h
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-3-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ytSJz6AhN6FbeOhHq/vgke5SMH6v8kgj2BIO88lHfSQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8kriaJmlaj4TnfxieOeadz1/gzl1aUfn08l
 nKSDw1FI3iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJAAKCRCLPIo+Aiko
 1QH6B/4lqyKplzuVpF0+8hbLeoXmHLiRWKH9Mqi0oiTjkS6N58Kvk9hEyxs7FgTk7xviKYceREQ
 pG+HgUoSec+Gh4OwMouTZQIVezeKvrIVRd5MRwcXxMIRrWW4Qz6OIbFUWJOECj0ODseHX2fN83t
 pp7z0Dg/M4i4ljPn0YVvDdxCZ5K29z4FQGvc6Ds75oYpveGK/noroQ+an2OpM6av7p7R81GTJ6E
 1H0v8Dp3rRnUwR5RERQwbSLq50yAxrsorKANCt+Xb5jRyM2El5YhKWPGP3GgugVwEtvEaIWp1AE
 DXKmXmgxabxJOpcprRUo5uXkXnr8zMLnlAPLdRfkzInqX+dr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The mmss_cc.xml.h file describes bits of the MMSS clock controller on
APQ8064 / MSM8960 platforms. They are not used by the driver and do not
belong to the DRM MSM driver. Drop the file.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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


