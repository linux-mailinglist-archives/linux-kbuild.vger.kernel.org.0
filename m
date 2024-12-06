Return-Path: <linux-kbuild+bounces-5026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2F9E7CAF
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Dec 2024 00:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CC4816C7FC
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 23:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F84213E7E;
	Fri,  6 Dec 2024 23:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rvp+WWeL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D29212FB2
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Dec 2024 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528325; cv=none; b=Otikc3RCgDRIYuhXfmU30kFo35Ha7mzSzHbobGTqAg1WCcGc1iIsAMEf9myX6cIBwoxgRnlANp92vWW8H424QM9/2MOpfGspN0te8IyRiiHezekQdK8XP8qM73/Rv5qj1TvSahJ9ChsAz3CHIzNDuL9Heeo2GbNNCTnb1LaAINQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528325; c=relaxed/simple;
	bh=Wa7Kv7PricBjMroxEO0Q9NJCwPJQ0U69/lCUJwLLOoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyVmg48opOkFaoOCpb9UxxNl6UHGBlm6vMAuzSZR+tpvxkpMMvm4K1F5f7D3dE88O25aTL9BgCpnrJ8DczSqmBpVJMqdTlfDofMzxxQazSzIggqixTWMSUGJA9BOxmJs+TAwdwDRc7ZT9CDZMOiuNwE5wm9wVIP06esPB8qDsRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rvp+WWeL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-724d23df764so2616459b3a.1
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Dec 2024 15:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733528323; x=1734133123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npc5/EXwRgV9fZkcYMR5vMPbJLkeKsCQO+ev3yk2o1U=;
        b=Rvp+WWeLyvJtHNcbfMwhxHPFbpZPCajJ49QfKh36ep8dKX7cg+l23U8M/rTEF+0BHX
         Yz5XM7uAoW+Cf1i0UDcdhmBD4X5mbEg3WDMmp4ncAlG7DGgfqodt29ROHI/jV9LqY4Ee
         gapUR74zeKWz97xQDcazDhLOatXydswt/TNGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528323; x=1734133123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npc5/EXwRgV9fZkcYMR5vMPbJLkeKsCQO+ev3yk2o1U=;
        b=i/kZmj6MW6EIOs5HW/o/BLeqXM5BkHYQmlwlPOuToUwRpB09EcVeIXNbdoRhXUvNML
         7V7iyedo5V71loiAFVU1r+tdNiShgBdGTxuWJLd7wLbmbGq5RDXuM9OQk+l2nlm5xzgu
         EipANCti1nypX+JGFmyLrarLqGRiF1XGl6QLZmKfEAjw8Yef3EgBiA17yGKA8+rp+ShM
         amqOdWKHim3lXhu4Iw3ZFWdUSgDZJ97LKfVteOaOnSjqrOZtwzTQ664y0tbmM1dhb8YA
         liiLSOjFLXeYYijqzPQOV+YiyRkbPaj1FHyxn8CjlqUEPPZHQimKC30LEYIENMTdzKkn
         w1DA==
X-Forwarded-Encrypted: i=1; AJvYcCVSdX83i/Fg07HG50nbspNKOGvI3vr3ZrqAcprq6jYXnIfSculO7FHX4QedlSXUhb1ValYzVrwqfA6HhJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkGPX1Re2g+vJLTE5WJ87BagfK7xmDNcFvr1t0R80gV3jNGLB
	gN/9qgaieTDO2Dzl2YNFhKuYArEgxhgfLijk9ymJE7bWi8WfstFQj/YuOrisvw==
X-Gm-Gg: ASbGnctQ4Dpuoi3j6h7ooxvWSWUTJnkbyMNtme4+Zs40xvArfqAVeAYl8783/aEvSy+
	2uIgvvM14pGl0kHg4L0hT5L5RK4S/lTAAI+iF9isy4o8BHqhWSzzYsNmQgZV+Vp4rjRqge9+OGM
	1FM94hLakDLG9f5PCR1RYClDyID3JlXoH0EUBLpWj9K8a8kTuuyG8f4XCYkEboGAQve5MhIYJyW
	SA4LH5njHhiwRvRMExvm5moyh4TKxjLx0/QNkOQCJvTcBXK23N2wn5tBgG5Soyqi22k2SP7RT05
	apcC20RCa0I99erhXDszNJZ+
X-Google-Smtp-Source: AGHT+IEwnZn4JmHjf3RRZuf4aJQ3xLLJws8lCWbViXA/5lZ1RWNF9JnUYcLQmuMX0s00k7x5Jh8dAg==
X-Received: by 2002:a17:903:110f:b0:215:44fe:1640 with SMTP id d9443c01a7336-21614d1f22amr59537635ad.3.1733528323337;
        Fri, 06 Dec 2024 15:38:43 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-215f8e5f2d6sm33999035ad.71.2024.12.06.15.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:38:42 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	pmalani@chromium.org,
	jthies@google.com,
	dmitry.baryshkov@linaro.org,
	badhri@google.com,
	rdbabiera@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] usb: typec: Only use SVID for matching altmodes
Date: Fri,  6 Dec 2024 15:38:12 -0800
Message-ID: <20241206153813.v4.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206233830.2401638-1-abhishekpandit@chromium.org>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
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

(no changes since v3)

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
2.47.0.338.g60cca15819-goog


