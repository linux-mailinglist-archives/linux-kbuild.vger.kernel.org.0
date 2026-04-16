Return-Path: <linux-kbuild+bounces-12803-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KSqA22k4GkskgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12803-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 10:57:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDDD40BE58
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 10:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A344302B71F
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 08:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04004395D9D;
	Thu, 16 Apr 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJlnzjZD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4653803E4;
	Thu, 16 Apr 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776329759; cv=none; b=HkmqzkC237y8LyPKIZ9CMaQtNFubvzI1X+BPUfJ+BUs6HlrxlMpVrPtgkUGMTfapXOir4Xru7dJekFjEWmA53jZMwVkIcRwnQMYVHoPPBNBlRY/eFWsjJo2FlUw5PyGYUOtEhsYGDHVUIgAPk46JlNcG8QsR4dlLuSxSHE6tisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776329759; c=relaxed/simple;
	bh=qP9op7qqcS5Lukl0xY0FbOKSLZSPfuuTkBQ5FGAIXHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eecpctI9I+2cTil7kbrNbea4202oxQSJKHcb44SGCNU5poUE+WG4fRDVQYJ5R5XMiaf94mhhAnPYTUJy+2KIbq+mXyst139gR3KRpYAgWC7C+0joLv/+eU89GcQYC5kS846Jdg6Mx09Pz0KNrlpqKe9yYh/3QwBmC9JNKc2WvwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJlnzjZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE584C2BCB3;
	Thu, 16 Apr 2026 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776329759;
	bh=qP9op7qqcS5Lukl0xY0FbOKSLZSPfuuTkBQ5FGAIXHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJlnzjZDwcviicCbIILPDAxC4Y0Mnwb5Vex/ZZdnkcTF4swx0HthKq5a/CxVUQJ5I
	 RaWf/yMsvg2I7H+kK63WbY+o5zZt0NKR7QtexrEONzBwSOzI6xsrS6jpTYT39jbH02
	 JAJFyv/K9BkTkJQziyfkkJJ+FhebMJ0JYH6D9GiJAJLx0OQpJOmwTMXGH3MoSGp+d2
	 bqootzA4OtnmAGQ1OTMfP8QAFPMn4OuQ2WmuMCjZIKcbYpFs1TAUh1TPAydaBLNcIX
	 5xr/kJUuKYS9LEiUC46WBOHJwYYsjh4h8xTtUoYnGFn89huAW56f/j+VjePkFn3Dl6
	 dy5VRIffuc3YA==
Date: Thu, 16 Apr 2026 14:25:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E
 connectors in devicetree
Message-ID: <4yockfx5rjcvfh2n2excrgsknnhi72rv2w7wf7onks2ryt33sm@w7zkcxuc6vem>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com>
 <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
 <eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
 <CAGXv+5E=tujhtZjwi6Qm7hk3Ks74UzTQHWq82NiTEw1+vYod5g@mail.gmail.com>
 <ad36pIu-0dutL7Nk@ashevche-desk.local>
 <CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
 <ad4tJN27opdEooA7@ashevche-desk.local>
 <CAGXv+5EPA29G-fsH=wWOD8AK6TZFezFhsE0NHPYj_Pt3nT+d_w@mail.gmail.com>
 <20260415165651.153b573d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260415165651.153b573d@bootlin.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[4.211.64.104.asn.rspamd.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12803-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-kbuild@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,linux.intel.com,oss.qualcomm.com,kernel.org,linuxfoundation.org,linux.dev,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,bootlin.com];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EDDD40BE58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:56:51PM +0200, Herve Codina wrote:
> Hi Chen, all,
> 
> ...
>  
> > 
> > I'm not arguing for a even more generic "M.2" connector. The "key" is
> > already described in the compatible. I'm saying we should have some way
> > of describing the individual interfaces (PCIe, SDIO, USB, UART, I2S, I2C)
> > on the connector so further nodes or properties can be attached to them,
> > either with overlays or dynamically within the kernel. Right now the
> > are only described as individual ports, but we can't actually tie a
> > device to a OF graph port.
> > 
> > But maybe I'm overthinking the representation part. AFAICT for Qualcomm's
> > UART-based BT bit part, Mani just had the driver create a device node
> > under the UART (by traversing the OF graph to find the UART). If that's
> > the desired way then the connector binding should mention it. And that
> > works for me. But I think it's messier and also we're missing an
> > opportunity to make the M.2 connector a standardized attachment point
> > for overlays.
> > 
> > Mani, could you also chime in a bit on what you envisioned?
> > 
> > (Added Luca from Bootlin to CC, as I think there are parallels to the
> >  "Hotplug of Non-discoverable Hardware" work)
> >
> 
> Related to "Hotplug of Non-discoverable Hardware",
> 
> I would add entries for busses in the connector without using an OF graph.
> 

I don't think this is a correct representation. It is non-standard to describe
the device nodes in some other connectors. While it may work with your series in
the future, not something I would bet-on at this point.

Using OF graph to link the connector nodes look like the cleaner solution to me.

> For I2C and later SPI, this was is done.
> 
> You already have an i2c-parent property but no node where an i2c device
> can be added.
> 
> The last discussion related to hotplug, connectors and DT led to the RFC
> series [1].
> 
> It is a huge series. The last patch give a real example of representation:
>   https://lore.kernel.org/all/20260112142009.1006236-78-herve.codina@bootlin.com/
> 
> In your case I would see some thing like:
> 
>     connector {
>         compatible = "pcie-m2-e-connector";
>         vpcie3v3-supply = <&vreg_wcn_3p3>;
>         vpcie1v8-supply = <&vreg_l15b_1p8>;
> 
> 	/*
> 	 * If those GPIOs have to be used by components available in
> 	 * the connected board, a Nexus node should be used.
>          */
>         w-disable1-gpios = <&tlmm 115 GPIO_ACTIVE_LOW>;
>         w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
>         viocfg-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
>         uart-wake-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
>         sdio-wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
>         sdio-reset-gpios = <&tlmm 120 GPIO_ACTIVE_LOW>;
> 
> 	conn-i2c {
> 		i2c-parent = <&i2c0>;
> 
> 		/*
>  		 * Here i2c devices available on the board
> 		 * connected to the connector can be described.
> 		 */
> 	};
> 
> 	/* Same kind to description for other busses */
> 	conn-pcie {
> 		pci-parent = <&xxxxx>;
> 
> 		/*
> 		 * The PCIe bus has abilities to discover devices.
> 		 * Not sure this node is needed.
> 		 *
> 		 * If a PCI device need a DT description to describe
> 		 * stuffs behind the device, what has been done for LAN966x
> 		 * could be re-used [2] and [3]
> 		 */

I don't think anyone would connect something like LAN966x to the M.2 connector.
M.2 cards have a defined purpose, like NVMe, WLAN etc... If anyone wants to
connect another SoC like LAN966x, they would use non-M.2 connectors.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

