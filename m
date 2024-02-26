Return-Path: <linux-kbuild+bounces-1062-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B78667F1
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 03:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36BCF281614
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 02:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F65DDF58;
	Mon, 26 Feb 2024 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SETr7nFg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E53EAF0
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Feb 2024 02:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913518; cv=none; b=Of0NaA8WVKv4/xOZ3NovPMwB/S3ZgNBcFRjC7PhzlKhv5Ow8zN4K0wQpoge86UyqmCA7AL4Aod3JSvP0MwoYN2qVBKukZS9fZa30xI1CTXuwYTikn1EC7zUPoAWtFLiRMoxJh2DUrPRiTpxoY+xEVj2Y0r197PtYsQnvx/MewrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913518; c=relaxed/simple;
	bh=cdm61gYGUySsFxPZ5ngtMYEu8AnIiXIGfprwz9M15j0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LYLME3KAn14aBRfhHgOoaUNOi49gzG4eanuDCVAXDpibriYUmU906orj1GvUe7R6uFe2WVz08pH57kH2WbsBjrhDRTLAgWy31KO1tOhrhy1NQSfNkkEQXgp5X3V8hT61SRIodE41YeLwSXRwRg080uWE8LxYM+rGMCsemdQHc3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SETr7nFg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-512fe342841so235006e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Feb 2024 18:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913514; x=1709518314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3E7dzOhxFiHb1JCqkhJvLIWTzxr8XDqqA0WBoNbgeo=;
        b=SETr7nFghbbOI0G/a5bafZto2x4LxkUrkS4qwT1eGqYTpTzcX+/mfn6i+6yNRnlrpG
         ti5yTRk/UU8C0aOncZ5Qc+OffuZjThrFgBJ7UREo8+G3h46G3b9wmHkDa03wyKAMKxb3
         cm4zwakBgn3EajsORwZnDaHQ+HEWSHZypk4hOBRkyO8W6EmaTV0TjGoeQo7HVp3xlmCf
         86rL4fGUSvqkw5TduqiSf6kO0wW1xJNItHLFjtmVUPexcte33XnJb4TBpQ2tAgHTsqj3
         woRvDODaiVQZ9x/s40vfhXXveVUhqklQT1fF7jSFDv5ba3M97z7gQRJgi3KezsSTkicF
         dZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913514; x=1709518314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3E7dzOhxFiHb1JCqkhJvLIWTzxr8XDqqA0WBoNbgeo=;
        b=P2G+8U9SQDwJ9sFll7wZlDzrwMYe0IBnrHf4UgzzMf82x50fkDFS5y2iHMfEsHiEgM
         lSs3G6eaQKW6SPB8SBsmF4ryMQZTqLaprQuOYcal4jQwggnpF1eS20IOhRPInyBgrazw
         LynrydRVIY5blH/phMKrR8e2UaHbB4ei/lx5vPAdM8OqjJW38uA/d89OU2AXfLAZXz2l
         WuuLu0/jqiScz+WTK/ppZrpk1eoVK0R3CGOPrEikv6JP8lhvKXac0PQ1qyRKpts4+NbG
         4Qt/I4kHymmSfTms7x6L9UUqVL7AE95qt26UroB/n4+Sk1o4ITmoKQcl6Y5A7rWPu8Ht
         Dj3A==
X-Gm-Message-State: AOJu0Yw4etgdx86WGFnongGt724vhseP4H0HuQQJdnXfyuciKedYB4Vw
	CgL0bC6lPXM3mGehhuJDn3n39cnlhimlVaPn6qCkPi7715+3re6Xvhkr2TuSsAs=
X-Google-Smtp-Source: AGHT+IELdSvsYandsvUg2/9kXl+Uxy6kAqgjNUnscBWDJrEMCJeiyutSYFowciKyHufpcYsErIDaEQ==
X-Received: by 2002:a05:6512:2007:b0:512:b43d:6694 with SMTP id a7-20020a056512200700b00512b43d6694mr1524362lfb.32.1708913514398;
        Sun, 25 Feb 2024 18:11:54 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:44 +0200
Subject: [PATCH RFC 08/12] drm/msm/headergen: don't output full file paths
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-8-86bb6c3346d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cdm61gYGUySsFxPZ5ngtMYEu8AnIiXIGfprwz9M15j0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NhT7+nEsdNbK4/t6/GWM4DvV+yrpaxToNms
 1msEgdr7MCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1e7GB/46EXHrORsKwaZpnKqF3lwzDU5kEbixRHeZy/SKsQys8wDF7msZstYUfIfros0SjXuGoJK
 Dnkg92e8E+Aa/GXa3/qWfkJyBPoeSogz78JZvkb5iGhuQtwqjBVXd4S6bt84CSWqyCuN2Hn4OwR
 JSEJKGu4AKK7xgMekhm4rGTlO71vF5cFSaJGR9gWtV4JncK9yEV/nWYgAp5kMd/v1/Cm85zBGaT
 DWhIM/JBGe7S+XnNITrRCrsy/HwgjSwFvTr7eKH1wb9+z16h/UIbqVWk08eguBjp14TwL41ILeY
 BFsjSb0hpnYqVsm//J92J5mLTKGYUaI9/tOZHzQ65jM/CN/1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to reduce noise, include just the file name into the generated
file headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/headergen2/headergen2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/headergen2/headergen2.c b/drivers/gpu/drm/msm/headergen2/headergen2.c
index d5a3eb7562ee..2e5c4593d865 100644
--- a/drivers/gpu/drm/msm/headergen2/headergen2.c
+++ b/drivers/gpu/drm/msm/headergen2/headergen2.c
@@ -377,13 +377,14 @@ static void printhead(struct fout f, struct rnndb *db) {
 		"The rules-ng-ng source files this header was generated from are:\n");
 	unsigned maxlen = 0;
 	for(i = 0; i < db->filesnum; ++i) {
-		unsigned len = strlen(db->files[i]);
+		unsigned len = strlen(basename(db->files[i]));
 		if(len > maxlen)
 			maxlen = len;
 	}
 	for(i = 0; i < db->filesnum; ++i) {
-		unsigned len = strlen(db->files[i]);
-		fprintf(f.file, "- %s%*s ", db->files[i], maxlen - len, "");
+		char *name = basename(db->files[i]);
+		unsigned len = strlen(name);
+		fprintf(f.file, "- %s%*s ", name, maxlen - len, "");
 		print_file_info(f.file, db->files[i]);
 	}
 	fprintf(f.file,

-- 
2.39.2


