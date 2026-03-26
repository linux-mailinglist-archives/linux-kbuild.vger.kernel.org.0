Return-Path: <linux-kbuild+bounces-12274-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAIBCXHqxGmj5AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12274-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:12:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A0A33102B
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD49A30A37A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 08:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4F63B7B9E;
	Thu, 26 Mar 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a03kFoVJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAAF3B3C14;
	Thu, 26 Mar 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512401; cv=none; b=rt6yJZ59xUpG/qRydOHXvxUSMBjcJWNEvGxEguRWK86KwyACV0O7egoVdG83jfa7cjDLM0XCGYvCrNbx3ttov/ZN47693fUnm+iCQxOC9Xit0hHrZhxNTRziVj5zil5xLaHw0VVMQe+B7wP02VY0vjBqH+sonqR2bd1a+CYEGZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512401; c=relaxed/simple;
	bh=cUxQWPcUIxqHU9aDbacGWrwTw3HZXVXOi2watGla2fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lg7sYqTeOYwaS0/K2FVTXQtAmy65gOWKbO2Q4O6ijuhq1YeLuy0ofH8PW3LNPoaYF4EWT+u8FN54LnNc/E5wxqtMxN0Jy80nFqbrUGBHDPRRqR7doC+xdq74YQSXPduTge/RADAS4Tk/unxcz5TP4lCukh+OfG1ivx5lyoAls00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a03kFoVJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03C9BC2BCB4;
	Thu, 26 Mar 2026 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774512401;
	bh=cUxQWPcUIxqHU9aDbacGWrwTw3HZXVXOi2watGla2fs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a03kFoVJeGxzVGsMk5IIu/GPKWipAOjxMkGQ318jubu2CkqJ/KzlBw7IIQuEsy/63
	 j0F5Jzyrqdd7bghTEgbnQHjeV+3U0z+ccDW3iaQ1AS1JyNdxqYT5AtSxuWV0gstByU
	 eadJh6uAVMgKvYqCr6NUvT1vLe7RvCFzCVIUrIwkix14UEkjTRDI7j8NZMVYgoRbgz
	 hsnkWJDtqf2UCQpDqHJg356wAYtayysHnhflD6t3mxC3kooBXMF+CPxg3xE0vbYxeB
	 GOw4X+yrmfVbVc6blCNhhGnJfk5030ZTynjwdRw2cuH++6ckdnB6KdlANkiiP1sg7L
	 PYPdW8ryDaAhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE26D106F2FA;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 26 Mar 2026 13:36:36 +0530
Subject: [PATCH v7 8/8] power: sequencing: pcie-m2: Create serdev device
 for WCN7850 bluetooth
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-pci-m2-e-v7-8-43324a7866e6@oss.qualcomm.com>
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
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10866;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=idB7rpvSBQMtS24fVx41QmdeqC1DW1juy8+wOcFwZck=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpxOkN71mkppldChBzZHIYnAftETujoQqLBzvT9
 82WUo5Q3O+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCacTpDQAKCRBVnxHm/pHO
 9flfB/97yEJg/LD7zs2qnTskC+l6aF3wo98whG0oqt3OCuFGWf7q/W1B9q0aHG9Vsw14VUXUrQO
 ibYjfB5wv4MyQQn4mCZ/I0v8CKLQ3wWRgOomiTJZ9Rc4Pt3F9ey3AZ55jPv35AnWeG+YePTt0j+
 LBjXQoZjWTCBkc1D3yiUhrgGz+H72mpIiRb/JskTOwbd7kwEWx2cfhRpTLAslBBF3gpIfrzYFAS
 T2TzZMc0vk2nCTqOuqpn1+bnm+//1khi2Y7I6A1dw+pCnUu7MYSqr4ksYPMvqSrJPnhW2kbmN5c
 KtCbV9aKK1C6s1rnfquu8/8OMACZHy15Q0iuqUcSlQObXX0V
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12274-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-kbuild@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B3A0A33102B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

For supporting bluetooth over the non-discoverable UART interface of
WCN7850, create the serdev device after enumerating the PCIe interface.
This is mandatory since the device ID is only known after the PCIe
enumeration and the ID is used for creating the serdev device.

Since by default there is no OF or ACPI node for the created serdev,
create a dynamic OF 'bluetooth' node with the 'compatible' property and
attach it to the serdev device. This will allow the serdev device to bind
to the existing bluetooth driver.

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # ThinkPad T14s gen6 (arm64)
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/Kconfig          |   3 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c | 253 ++++++++++++++++++++++++++++--
 2 files changed, 240 insertions(+), 16 deletions(-)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index f5fff84566ba..1ec142525a4a 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -37,7 +37,8 @@ config POWER_SEQUENCING_TH1520_GPU
 
 config POWER_SEQUENCING_PCIE_M2
 	tristate "PCIe M.2 connector power sequencing driver"
-	depends on OF || COMPILE_TEST
+	depends on (PCI && OF) || COMPILE_TEST
+	select OF_DYNAMIC if OF
 	help
 	  Say Y here to enable the power sequencing driver for PCIe M.2
 	  connectors. This driver handles the power sequencing for the M.2
diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 3507cdcb1e7b..a75ca4fda2eb 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -12,9 +12,11 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/of_platform.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/provider.h>
 #include <linux/regulator/consumer.h>
+#include <linux/serdev.h>
 #include <linux/slab.h>
 
 struct pwrseq_pcie_m2_pdata {
@@ -30,6 +32,9 @@ struct pwrseq_pcie_m2_ctx {
 	struct notifier_block nb;
 	struct gpio_desc *w_disable1_gpio;
 	struct gpio_desc *w_disable2_gpio;
+	struct serdev_device *serdev;
+	struct of_changeset *ocs;
+	struct device *dev;
 };
 
 static int pwrseq_pcie_m2_vregs_enable(struct pwrseq_device *pwrseq)
@@ -172,11 +177,202 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	return PWRSEQ_NO_MATCH;
 }
 
-static void pwrseq_pcie_m2_free_regulators(void *data)
+static int pwrseq_m2_pcie_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
+					struct device_node *parent)
 {
-	struct pwrseq_pcie_m2_ctx *ctx = data;
+	struct device *dev = ctx->dev;
+	struct device_node *np;
+	int ret;
 
-	regulator_bulk_free(ctx->num_vregs, ctx->regs);
+	ctx->ocs = kzalloc_obj(*ctx->ocs);
+	if (!ctx->ocs)
+		return -ENOMEM;
+
+	of_changeset_init(ctx->ocs);
+
+	np = of_changeset_create_node(ctx->ocs, parent, "bluetooth");
+	if (!np) {
+		dev_err(dev, "Failed to create bluetooth node\n");
+		ret = -ENODEV;
+		goto err_destroy_changeset;
+	}
+
+	ret = of_changeset_add_prop_string(ctx->ocs, np, "compatible", "qcom,wcn7850-bt");
+	if (ret) {
+		dev_err(dev, "Failed to add bluetooth compatible: %d\n", ret);
+		goto err_destroy_changeset;
+	}
+
+	ret = of_changeset_apply(ctx->ocs);
+	if (ret) {
+		dev_err(dev, "Failed to apply changeset: %d\n", ret);
+		goto err_destroy_changeset;
+	}
+
+	ret = device_add_of_node(&ctx->serdev->dev, np);
+	if (ret) {
+		dev_err(dev, "Failed to add OF node: %d\n", ret);
+		goto err_revert_changeset;
+	}
+
+	return 0;
+
+err_revert_changeset:
+	of_changeset_revert(ctx->ocs);
+err_destroy_changeset:
+	of_changeset_destroy(ctx->ocs);
+	kfree(ctx->ocs);
+	ctx->ocs = NULL;
+
+	return ret;
+}
+
+static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
+{
+	struct serdev_controller *serdev_ctrl;
+	struct device *dev = ctx->dev;
+	int ret;
+
+	struct device_node *serdev_parent __free(device_node) =
+		of_graph_get_remote_node(dev_of_node(ctx->dev), 3, 0);
+	if (!serdev_parent)
+		return 0;
+
+	serdev_ctrl = of_find_serdev_controller_by_node(serdev_parent);
+	if (!serdev_ctrl)
+		return 0;
+
+	/* Bail out if the device was already attached to this controller */
+	if (serdev_ctrl->serdev) {
+		serdev_controller_put(serdev_ctrl);
+		return 0;
+	}
+
+	ctx->serdev = serdev_device_alloc(serdev_ctrl);
+	if (!ctx->serdev) {
+		ret = -ENOMEM;
+		goto err_put_ctrl;
+	}
+
+	ret = pwrseq_m2_pcie_create_bt_node(ctx, serdev_parent);
+	if (ret)
+		goto err_free_serdev;
+
+	ret = serdev_device_add(ctx->serdev);
+	if (ret) {
+		dev_err(dev, "Failed to add serdev for WCN7850: %d\n", ret);
+		goto err_free_dt_node;
+	}
+
+	serdev_controller_put(serdev_ctrl);
+
+	return 0;
+
+err_free_dt_node:
+	device_remove_of_node(&ctx->serdev->dev);
+	of_changeset_revert(ctx->ocs);
+	of_changeset_destroy(ctx->ocs);
+	kfree(ctx->ocs);
+	ctx->ocs = NULL;
+err_free_serdev:
+	serdev_device_put(ctx->serdev);
+	ctx->serdev = NULL;
+err_put_ctrl:
+	serdev_controller_put(serdev_ctrl);
+
+	return ret;
+}
+
+static void pwrseq_pcie_m2_remove_serdev(struct pwrseq_pcie_m2_ctx *ctx)
+{
+	if (ctx->serdev) {
+		device_remove_of_node(&ctx->serdev->dev);
+		serdev_device_remove(ctx->serdev);
+		ctx->serdev = NULL;
+	}
+
+	if (ctx->ocs) {
+		of_changeset_revert(ctx->ocs);
+		of_changeset_destroy(ctx->ocs);
+		kfree(ctx->ocs);
+		ctx->ocs = NULL;
+	}
+}
+
+static int pwrseq_m2_pcie_notify(struct notifier_block *nb, unsigned long action,
+			      void *data)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = container_of(nb, struct pwrseq_pcie_m2_ctx, nb);
+	struct pci_dev *pdev = to_pci_dev(data);
+	int ret;
+
+	/*
+	 * Check whether the PCI device is associated with this M.2 connector or
+	 * not, by comparing the OF node of the PCI device parent and the Port 0
+	 * (PCIe) remote node parent OF node.
+	 */
+	struct device_node *pci_parent __free(device_node) =
+			of_graph_get_remote_node(dev_of_node(ctx->dev), 0, 0);
+	if (!pci_parent || (pci_parent != pdev->dev.parent->of_node))
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		/* Create serdev device for WCN7850 */
+		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107) {
+			ret = pwrseq_pcie_m2_create_serdev(ctx);
+			if (ret)
+				return notifier_from_errno(ret);
+		}
+		break;
+	case BUS_NOTIFY_REMOVED_DEVICE:
+		/* Destroy serdev device for WCN7850 */
+		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107)
+			pwrseq_pcie_m2_remove_serdev(ctx);
+
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static bool pwrseq_pcie_m2_check_remote_node(struct device *dev, u8 port, u8 endpoint,
+					     const char *node)
+{
+	struct device_node *remote __free(device_node) =
+			of_graph_get_remote_node(dev_of_node(dev), port, endpoint);
+
+	if (remote && of_node_name_eq(remote, node))
+		return true;
+
+	return false;
+}
+
+/*
+ * If the connector exposes a non-discoverable bus like UART, the respective
+ * protocol device needs to be created manually with the help of the notifier
+ * of the discoverable bus like PCIe.
+ */
+static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx, struct device *dev)
+{
+	int ret;
+
+	/*
+	 * Register a PCI notifier for Key E connector that has PCIe as Port
+	 * 0/Endpoint 0 interface and Serial as Port 3/Endpoint 0 interface.
+	 */
+	if (pwrseq_pcie_m2_check_remote_node(dev, 3, 0, "serial")) {
+		if (pwrseq_pcie_m2_check_remote_node(dev, 0, 0, "pcie")) {
+			ctx->dev = dev;
+			ctx->nb.notifier_call = pwrseq_m2_pcie_notify;
+			ret = bus_register_notifier(&pci_bus_type, &ctx->nb);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Failed to register notifier for serdev\n");
+		}
+	}
+
+	return 0;
 }
 
 static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
@@ -190,6 +386,7 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, ctx);
 	ctx->of_node = of_node_get(dev->of_node);
 	ctx->pdata = device_get_match_data(dev);
 	if (!ctx->pdata)
@@ -206,21 +403,21 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to get all regulators\n");
 
+	ctx->num_vregs = ret;
+
 	ctx->w_disable1_gpio = devm_gpiod_get_optional(dev, "w-disable1", GPIOD_OUT_HIGH);
-	if (IS_ERR(ctx->w_disable1_gpio))
-		return dev_err_probe(dev, PTR_ERR(ctx->w_disable1_gpio),
+	if (IS_ERR(ctx->w_disable1_gpio)) {
+		ret = dev_err_probe(dev, PTR_ERR(ctx->w_disable1_gpio),
 				     "Failed to get the W_DISABLE_1# GPIO\n");
+		goto err_free_regulators;
+	}
 
 	ctx->w_disable2_gpio = devm_gpiod_get_optional(dev, "w-disable2", GPIOD_OUT_HIGH);
-	if (IS_ERR(ctx->w_disable2_gpio))
-		return dev_err_probe(dev, PTR_ERR(ctx->w_disable2_gpio),
+	if (IS_ERR(ctx->w_disable2_gpio)) {
+		ret = dev_err_probe(dev, PTR_ERR(ctx->w_disable2_gpio),
 				     "Failed to get the W_DISABLE_2# GPIO\n");
-
-	ctx->num_vregs = ret;
-
-	ret = devm_add_action_or_reset(dev, pwrseq_pcie_m2_free_regulators, ctx);
-	if (ret)
-		return ret;
+		goto err_free_regulators;
+	}
 
 	config.parent = dev;
 	config.owner = THIS_MODULE;
@@ -229,11 +426,36 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 	config.targets = ctx->pdata->targets;
 
 	ctx->pwrseq = devm_pwrseq_device_register(dev, &config);
-	if (IS_ERR(ctx->pwrseq))
-		return dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
+	if (IS_ERR(ctx->pwrseq)) {
+		ret = dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
 				     "Failed to register the power sequencer\n");
+		goto err_free_regulators;
+	}
+
+	/*
+	 * Register a notifier for creating protocol devices for
+	 * non-discoverable busses like UART.
+	 */
+	ret = pwrseq_pcie_m2_register_notifier(ctx, dev);
+	if (ret)
+		goto err_free_regulators;
 
 	return 0;
+
+err_free_regulators:
+	regulator_bulk_free(ctx->num_vregs, ctx->regs);
+
+	return ret;
+}
+
+static void pwrseq_pcie_m2_remove(struct platform_device *pdev)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = platform_get_drvdata(pdev);
+
+	bus_unregister_notifier(&pci_bus_type, &ctx->nb);
+	pwrseq_pcie_m2_remove_serdev(ctx);
+
+	regulator_bulk_free(ctx->num_vregs, ctx->regs);
 }
 
 static const struct of_device_id pwrseq_pcie_m2_of_match[] = {
@@ -255,6 +477,7 @@ static struct platform_driver pwrseq_pcie_m2_driver = {
 		.of_match_table = pwrseq_pcie_m2_of_match,
 	},
 	.probe = pwrseq_pcie_m2_probe,
+	.remove = pwrseq_pcie_m2_remove,
 };
 module_platform_driver(pwrseq_pcie_m2_driver);
 

-- 
2.51.0



