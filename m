Return-Path: <linux-kbuild+bounces-9886-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BA352C8EC45
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 15:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0919634D15A
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 14:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AD0263F4E;
	Thu, 27 Nov 2025 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IWxFRvrM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F423EAB6
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764253930; cv=none; b=TGaUop9PubVyOi9OtZd1m4jIQS6lnmeYyxP9imrDC5NMGOOjU/KevIGmFhs+FWl29PL2P0hCD8np9YUCo425yvYFM2LJT3bQqYOp1bVe8t0sgkH/BRrePqXSL6X21GHf4dXmnPczrE2xY3x9DiZqowno2WR9CZaR/FzwFI9dgxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764253930; c=relaxed/simple;
	bh=5s4kM/4I9QIFAIQ7Xr2TkK6RVCGV+sQOtn5UYl+vDlI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHLnpNQZx639jN7Fn+zcW+FXSHvuw/N3QbB7gthlTu4pFPttNswGfb7Q9e2idVq6EeZ9k5N0iNM4v9D3DRYkoswFENOX5wU7WrF4Zi2Iuv2GFzSPmxvyYJB4qTMeLuDOLC8fbeSNjCK5w/mUD88FSR5uuffk34VHjHxaTadfhhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IWxFRvrM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59428d2d975so967820e87.3
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 06:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764253927; x=1764858727; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kV+ineTuRO2FCjwv8fpM2FJ3fRBCPasbNXO10VdD+pQ=;
        b=IWxFRvrMBKqU2T7gnCRsGpMHoF1i3Xi+cfhr+RyIsef0wp/QKhTcnfhklLfGXRnASb
         pcH6UiEpO4jJN3Ib4jpPSiR/Wwf8SW96dUC/ciDVikh96MyfKn8fnMDt4ipw8p6wYME4
         C8s3FtqyMCTJAUAjxl2mBs2HMq4OIAV9TqQTh6zjgwi878I6+q2cXSzTFqPse7Es368i
         ylGVQxglxUwTNtKjv570uq+c3g/nbEidck5W/BdxvFhnCwJRVfdTl6SojmpKAVFH3+Od
         mjqcdHRw6DBYfq2DIUKJKLoDfF2TMgIznce9NtBv8joUFMpIOr8TMfeNYtLfL2fWr34n
         tZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764253927; x=1764858727;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV+ineTuRO2FCjwv8fpM2FJ3fRBCPasbNXO10VdD+pQ=;
        b=l2agMYAz4K9mQDWfzZttz54OJTP46UEzY8pBYYhFP9VVc+timFRweH2nghAZW18OrR
         ti1wE85ESHRT4XyKzqATWWvSQ34IhRVkIqSpHlFWKhxVEKIj2fgAlHkw6QQ/T+72E1Nh
         geD4Tvzpt84/rCrJamoEmyaVpbK0InzxNJeDtrObRH+a6m9bCgPb4paWIgy62SGpSSkk
         d9Y2hl3XGwoi1T0F/FPqJz9jTTSvGUltc/lCqui9h7ySs1QF/OdhGyxKm9ccP6RhVFG9
         fEPUCdvGoqiWIgk9BwkXKbk23Navm3HKiICszMU4Sj2PBaI59kvn0Q4FxOKiiRbzwrco
         L/iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPUQaPCK1kGHtWfu4bX64RoAgp8mv4pyoJdMHeRkpH5pS1uhb6qVa2rhMQmmuDlhIh6N2SaxDs/vRvi5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2P+wXOckikP1nrMUNgvFLzO3xIRBzYbSO3O/5LqhB6WANqAW
	LcADCDhxzb3W0w9mAX9lofyS9YyTFeW0AFxivpO69Zrpdk6O5e+/aXwfwIltMDFePT/TF95dffz
	kTZmltRcH7NAgx0Mk5qs1QCmyXL2BWQwndmFe2PLZGA==
X-Gm-Gg: ASbGncuKdbNnftIlhZLTW0RDrPUHGC+F8ge+DvyoZ9C3mW8xYsIIMGqQjDA/KLO4262
	YmLUWa8Ei/VoSI+fnS8D6Es7ySfpbpcR8mYO5AIlfMVtRhcKEDJf6XHjxRytfs1nFeoWvWX6SiK
	pJaIZnxiDZeDJ9osc+EB2LfNCyJvbIjy9PUfrREAOJAWO48mxsNkUAYR32Ts3PEGiznro/6u3vD
	YERJNmTKk7ApU3jL1YAisnbYFY9ou4nWwLo0v7uTDDUplUWO36aZ32M7GcWJe7hBP55I5wGYZtO
	h6hTV1abdzcNZ/705KgYSQG37y0=
X-Google-Smtp-Source: AGHT+IHlhhzIIp/gnfsTHhd+vqhk+v48Z9xJOXoO7x5goAaqvtEG81gcVcAV13Y3mYngJi03cv1qgF1Hme/Zouniots=
X-Received: by 2002:a05:6512:3e14:b0:591:c8de:467b with SMTP id
 2adb3069b0e04-596b528c028mr4219398e87.40.1764253926578; Thu, 27 Nov 2025
 06:32:06 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 06:32:04 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 06:32:04 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251125-pci-m2-e-v2-2-32826de07cc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-2-32826de07cc5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 06:32:04 -0800
X-Gm-Features: AWmQ_bmdSkzBaj3zxXIgo7YdGy9A3hKC58TOOOS51TGwxK6BIP2tm8BLLT5PXkE
Message-ID: <CAMRc=Mc-WebsQZ3jt2xirioNMticiWj9PJ3fsPTXGCeJ1iTLRg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] serdev: Add serdev device based driver match support
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

On Tue, 25 Nov 2025 15:45:06 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Add support to match serdev devices with serdev drivers based on the serdev
> ID table defined in serdev_device_driver::id_table.
>
> The matching function, serdev_driver_match_device() uses the serdev device
> name to match against the entries in serdev_device_driver::id_table.
>
> If there is no serdev id_table for the driver, then serdev_device_match()
> will fallback to ACPI and DT based matching.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/tty/serdev/core.c         | 23 ++++++++++++++++++++++-
>  include/linux/mod_devicetable.h   |  7 +++++++
>  include/linux/serdev.h            |  4 ++++
>  scripts/mod/devicetable-offsets.c |  3 +++
>  4 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> index b33e708cb245..2b5582cd5063 100644
> --- a/drivers/tty/serdev/core.c
> +++ b/drivers/tty/serdev/core.c
> @@ -85,12 +85,33 @@ static const struct device_type serdev_ctrl_type = {
>  	.release	= serdev_ctrl_release,
>  };
>
> +static int serdev_driver_match_device(struct device *dev, const struct device_driver *drv)
> +{
> +	const struct serdev_device_driver *serdev_drv = to_serdev_device_driver(drv);
> +	struct serdev_device *serdev = to_serdev_device(dev);
> +	const struct serdev_device_id *id;
> +
> +	if (!serdev_drv->id_table)
> +		return 0;
> +
> +	for (id = serdev_drv->id_table; id->name[0]; id++) {
> +		if (!strcmp(dev_name(dev), id->name)) {
> +			serdev->id = id;
> +			return 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +

I don't know if Rob agrees with me but I would very much prefer to see
software-node-based approach instead of an ID table matching.

Could you in the pwrseq driver, create a software node for the serdev device
you allocate, set its "compatible" to "qcom,wcn7850-bt" and match against it
here?

This has several benefits: if you ever need to pass more properties to the
serdev devices, you already have a medium for that and you can also leave
serdev_device_add() alone. You're comparing the entire name here - what if
someone sets device's ID to some value and the name will be "WCN7850.2"?

You could also drop the serdev_id field from struct serdev_device. For matching
you could even reuse the of_device_id from the device driver.

Which also makes me think that maybe we should finally think about a generic,
fwnode-based device driver matching in the driver model...

Bartosz

>  static int serdev_device_match(struct device *dev, const struct device_driver *drv)
>  {
>  	if (!is_serdev_device(dev))
>  		return 0;
>
> -	/* TODO: platform matching */
> +	if (serdev_driver_match_device(dev, drv))
> +		return 1;
> +
>  	if (acpi_driver_match_device(dev, drv))
>  		return 1;
>
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 6077972e8b45..70c54c4bedba 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -976,4 +976,11 @@ struct coreboot_device_id {
>  	kernel_ulong_t driver_data;
>  };
>
> +#define SERDEV_NAME_SIZE 32
> +
> +struct serdev_device_id {
> +	const char name[SERDEV_NAME_SIZE];
> +	kernel_ulong_t driver_data;
> +};
> +
>  #endif /* LINUX_MOD_DEVICETABLE_H */
> diff --git a/include/linux/serdev.h b/include/linux/serdev.h
> index ecde0ad3e248..aca92e0ee6e7 100644
> --- a/include/linux/serdev.h
> +++ b/include/linux/serdev.h
> @@ -39,6 +39,7 @@ struct serdev_device_ops {
>   * @ops:	Device operations.
>   * @write_comp	Completion used by serdev_device_write() internally
>   * @write_lock	Lock to serialize access when writing data
> + * @id:		serdev device ID entry
>   */
>  struct serdev_device {
>  	struct device dev;
> @@ -47,6 +48,7 @@ struct serdev_device {
>  	const struct serdev_device_ops *ops;
>  	struct completion write_comp;
>  	struct mutex write_lock;
> +	const struct serdev_device_id *id;
>  };
>
>  #define to_serdev_device(d) container_of_const(d, struct serdev_device, dev)
> @@ -55,11 +57,13 @@ struct serdev_device {
>   * struct serdev_device_driver - serdev slave device driver
>   * @driver:	serdev device drivers should initialize name field of this
>   *		structure.
> + * @id_table:	serdev device ID table
>   * @probe:	binds this driver to a serdev device.
>   * @remove:	unbinds this driver from the serdev device.
>   */
>  struct serdev_device_driver {
>  	struct device_driver driver;
> +	const struct serdev_device_id *id_table;
>  	int	(*probe)(struct serdev_device *);
>  	void	(*remove)(struct serdev_device *);
>  };
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index d3d00e85edf7..c1bfa8eddc4d 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -280,5 +280,8 @@ int main(void)
>  	DEVID(coreboot_device_id);
>  	DEVID_FIELD(coreboot_device_id, tag);
>
> +	DEVID(serdev_device_id);
> +	DEVID_FIELD(serdev_device_id, name);
> +
>  	return 0;
>  }
>
> --
> 2.48.1
>
>
>

