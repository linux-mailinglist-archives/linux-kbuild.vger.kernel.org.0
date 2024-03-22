Return-Path: <linux-kbuild+bounces-1280-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B28874FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 23:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3A26B22963
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 22:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BFA82897;
	Fri, 22 Mar 2024 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIz7ygwI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D054D82890
	for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2024 22:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711148222; cv=none; b=TusrpQyZk0lbHQjuDC9B/qPCM9XO1vIGBoqGw5jlmBi5n5wt4cGw3Z1in+WF4aptESk21up5zTbyGQPlyUf65IKEdMYKFfV77cYfffPWwESHUnMwH3M3Y1Lc3hUNywoanz90yLlp7wHCEXow31NdWXRcMd4moxfC2jzZksHozFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711148222; c=relaxed/simple;
	bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AI+KNkjky2I1TbEE+/K3hKjwxHEV3QfPQZVjzNeWlarGo5KFk51J3GzBxvTwHVzppx0R4DsoyH0ZAb4EDgMYuAESJaYeHcZwDYqrRwQjXXDopy9g0ghMeZ8broLZJJ78q87yGkxsQmRO7G4j3l4GqbLPemOKT+7OLDmyFGExLFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIz7ygwI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513cf9bacf1so3598048e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2024 15:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711148219; x=1711753019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=EIz7ygwIsXytZsFUFcojYJvZiPFale4/wWZ2VDkwjlBrGt/q2Vur/YiVWiL+mfZgwb
         lzsOXlR5NUElC1+4A08lE7xNIR2B6i2IC+b7f7lSq1IqfZBW7Te0AnmZtuYpF2X6khtj
         /XnyWnwe+uBN52bXFWlZvInAOQZXDrCO0q2KtMDI6IHze8AoSUwGxXCORozFK2ypwktB
         +Fb47RL2CqRUIqFSCM78HQRpbpxBIpRHL1yeOoueAJJiJlbeUKIxYZdcS0UaJhnfh4VK
         NEZTMpdtod+U1i8cgzDDXmIRJThPcpdvCB1hWaeGA07k8pbHWOJAM6k9BIB4ax9gRVBg
         PCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711148219; x=1711753019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=lMkH84k79Y48whbLgQxozbE2u1A7zysU5oIIOepaOW3mrv6TAes/M/NsuHRyBx+PBX
         /xhfpgbexyXdMq4Ex/E1aFBWi2YeNBMXKiuN12iO2ZOvPjmCJM0wu+U/qwEl1gJO0w4x
         gH58IMGDKmsSGd7LpL1aCeOsXuFz5SOR9UAssJ7xzwlja/5i+M/ldWbyr45TPB62B3WO
         5zAeV09Wo0nokAINeSZBi0bhOmC1K3zEruFj5eWw0oe7cfS4o1a8F5njgf5goOkbZ0Zk
         5R/R/sTU9XtNiPoBAhv21R5XKrZgHSBkrdiKIoCbRpL0Yd3Vf7ISPmGDhmeeff5gkGJr
         W1Ag==
X-Gm-Message-State: AOJu0YyKPaO5N6KcChDpyDtyE5MLNFa//OU8XhNTORi+vbLJLlDwbgtw
	D2XtS1Harn4jbfyUnO1x/pBeDUgm1h6/HK0bZMHyUoUbLVlvC2EdLm+7Eb+91PA=
X-Google-Smtp-Source: AGHT+IGdp+o4CDbwmcSah48K76ZnFm8Lpri3RosPHxDjMy+zNnVHyIo5UxLjLdqY6Hh1qIxp+YMhZQ==
X-Received: by 2002:ac2:5611:0:b0:515:852c:c77b with SMTP id v17-20020ac25611000000b00515852cc77bmr463629lfd.39.1711148219036;
        Fri, 22 Mar 2024 15:56:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 15:56:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:56:53 +0200
Subject: [PATCH v4 01/16] drm/msm/mdp5: add writeback block bases
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+o/nm0v9VxfyjaFzlD26OA0ztf8G7XYN2DKnPv8nz8cv
 /6rdFNhJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmMlGWg2GCr5C8843Zf6Lz
 GObIBh5dunfTo+2mXFyH6tyKmz4091r4vOZvONnbekz6mbhQm3ko54up7hYCLzoflwvzBVta1Vt
 tiAxjl9DNTpyT9o+v4qrW1ens25pP2LAeO8aza9l76WjepmdHbjIUVm/8bcWpr9AdLPrw6deVMg
 VHu5fU9UTOq9mz2zprtqUa24d7M7Uup9uVW215s6zTLKkptdfRpTtMdj378fSiFbNW2h1481Tu7
 M+9U5bf8VNQTrU6vpm1mdGkdQrDA9OiwpoDuyJfGkVWHAisbX7wR2ytJlP7+00e9zkMjE+4pkmJ
 Jz4PDPTM/3Fm9sepmud/XJO9+y3g8zV2SVWZaKeOOKW1AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
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


