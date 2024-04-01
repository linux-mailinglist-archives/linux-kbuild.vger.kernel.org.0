Return-Path: <linux-kbuild+bounces-1424-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD2989371E
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 04:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FD0DB20EE0
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 02:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D06A1C0DF8;
	Mon,  1 Apr 2024 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ccfb1GjD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD9064D
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Apr 2024 02:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939373; cv=none; b=QUvcKqOPEu3f6h7KgM7cM6ZA/HOm/MCknSBLEAEoDLZQ3FCyOrwJLQHDrVn0831WhagqYwPVya6iWjhB8dHwDys6zhCxBKxEmkDdATgjRF9fg84KKV16eGOKPFEuq7SBxASAFpqxFa/mrAS9dCFi8oVO/i1sMS0Goha6BXpA8k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939373; c=relaxed/simple;
	bh=gQvNFYs+XySj42ee8HZa37cqRlMD12EMVNfdjmgcLAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2OKRKaIMn/KlK+kFToSiRKxs6UhFNXM+xUjV6WVEjdXMsVJnzldXaf+YV6El4Yr8uQV9tYBBQaKuAZuVUqF4z28xjfeutQQG0sV/fJgTbhzrJ9FYZCkVFi50y08F+3p05Jg8LpGjlLC9NWq2zApJELcxIfrBn4qNUnqsnYGIFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ccfb1GjD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513d717269fso4309515e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711939369; x=1712544169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rDSJ7AmNeLa9TRlNQ3TwOTepykvmV+/MVa8FZsXwpw=;
        b=ccfb1GjDC+yUS/wDjcz0Djr+sMKLDzbd9Ytj7/599r2iI6OoZaaON0MP0cpTAcBcay
         bnvG+ZIafPIzcEuQ1YwkudAL3CvKbDrOKj6kaXEynBFobSYkYO+QTCfk2dLNpyESptdC
         4Xboa4qZbub2aeXC+jONNcYBo3lYzzXlIn/HXbMnNb4zJUZ1Jc26821D26eZgSIqMmBa
         LQ/jMp6Wc8lLDhKatxQ+uUQxr8dXSRIlZL7ZB5q4Ls2MQc2x/C2GsHc2c71TwnHFCu+Y
         KGgwqaSTWOm2Je0eV8kLuKkeIi4bTzat9m9RbBBdPRKb8/MOTguJ9w2glwyI/dQoWQ2W
         Jy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939369; x=1712544169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rDSJ7AmNeLa9TRlNQ3TwOTepykvmV+/MVa8FZsXwpw=;
        b=KIoEmF/TN60yJhelBpPST7OxUkSA8fSbi2nkXwVdyoBkW56x2+yW0Xgg+cypwEtefz
         HwcKL7/SNsKPjwFc33BXPCWKvEwWDNOxN6DiI+TTGNM5FTOlGYmp7emYWXf++/v+Kjn8
         VUi8FCOLFr/O/L4+DKivIAIKupSx8Pga+ZWTHlBTGvLbqzwqLxha26uZCDeXBIKYNaPa
         NPY/v4Y70whagyfY9i6pNHwYI2uvT4PZFpEaq9RrkBvzszMQdPBsLQPT9t+alfP0Kf5e
         2ArWf8T3oW855TJXE2+tKJLoh+5u5MxKn89SCGQghgnfGpHlkgAwG+uEvFyR8Ca7uX1U
         SNnQ==
X-Gm-Message-State: AOJu0Ywqal4izPmErPKOGD3n4ooV5Cbo08eFuIjDC9AT4d55KHnDMY6U
	2zf5v0KMgvS/k1V3ZPgiyCHIgk04L8D63rEkt6+6YNpX3pVl8s6sSSQ+x9uXV0w=
X-Google-Smtp-Source: AGHT+IHSIDHPRdM5xZAaH3Io7sMMmdjJv4c2i8FE+Koto1FlctrjZgdMY7hLAVOqv0ATA8ZE7VAHzQ==
X-Received: by 2002:a05:6512:20a:b0:515:c43e:19c6 with SMTP id a10-20020a056512020a00b00515c43e19c6mr5023289lfo.23.1711939369518;
        Sun, 31 Mar 2024 19:42:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 19:42:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:31 +0300
Subject: [PATCH v5 01/18] drm/msm/mdp5: add writeback block bases
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-1-4bdb277a85a1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gQvNFYs+XySj42ee8HZa37cqRlMD12EMVNfdjmgcLAk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8kad/EEq82XdpkE7It1OWLKMTzOoaDJB4Vx
 wHdIwLFPeGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJAAKCRCLPIo+Aiko
 1QJoB/4lw7tABe2oXMBUbWaVTwdiGuyjcXtO2DBKvgfLzHDVK2KIp7tKRGRodYQo9pPhRWBW4pb
 NBXVffDrmZfR6R+e18AK8THWxmrP2+GfEYo3ozwbWGdiEvW52MJd3bTYIw/Pk8k25WlB58wZzOL
 FfgWM6A/8sleWqv37sIvBGRgityJwrxkDlktSJCfSl6x0U3MxXdWTj5z4je8nQpmzFc0AcFDIKQ
 YoQW4ckTlHI9GICW+AcpHa2ApE+hkbmiMgwGJClq0qlRPGLTC0muR0B2Uh52pWv2aelaAj9Wz7N
 bUnFGZedMPlWBFKAM1phN5l/lTWF+j/2Yj8Kxz80YfUWhWMW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2


