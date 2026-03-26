Return-Path: <linux-kbuild+bounces-12269-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HyZABbqxGkz5AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12269-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:11:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBC1330EB6
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D27D93041BC6
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 08:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39CF35F170;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSUoMf7R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951433ADAC;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512400; cv=none; b=pGopi+wxqmKjlpJtyxhQ/J+FOj5SVFwOd9935hkpHAdcjhxdv/hJ2JhDE3D4PO/6tCjk0Vw7Q7hTvbcToQVzMhWrWrCr+MOlveQMcdIUd+ghzJtmVupVJdp7eHIVJISnWPS+Uc54sbC4XXumMP2yMsyUvO3v4ZnIvGd8RApsqL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512400; c=relaxed/simple;
	bh=90rMoHNtpikEEOX4hxu7KxohYPZTjuhD8cCrdkwCho4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CJrNPvnsp9k4EW1l5pAZGjGUfb/VsViAAbGQWYCcBILAzN8DqVa7fZh5osQzWJsQfwtVvF7HsyZh1tIJyAxX8MeNydUOxZRr4hhatGOYli5oUqsBuDiqxC57HoGr4q0R7ntJTc2MRtlweBPalh0Bp0xKg+44yBFFnG4X3Y80ub4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSUoMf7R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C1F4C2BCB1;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774512400;
	bh=90rMoHNtpikEEOX4hxu7KxohYPZTjuhD8cCrdkwCho4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VSUoMf7RhRL6XWXGd4mB8B+FTVTqYZfDUov0jI/YT+tcrFj+ZqPFSmCYkQgAij6od
	 ZvMhHeQLKBsDKRVJ/VdKqApFKQegyaggZYQrqwTlSf4NsPyxfo+ReuW3afaP66NqYn
	 fs1N2SReU+iI5+bblk1v0A2Qq395tYa2zA8oSVhmoCFDE2eL6NVANUmYQPXkrboUN4
	 n/08EUj0c/EiET7vBeT1ptYl9DPCN9hD83CE/BfoGBZzNE1QNeUYZN8kxMkKbb8DUl
	 L/pZOJ9by1ekkiAV5z0EL+hbPZlUhS4mmkl4yDUFZgbhwTBoPUAzYIsV7hhnIHPM8Z
	 IAiHN910O4OoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55653106F2F3;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 26 Mar 2026 13:36:30 +0530
Subject: [PATCH v7 2/8] serdev: Add an API to find the serdev controller
 associated with the devicetree node
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-pci-m2-e-v7-2-43324a7866e6@oss.qualcomm.com>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
In-Reply-To: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=rr2lmVP0IC6lUnB67NHw0qDXlaCs5LnvUTeOalg9qug=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpxOkNFnPCY8rlImwmoav5x6RK0WOCh1k67UnkK
 tWxcXlgZmSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCacTpDQAKCRBVnxHm/pHO
 9XKQB/9CSXeRJwS5NhVSb4wiX3OflP1zFS299ahwT+wJ/WPmuWbeRd7xFOmfaCHyxHa3z7q4+Z4
 uOwpqWolIy+p2mDbVuDufH1pTUjYCZ4V3z63MWM6tUB4cWaUqf0Bqv09LwOiaJ60fSvgGk3I8+3
 /DhHBpnSID+mbL/nQxvlIqoWDvsi1RCHAl3TJzup7yyJq6507KDw3lXW2SesGmy1DnH3k96xt6i
 u2KunrYZaUQZx47kXE8MdNR3dQKI6oDdWNK+IjhhoHYmJUErD7jTq8Mmd33VXoKteKBL+Knjh5v
 RmR7FAslGJokUbE6ad1rbPmMnYzzLYQBQl2yY3iF+HY9GgYr
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12269-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9BBC1330EB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Add of_find_serdev_controller_by_node() API to find the serdev controller
device associated with the devicetree node.

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # ThinkPad T14s gen6 (arm64)
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/tty/serdev/core.c | 19 +++++++++++++++++++
 include/linux/serdev.h    |  9 +++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index 8f25510f89b6..bf88b95f7458 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -514,6 +514,25 @@ struct serdev_controller *serdev_controller_alloc(struct device *host,
 }
 EXPORT_SYMBOL_GPL(serdev_controller_alloc);
 
+#ifdef CONFIG_OF
+/**
+ * of_find_serdev_controller_by_node() - Find the serdev controller associated
+ *					 with the devicetree node
+ * @node:	Devicetree node
+ *
+ * Return: Pointer to the serdev controller associated with the node. NULL if
+ * the controller is not found. Caller is responsible for calling
+ * serdev_controller_put() to drop the reference.
+ */
+struct serdev_controller *of_find_serdev_controller_by_node(struct device_node *node)
+{
+	struct device *dev = bus_find_device_by_of_node(&serdev_bus_type, node);
+
+	return (dev && dev->type == &serdev_ctrl_type) ? to_serdev_controller(dev) : NULL;
+}
+EXPORT_SYMBOL_GPL(of_find_serdev_controller_by_node);
+#endif
+
 static int of_serdev_register_devices(struct serdev_controller *ctrl)
 {
 	struct device_node *node;
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index 0c7d3c27d1f8..188c0ba62d50 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -334,4 +334,13 @@ static inline bool serdev_acpi_get_uart_resource(struct acpi_resource *ares,
 }
 #endif /* CONFIG_ACPI */
 
+#ifdef CONFIG_OF
+struct serdev_controller *of_find_serdev_controller_by_node(struct device_node *node);
+#else
+static inline struct serdev_controller *of_find_serdev_controller_by_node(struct device_node *node)
+{
+	return NULL;
+}
+#endif /* CONFIG_OF */
+
 #endif /*_LINUX_SERDEV_H */

-- 
2.51.0



