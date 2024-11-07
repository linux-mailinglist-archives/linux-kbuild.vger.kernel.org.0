Return-Path: <linux-kbuild+bounces-4552-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 324BB9C0EEC
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 20:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 563101C217F3
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 19:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CB4215C43;
	Thu,  7 Nov 2024 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J9yw/BRs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457BD2170B2
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Nov 2024 19:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007902; cv=none; b=mFIQDHXckddx3sl3M9Ma/eAgd7ZF3Vt8881CqETcczUGPacTjfyX/AIVuPxDS6M/bnKkQq2m3pYwHWwAP1PU7nmCgF65AozMFe2stizrkXWjnPEB8DJltzNxHkbjn23bnOvccBHyGz680LsS/wIJwwGS/Y+Wd/AR9PE3g3Fts60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007902; c=relaxed/simple;
	bh=ND8duXxeqpOMTaKR32jDF37o2wNYr8J9a6+AaXeIoic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFbiP2dZWdY9yxO0kVwXLGNItMXlxZXNLB3FludqDM/GRuoF7FIBBQU6xYyVXMPCUcX5Yo3eJDqaUrKVf89dz+VAmqXQXG5OCVTe7Bsl24EPabnciUZ+qiLaxRFteaViQpP0iZQif6Bnif/TdD5Sbq3c/dvk+XVh5xI3kf8ttro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J9yw/BRs; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ede82dbb63so848106a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Nov 2024 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007901; x=1731612701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge6TnT0PL++7IUpHJoGRRwwYMPSP58r23n3kpkNEevA=;
        b=J9yw/BRslc9QTQAu86qviEViBgBF8Zw1ltJwOz/ogPboDfI2/tqhNX5uJVdb74jgik
         3OTwzY/1udnVZafZmFwgNQfB5UiOB+YQPvnFq8RG2bujrM0ga6EHRyVgBK/XZ0Dy9s4Q
         GUBtmV81emOsGrgvPUMQ7bIZ8oLNOJ5FBsvfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007901; x=1731612701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge6TnT0PL++7IUpHJoGRRwwYMPSP58r23n3kpkNEevA=;
        b=RzT/p5xNJTbrrYL7gUkAVOeOMS138vWbi4uW+rznVAwdxAlOH0IvLHjvyv4kIFLjuv
         IbepYKRPJUvBwO2xyosxgpsk8pUTuB2qB50dGnXcYqJ6hCArbsxA+X7JbYmcQUYAGczx
         vpxJf+cK4Z09syid+8yubLJXdILHYdp18vQ0jnEauejFBfiUtn3VXIVZOka20qVzDzSM
         23qR2jGRNBlF6xf4SWxC43T4/2Nzb4eqe6j3S9ZCPbYSX/TzGa02x+JIk3HMBYZTUjiJ
         HyHLVofa1/n//5w90R3zN1IiFu9oGDPdidq1+k4AXUfrKnjBp8dXLQnlCTZz0CiDPJTj
         VIIg==
X-Forwarded-Encrypted: i=1; AJvYcCVZPS4INh8mgLkUmi/XEOp/joux6om8SB5Invq0TMQT0P1zpKGTCJMkCgmu1J7PzpaLR65FdGhxnGUvI7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPXXJuBXGgh2zCsqrd4x/GYl0+YuF8QjaaGVomRyGmbu8cqm2O
	l7NFRcdfDghjqSe75OmAXrpuYYjtcYm/mbdov6T7zsIrFBzN/LUC9LQgYeH6aA==
X-Google-Smtp-Source: AGHT+IE7o1xJwA2XjuGz9LhbPKe/6CQOLFgBLUy5xzkzep2TbqXM20/rFdDiwN3eRoefW7Th2I/1zg==
X-Received: by 2002:a17:90b:3847:b0:2e2:e136:a931 with SMTP id 98e67ed59e1d1-2e9b16ea3e7mr488934a91.6.1731007900637;
        Thu, 07 Nov 2024 11:31:40 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2e9a5fd180fsm1869330a91.33.2024.11.07.11.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:40 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] usb: typec: Only use SVID for matching altmodes
Date: Thu,  7 Nov 2024 11:29:54 -0800
Message-ID: <20241107112955.v3.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107193021.2690050-1-abhishekpandit@chromium.org>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mode in struct typec_altmode is used to indicate the index of the
altmode on a port, partner or plug. It is used in enter mode VDMs but
doesn't make much sense for matching against altmode drivers or for
matching partner to port altmodes.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v3:
- Removed mode from altmode device ids
- Updated modalias for typecd bus to remove mode
- Re-ordered to start of series

Changes in v2:
- Update altmode_match to ignore mode entirely
- Also apply the same behavior to typec_match

 drivers/usb/typec/altmodes/displayport.c | 2 +-
 drivers/usb/typec/altmodes/nvidia.c      | 2 +-
 drivers/usb/typec/bus.c                  | 6 ++----
 drivers/usb/typec/class.c                | 4 ++--
 scripts/mod/devicetable-offsets.c        | 1 -
 scripts/mod/file2alias.c                 | 4 +---
 6 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 2f03190a9873..3245e03d59e6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -791,7 +791,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
 EXPORT_SYMBOL_GPL(dp_altmode_remove);
 
 static const struct typec_device_id dp_typec_id[] = {
-	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
+	{ USB_TYPEC_DP_SID },
 	{ },
 };
 MODULE_DEVICE_TABLE(typec, dp_typec_id);
diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altmodes/nvidia.c
index fe70b36f078f..2b77d931e494 100644
--- a/drivers/usb/typec/altmodes/nvidia.c
+++ b/drivers/usb/typec/altmodes/nvidia.c
@@ -24,7 +24,7 @@ static void nvidia_altmode_remove(struct typec_altmode *alt)
 }
 
 static const struct typec_device_id nvidia_typec_id[] = {
-	{ USB_TYPEC_NVIDIA_VLINK_SID, TYPEC_ANY_MODE },
+	{ USB_TYPEC_NVIDIA_VLINK_SID },
 	{ },
 };
 MODULE_DEVICE_TABLE(typec, nvidia_typec_id);
diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index aa879253d3b8..ae90688d23e4 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -454,8 +454,7 @@ static int typec_match(struct device *dev, const struct device_driver *driver)
 	const struct typec_device_id *id;
 
 	for (id = drv->id_table; id->svid; id++)
-		if (id->svid == altmode->svid &&
-		    (id->mode == TYPEC_ANY_MODE || id->mode == altmode->mode))
+		if (id->svid == altmode->svid)
 			return 1;
 	return 0;
 }
@@ -470,8 +469,7 @@ static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	if (add_uevent_var(env, "MODE=%u", altmode->mode))
 		return -ENOMEM;
 
-	return add_uevent_var(env, "MODALIAS=typec:id%04Xm%02X",
-			      altmode->svid, altmode->mode);
+	return add_uevent_var(env, "MODALIAS=typec:id%04X", altmode->svid);
 }
 
 static int typec_altmode_create_links(struct altmode *alt)
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 4b3047e055a3..febe453b96be 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -237,13 +237,13 @@ static int altmode_match(struct device *dev, void *data)
 	if (!is_typec_altmode(dev))
 		return 0;
 
-	return ((adev->svid == id->svid) && (adev->mode == id->mode));
+	return (adev->svid == id->svid);
 }
 
 static void typec_altmode_set_partner(struct altmode *altmode)
 {
 	struct typec_altmode *adev = &altmode->adev;
-	struct typec_device_id id = { adev->svid, adev->mode, };
+	struct typec_device_id id = { adev->svid };
 	struct typec_port *port = typec_altmode2port(adev);
 	struct altmode *partner;
 	struct device *dev;
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 9c7b404defbd..d3d00e85edf7 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -237,7 +237,6 @@ int main(void)
 
 	DEVID(typec_device_id);
 	DEVID_FIELD(typec_device_id, svid);
-	DEVID_FIELD(typec_device_id, mode);
 
 	DEVID(tee_client_device_id);
 	DEVID_FIELD(tee_client_device_id, uuid);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index c4cc11aa558f..218ccb7150bf 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1343,14 +1343,12 @@ static int do_tbsvc_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
-/* Looks like: typec:idNmN */
+/* Looks like: typec:idN */
 static int do_typec_entry(const char *filename, void *symval, char *alias)
 {
 	DEF_FIELD(symval, typec_device_id, svid);
-	DEF_FIELD(symval, typec_device_id, mode);
 
 	sprintf(alias, "typec:id%04X", svid);
-	ADD(alias, "m", mode != TYPEC_ANY_MODE, mode);
 
 	return 1;
 }
-- 
2.47.0.277.g8800431eea-goog


