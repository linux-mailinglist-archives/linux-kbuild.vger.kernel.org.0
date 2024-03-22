Return-Path: <linux-kbuild+bounces-1289-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B3F887528
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 23:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9571F24501
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 22:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B653C82C9B;
	Fri, 22 Mar 2024 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LME3k3MG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725198289C
	for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2024 22:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711148239; cv=none; b=qoaGcoMq4/j9M7/+vhix3RNeGLzyzL0ww67mMAdVntP6CgTwZi7dF3ICsnwe8prrkvMkjKlnDrCGBuxB/QCn6O5NeqIhoQ0HPzllg+9pXFbs2bdzOhPOKkCEvGux4rRHGnv24sNlGKtYXrtkTWJ9oEFxyeZs0GZ1fOMxuADf09U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711148239; c=relaxed/simple;
	bh=tk6RW7wvvTdnkY3wljio1r8oaKO2sVcSbxMNG/1qG+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6wsPN6GBLEvU+rrf0mOMI5lNN1wk0rSkydW7PYOR6VaEc3s+c1d5ZE1xUsUJ2+WHIAfrPYtztU7b37VN4qqJvCXMc1Z5Ixj8csj3m/zFybdBAyKxe/iCyJaxH09Ptr5F1In0qx5SQOLlwH0WWRqjX3Afmm99cuGCets/VVaUZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LME3k3MG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-513d212f818so3118879e87.2
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2024 15:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711148233; x=1711753033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiKHoC9W/yjs4rNgTi54ExLCR/jY6XELAFEtJK3SrSw=;
        b=LME3k3MGRkjmz+yfnFvSrIF/wRQbilRA2yf8c5xAFgWnw086/xqT5U2OR/RGOezsUR
         PNBx271e8Va9AOOCDk52It6rtFzLRlcOoJNjZp0SWe/oeemWKJS7VWhWWABLcilmcdrE
         xSGBaW0KekMP6jLQgOd7N9GXD4Gb5tlAUpOHCBqFIpygCh2p7V52FjdUd/C3yDYLxgyk
         DhTRG/UJgm7uxcKp5cNj0dlioNTgyhKn3NO9XoNn/zvVYL8IEDEqVoGwSsbpk70hnS+A
         /uk+SS2JFLCcv0grKGSGHW9nLjL0/Fb6akoGEjasHbCM7Gn8aSLLXH9gC6gYoTkNIQfx
         Z2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711148233; x=1711753033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiKHoC9W/yjs4rNgTi54ExLCR/jY6XELAFEtJK3SrSw=;
        b=qxtcrA1ud3dVMZhYBp86NmZFIEWdtVgOWUsB8fP1QK3K3Y0na5ZR7Qrx3hQmjSiYYS
         1yPS4UOks+lUdNwf+Vcj21UtRKAozYFaDBLKo7TIzz0iVoYZ8uUYce93Dhoe0FLpQ7g5
         5ABd+OCv2a6ElP1p+QQr/xZOGY+Cg+2uhvvwpRVP5gP582YVT3E4ifYi/T81kD0KnEhT
         3BihHhTG9ZgONdPqG5GTHd6IJJkvgsySTOGygclSclTeIsC0I1O5h1GkKwTpXWs29AuQ
         pgCF4Q+xLZZiQkNumkNtH5TTGRw43BhG4kVTy2qBKAUCVr58Qxao8lXDU0RrKoHKUn5t
         urHw==
X-Gm-Message-State: AOJu0YyJmhwuEPA1BUAF6dpqzlw0MYo32mKcP5w0I/TTi4YsGZPNUsW/
	+GH8ebne/5EDilz3BYndzZM/LOTRgRa37lqiOHwidK+KXlcQVOJSf0JJhTH2Ee8=
X-Google-Smtp-Source: AGHT+IHFe0fZBNItIPY2KEhFD2HE+vHm1Zh9i1vgcwvPMtS20UW4rwhqx8JIXdexyuLfC+IQhPfzNA==
X-Received: by 2002:a05:6512:310c:b0:513:d246:6e65 with SMTP id n12-20020a056512310c00b00513d2466e65mr451054lfb.50.1711148233509;
        Fri, 22 Mar 2024 15:57:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 15:57:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:57:07 +0200
Subject: [PATCH v4 15/16] drm/msm: drop A6xx GMU header
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-15-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15918;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tk6RW7wvvTdnkY3wljio1r8oaKO2sVcSbxMNG/1qG+8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/gy4m5d1QnzbiGkI11KNFJ64R8gKpeqyXAGWu
 Fay834RuueJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf4MuAAKCRCLPIo+Aiko
 1YYVB/9G9uh5KXGK8ZkX0+Ecyfg+ATGIo1qp71jibk5zJqJFj7qmBYIOdUwy2BPpQrD4jmNIB5K
 5nspex4tHqqhkHRhVAck8pUGJT/h8FmLvSJQICLl8Md75k+R3HUfUTd2h1Jd/6Bd8A+0YFSMbzw
 zYOfHvuPpu9w0af3ucBEshkcIP4doiCZ+q7GpAuaNdI9eChvSdrDjUOkHn7dEKvgYhU4//GiUqJ
 tmcrPVAruOCMYV12gxsbY62DMYXdxWBdPmTwiLal+O6DDwkFuXJSxG9Q47aYjPZlKZgyCYi8lLA
 cDQ7ciQSrcYOwcz9qnp1GNdssHn8X8T8Zfm1XAwApLpjrrEK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as the headers are generated during the build step, drop
pre-generated copies of the Adreno A6xx GMU header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 422 ------------------------------
 1 file changed, 422 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
deleted file mode 100644
index 9d7f93929367..000000000000
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ /dev/null
@@ -1,422 +0,0 @@
-#ifndef A6XX_GMU_XML
-#define A6XX_GMU_XML
-
-/* Autogenerated file, DO NOT EDIT manually!
-
-This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
-http://gitlab.freedesktop.org/mesa/mesa/
-git clone https://gitlab.freedesktop.org/mesa/mesa.git
-
-The rules-ng-ng source files this header was generated from are:
-
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx_gmu.xml      (  11820 bytes, from Fri Jun  2 14:59:26 2023)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml  (   1572 bytes, from Fri Jun  2 14:59:26 2023)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
-
-Copyright (C) 2013-2024 by the following authors:
-- Rob Clark <robdclark@gmail.com> Rob Clark
-- Ilia Mirkin <imirkin@alum.mit.edu> Ilia Mirkin
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
-
-*/
-
-#ifdef __KERNEL__
-#include <linux/bug.h>
-#define assert(x) BUG_ON(!(x))
-#else
-#include <assert.h>
-#endif
-
-#ifdef __cplusplus
-#define __struct_cast(X)
-#else
-#define __struct_cast(X) (struct X)
-#endif
-
-#define A6XX_GMU_GPU_IDLE_STATUS_BUSY_IGN_AHB			0x00800000
-#define A6XX_GMU_GPU_IDLE_STATUS_CX_GX_CPU_BUSY_IGN_AHB		0x40000000
-
-#define A6XX_GMU_OOB_BOOT_SLUMBER_SET_MASK			0x00400000
-#define A6XX_GMU_OOB_BOOT_SLUMBER_CHECK_MASK			0x40000000
-#define A6XX_GMU_OOB_BOOT_SLUMBER_CLEAR_MASK			0x40000000
-#define A6XX_GMU_OOB_DCVS_SET_MASK				0x00800000
-#define A6XX_GMU_OOB_DCVS_CHECK_MASK				0x80000000
-#define A6XX_GMU_OOB_DCVS_CLEAR_MASK				0x80000000
-#define A6XX_GMU_OOB_GPU_SET_MASK				0x00040000
-#define A6XX_GMU_OOB_GPU_CHECK_MASK				0x04000000
-#define A6XX_GMU_OOB_GPU_CLEAR_MASK				0x04000000
-#define A6XX_GMU_OOB_PERFCNTR_SET_MASK				0x00020000
-#define A6XX_GMU_OOB_PERFCNTR_CHECK_MASK			0x02000000
-#define A6XX_GMU_OOB_PERFCNTR_CLEAR_MASK			0x02000000
-
-#define A6XX_HFI_IRQ_MSGQ_MASK					0x00000001
-#define A6XX_HFI_IRQ_DSGQ_MASK					0x00000002
-#define A6XX_HFI_IRQ_BLOCKED_MSG_MASK				0x00000004
-#define A6XX_HFI_IRQ_CM3_FAULT_MASK				0x00800000
-#define A6XX_HFI_IRQ_GMU_ERR_MASK__MASK				0x007f0000
-#define A6XX_HFI_IRQ_GMU_ERR_MASK__SHIFT			16
-static inline uint32_t A6XX_HFI_IRQ_GMU_ERR_MASK(uint32_t val)
-{
-	return ((val) << A6XX_HFI_IRQ_GMU_ERR_MASK__SHIFT) & A6XX_HFI_IRQ_GMU_ERR_MASK__MASK;
-}
-#define A6XX_HFI_IRQ_OOB_MASK__MASK				0xff000000
-#define A6XX_HFI_IRQ_OOB_MASK__SHIFT				24
-static inline uint32_t A6XX_HFI_IRQ_OOB_MASK(uint32_t val)
-{
-	return ((val) << A6XX_HFI_IRQ_OOB_MASK__SHIFT) & A6XX_HFI_IRQ_OOB_MASK__MASK;
-}
-
-#define A6XX_HFI_H2F_IRQ_MASK_BIT				0x00000001
-
-#define REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL		0x00000080
-
-#define REG_A6XX_GMU_GX_SPTPRAC_POWER_CONTROL			0x00000081
-
-#define REG_A6XX_GMU_CM3_ITCM_START				0x00000c00
-
-#define REG_A6XX_GMU_CM3_DTCM_START				0x00001c00
-
-#define REG_A6XX_GMU_NMI_CONTROL_STATUS				0x000023f0
-
-#define REG_A6XX_GMU_BOOT_SLUMBER_OPTION			0x000023f8
-
-#define REG_A6XX_GMU_GX_VOTE_IDX				0x000023f9
-
-#define REG_A6XX_GMU_MX_VOTE_IDX				0x000023fa
-
-#define REG_A6XX_GMU_DCVS_ACK_OPTION				0x000023fc
-
-#define REG_A6XX_GMU_DCVS_PERF_SETTING				0x000023fd
-
-#define REG_A6XX_GMU_DCVS_BW_SETTING				0x000023fe
-
-#define REG_A6XX_GMU_DCVS_RETURN				0x000023ff
-
-#define REG_A6XX_GMU_ICACHE_CONFIG				0x00004c00
-
-#define REG_A6XX_GMU_DCACHE_CONFIG				0x00004c01
-
-#define REG_A6XX_GMU_SYS_BUS_CONFIG				0x00004c0f
-
-#define REG_A6XX_GMU_CM3_SYSRESET				0x00005000
-
-#define REG_A6XX_GMU_CM3_BOOT_CONFIG				0x00005001
-
-#define REG_A6XX_GMU_CM3_FW_BUSY				0x0000501a
-
-#define REG_A6XX_GMU_CM3_FW_INIT_RESULT				0x0000501c
-
-#define REG_A6XX_GMU_CM3_CFG					0x0000502d
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE		0x00005040
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_0		0x00005041
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_1		0x00005042
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L		0x00005044
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H		0x00005045
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_1_L		0x00005046
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_1_H		0x00005047
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_2_L		0x00005048
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_2_H		0x00005049
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_3_L		0x0000504a
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_3_H		0x0000504b
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L		0x0000504c
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_4_H		0x0000504d
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_5_L		0x0000504e
-
-#define REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_5_H		0x0000504f
-
-#define REG_A6XX_GMU_PWR_COL_INTER_FRAME_CTRL			0x000050c0
-#define A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_IFPC_ENABLE		0x00000001
-#define A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_HM_POWER_COLLAPSE_ENABLE	0x00000002
-#define A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_SPTPRAC_POWER_CONTROL_ENABLE	0x00000004
-#define A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_NUM_PASS_SKIPS__MASK	0x00003c00
-#define A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_NUM_PASS_SKIPS__SHIFT	10
-static inline uint32_t A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_NUM_PASS_SKIPS(uint32_t val)
-{
-	return ((val) << A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_NUM_PASS_SKIPS__SHIFT) & A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_NUM_PASS_SKIPS__MASK;
-}
-#define A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_MIN_PASS_LENGTH__MASK	0xffffc000
-#define A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_MIN_PASS_LENGTH__SHIFT	14
-static inline uint32_t A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_MIN_PASS_LENGTH(uint32_t val)
-{
-	return ((val) << A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_MIN_PASS_LENGTH__SHIFT) & A6XX_GMU_PWR_COL_INTER_FRAME_CTRL_MIN_PASS_LENGTH__MASK;
-}
-
-#define REG_A6XX_GMU_PWR_COL_INTER_FRAME_HYST			0x000050c1
-
-#define REG_A6XX_GMU_PWR_COL_SPTPRAC_HYST			0x000050c2
-
-#define REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS			0x000050d0
-#define A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_SPTPRAC_GDSC_POWERING_OFF	0x00000001
-#define A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_SPTPRAC_GDSC_POWERING_ON	0x00000002
-#define A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_SPTPRAC_GDSC_POWER_OFF	0x00000004
-#define A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_SPTPRAC_GDSC_POWER_ON	0x00000008
-#define A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_SP_CLOCK_OFF		0x00000010
-#define A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GMU_UP_POWER_STATE	0x00000020
-#define A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF	0x00000040
-#define A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF		0x00000080
-
-#define REG_A6XX_GMU_GPU_NAP_CTRL				0x000050e4
-#define A6XX_GMU_GPU_NAP_CTRL_HW_NAP_ENABLE			0x00000001
-#define A6XX_GMU_GPU_NAP_CTRL_SID__MASK				0x000001f0
-#define A6XX_GMU_GPU_NAP_CTRL_SID__SHIFT			4
-static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
-{
-	return ((val) << A6XX_GMU_GPU_NAP_CTRL_SID__SHIFT) & A6XX_GMU_GPU_NAP_CTRL_SID__MASK;
-}
-
-#define REG_A6XX_GMU_RPMH_CTRL					0x000050e8
-#define A6XX_GMU_RPMH_CTRL_RPMH_INTERFACE_ENABLE		0x00000001
-#define A6XX_GMU_RPMH_CTRL_LLC_VOTE_ENABLE			0x00000010
-#define A6XX_GMU_RPMH_CTRL_DDR_VOTE_ENABLE			0x00000100
-#define A6XX_GMU_RPMH_CTRL_MX_VOTE_ENABLE			0x00000200
-#define A6XX_GMU_RPMH_CTRL_CX_VOTE_ENABLE			0x00000400
-#define A6XX_GMU_RPMH_CTRL_GFX_VOTE_ENABLE			0x00000800
-#define A6XX_GMU_RPMH_CTRL_DDR_MIN_VOTE_ENABLE			0x00001000
-#define A6XX_GMU_RPMH_CTRL_MX_MIN_VOTE_ENABLE			0x00002000
-#define A6XX_GMU_RPMH_CTRL_CX_MIN_VOTE_ENABLE			0x00004000
-#define A6XX_GMU_RPMH_CTRL_GFX_MIN_VOTE_ENABLE			0x00008000
-
-#define REG_A6XX_GMU_RPMH_HYST_CTRL				0x000050e9
-
-#define REG_A6XX_GPU_GMU_CX_GMU_RPMH_POWER_STATE		0x000050ec
-
-#define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
-
-#define REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF			0x000050f1
-
-#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
-
-#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
-
-#define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
-
-#define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
-
-#define REG_A6XX_GMU_LLM_GLM_SLEEP_STATUS			0x00005158
-
-#define REG_A6XX_GMU_ALWAYS_ON_COUNTER_L			0x00005088
-
-#define REG_A6XX_GMU_ALWAYS_ON_COUNTER_H			0x00005089
-
-#define REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE			0x000050c3
-
-#define REG_A6XX_GMU_HFI_CTRL_STATUS				0x00005180
-
-#define REG_A6XX_GMU_HFI_VERSION_INFO				0x00005181
-
-#define REG_A6XX_GMU_HFI_SFR_ADDR				0x00005182
-
-#define REG_A6XX_GMU_HFI_MMAP_ADDR				0x00005183
-
-#define REG_A6XX_GMU_HFI_QTBL_INFO				0x00005184
-
-#define REG_A6XX_GMU_HFI_QTBL_ADDR				0x00005185
-
-#define REG_A6XX_GMU_HFI_CTRL_INIT				0x00005186
-
-#define REG_A6XX_GMU_GMU2HOST_INTR_SET				0x00005190
-
-#define REG_A6XX_GMU_GMU2HOST_INTR_CLR				0x00005191
-
-#define REG_A6XX_GMU_GMU2HOST_INTR_INFO				0x00005192
-#define A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ			0x00000001
-#define A6XX_GMU_GMU2HOST_INTR_INFO_CM3_FAULT			0x00800000
-
-#define REG_A6XX_GMU_GMU2HOST_INTR_MASK				0x00005193
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_SET				0x00005194
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_CLR				0x00005195
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_RAW_INFO			0x00005196
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_EN_0				0x00005197
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_EN_1				0x00005198
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_EN_2				0x00005199
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_EN_3				0x0000519a
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_INFO_0			0x0000519b
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_INFO_1			0x0000519c
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_INFO_2			0x0000519d
-
-#define REG_A6XX_GMU_HOST2GMU_INTR_INFO_3			0x0000519e
-
-#define REG_A6XX_GMU_GENERAL_0					0x000051c5
-
-#define REG_A6XX_GMU_GENERAL_1					0x000051c6
-
-#define REG_A6XX_GMU_GENERAL_6					0x000051cb
-
-#define REG_A6XX_GMU_GENERAL_7					0x000051cc
-
-#define REG_A7XX_GMU_GENERAL_8					0x000051cd
-
-#define REG_A7XX_GMU_GENERAL_9					0x000051ce
-
-#define REG_A7XX_GMU_GENERAL_10					0x000051cf
-
-#define REG_A6XX_GMU_ISENSE_CTRL				0x0000515d
-
-#define REG_A6XX_GPU_CS_ENABLE_REG				0x00008920
-
-#define REG_A6XX_GPU_GMU_CX_GMU_ISENSE_CTRL			0x0000515d
-
-#define REG_A6XX_GPU_CS_AMP_CALIBRATION_CONTROL3		0x00008578
-
-#define REG_A6XX_GPU_CS_AMP_CALIBRATION_CONTROL2		0x00008558
-
-#define REG_A6XX_GPU_CS_A_SENSOR_CTRL_0				0x00008580
-
-#define REG_A6XX_GPU_CS_A_SENSOR_CTRL_2				0x00027ada
-
-#define REG_A6XX_GPU_CS_SENSOR_GENERAL_STATUS			0x0000881a
-
-#define REG_A6XX_GPU_CS_AMP_CALIBRATION_CONTROL1		0x00008957
-
-#define REG_A6XX_GPU_CS_SENSOR_GENERAL_STATUS			0x0000881a
-
-#define REG_A6XX_GPU_CS_AMP_CALIBRATION_STATUS1_0		0x0000881d
-
-#define REG_A6XX_GPU_CS_AMP_CALIBRATION_STATUS1_2		0x0000881f
-
-#define REG_A6XX_GPU_CS_AMP_CALIBRATION_STATUS1_4		0x00008821
-
-#define REG_A6XX_GPU_CS_AMP_CALIBRATION_DONE			0x00008965
-
-#define REG_A6XX_GPU_CS_AMP_PERIOD_CTRL				0x0000896d
-
-#define REG_A6XX_GPU_CS_AMP_CALIBRATION_DONE			0x00008965
-
-#define REG_A6XX_GPU_GMU_CX_GMU_PWR_THRESHOLD			0x0000514d
-
-#define REG_A6XX_GMU_AO_INTERRUPT_EN				0x00009303
-
-#define REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR			0x00009304
-
-#define REG_A6XX_GMU_AO_HOST_INTERRUPT_STATUS			0x00009305
-#define A6XX_GMU_AO_HOST_INTERRUPT_STATUS_WDOG_BITE		0x00000001
-#define A6XX_GMU_AO_HOST_INTERRUPT_STATUS_RSCC_COMP		0x00000002
-#define A6XX_GMU_AO_HOST_INTERRUPT_STATUS_VDROOP		0x00000004
-#define A6XX_GMU_AO_HOST_INTERRUPT_STATUS_FENCE_ERR		0x00000008
-#define A6XX_GMU_AO_HOST_INTERRUPT_STATUS_DBD_WAKEUP		0x00000010
-#define A6XX_GMU_AO_HOST_INTERRUPT_STATUS_HOST_AHB_BUS_ERROR	0x00000020
-
-#define REG_A6XX_GMU_AO_HOST_INTERRUPT_MASK			0x00009306
-
-#define REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL			0x00009309
-
-#define REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL			0x0000930a
-
-#define REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL			0x0000930b
-
-#define REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS			0x0000930c
-#define A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS_GPUBUSYIGNAHB	0x00800000
-
-#define REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_STATUS2			0x0000930d
-
-#define REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK			0x0000930e
-
-#define REG_A6XX_GMU_AO_AHB_FENCE_CTRL				0x00009310
-
-#define REG_A6XX_GMU_AHB_FENCE_STATUS				0x00009313
-
-#define REG_A6XX_GMU_AHB_FENCE_STATUS_CLR			0x00009314
-
-#define REG_A6XX_GMU_RBBM_INT_UNMASKED_STATUS			0x00009315
-
-#define REG_A6XX_GMU_AO_SPARE_CNTL				0x00009316
-
-#define REG_A6XX_GMU_RSCC_CONTROL_REQ				0x00009307
-
-#define REG_A6XX_GMU_RSCC_CONTROL_ACK				0x00009308
-
-#define REG_A6XX_GMU_AHB_FENCE_RANGE_0				0x00009311
-
-#define REG_A6XX_GMU_AHB_FENCE_RANGE_1				0x00009312
-
-#define REG_A6XX_GPU_CC_GX_GDSCR				0x00009c03
-
-#define REG_A6XX_GPU_CC_GX_DOMAIN_MISC				0x00009d42
-
-#define REG_A6XX_GPU_CPR_FSM_CTL				0x0000c001
-
-#define REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0			0x00000004
-
-#define REG_A6XX_RSCC_PDC_SEQ_START_ADDR			0x00000008
-
-#define REG_A6XX_RSCC_PDC_MATCH_VALUE_LO			0x00000009
-
-#define REG_A6XX_RSCC_PDC_MATCH_VALUE_HI			0x0000000a
-
-#define REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0				0x0000000b
-
-#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR			0x0000000d
-
-#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA			0x0000000e
-
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_L_DRV0		0x00000082
-
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_H_DRV0		0x00000083
-
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_EN_DRV0			0x00000089
-
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_OUTPUT_DRV0		0x0000008c
-
-#define REG_A6XX_RSCC_OVERRIDE_START_ADDR			0x00000100
-
-#define REG_A6XX_RSCC_SEQ_BUSY_DRV0				0x00000101
-
-#define REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740			0x00000154
-
-#define REG_A6XX_RSCC_SEQ_MEM_0_DRV0				0x00000180
-
-#define REG_A6XX_RSCC_TCS0_DRV0_STATUS				0x00000346
-
-#define REG_A6XX_RSCC_TCS1_DRV0_STATUS				0x000003ee
-
-#define REG_A6XX_RSCC_TCS2_DRV0_STATUS				0x00000496
-
-#define REG_A6XX_RSCC_TCS3_DRV0_STATUS				0x0000053e
-
-#ifdef __cplusplus
-#endif
-
-#endif /* A6XX_GMU_XML */

-- 
2.39.2


