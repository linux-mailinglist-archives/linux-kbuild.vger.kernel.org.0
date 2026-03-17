Return-Path: <linux-kbuild+bounces-11988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EONjDTvWuGn9jwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11988-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:19:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E83CC2A3827
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64157302C360
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 04:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D07F335571;
	Tue, 17 Mar 2026 04:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RonaWlGq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F92EB874;
	Tue, 17 Mar 2026 04:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721137; cv=none; b=VEg6lHq4j/5G8mke8LC0w/lV8qX8P4x/rMl/ATz7QVxBmMSPNoNly4mwi5Ca1aPb5VdTq6DS9ZVPIj8EgLWjJkQsPU9BdYMFILQkBq3qnunkDM2TNCemOwA2tuRAdlH0lrM9aWG1f3aapwDOwetX/PwJHvYN9nqyybfUMW/Xu8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721137; c=relaxed/simple;
	bh=aAW7xmcPapo/bUAlT3a8Nv6ct0mWRHp2J/iY7SZTN+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKfb+Mq8Z88ask6PWL9Q0UoTJ+4jMIdUbwG45ZI+BWRk+v1bjKY7QX5ziGHikWYAL3dWEGTgplD92SDrPdrUl/xAtK4eezpcHnD4b8RzOo0xn613arpuZCN5j1+f8XDu27GNtc/M2Dh5StCV8cs0jU63BixqCtSE0Q2wSMiqIio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RonaWlGq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBC1C4CEF7;
	Tue, 17 Mar 2026 04:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773721137;
	bh=aAW7xmcPapo/bUAlT3a8Nv6ct0mWRHp2J/iY7SZTN+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RonaWlGqdCAqdKJoPAT7n70KfSue7ZyHcB38BqGTjnPwp7XfAWj8yUL2HGmACfyaQ
	 6qHE5XWcPYYH4knm6PiIHCBZqsSK0U6fsETRNIXB/IlzL25jTkZC9pvDBwjQmojkAH
	 zMgSO4PR9ZAN3vo8aRHaj1ay97LYaJmA1QnJydbiLtagx9KvkJqAzxcpaRb10V0vx9
	 h5HNRP7/xC3fQ53/n+dfKd/j+WCSFVQp9I5vlicZCfm9WOunp9TtUXFtxYrBD4Hdp0
	 /3U9Dydg6DkSS+QsEIZg6d3KaGYGV8c4JAjVxMQYQNl1sH6Z7xMC73rc7Yaz0HSR2g
	 l5hEdJ7aS57/Q==
Date: Tue, 17 Mar 2026 09:48:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-acpi@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: Re: [PATCH v5 9/9] power: sequencing: pcie-m2: Create serdev device
 for WCN7850 bluetooth
Message-ID: <bsc57i43nvrstrgbtxgefcee2k25uua7cmyfy5riiglwww5xtl@vwfsuvflmmy3>
References: <20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com>
 <20260224-pci-m2-e-v5-9-dd9b9501d33c@oss.qualcomm.com>
 <CAMRc=MeJP-BLf3_zM9b+nz1nMOGVzyUhXemejHkV+AJREGPz_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeJP-BLf3_zM9b+nz1nMOGVzyUhXemejHkV+AJREGPz_w@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11988-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,linaro.org,kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,dt,manivannan.sadhasivam.oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E83CC2A3827
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Feb 25, 2026 at 03:22:50AM -0800, Bartosz Golaszewski wrote:
> On Tue, 24 Feb 2026 06:30:55 +0100, Manivannan Sadhasivam via B4 Relay
> <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >
> > For supporting bluetooth over the non-discoverable UART interface of
> > WCN7850, create the serdev device after enumerating the PCIe interface.
> > This is mandatory since the device ID is only known after the PCIe
> > enumeration and the ID is used for creating the serdev device.
> >
> > Since by default there is no OF or ACPI node for the created serdev,
> > create a dynamic OF 'bluetooth' node with the 'compatible' property and
> > attach it to the serdev device. This will allow the serdev device to bind
> > to the existing bluetooth driver.
> >
> > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # ThinkPad T14s gen6 (arm64)
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >
> 
> [snip]
> 
> > -static void pwrseq_pcie_m2_free_regulators(void *data)
> > +static void pwrseq_pcie_m2_free_resources(void *data)
> >  {
> >  	struct pwrseq_pcie_m2_ctx *ctx = data;
> >
> > +	serdev_device_remove(ctx->serdev);
> > +	bus_unregister_notifier(&pci_bus_type, &ctx->nb);
> > +	of_changeset_revert(ctx->ocs);
> > +	of_changeset_destroy(ctx->ocs);
> >  	regulator_bulk_free(ctx->num_vregs, ctx->regs);
> >  }
> >
> > +static int pwrseq_m2_pcie_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
> > +					struct device_node *parent)
> > +{
> > +	struct device *dev = ctx->dev;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	ctx->ocs = devm_kzalloc(dev, sizeof(*ctx->ocs), GFP_KERNEL);
> > +	if (!ctx->ocs)
> > +		return -ENOMEM;
> > +
> > +	of_changeset_init(ctx->ocs);
> > +
> > +	np = of_changeset_create_node(ctx->ocs, parent, "bluetooth");
> > +	if (!np) {
> > +		dev_err(dev, "Failed to create bluetooth node\n");
> > +		ret = -ENODEV;
> > +		goto err_destroy_changeset;
> > +	}
> > +
> > +	ret = of_changeset_add_prop_string(ctx->ocs, np, "compatible", "qcom,wcn7850-bt");
> > +	if (ret) {
> > +		dev_err(dev, "Failed to add bluetooth compatible: %d\n", ret);
> > +		goto err_destroy_changeset;
> > +	}
> > +
> > +	ret = of_changeset_apply(ctx->ocs);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to apply changeset: %d\n", ret);
> > +		goto err_destroy_changeset;
> > +	}
> > +
> > +	ret = device_add_of_node(&ctx->serdev->dev, np);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to add OF node: %d\n", ret);
> > +		goto err_revert_changeset;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_revert_changeset:
> > +	of_changeset_revert(ctx->ocs);
> > +err_destroy_changeset:
> > +	of_changeset_destroy(ctx->ocs);
> > +
> 
> I would prefer pwrseq_pcie_m2_free_resources() to be split into separate
> devm actions, otherwise it's not much different from simply having the
> .remove() callback. With a split like that you'd avoid having these labels
> here.
> 

We do need these error labels since pwrseq_m2_pcie_create_bt_node() is called
from notifier callback and a failure here doesn't cause the driver to fail. So
the changeset will linger till the driver gets removed.

So I don't see a real need to split pwrseq_pcie_m2_free_resources().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

