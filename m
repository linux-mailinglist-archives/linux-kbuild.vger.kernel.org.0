Return-Path: <linux-kbuild+bounces-1058-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1758667EB
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 03:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7E34B20D1E
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 02:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31ECF9C3;
	Mon, 26 Feb 2024 02:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZxlFVSIq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9630D53C
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Feb 2024 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913513; cv=none; b=JhEXd33jpDXYxohodAZq4Y2feyjAQelpGOJqW4E9Q+uIAKD7JfS73bOrXMjl9L3NhaeST25droCeJtM3XbaBkczP3gxHgKUmnCscw8xEqrMxt3zQi6bsCMnT+8NYYx4d8eJcQO3jJ66qOWUXvZwJv7CzuIudaTiFLLQ7KLS8zTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913513; c=relaxed/simple;
	bh=WdZH3u8yRJqqGjSYbceH8YaJBPAPZG8nl8tvSvRvLKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRDas9ESubNGjhwwK/6MSdCnhwiK5PpNtIjM9ulSaXST9KsW/jN+ObzhQLdgLKnfY9ics44s+P7VEQ7B2FmBxICJYkSN+rEJjroJPm1uNtKJWKXElWu3TAGLcz+/wdJSqh8+5z7LXHvJSVdNvFDyOZwEAUvNphBoCMf3NDrGbnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZxlFVSIq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512bce554a5so3129691e87.3
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Feb 2024 18:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913510; x=1709518310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
        b=ZxlFVSIqo/jML0LKYlQlj9Cane8r0aymAJiwyEeVdHxxqakYh+Gw8VwZdiz3ApPqbm
         AhukiD0qICtZuJg1Mqng4Xd97C1m/uBDWLLMRVNSyIrqkqLdJr32T4icDK1VS98AI1MB
         vobg3kKx869Qt/R9x31KdlHU7bir8xv/NowvDv4tHbtekgsyWRTsYtD0rU86LrZNOL+n
         8KC7d9aYD7gDWIgyOdXnZ0JyZQCeYMtIUCu9kElIGLGStOHeJRTEth46Jr7TOVmWA2K6
         LHDjswZ4eFfuxvAwA9PjbqSHjxncoVjfKN3I3gxboITLBFl4HIB3aZpthkATCBw5WB43
         lzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913510; x=1709518310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
        b=qf3naiVR0GsNF53I2RjoPH6/qLNI8m+cCZXCtgJ8AAuUrNU1JzjH4D1yZUdPTsP3hS
         CkRwcMd3JluV+bfcuwvSh7P3/C/sMbqBw2cprT7Wv/ijCqCtm4dYvU5D1gz8HqCZVzN9
         Z51Jw5JjdUWmgw7NGgXppiaPZ+qPrDj9knRDmjGgBXrqYrOcqx8yrMb73rIA7l4BAGgf
         AGvnBTt7qa0iDcoiglu+kIR7XQ+YV3kLg46M+6ymVW6+ptXend1D/u5y/NOEcsfy+uz6
         x0mgSb23fRKY0bG/94PDrVpkVu09BfwREg0KijjjLTPTgea7h6VdNL8jYAwL+/B2TZQL
         f/GA==
X-Gm-Message-State: AOJu0YyYX9T2B99KUjCOi+qH/IWjNLop3BtyJw6VOS2yo14k3bODHcli
	JF4hB86huiD6RmmvyMRVVH05pZeh0gs9KGSbVSVkvhZXud++H9LSu9H+z0+Qruo=
X-Google-Smtp-Source: AGHT+IGY4gzmXsE9Jy4EjXBhsqpj7Vs6TDkLR5AhhddiGoCDdzrxQEMLv0q8q6w5zsVTlzfWfmua6A==
X-Received: by 2002:a19:5e19:0:b0:512:b27c:18b5 with SMTP id s25-20020a195e19000000b00512b27c18b5mr3280872lfb.30.1708913509984;
        Sun, 25 Feb 2024 18:11:49 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:39 +0200
Subject: [PATCH RFC 03/12] drm/msm/hdmi: drop qfprom.xml.h
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-3-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4711;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WdZH3u8yRJqqGjSYbceH8YaJBPAPZG8nl8tvSvRvLKI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NgDVAiYFY+rVPhG374kNIOZMpIfGmIPD+KZ
 m2xSKCJUA+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYAAKCRCLPIo+Aiko
 1eSWB/9rUdYOzJ6SCw09S6S+UkN+7JsPcFZ7Gu6TxtaafR7OH17XE91bJ3ge0wpAc3oJZ57VDsI
 POjy6aEIDWHkitOlLphzzCGeYumnPQXltPcrXfSWBiLfYNS6fBnfdvjUydNLwyLIVT5UBv75LTK
 XJ4QxWLdUm7gLie2JtRuv4p2nCd+r8cEJq8Oji6/5MBB42qxz49FgXaTV3mfHzg6hlrP/qN+R6W
 3Ii3dUInB0VmLJKJ5qT4HLYq9HsxGRL6MlTeyhI3rt0k1PLUdLS0xsd8KIWr2XLLCQXoWonpxAL
 SH004jrThzbPaOTke85niR6eiVfhZNgpBnDpaRCvVb0iIIE0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The qfprom.xml.h contains definitions for the nvmem code. They are not
used in the existing code. Also if we were to use them later, we should
have used nvmem cell API instead of using these defs. Drop the file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h | 61 -----------------------------------
 1 file changed, 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/qfprom.xml.h b/drivers/gpu/drm/msm/hdmi/qfprom.xml.h
deleted file mode 100644
index 498801526695..000000000000
--- a/drivers/gpu/drm/msm/hdmi/qfprom.xml.h
+++ /dev/null
@@ -1,61 +0,0 @@
-#ifndef QFPROM_XML
-#define QFPROM_XML
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
-#define REG_QFPROM_CONFIG_ROW0_LSB				0x00000238
-#define QFPROM_CONFIG_ROW0_LSB_HDMI_DISABLE			0x00200000
-#define QFPROM_CONFIG_ROW0_LSB_HDCP_DISABLE			0x00400000
-
-
-#endif /* QFPROM_XML */

-- 
2.39.2


