Return-Path: <linux-kbuild+bounces-11992-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QELLNAPZuGmjkAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11992-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:30:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F19282A3A0B
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5CA230209B7
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 04:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA633379998;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRsSVi1g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4850736D4FC;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721803; cv=none; b=R7B1W5yeUZVRHM1ShHYeB4z3QLFRuYAp3Vh+nENYwFz1qz3PuAIu30JdvmIZB8FqocOcywU9IapYbQ4mw9l10AUVJaHQvzBAPf7QS/obuQ6nFoz0mnAqV69Ar4JMHX7o4IeZwez5Fvkrl3xGR4VR7pD5RSyFX3y0fN/D0jUwj9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721803; c=relaxed/simple;
	bh=90rMoHNtpikEEOX4hxu7KxohYPZTjuhD8cCrdkwCho4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhtqGCkrn9LI9Y+kYef3a8bDUuR1OmygU2krd4BZCxgapE9FOa3InxJodchcr+9FfSWph+JPexhhW6QkpPMk0NZuqKogFr4i1KmJFEebowW61WXSDfuibOwcPiGv943f6MU7qPNmkbHAAoOMrB/5WlF1J20wKYegcyZdXy4frGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRsSVi1g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E18DDC2BC9E;
	Tue, 17 Mar 2026 04:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773721803;
	bh=90rMoHNtpikEEOX4hxu7KxohYPZTjuhD8cCrdkwCho4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IRsSVi1g7WlEkI8pVUKi9MtaGzLiC7I8sSTHvz48V2YOrK/KM9FE22hQBcbPbryT8
	 yA+xtK3RoFt9b0q5UmlDSbflPzrNMW0y5XkJ5RvTyh0SDZ96Q2P3LhnG4EDV16ZlXb
	 QkRSFYlyRgZT8msPmVaN9VKkPaVrIQn51JmraxmNY6sg/4murMKamcLcQlRPVEmL3X
	 MquB+oKcFCiXEKF9GMKGaJKDY93UvyC3loIEr8gpGuEKa68efLsBhQZtzr7k6b/BLC
	 qDqJeIp/8w3C+JzRXTnHlZUuEzZO68q+z+h+VniCM7D2BO651XS1uqTTO7GdJWEGOc
	 MXMenGv8zVNkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDADFB5EAF;
	Tue, 17 Mar 2026 04:30:02 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 17 Mar 2026 09:59:52 +0530
Subject: [PATCH v6 2/9] serdev: Add an API to find the serdev controller
 associated with the devicetree node
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-pci-m2-e-v6-2-9c898f108d3d@oss.qualcomm.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=rr2lmVP0IC6lUnB67NHw0qDXlaCs5LnvUTeOalg9qug=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpuNjHP7OTLCI2v2JEVO7b4GY8c87LN9vRLUsYb
 MkGvu6rvciJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCabjYxwAKCRBVnxHm/pHO
 9ZAHB/4rn5Keq3wWhvaowq3W9YqMd9yLEZHQV886wlmogjs0wgzzh5fJUBMd3yGfKKvdjklZ/NF
 W/hl8xIId+94P5p3blvB1vN/jSKEd2eOfPveBS+ThJ3ayG8UN6cS4gen7hHfv6aVfH49jeq8cMv
 WNCnmLGtS46/uxBpjJTI2Px2y3P3N6qxUZGJ3Bz4YBBJ+fTplV0mjkr9or9oveKKSnJox08CkJx
 Xj0FOj0AzGycp8KZUOu470j3cOn60Gj8h9c708Xyd7RolCH1sx82JIYdNgh+fnVRXsyYvWwUd/q
 jk9buKNVQVfoMZwNcZBda0Ge5kv6fSdI78HEiJQWZjrTYopO
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11992-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: F19282A3A0B
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



