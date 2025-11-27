Return-Path: <linux-kbuild+bounces-9887-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C104CC8EC8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 15:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71BAB3ACAD0
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 14:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD5933372B;
	Thu, 27 Nov 2025 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jxF5SLN/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1962A33345C
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764254279; cv=none; b=e1xPk/GDs970OGmwCNZnACh/5exbMSZ/a1566I8oWrpP8drqVM+Pj0GcAqK9FDj3z2WXx9jtuk1oCn3A18eYXQAkcGMR/ZxDvAZU0UVpB6A9xl/ipJR5yCakP3WIahbQQmlIElrqzyuhjarVaj9dOTPmWzXLoEKHAaqq8pm0m6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764254279; c=relaxed/simple;
	bh=X1Ldd1pDA8Igmeknj7tlqAQAGac9Gmdov5hMB67qp6c=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6ipwXVk6b1Rx/SXmz8eGWjKrngPWPtCdQW13qgN6QHpbw8PBd7J2i6AdhObKMBlIELXWReJn1r8GFtU6oyvU56PwZMaYWLTkGeSuHQrEnHzWRFebIG6S9LsvvhizP6yMdIDIxHm/fR+CBIjx7QlZJAVCrpxrW4eCtS1Ld5T350=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jxF5SLN/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5942a631c2dso1337272e87.2
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 06:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764254275; x=1764859075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYjGgDc62jC79UPrwBm0Wqe2D8LTyTSAMvzD7Li+ucA=;
        b=jxF5SLN/pGSuWhG6RX6JQ/iQtzX1+hvCKdXFLQ02hzVEHuibi9lhcOylRZtpgBtYtW
         Bte1hAnjfpTjYlO+lH0k8ulDN+RfDwbsFNsiJJ8WueffeHIJA2cLYc5vakN5P5V9fLBz
         HuzcDIwN6oOvYnubDW8nW3VQSYg0f9wTZbNA6eQBLZvE/+bph/TbtrjCtlc/dJupRC5K
         r0VZslHg4XTIkNjGxZeARcDYEJM2GlJZQBuRx/ptgrDfKM4aOLwIl2L2mcYM2oo+Bn3n
         V2Omjo9ySA1obEEes0B1Qv1qmMJHzR0rTmONVhwSRQteQM0RwPMIY4DmNeWJIZLMp1AS
         CYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764254275; x=1764859075;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYjGgDc62jC79UPrwBm0Wqe2D8LTyTSAMvzD7Li+ucA=;
        b=Sc9d5ZedZqgZ7SK665X0DIHai5ElblV6WP03rpfNl+OkhiUA2WKhv4Nv4REFY39hPe
         9gHrrclMpja9v0STyBhFGraU5/Fsz//K+Z83oEITPzG3pY1gGqoikb3Bhoq1eReg1c0j
         BCs9owH2APgnNd1nDcprLyZqWert/pmP4urJiPAMTbgkJJSchZ0DBIc3gUVxwgvwqWCg
         utXDTpIKvNQwcu21ymptgG8MW8mZlqiaRgVVfOIBLDzjtiiaeb39HMUwurxtdsf0XHxV
         1mr43/6g5yZlnXiH4e1u2Hq4oBrpGSMX8+qhsml0APVG6AZWf/3bNy0n0h2Pfix5f5+F
         l/sg==
X-Forwarded-Encrypted: i=1; AJvYcCXYfk93gn2d/uFJFeHnwSgRGO3SNfz9tWwWFD1HwfmaHQiWcNOR5sB2I7ld+v9nRYZFYYdo1fMB8GQFZP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoYQb4W1UvRA27IBlPvPS/NHfiuhz/lTL1izkPzpn6GwhHjMdk
	sc8jmArL5mPxNsLJU/QePXZkig95W5Z1qty5vhRq5nHYd7aK7xKr0r+Dvr1Xl3ccdHn3No0MNU3
	ZnCdKlw4/JtVHYa6Slq9iy/5kGunBGJTVAH+gu9/ntw==
X-Gm-Gg: ASbGncu9R6ku7uAY1qIuBJsqecyeCausBIQ7BT5u9HQgsj0xppfXbnTQaXZiXu/2DKj
	Cf3gleKlFR6A6RlbPlYayxlFufU9tyY98/9tsjRan9p+F8+iOeA/vTyT978Yrk+V5XhlKeGMf4I
	zHGPrDXlxvb9Sr/pgYHOlZhXY0dTyXW1kXsDvmUgLkBmi2L8lRfrWHBnADInkUJ2qBztYJfet4o
	Ox5rysQcbDssSXnSU3xOwQLFB+3TwZNizw2zoCXKja4UkxEJ4cttqd9xrLQOlbvy2VxM4cakIQu
	wnKctcL45voFyUlx4Ip4pRgCYHI=
X-Google-Smtp-Source: AGHT+IH8Ttsbi5KEeEAGk11LiOYQsu2N95FdEs0+cbMJMu5dLDKPCc8OYAk6PKicQIK8vI3aANmTaZiucmGCvDUboNk=
X-Received: by 2002:a05:6512:3a95:b0:595:a5f0:1110 with SMTP id
 2adb3069b0e04-596a3ec065fmr8521200e87.30.1764254274981; Thu, 27 Nov 2025
 06:37:54 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 06:37:53 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 06:37:53 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251125-pci-m2-e-v2-10-32826de07cc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-10-32826de07cc5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 06:37:53 -0800
X-Gm-Features: AWmQ_bmnE127PrJJlBfvUEW3R05_jJjqY__HdS6nPt4vVoiWctPQWqo-RlX_yNA
Message-ID: <CAMRc=McH9u7Y8EZMwSjcCUs6rVx9K+h5OxFOrjwXhKm1td-EeQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] power: sequencing: pcie-m2: Add support for PCIe
 M.2 Key E connectors
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 15:45:14 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Add support for handling the power sequence of the PCIe M.2 Key E
> connectors. These connectors are used to attach the Wireless Connectivity
> devices to the host machine including combinations of WiFi, BT, NFC using
> interfaces such as PCIe/SDIO for WiFi, USB/UART for BT and I2C for NFC.
>
> Currently, this driver supports only the PCIe interface for WiFi and UART
> interface for BT. The driver also only supports driving the 3.3v/1.8v power
> supplies and W_DISABLE{1/2}# GPIOs. The optional signals of the Key E
> connectors are not currently supported.
>
> For supporting Bluetooth over the non-discoverable UART interface, the
> driver currently creates the serdev interface after enumerating the PCIe
> interface. This is mandatory since the device ID is only known after the
> PCIe enumeration and the ID is used for creating the serdev device.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/Kconfig          |   1 +
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 205 +++++++++++++++++++++++++++++-
>  2 files changed, 199 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
> index f5fff84566ba..29bd204319cc 100644
> --- a/drivers/power/sequencing/Kconfig
> +++ b/drivers/power/sequencing/Kconfig
> @@ -38,6 +38,7 @@ config POWER_SEQUENCING_TH1520_GPU
>  config POWER_SEQUENCING_PCIE_M2
>  	tristate "PCIe M.2 connector power sequencing driver"
>  	depends on OF || COMPILE_TEST
> +	depends on PCI
>  	help
>  	  Say Y here to enable the power sequencing driver for PCIe M.2
>  	  connectors. This driver handles the power sequencing for the M.2
> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
> index 4835d099d967..c2cc129f6917 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
> @@ -5,14 +5,17 @@
>   */
>

I think you're missing linux/err.h here.

>  #include <linux/device.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_platform.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pwrseq/provider.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/serdev.h>
>  #include <linux/slab.h>

(snip)

>
> +static int pwrseq_m2_pcie_notify(struct notifier_block *nb, unsigned long action,
> +			      void *data)
> +{
> +	struct pwrseq_pcie_m2_ctx *ctx = container_of(nb, struct pwrseq_pcie_m2_ctx, nb);
> +	struct pci_dev *pdev = to_pci_dev(data);
> +	struct device_node *pci_remote __free(device_node) = NULL;
> +	struct device_node *serdev_remote __free(device_node) = NULL;
> +	struct serdev_controller *serdev_ctrl;
> +	struct serdev_device *serdev;
> +	struct device *dev = ctx->dev;
> +	int ret;
> +
> +	/*
> +	 * Check whether the PCI device is associated with this M.2 connector or
> +	 * not, by comparing the OF node of the PCI device parent and the Port 0
> +	 * (PCIe) remote node parent OF node.
> +	 */
> +	pci_remote = of_graph_get_remote_node(dev_of_node(ctx->dev), 0, 0);
> +	if (!pci_remote || (pci_remote != pdev->dev.parent->of_node))
> +		return NOTIFY_DONE;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		/* Create serdev device for WCN7850 */
> +		if (pdev->vendor == PCI_VENDOR_ID_QCOM && pdev->device == 0x1107) {
> +			serdev_remote = of_graph_get_remote_node(dev_of_node(ctx->dev), 1, 1);
> +			if (!serdev_remote)
> +				return NOTIFY_DONE;
> +
> +			serdev_ctrl = of_find_serdev_controller_by_node(serdev_remote);
> +			if (!serdev_ctrl)
> +				return NOTIFY_DONE;
> +
> +			serdev = serdev_device_alloc(serdev_ctrl);
> +			if (!serdev)
> +				return NOTIFY_BAD;
> +


This is where you'd add the software node I wrote about under another patch
from this series.

> +			ret = serdev_device_add(serdev, "WCN7850");
> +			if (ret) {
> +				dev_err(dev, "Failed to add serdev for WCN7850: %d\n", ret);
> +				serdev_device_put(serdev);

If you're touching serdev code in the same series, maybe you could define
a cleanup action for serdev devices and use it here?

> +				return NOTIFY_BAD;
> +			}
> +		}
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static bool pwrseq_pcie_m2_check_remote_node(struct device *dev, u8 port, u8 endpoint,
> +					     const char *node)
> +{
> +	struct device_node *remote __free(device_node) = NULL;
> +
> +	remote = of_graph_get_remote_node(dev_of_node(dev), port, endpoint);

I'd do it like this to follow the convention of initializing automatic
variables at definition.

	struct device_node *remote __free(device_node) =
		of_graph_get_remote_node(dev_of_node(dev), port, endpoint);

> +	if (remote && of_node_name_eq(remote, node))
> +		return true;
> +
> +	return false;
> +}
> +
> +/*
> + * If the connector exposes a non-discoverable bus like UART, the respective
> + * protocol device needs to be created manually with the help of the notifier
> + * of the discoverable bus like PCIe.
> + */
> +static int pwrseq_pcie_m2_register_notifier(struct pwrseq_pcie_m2_ctx *ctx, struct device *dev)
> +{
> +	int ret;
> +
> +	/*
> +	 * Register a PCI notifier for Key E connector that has PCIe as Port
> +	 * 0/Endpoint 0 interface and Serial as Port 1/Endpoint 1 interface.
> +	 */
> +	if (pwrseq_pcie_m2_check_remote_node(dev, 1, 1, "serial")) {
> +		if (pwrseq_pcie_m2_check_remote_node(dev, 0, 0, "pcie")) {
> +			ctx->dev = dev;
> +			ctx->nb.notifier_call = pwrseq_m2_pcie_notify;
> +			ret = bus_register_notifier(&pci_bus_type, &ctx->nb);
> +			if (ret) {
> +				dev_err_probe(dev, ret, "Failed to register notifier for serdev\n");
> +				return ret;
> +			}

return dev_err_probe() and save three lines?

> +		}
> +	}
> +
> +	return 0;
> +}
> +

Bart

