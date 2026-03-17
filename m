Return-Path: <linux-kbuild+bounces-11993-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E+nHPTYuGmjkAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11993-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:30:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A12A39B6
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A36F3037F36
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 04:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D168737AA64;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AksK2gIg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE4E36E477;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721803; cv=none; b=Gefb8AigL8ESDUKHy9YCe/0Fj7FKt7c/NOhe4/8W6lgDaNrWH6zvEnjYHpnkTKXE4lE5L5aetYMF/AtpXRAqja7RVbtS63jyUUdMkOAvfemCGYWz9nNfWMgGTtwisre8lly2C55akgze1OGttv82Gu2c23KkF1CjdopWdSGbcLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721803; c=relaxed/simple;
	bh=JoCqd4qTmhZAw9Ra/kUSAYchs5sr6tzJ0I7Nt266T1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FO0qnqhU+OGqByebql6Wt4vPtL7bm0iN2RTkGs4kHONbD2mqPctE67+I1TVSNGruzexV59vF1yE5ggF9CeYDwpka80Dm0CuoJURE1EX7J5NfDW/6oJHjL5Xg18CWyTlTB0D+T7OUc1U4y0SFfuSzaOEn9mg3Vo6QRvrrcKFMPLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AksK2gIg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2FFCC4AF09;
	Tue, 17 Mar 2026 04:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773721803;
	bh=JoCqd4qTmhZAw9Ra/kUSAYchs5sr6tzJ0I7Nt266T1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AksK2gIgIPyYByAvwm5WugRT610NCVqFuKYafU0bCYZ60gDnWGeXiwVHFVaL6YGSn
	 ow/8WubzwXhqDGYFdnjaLEfYYlg4aU+ewNE46ahRmPYXzDEH1Cap6d1WSKemLhu+Yd
	 bwrMz806TDOcyCJRmyIHxAvopcxXA3F/FThclIdlxaJFVHKgK9030FvtcCjOFhg+0r
	 P6C8nfw7r68JrCEWlYugAWkjmBIiUYq+KeR3+8RQ2TliARhyEi3BKcg14g73oIY83g
	 NkajgP7LXWoKW2Oin66UgAnFgYHrDbg+oKoRR9SCykp594TNrdMUrq6O9gE3MIsysM
	 mu6PtPTZB7QMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE445FB5EB6;
	Tue, 17 Mar 2026 04:30:02 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 17 Mar 2026 09:59:53 +0530
Subject: [PATCH v6 3/9] serdev: Do not return -ENODEV from
 of_serdev_register_devices() if external connector is used
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-pci-m2-e-v6-3-9c898f108d3d@oss.qualcomm.com>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
In-Reply-To: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-acpi@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=9JYNk+DMPq2LlZQfTiexJ4EeAYXDboalcaCh+TYovs0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpuNjHCVxcR2eU20/cYNvdftr00vaJ2V7UvPmaH
 ymEVn5El6iJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCabjYxwAKCRBVnxHm/pHO
 9ciYB/97N4zLhjZr8iceNjwbuRKrCaK0uDrMyc88oKP1joAcuT6eaUaj9C4ac965XDtFjvjgQcd
 HuwZVvPK4edCTJ07RJUPS/RII7SYHgt1Qp8I6dgYWfHD+zpYh1AtJQ8h4rZ1SL6HnMX3FPKAoOc
 +juE9NbztuXO6VsYVDmE3OPHix3rydnJf4nJKmI0Vzfdw2NZJOoUUaheS+m3P21exNVYXN4PyZr
 Fbx8q8CPiqbYDQ8A3ghk65Fy5xPFJfpoLEVq1y9Q0bRNiYFgj5OxjuT7FhchuSArGheEnntt+T4
 oiqiSZt1qADyi4zQnyeOBcuo4wbY2gNTewEHkCOn25cCPAN8
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11993-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-kbuild@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 298A12A39B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

If an external connector like M.2 is connected to the serdev controller
in DT, then the serdev devices may be created dynamically by the connector
driver. So do not return -ENODEV from of_serdev_register_devices() if the
static nodes are not found and the graph node is used.

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # ThinkPad T14s gen6 (arm64)
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/tty/serdev/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index bf88b95f7458..e9d044a331b0 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -561,7 +562,13 @@ static int of_serdev_register_devices(struct serdev_controller *ctrl)
 		} else
 			found = true;
 	}
-	if (!found)
+
+	/*
+	 * When the serdev controller is connected to an external connector like
+	 * M.2 in DT, then the serdev devices may be created dynamically by the
+	 * connector driver.
+	 */
+	if (!found && !of_graph_is_present(dev_of_node(&ctrl->dev)))
 		return -ENODEV;
 
 	return 0;

-- 
2.51.0



