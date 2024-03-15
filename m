Return-Path: <linux-kbuild+bounces-1246-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D32487CCAD
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 12:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD1F1F22223
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Mar 2024 11:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43C81BC2C;
	Fri, 15 Mar 2024 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o7J1RqAJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9FF1BC59
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710503192; cv=none; b=q25QoDJyG7cNsNbCbvDGR4KRmz0pJmiv/VTBI0dRczAc1cKEi4U4rf+kioagi+ZrQS4Ogi0sE4r7SU9vol1K7wWUPoHEI4mrwpW8QXKvQz+YpW82rpAdpZlPPPvfHRLIA80FOWWDtZaE6mynruJPj74ZUcvIOFuCcRKjnlK129s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710503192; c=relaxed/simple;
	bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEGC28PyoJNSHHUehOisiBemNLswbVJb9HhDJvms/yJVc/bQiTt0WdD4hOEeJ+lW4Ep1kArGEwkP61JK/vitXXExZE6uiCOdJs1QEDrcVgUw6JBz6XAsiYD2zbV5NOXxJVd3r3iSFMpZ6G1AeXQX0Wafk124iyE9NtbTnLB9pjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o7J1RqAJ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513c8b72b24so2321414e87.3
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Mar 2024 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710503189; x=1711107989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=o7J1RqAJuP5Jx/gwkyiPSUcXPL8lV9gaqxuAik7tQ3zslnbujkuNt7zP7FnyEwO5nK
         53gCLC1lx0ceK6TG6NkqLUJGgC8lsQivRJLzc3JjcLz8gUrtO3aoCeDBKb5BTWErxvm9
         soAK/aEhyofTxukpDUfl/JbyUZZ7nUx9Lf2v1U15dFJTeqjejIs7CJYE6qMjJi7YXsLU
         AMyLhuJa7qD41ksKA19mY5edYjfjCFPVJ095uSSoEUHmMC35m01so5WwWkVMyvgf1A6V
         0Q5wGkF/VAe+5hE42UEtRzV5BkA8jjhTQT6lmCMg7kO8vnq9e6m4npALLZMPYcwLx30i
         J01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710503189; x=1711107989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
        b=p/piF1YmZMrLUL5/cwUa/Cd5MqUwwOPrWzWL/8SZODxUkvGyqB1yDS3JROr7y9TmJU
         2VesHyNRcxHd1qOnM3cAEACSKSS4cpx+aNWgJsVyfxrMUC3iXiVC8KQfPZWj+pMdq4I8
         Jx0pXEhUfdgMO3HcKbZBg/y0R9CJojIqM1lzZx52q1Lrp+oWtENgLIhXrMBnLQpMjScw
         N0mOLYmBbSM2iYRNSESei+HdOIUzH7xuVaIg0l1o7+xPEFTzjPRcc5fNdoovfznsMbRo
         dx3GLVDp+x/0YXmwp622fvbUn6t0zj4VQTa8fcYiWhhsCeV8jb++rlGfAy9jJs0eIQ3f
         vB+Q==
X-Gm-Message-State: AOJu0YzJTbtDnBEwh5Bd91I1I14MVK9vr5rlug/HacRxPcCT3obuSzhT
	8M0cvPv603h+cZj4mk6MDRCWeaFWyFUBj2lptaSNqGj9KKgW3NGlAAUQn/75+XI=
X-Google-Smtp-Source: AGHT+IFvHmKzxUIFY76dv6GIA+LeCO8F/bh1rhpzPNmjrJjuJuj4/5FvAu2HjyJaibvuaPIRy0Rr2Q==
X-Received: by 2002:a19:9142:0:b0:513:d5b5:78e9 with SMTP id y2-20020a199142000000b00513d5b578e9mr1999251lfj.26.1710503189363;
        Fri, 15 Mar 2024 04:46:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l17-20020ac24a91000000b00513b024b232sm619987lfp.10.2024.03.15.04.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:46:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 13:46:23 +0200
Subject: [PATCH RFC v3 01/12] drm/msm/mdp5: add writeback block bases
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v3-1-0fc122e36c53@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl9DUQImGnbz7nOsTqodT0se82AQB3A8EYtQh11
 obHHUk4GRiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfQ1EAAKCRCLPIo+Aiko
 1V7yB/0XGKzg8zS5Tz1eog71yhF6z96DuLKN8UwYg8RvBiL5qYpDugWvlB1XfUKUANgSFkEAFir
 bqttMynucXaLYAbTp858g61l4BmU4aBOK0DR9JQl05C55JhhyUBBEr25F0eBEk/0MKC23fhJH11
 776CxdVTG7MFLem7OI4sKWEv1zWY935B3SyF8CpjZ97ltNOVhuhrhyfLCpsNxIzOR9rWa7FtaLy
 2PjURezJWYZuJXbrR/2gv/ORk5zuUp3KhwVbli3eM9snnTJ1HiPRNwSzo45u/CH63kIxcJElByu
 3ijGtDoMWI+FWTIrIqb81qN5K9T5+eOQ1eV2yaF9+JQ2ls3D
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


