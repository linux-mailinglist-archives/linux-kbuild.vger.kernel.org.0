Return-Path: <linux-kbuild+bounces-1235-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9387C715
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 02:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B6FD1C21D29
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 01:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA63A6FD7;
	Fri, 15 Mar 2024 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6jsK13Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45F26FB8
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 01:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710465763; cv=none; b=OgRFqKsSJmFYoI1MOAm3uFfUVJ2g5F5cmRQnoK8QLSr5kgT2SkRi+Vk9pDqEK29Nk9p90u8QaaYJSHDUan0zTmBY5XA9GNP1Tq5SAgPg9OxAH9nHdIyaCA0mxSlWClUciYbpnLYXtVhl/tSJXF8R54DYzGy6rbBlovc/T69enzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710465763; c=relaxed/simple;
	bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QUL24ZhQ3nBlxgnpbikl1+heIRz3LLDdC3quyMWjUOSt3+5FePGqxV5g4l8E8De4kLjqiwAZ/GGvdrg3jC/KDp3q3jPOa4sqjUryoi8altvxkYyZVwrBi8Yv0h3+41HWvuuGnyAkWWYuAKD+CQUudC0Bd5bhSCgnsHBio46WxrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6jsK13Q; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513d3e57518so1287382e87.3
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Mar 2024 18:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710465760; x=1711070560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=B6jsK13QBWQjRZbGokfhOhLtGFsTy1Gg7hQp51waqM5ev62JC2L1gcBpwLQGMnBQS/
         8VED3Z1A+fccd/0w1H4/6qelTWS5GoH82fpQtVQeZm28rhxMkNV4I5jt2BxN7dCC2+GS
         0GTpBlYOSMQT9xZ8WucBmjB9rWNXGZJEI32qb2dytij+DACoEMyr1O2scNEqhR1XFpG3
         ry36YUotLCmk92+oc4gcpRxSNJNKjXdpYw9B4bzz/OdaRkq0B9yNAN54aHlfUCtMj2dl
         f5lUZrEirFgkzKdEA6Ybot5M7HLomjxv1lRbamkIBbEonEs6Szz5CkW4qspTsVdZjSfl
         baOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710465760; x=1711070560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=hEU5D4gmRzSQxp6FpG8bVYmOmJKvmFSCPvBtHBs902zNS3v4CXBunm9S+JAcLdHm0w
         0uzoZ1dCPPQkVYePTD5cn4zFUrtWR/1Tgj00yVZ3sw/vg54Txzya7w647mHQd6R/Rzxx
         e9IVQ5hAg7Q0CIgTgPVpketRUuqMUqJYxuI5aNST4uO8snYFS6l8zVdFwR5DIdgc3gCA
         H85i5sKMmpyG/gIEhXEo8rstBBebT/XoQKV28Rk9UMBpguM0zCv8pKQDyjPZ8A9mLqJr
         9ThW9Ijc06XE+kwOuy8bYtPahC6WjaliChQaazvxhyxME+dW/4suR53F2v0gSz0t3hel
         N/MQ==
X-Gm-Message-State: AOJu0YxezTOgxokLpKZAxkM9leKIj1VWPKFkxBRe7WV8ExsZcAK4HTGC
	XbZF4b5nmFTQnXKNCD+C0dw3e87c1ksFuHWvod1TcnXVhwUXTo4BSXp6VfOSPpM=
X-Google-Smtp-Source: AGHT+IFtneaGTAZC9+bjGCN7jkSWwII9+oxv6WIqAz4eTX6blLRQmZnKzzdrOySHPQhNFCrcWlptAw==
X-Received: by 2002:a19:6406:0:b0:513:d8e3:fe3d with SMTP id y6-20020a196406000000b00513d8e3fe3dmr348905lfb.26.1710465760216;
        Thu, 14 Mar 2024 18:22:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m11-20020a19434b000000b00513d6089dc7sm190559lfj.131.2024.03.14.18.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 18:22:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 03:22:34 +0200
Subject: [PATCH RFC v2 1/7] drm/msm/mdp5: add writeback block bases
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v2-1-7cd68ecc4320@linaro.org>
References: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl86Lbu1WTtWJjAFtiellueU8vs3B6gc89KBYKd
 LaVA8f413WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfOi2wAKCRCLPIo+Aiko
 1aQACACn5dtZSR/KdnryXxUSdBpOMw2qv1GtZtUr0sg5jAlDajqmZmzdzktPQ/MFBFJQLIkmD1q
 alPUSIj3GdZj+r453uYlh6P8Ll5SwIrzWgliE/IavUVtp5qvycdt9fYuAV9IaRrxOPTX+0+DCAV
 Q1nF5gXuVOYgo+Z+axf9MN8p8gCCWt94JfDpDY/PiBSYqejz5eufQYXyYEdRwYXf64IBoZK19z4
 b20L6okrQda2g273iDU00maq3RB37QDPkGClKNTYJRteyFH3qskcCOFfA0tm822FQV/AXVn1GDG
 zM/rJ8CGhK6l3KTbpOTK1EPB/SslyvZ9Qe5vwvPUgBdP7ED/
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


