Return-Path: <linux-kbuild+bounces-11995-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIqxFg3ZuGmjkAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11995-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:31:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A52A3A39
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAE04300E6B7
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 04:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6BA37B02D;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBWia1kv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749CB374734;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721803; cv=none; b=V42x0IfrQU7JX5YOemdn4du6V9D0SkYQ9Z9wjzdtsaFp5XFg94rlzEYS+mg0IgWiz5ftjmgGgRlrwKtJ16XUm2/SXoQwTQrS9AqYoo3QY4GjqTsVTMfXAcvV5NBmhPS+6R9QoRGLt9pN6/YypNawTquODZwBaB8R5y7mPmWLI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721803; c=relaxed/simple;
	bh=QPg5ucT2J9JR6E3rS7caTqzm372tAM2YlgwRdg7/hwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiJKbpKhmBtDeGYJGLKsJ+m6qaSmBqBlREVxyS9UshXz3xym40m4U/uCIh+voXHnUNNcWa+m3qy3cu9MNxvEbix4kAQKUa9Yi2VpaqoI1BdFgvz68mqzi+pYa5IW5kJALAzxKa+e3+mbSKudwHbOAvSFJB4SVgQ276/VwLh9yus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBWia1kv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D6FEC4AF60;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773721803;
	bh=QPg5ucT2J9JR6E3rS7caTqzm372tAM2YlgwRdg7/hwg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QBWia1kvU0hzr9/IIMmiMugwqXQui+E5Zx0jATpiYOwYOK0lAS8n/RLftJg5KaA14
	 7VZQOVGDiQyxORYefUTsU1j9P18wxbOL8wxqtXnZmG2hFAuZpr5YdG+ADjgYoZ1ceP
	 q+e9Njs6j5DnE2G6/sBBB+VqXUuaRGp7NK2QIrlBtYfxQZgtivjpGAMOwOOKMLlLQm
	 2O6djr56VWXvd4czVXlyqSIO8+HLfJ77KUD2sjkv3bjlJUvgR7hlnAnY4DzkfNTkaw
	 bRuj2DMujfRs3Bf0maFHBe1Q5jHSe1YnHyMsSNzC8Wb4uLCcXq3Ncaxa+3qOQqjwLa
	 u4KYFagK0jgvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4137FFB5EAF;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 17 Mar 2026 09:59:58 +0530
Subject: [PATCH v6 8/9] power: sequencing: pcie-m2: Add support for PCIe
 M.2 Key E connectors
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-pci-m2-e-v6-8-9c898f108d3d@oss.qualcomm.com>
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
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6901;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=HRGptE1JIyA395dlxkM3raRO8gPG2oSfeqDUBhjL6YY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpuNjI88cHDGNTObFzDe79dog7fTAXqu7YQQQfm
 kCHUeJi2vGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCabjYyAAKCRBVnxHm/pHO
 9S/FB/9gtY/+oWrElNEe20sUpacFpvS2nuWpFnoOKST0NqPD5ea7OCiFxB5Vsv725QmDRpfGjPO
 mdpEPBabPEbHLoRm55+doWY4j8e1EMpk8mObda+e1ALD2Hqrbl3G8Rw3g4g0ZHNK/l+jPW2wKem
 pZO9EqEko9yPk9pAE29G+xQrW8zMIiI7Fi/kN0gtiL3GkDr0RXIxInGcARFLuQeGycJch5qYWpM
 uqcUgk+94ysca0G2SRWqdBmMZVXJBFGlVoM7u5vbm2JV4vsOQCl5kl03xQbgYQ8gIqsSzQ5ERt6
 I8/oNDhLugHePcQ3fI2o8+QhYNI2hszIQRe491uGcFC56XUa
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11995-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 9C2A52A3A39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Add support for handling the power sequence of the PCIe M.2 Key E
connectors. These connectors are used to attach the Wireless Connectivity
devices to the host machine including combinations of WiFi, BT, NFC using
interfaces such as PCIe/SDIO for WiFi, USB/UART for BT and I2C for NFC.

Currently, this driver supports only the PCIe interface for WiFi and UART
interface for BT. The driver also only supports driving the 3.3v/1.8v power
supplies and W_DISABLE{1/2}# GPIOs. The optional signals of the Key E
connectors are not currently supported.

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # ThinkPad T14s gen6 (arm64)
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 107 ++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 6 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index d31a7dd8b35c..3507cdcb1e7b 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -5,10 +5,13 @@
  */
 
 #include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/provider.h>
 #include <linux/regulator/consumer.h>
@@ -25,16 +28,18 @@ struct pwrseq_pcie_m2_ctx {
 	struct regulator_bulk_data *regs;
 	size_t num_vregs;
 	struct notifier_block nb;
+	struct gpio_desc *w_disable1_gpio;
+	struct gpio_desc *w_disable2_gpio;
 };
 
-static int pwrseq_pcie_m2_m_vregs_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pcie_m2_vregs_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return regulator_bulk_enable(ctx->num_vregs, ctx->regs);
 }
 
-static int pwrseq_pcie_m2_m_vregs_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pcie_m2_vregs_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
@@ -43,18 +48,84 @@ static int pwrseq_pcie_m2_m_vregs_disable(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_vregs_unit_data = {
 	.name = "regulators-enable",
-	.enable = pwrseq_pcie_m2_m_vregs_enable,
-	.disable = pwrseq_pcie_m2_m_vregs_disable,
+	.enable = pwrseq_pcie_m2_vregs_enable,
+	.disable = pwrseq_pcie_m2_vregs_disable,
 };
 
-static const struct pwrseq_unit_data *pwrseq_pcie_m2_m_unit_deps[] = {
+static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
 	&pwrseq_pcie_m2_vregs_unit_data,
 	NULL
 };
 
+static int pwrseq_pci_m2_e_uart_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
+}
+
+static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
+}
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
+	.name = "uart-enable",
+	.deps = pwrseq_pcie_m2_unit_deps,
+	.enable = pwrseq_pci_m2_e_uart_enable,
+	.disable = pwrseq_pci_m2_e_uart_disable,
+};
+
+static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);
+}
+
+static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
+}
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
+	.name = "pcie-enable",
+	.deps = pwrseq_pcie_m2_unit_deps,
+	.enable = pwrseq_pci_m2_e_pcie_enable,
+	.disable = pwrseq_pci_m2_e_pcie_disable,
+};
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
 	.name = "pcie-enable",
-	.deps = pwrseq_pcie_m2_m_unit_deps,
+	.deps = pwrseq_pcie_m2_unit_deps,
+};
+
+static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
+{
+	/*
+	 * FIXME: This delay is only required for some Qcom WLAN/BT cards like
+	 * WCN7850 and not for all devices. But currently, there is no way to
+	 * identify the device model before enumeration.
+	 */
+	msleep(50);
+
+	return 0;
+}
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
+	.name = "uart",
+	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
+	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+};
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
+	.name = "pcie",
+	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
+	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
@@ -62,11 +133,21 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 	.unit = &pwrseq_pcie_m2_m_pcie_unit_data,
 };
 
+static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
+	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_uart_target_data,
+	NULL
+};
+
 static const struct pwrseq_target_data *pwrseq_pcie_m2_m_targets[] = {
 	&pwrseq_pcie_m2_m_pcie_target_data,
 	NULL
 };
 
+static const struct pwrseq_pcie_m2_pdata pwrseq_pcie_m2_e_of_data = {
+	.targets = pwrseq_pcie_m2_e_targets,
+};
+
 static const struct pwrseq_pcie_m2_pdata pwrseq_pcie_m2_m_of_data = {
 	.targets = pwrseq_pcie_m2_m_targets,
 };
@@ -125,6 +206,16 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to get all regulators\n");
 
+	ctx->w_disable1_gpio = devm_gpiod_get_optional(dev, "w-disable1", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->w_disable1_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->w_disable1_gpio),
+				     "Failed to get the W_DISABLE_1# GPIO\n");
+
+	ctx->w_disable2_gpio = devm_gpiod_get_optional(dev, "w-disable2", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->w_disable2_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->w_disable2_gpio),
+				     "Failed to get the W_DISABLE_2# GPIO\n");
+
 	ctx->num_vregs = ret;
 
 	ret = devm_add_action_or_reset(dev, pwrseq_pcie_m2_free_regulators, ctx);
@@ -150,6 +241,10 @@ static const struct of_device_id pwrseq_pcie_m2_of_match[] = {
 		.compatible = "pcie-m2-m-connector",
 		.data = &pwrseq_pcie_m2_m_of_data,
 	},
+	{
+		.compatible = "pcie-m2-e-connector",
+		.data = &pwrseq_pcie_m2_e_of_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pwrseq_pcie_m2_of_match);

-- 
2.51.0



