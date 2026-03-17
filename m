Return-Path: <linux-kbuild+bounces-11999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBrMEjP4uGk5mQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11999-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 07:44:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F412A466C
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 07:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A2D83029E6B
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 06:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC9133D4E1;
	Tue, 17 Mar 2026 06:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDLoxxDA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01413264D6;
	Tue, 17 Mar 2026 06:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773729782; cv=none; b=YqcRpVHp1nkc1XYyo7m9qHJQjxXOAkVs21CFTQsCiSNfBuw6SL1Dv67gpworaYBWn7ZYlHhQSNmw1udVjtsOHX/IU1zFluLsH+gA8Y9YxIap8ktlOQZtyqU2ayOdd09g6HFGtgmdIPGT5SwYhfh3+rPAv5LH2fFlf/ML9AH8EXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773729782; c=relaxed/simple;
	bh=RV36HArRQD5WpIrbL59QzOUQbECg2GUM/eOEhUB92hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNqhIjHkA5zdAYWXVZBRGg8Qf0LutVTgF6E+hIM7kfyaP6D2OfQTuXY7dzBKmQ87fixSovpN39rZoCcjsGw8A3CWncwwUduUizHuDOIGQ0hTSvcJnOCz40GkAk2kJpMCh1YKZaSkUiSM3KQlXNYpGBebqHJTcKsp+XeVlPp5RBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDLoxxDA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63198C4CEF7;
	Tue, 17 Mar 2026 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773729782;
	bh=RV36HArRQD5WpIrbL59QzOUQbECg2GUM/eOEhUB92hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDLoxxDAvu4KFUNvAqr4AoRhunOfAF7ryj5X+FkO/ws53gVxJpwBMbTZW5AFZUpJR
	 4hAOlGRX4ydTnfmdQOre3kaAoseauWJfbCaMCo0fGoU21FVGE+jAB40WTbhOMC5+9T
	 ErNhQvhjHYdHbrfbP63w/qkuLXj6EhEKuDP4RVkKvMpdaJyyJVzi31p95Kq/jmF49E
	 6F/fNWuSiU2CpW5KhdHIT5uJn5lsaZK7fdOoizcTUyuilvHDlILIZ0TWpgfxU5eX2K
	 FxuQW09NlZULK7mC9C9aXh1t85izuhK//XTJ6BaUuyiukIIYlxPxM5KtDX4S3h779U
	 gXw7KOGtZcW0w==
Date: Tue, 17 Mar 2026 12:12:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 9/9] power: sequencing: pcie-m2: Create serdev device
 for WCN7850 bluetooth
Message-ID: <adtnsxel2lh2hgftqplvd3slfk3x5zx7xyfroxgdbmoz4qticp@lkx6iplaawoe>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
 <20260317-pci-m2-e-v6-9-9c898f108d3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317-pci-m2-e-v6-9-9c898f108d3d@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11999-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A8F412A466C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 09:59:59AM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> For supporting bluetooth over the non-discoverable UART interface of
> WCN7850, create the serdev device after enumerating the PCIe interface.
> This is mandatory since the device ID is only known after the PCIe
> enumeration and the ID is used for creating the serdev device.
> 
> Since by default there is no OF or ACPI node for the created serdev,
> create a dynamic OF 'bluetooth' node with the 'compatible' property and
> attach it to the serdev device. This will allow the serdev device to bind
> to the existing bluetooth driver.
> 
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # ThinkPad T14s gen6 (arm64)
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/Kconfig          |   3 +-
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 178 +++++++++++++++++++++++++++++-
>  2 files changed, 177 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
> index f5fff84566ba..55aeef125e6f 100644
> --- a/drivers/power/sequencing/Kconfig
> +++ b/drivers/power/sequencing/Kconfig
> @@ -37,7 +37,8 @@ config POWER_SEQUENCING_TH1520_GPU
>  
>  config POWER_SEQUENCING_PCIE_M2
>  	tristate "PCIe M.2 connector power sequencing driver"
> -	depends on OF || COMPILE_TEST
> +	depends on (PCI && OF) || COMPILE_TEST
> +	select OF_DYNAMIC
>  	help
>  	  Say Y here to enable the power sequencing driver for PCIe M.2
>  	  connectors. This driver handles the power sequencing for the M.2
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
> index 3507cdcb1e7b..77357439ba81 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -12,9 +12,11 @@
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_platform.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pwrseq/provider.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/serdev.h>
>  #include <linux/slab.h>
>  
>  struct pwrseq_pcie_m2_pdata {
> @@ -30,6 +32,9 @@ struct pwrseq_pcie_m2_ctx {
>  	struct notifier_block nb;
>  	struct gpio_desc *w_disable1_gpio;
>  	struct gpio_desc *w_disable2_gpio;
> +	struct serdev_device *serdev;
> +	struct of_changeset *ocs;
> +	struct device *dev;
>  };
>  
>  static int pwrseq_pcie_m2_vregs_enable(struct pwrseq_device *pwrseq)
> @@ -172,13 +177,176 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
>  	return PWRSEQ_NO_MATCH;
>  }
>  
> -static void pwrseq_pcie_m2_free_regulators(void *data)
> +static void pwrseq_pcie_m2_free_resources(void *data)
>  {
>  	struct pwrseq_pcie_m2_ctx *ctx = data;
>  
> +	serdev_device_remove(ctx->serdev);
> +	bus_unregister_notifier(&pci_bus_type, &ctx->nb);
> +	of_changeset_revert(ctx->ocs);
> +	of_changeset_destroy(ctx->ocs);
>  	regulator_bulk_free(ctx->num_vregs, ctx->regs);
>  }
>  
> +static int pwrseq_m2_pcie_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
> +					struct device_node *parent)
> +{
> +	struct device *dev = ctx->dev;
> +	struct device_node *np;
> +	int ret;
> +
> +	ctx->ocs = devm_kzalloc(dev, sizeof(*ctx->ocs), GFP_KERNEL);
> +	if (!ctx->ocs)
> +		return -ENOMEM;
> +
> +	of_changeset_init(ctx->ocs);
> +
> +	np = of_changeset_create_node(ctx->ocs, parent, "bluetooth");
> +	if (!np) {
> +		dev_err(dev, "Failed to create bluetooth node\n");
> +		ret = -ENODEV;
> +		goto err_destroy_changeset;
> +	}
> +
> +	ret = of_changeset_add_prop_string(ctx->ocs, np, "compatible", "qcom,wcn7850-bt");
> +	if (ret) {
> +		dev_err(dev, "Failed to add bluetooth compatible: %d\n", ret);
> +		goto err_destroy_changeset;
> +	}
> +
> +	ret = of_changeset_apply(ctx->ocs);
> +	if (ret) {
> +		dev_err(dev, "Failed to apply changeset: %d\n", ret);
> +		goto err_destroy_changeset;
> +	}
> +
> +	ret = device_add_of_node(&ctx->serdev->dev, np);
> +	if (ret) {
> +		dev_err(dev, "Failed to add OF node: %d\n", ret);
> +		goto err_revert_changeset;
> +	}
> +
> +	return 0;
> +
> +err_revert_changeset:
> +	of_changeset_revert(ctx->ocs);
> +err_destroy_changeset:
> +	of_changeset_destroy(ctx->ocs);
> +
> +	return ret;
> +}
> +
> +static int pwrseq_m2_pcie_notify(struct notifier_block *nb, unsigned long action,
> +			      void *data)
> +{
> +	struct pwrseq_pcie_m2_ctx *ctx = container_of(nb, struct pwrseq_pcie_m2_ctx, nb);
> +	struct pci_dev *pdev = to_pci_dev(data);
> +	struct serdev_controller *serdev_ctrl;
> +	struct device *dev = ctx->dev;
> +	int ret;
> +
> +	/*
> +	 * Check whether the PCI device is associated with this M.2 connector or
> +	 * not, by comparing the OF node of the PCI device parent and the Port 0
> +	 * (PCIe) remote node parent OF node.
> +	 */
> +	struct device_node *pci_parent __free(device_node) =
> +			of_graph_get_remote_node(dev_of_node(ctx->dev), 0, 0);
> +	if (!pci_parent || (pci_parent != pdev->dev.parent->of_node))
> +		return NOTIFY_DONE;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		/* Create serdev device for WCN7850 */
> +		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107) {
> +			struct device_node *serdev_parent __free(device_node) =
> +				of_graph_get_remote_node(dev_of_node(ctx->dev), 1, 1);

Typo. This should be:

	of_graph_get_remote_node(dev_of_node(ctx->dev), 3, 0);

Bartosz, could you please fix it while applying?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

