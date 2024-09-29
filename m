Return-Path: <linux-kbuild+bounces-3828-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9546989697
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Sep 2024 19:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FB892848AE
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Sep 2024 17:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAF227713;
	Sun, 29 Sep 2024 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxC0UJnP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029AA38FB0;
	Sun, 29 Sep 2024 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727631188; cv=none; b=dCSrCo2PxH133gqYRQwu/OQfG+RdmR+iP5w3EhSHVjk36n7wtm2pDhEBhmb7GD2+nOH9Seep1RSgb9t2pp93RNU1l/9sRWcmbegS1Cg6MIFvEXA8xAQvG7JGLoUsVshIKenBsCm3mgO718MciwU+MemE1DeZZ0FkNS1b5iPnXg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727631188; c=relaxed/simple;
	bh=2VgBZc4+23cLmlDCc2tO1++tWH4VilOu/a5VqAsUs0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DC29hh0BTdGapBmwcQhMZ/XiOSxYm6SR6QC2MPjzE8QDfH3iCIOHCcE8haSuo4EHe3hUOC26vMNN7T2HVazIa3o+ya91r9mNasKr9yfpqjE50igq3WqOoVEGqiqdstjvw5fvVo5qIamlgQQ+jfUVzDVffbgtmDRRSdWI2fpgLKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxC0UJnP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9C9C4CEC5;
	Sun, 29 Sep 2024 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727631187;
	bh=2VgBZc4+23cLmlDCc2tO1++tWH4VilOu/a5VqAsUs0Y=;
	h=From:To:Cc:Subject:Date:From;
	b=sxC0UJnPxOtBdP81/U6TM1e96mZxPUEphglmPHRm7T88kEKGOA5LSNY8vuj4qZsyA
	 bKzNCitrokn8Mx0Q/y1HrUJIm9b52EyBm8r7D4DdY/MLAVQbU7dTHxL7kKUzCNC3tY
	 lENzlXJkSVlNRO6FB1mfXuP4y59NKkH3b/NAADFFjy2i7Xfzk+XGcdDu/1so2CdcMk
	 EwOaVzZjdOjtbZM/Hu56zEs6jPi0ZWsZ9aEXTjvMkTxkNgWN5gZttbWtcwrg53J+3t
	 Ev2mfN7OYM76K4PQ8yDJb5KE+LoHFlDnFDLl5elTcPwggGIieL27sKym5xvCF1ecsV
	 qEp2/NvOW1M5Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] usb: use "prompt" instead of "bool" for choice prompts
Date: Mon, 30 Sep 2024 02:32:36 +0900
Message-ID: <20240929173302.203827-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit fde192511bdb ("kconfig: remove tristate choice support"),
all choice blocks are now boolean. There is no longer a need to specify
the choice type explicitly.

Most choice blocks already use "prompt". Before the next commit removes
support for the "bool" syntax in choice entries, this commit converts
the remaining "bool" occurences under drivers/usb/.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/usb/dwc2/Kconfig    | 2 +-
 drivers/usb/dwc3/Kconfig    | 2 +-
 drivers/usb/isp1760/Kconfig | 2 +-
 drivers/usb/mtu3/Kconfig    | 2 +-
 drivers/usb/musb/Kconfig    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
index c131719367ec..d7af55a8eced 100644
--- a/drivers/usb/dwc2/Kconfig
+++ b/drivers/usb/dwc2/Kconfig
@@ -21,7 +21,7 @@ config USB_DWC2
 if USB_DWC2
 
 choice
-	bool "DWC2 Mode Selection"
+	prompt "DWC2 Mode Selection"
 	default USB_DWC2_DUAL_ROLE if (USB && USB_GADGET)
 	default USB_DWC2_HOST if (USB && !USB_GADGET)
 	default USB_DWC2_PERIPHERAL if (!USB && USB_GADGET)
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 31078f3d41b8..310d182e10b5 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -23,7 +23,7 @@ config USB_DWC3_ULPI
 	  controller.
 
 choice
-	bool "DWC3 Mode Selection"
+	prompt "DWC3 Mode Selection"
 	default USB_DWC3_DUAL_ROLE if (USB && USB_GADGET)
 	default USB_DWC3_HOST if (USB && !USB_GADGET)
 	default USB_DWC3_GADGET if (!USB && USB_GADGET)
diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
index 2ed2b73291d1..e19178f3cdd3 100644
--- a/drivers/usb/isp1760/Kconfig
+++ b/drivers/usb/isp1760/Kconfig
@@ -26,7 +26,7 @@ config USB_ISP1761_UDC
 if USB_ISP1760
 
 choice
-	bool "ISP1760 Mode Selection"
+	prompt "ISP1760 Mode Selection"
 	default USB_ISP1760_DUAL_ROLE if (USB && USB_GADGET)
 	default USB_ISP1760_HOST_ROLE if (USB && !USB_GADGET)
 	default USB_ISP1760_GADGET_ROLE if (!USB && USB_GADGET)
diff --git a/drivers/usb/mtu3/Kconfig b/drivers/usb/mtu3/Kconfig
index bf98fd36341d..d281da1cdbcc 100644
--- a/drivers/usb/mtu3/Kconfig
+++ b/drivers/usb/mtu3/Kconfig
@@ -21,7 +21,7 @@ config USB_MTU3
 
 if USB_MTU3
 choice
-	bool "MTU3 Mode Selection"
+	prompt "MTU3 Mode Selection"
 	default USB_MTU3_DUAL_ROLE if (USB && USB_GADGET)
 	default USB_MTU3_HOST if (USB && !USB_GADGET)
 	default USB_MTU3_GADGET if (!USB && USB_GADGET)
diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 9a8cf3de0617..9e45d12b81d3 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -29,7 +29,7 @@ config USB_MUSB_HDRC
 if USB_MUSB_HDRC
 
 choice
-	bool "MUSB Mode Selection"
+	prompt "MUSB Mode Selection"
 	default USB_MUSB_DUAL_ROLE if (USB && USB_GADGET)
 	default USB_MUSB_HOST if (USB && !USB_GADGET)
 	default USB_MUSB_GADGET if (!USB && USB_GADGET)
-- 
2.43.0


