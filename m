Return-Path: <linux-kbuild+bounces-1247-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E7487CCB5
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 12:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF544B212DF
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 11:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C09A1BF28;
	Fri, 15 Mar 2024 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dxNo2lJQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1030A1BC5E
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710503193; cv=none; b=PM/w2Bwx6k4+KvKkOmILgJDhoVzRV4ngpy7kXlGvld+Y+rFofe+fR8oLja48cZn4jvmImX1M3sIV7/opXWpmp7aQtvZuekh+mXFB8z7PXGJ4diyt666X55yNlvB4kPm3LwCIst7bhslm7uYS5U331ZycNtk5G0kbX8Nd715Jojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710503193; c=relaxed/simple;
	bh=WdZH3u8yRJqqGjSYbceH8YaJBPAPZG8nl8tvSvRvLKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msQdvysF5jLSBFe9o9JRAY4V1ZgqROgeDi+mWdCC0vLv9ag5ht8hBLFzL3ulMcJfxGAwFRZ87JOZGIYIMgdDOIog9FdDc4tUwrro+yB3UQ5r2m6tGfY4hF9SBaObivFIod3stQaR9OmoZJ0ns7EN7XHLsdadt26TQMAIa6Emd70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dxNo2lJQ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51381021af1so2766787e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 04:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710503190; x=1711107990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
        b=dxNo2lJQ1F5Gb5JoRySxs6ebOH4hpAF8ZpGgWvBhlStNUNTXCCzPuDK5Z2I5nhNLV7
         mLaPGPot8n51RXQzxFbnnzausy9nqxC4+Y9wvp6s4hUaKMxFUpakciX3XZYieuGqUlpm
         v8N7yOH/haFXLrc2WGTxxDQLFj0guGc7pEySgsu+LvQPTVnSVp3DVG/eFE+ANwYn/KA1
         EanwDJzWH1TpDSf5oYpkAwAL12NU+Up9lLnDFWQh8K1h2Z2AWYWZVfdUjH23ZUk14oZO
         MQvlEpDQHQM+CP3fcSpNM3V7l/EzZirlEahKiG4SH7roNFE3RIcrJQOwyOt8UPnRqV1h
         rA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710503190; x=1711107990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
        b=SxKqvyRmxFc/pinXHqL2JF0mdnOdazA+nqsfWB92nGDzxlEeQxFZ/0eTUQIVBRUIMk
         NUzKKnug+aqxmd2YhTo+TZEqsRx8gudsGPZKLcklEvmGqzk0nZKAocu+V8ljSku/HS7y
         c8pTE5lQtNi1uff1u8Mw1iGVSkeB3B7ax78w1bfA63WGzl25yvb8KGsWjFTDNfsA9q4p
         90hI67/Y7p3rpkOoNAvIA0opCvDY8XH9n7GS8VmeOm+xjtmDq+5YkJG64RwT7P6flW6P
         IVXXPIFdVlYvBA5hPBpk32EURp0XA9ICKO4wXjOpGuOsFEzcsFshtTKYW16porjsIyHr
         FnlA==
X-Gm-Message-State: AOJu0YzKGtlc+hS53sbxO4R3IL3SrfaCTmpaQJdpnp3SF7e67QAMqGN9
	O8hT8W/150fBZ0/U7x+794DniJUT0e5Zvzl41WhqFAL2SjICRXF0PFKP79/EwO0=
X-Google-Smtp-Source: AGHT+IHwpPmdnU1MpvxTqQo5Y1lvPc+qWeTGrnOHX4NlCO7xrbZ0sucFRLcC8XXTqGqQQ1y4Z3C2/A==
X-Received: by 2002:ac2:5f8b:0:b0:513:c2c7:573e with SMTP id r11-20020ac25f8b000000b00513c2c7573emr2514170lfe.23.1710503190336;
        Fri, 15 Mar 2024 04:46:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l17-20020ac24a91000000b00513b024b232sm619987lfp.10.2024.03.15.04.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:46:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 13:46:24 +0200
Subject: [PATCH RFC v3 02/12] drm/msm/hdmi: drop qfprom.xml.h
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v3-2-0fc122e36c53@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4711;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WdZH3u8yRJqqGjSYbceH8YaJBPAPZG8nl8tvSvRvLKI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl9DUQQQF74LwZT1gRX6WqqoLWz9flZ5KUh7elK
 bI3BziyC6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfQ1EAAKCRCLPIo+Aiko
 1WTJB/9DhrR8Qhf0IFcC+tv+CIG7zFVPu0BjMvbZs/PJwkQ0UBKwisp2kvpQ+JnzC6djzQeNKwV
 hHSGALG20qDWeliVeuUvjo1kiZoyI4RgVo7zorHkyoz6A7CvMeYjJAG+epziJmlw++xtuNg1Ejm
 5d4j5K45rljeIm0VcckcXu0RQssfBeQjDkq8i2dC96hXQJy4TxetywYYdwSD/Y3Uk/rBvjG9zpb
 1yWgRmSBCIDpAC/x6DnTdpfbRCE8rvos/hQUPFInwRRi6u3lhzY5Cr8CTsmL7w0DXO+n5kt9ntt
 vXFE5FVuG9MOMboTNnfSEvBjzTjxUYoJEDrgSOCB6nBAvxQn
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


