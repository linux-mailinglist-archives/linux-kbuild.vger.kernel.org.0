Return-Path: <linux-kbuild+bounces-1063-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548A8667F5
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 03:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 915931F21DCB
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 02:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE5B12E78;
	Mon, 26 Feb 2024 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lL+VWtMq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D2D534
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Feb 2024 02:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913518; cv=none; b=e65JwZdMzvkG4WZzFUxv7kIn8/Cf7uZSWjJwUwFjYf9LZnpB9tFxbEUpS3JiX8UOs9TZSdzZVCUqCEsrnGROz/lwCrpwOJ7B4plPhvRgzf1bRkw80lidZFEVtLfJi+LEi9CfgoXf2CTAFubNmKkVYdZFuuLyFw1du8WmGkzWslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913518; c=relaxed/simple;
	bh=JyJ2naEA9+YJx/+oipu+eUllHx2U7M8qpx+d+P3kb+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I63+wZv2OjXPUEK4ulXUEFgW+8SW+Hz82pUpU0GxbZivQrGvY2QzJVUfh/qcxoltuuo+B1GLRBnjpwSWuCGKY9gXUfO64nYQNdEA81+uH1vEHBCGe2wzORCKjcYpPTwGXxASwvcQY/lvSVQBQjYCPdFstJp5Ou+VW8Mg14t1G3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lL+VWtMq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-512f7332252so1255798e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Feb 2024 18:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913515; x=1709518315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18tJ6UzqGWS5ZS/rCnpPVeNsGeBIHv5z+8hQsl9S7jI=;
        b=lL+VWtMqas+uG1y93l4GZGFjDOxzbb4s40zh/03l5oF36oSDH2Vnz3kCAXHj0pDKeB
         KkiI4EwGp++B7M7/6v+RLDNxGK9ed6oggCuIR78dAbW1OUwHKXFahqZXbUbc9/wsuGlo
         5YvAIdvYq5bUcKkhZjntUO/YjV68LUw2g4Ivd+sD097/xzHIDfa8IcPuv82Hcge3tDFL
         5uOBWOMoOTwcbfVpmrNIq+v+Ub32Ob6+UZV2AbmgzU/5yrnzMvuFkPVwy19OqAI3QRAP
         EwWymoE74UVamR8kV5R67RAnjWe7Vchw779mg0UmWtVwz3jlld1fHk5EqyK8DshfTkbV
         z+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913515; x=1709518315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18tJ6UzqGWS5ZS/rCnpPVeNsGeBIHv5z+8hQsl9S7jI=;
        b=ZnkUWgq3tK3lxC7KTHRXXu1G/AaE8YhjO3BBVUvVMiKOq1wGZOwxpbnox9m25mrtmM
         MkbAigL85CqSuBCcoqmUGwsMXypFDeqSiHwCzpK+GTQ+EDqV5HDWbxyNLnyUzqj35bR6
         zkT/uT0Wl5OsXs5gcaJQKmbUxtRvQDehYXtXqmuFiDVsfZErPCSvpd8L1uhXDNqnkors
         yuyJYALWclYyKT/DHVhnRvroAdIFPhTu0LK07QhnwxtkMGWlK282dqAnfwfW2RalmUgw
         fAqJNinpvbTIT4Q5gWuwUJ7d3NLCzsVRBuKtbaT3TLDkZ5z5Xvrv/kvs1UsxSTAzuvLB
         4dpA==
X-Gm-Message-State: AOJu0Yw8fyL3Lcd8SE8alyRLWy7P2mIDCmPcpv9qOyCNZibdJk+zE5Ww
	tXZFrjpwl4YlpZBrPXQ2cGzPO64S77pT+X+qf1OFdWedzQ4znVlYLIxlIMcg0Ds=
X-Google-Smtp-Source: AGHT+IGx7Awy//hcII4n+oRauO+5C95ueBAjeHayplcepthN/F68ja0f/KxiVX2XJaG/pH3wqhgU4w==
X-Received: by 2002:a05:6512:2109:b0:512:b932:7913 with SMTP id q9-20020a056512210900b00512b9327913mr2888939lfr.41.1708913515397;
        Sun, 25 Feb 2024 18:11:55 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:45 +0200
Subject: [PATCH RFC 09/12] drm/msm/headergen: generate _shipped files
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-9-86bb6c3346d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JyJ2naEA9+YJx/+oipu+eUllHx2U7M8qpx+d+P3kb+o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NhQ5hUimItcSECWaPO/JC8mPEonJzKnRRJr
 ZQN9JCP0jyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1XAgB/47QZNDdURBNmftlahtNPqFQ41iZc3XuPDbBZhQR69OOxcWir3zjFsCoPTsBoKQHuKDu5p
 QGsdtUFWG1eJAsrdIIer0q5RugUFdgC5MB+dwQ6rlDDkwyRYAzRfmoodyXCV6PEc6y7farR0RpK
 2lOSZb9+Fi39wUWtH9RpTOJjRQ3BZY1AgkfvT06IUs02MNq7jm5RQDLnLz+ymEVHcdgBqkr3ZHd
 2qdP8LuCXHR2g6uJoyXVsQE/h5JCHCoB73otR85c/w23NZc1KddSlzF9hzAEcEna1gBy0ZqyzBx
 J/rpd4H7zDnzZ+b+5OHDn3PWqehjd9jn81a8GmSQcEco5tJ2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Change headergen semantics to generate the .xml.h_shipped files instead
of just generating headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/headergen2/headergen2.c | 33 +++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/headergen2/headergen2.c b/drivers/gpu/drm/msm/headergen2/headergen2.c
index 2e5c4593d865..7d884fa547b2 100644
--- a/drivers/gpu/drm/msm/headergen2/headergen2.c
+++ b/drivers/gpu/drm/msm/headergen2/headergen2.c
@@ -417,30 +417,41 @@ static void printhead(struct fout f, struct rnndb *db) {
 
 int main(int argc, char **argv) {
 	char *file;
+	char *out_dir;
 	struct rnndb *db;
 	int i, j;
 
-	if (argc < 2) {
-		fprintf(stderr, "Usage:\n\theadergen database-file\n");
-		exit(1);
+	if (argv[1] && !strcmp(argv[1], "--no-asserts")) {
+		no_asserts = true;
+		argv++;
+		argc--;
 	}
 
-	if ((argc >= 3) && !strcmp(argv[1], "--no-asserts")) {
-		no_asserts = true;
-		file = argv[2];
-	} else {
-		file = argv[1];
+	if (argc != 3) {
+		fprintf(stderr, "Usage:\n\theadergen database-file out-dir\n");
+		exit(1);
 	}
 
+	file = argv[1];
+	out_dir = argv[2];
+
 	rnn_init();
 	db = rnn_newdb();
 	rnn_parsefile (db, file);
 	rnn_prepdb (db);
 	for(i = 0; i < db->filesnum; ++i) {
-		char *dstname = malloc(strlen(db->files[i]) + 3);
+		char *curfile = basename(db->files[i]);
+		char *dstname;
 		char *pretty;
-		strcpy(dstname, db->files[i]);
-		strcat(dstname, ".h");
+		int ret;
+
+		ret = asprintf(&dstname, "%s/%s.h_shipped",
+			       out_dir, curfile);
+		if (ret < 0) {
+			perror("asprintf");
+			exit(1);
+		}
+
 		struct fout f = { db->files[i], fopen(dstname, "w") };
 		if (!f.file) {
 			perror(dstname);

-- 
2.39.2


