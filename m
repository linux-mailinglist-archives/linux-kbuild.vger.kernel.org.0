Return-Path: <linux-kbuild+bounces-12805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHxkMYPm4GnhnAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12805-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 15:39:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1506D40EF23
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 15:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D22303016B30
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 13:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E443C0600;
	Thu, 16 Apr 2026 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EloIX9sM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD623947AC;
	Thu, 16 Apr 2026 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346477; cv=none; b=doszSaV/p5KCtGMihmDlkZnp1BuLfWP41ylh1eUv1VSW0ib0+x4h9ZKPeajQV4kByINW8gALFwALHXicsf5/GtWHsXMndQdXBRVcm3S1wH+tU4XMNUUMTlMt6F/KLs6ctZkugXwV4n7iFOdn+8SJUN50vzwo5PB8sLQm5eEFRAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346477; c=relaxed/simple;
	bh=OdPGRiJ2OTAd0wN0VpIuzIvWe5D9n+gShs26W0B8xqs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KN4c0OSYumQWlsmEKCbOgyqyBvvegLoAiFahJmzTq9woCjwVBWA4CUjMhC3VEPLOCm9H44+COB5KEhTUiihz2Glc7ROO9WbbKoRiFQ4LCkRfBFaJzb0sXtpB84b6/C6Pna4aEAGD6v+TFq7bXHp3f+ypIQo7f3Bfjn8+xA64zVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EloIX9sM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 47F3F4E42A1E;
	Thu, 16 Apr 2026 13:34:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0867F60495;
	Thu, 16 Apr 2026 13:34:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 360BB10460880;
	Thu, 16 Apr 2026 15:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776346472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3XpbdgVt+Cx8FP8MN9lmm4BPNvobbTQ5J2Ix6m+jMcE=;
	b=EloIX9sM1QOhKmblue3jMDM5k8KpAKMHSGLQ8TanAuK7ENEV4CJPIMh2MskGhnhqAWn8Yw
	kUAvaK1IF/Se+k3PBQG/MKIkBmVQpmTrY37v/4rJgCuO1y+r/1Gi1LkS705qt3VLfG8J/t
	Xh6hvLhGANS4fiHpUfY431EjCRXdb9gafJMTVqrXQqnuY5IB80FZ7/DSZE6NczIytZJkU/
	4zplh8emxfZOdpV5qrGtzBrEKS6pZZFh2AdjAIRSTDrK00XSpARNgEHfGzFQBwyefj3PSo
	lEtKIt5lgvdG95GPo0kXJtjJ2O6cW+fsn6WroFDb1nkTBbUb0qISYKdg0D0cCg==
Date: Thu, 16 Apr 2026 15:34:21 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto
 von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, Stephan Gerhold
 <stephan.gerhold@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org, Hans de
 Goede <johannes.goede@oss.qualcomm.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E
 connectors in devicetree
Message-ID: <20260416153421.1692848f@bootlin.com>
In-Reply-To: <4yockfx5rjcvfh2n2excrgsknnhi72rv2w7wf7onks2ryt33sm@w7zkcxuc6vem>
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
	<4yockfx5rjcvfh2n2excrgsknnhi72rv2w7wf7onks2ryt33sm@w7zkcxuc6vem>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[chromium.org,linux.intel.com,oss.qualcomm.com,kernel.org,linuxfoundation.org,linux.dev,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,bootlin.com];
	TAGGED_FROM(0.00)[bounces-12805-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1506D40EF23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Manivannan,

On Thu, 16 Apr 2026 14:25:39 +0530
Manivannan Sadhasivam <mani@kernel.org> wrote:

> On Wed, Apr 15, 2026 at 04:56:51PM +0200, Herve Codina wrote:
> > Hi Chen, all,
> > 
> > ...
> >    
> > > 
> > > I'm not arguing for a even more generic "M.2" connector. The "key" is
> > > already described in the compatible. I'm saying we should have some way
> > > of describing the individual interfaces (PCIe, SDIO, USB, UART, I2S, I2C)
> > > on the connector so further nodes or properties can be attached to them,
> > > either with overlays or dynamically within the kernel. Right now the
> > > are only described as individual ports, but we can't actually tie a
> > > device to a OF graph port.
> > > 
> > > But maybe I'm overthinking the representation part. AFAICT for Qualcomm's
> > > UART-based BT bit part, Mani just had the driver create a device node
> > > under the UART (by traversing the OF graph to find the UART). If that's
> > > the desired way then the connector binding should mention it. And that
> > > works for me. But I think it's messier and also we're missing an
> > > opportunity to make the M.2 connector a standardized attachment point
> > > for overlays.
> > > 
> > > Mani, could you also chime in a bit on what you envisioned?
> > > 
> > > (Added Luca from Bootlin to CC, as I think there are parallels to the
> > >  "Hotplug of Non-discoverable Hardware" work)
> > >  
> > 
> > Related to "Hotplug of Non-discoverable Hardware",
> > 
> > I would add entries for busses in the connector without using an OF graph.
> >   
> 
> I don't think this is a correct representation. It is non-standard to describe
> the device nodes in some other connectors. While it may work with your series in
> the future, not something I would bet-on at this point.
> 
> Using OF graph to link the connector nodes look like the cleaner solution to me.

In your DT binding, there is the i2c-parent property at connector level.

How it is used or planned to be used in order to handle devices available on the
board connected to the M2 connector ?

> 
> > For I2C and later SPI, this was is done.
> > 
> > You already have an i2c-parent property but no node where an i2c device
> > can be added.
> > 
> > The last discussion related to hotplug, connectors and DT led to the RFC
> > series [1].
> > 
> > It is a huge series. The last patch give a real example of representation:
> >   https://lore.kernel.org/all/20260112142009.1006236-78-herve.codina@bootlin.com/
> > 
> > In your case I would see some thing like:
> > 
> >     connector {
> >         compatible = "pcie-m2-e-connector";
> >         vpcie3v3-supply = <&vreg_wcn_3p3>;
> >         vpcie1v8-supply = <&vreg_l15b_1p8>;
> > 
> > 	/*
> > 	 * If those GPIOs have to be used by components available in
> > 	 * the connected board, a Nexus node should be used.
> >          */
> >         w-disable1-gpios = <&tlmm 115 GPIO_ACTIVE_LOW>;
> >         w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
> >         viocfg-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> >         uart-wake-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
> >         sdio-wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
> >         sdio-reset-gpios = <&tlmm 120 GPIO_ACTIVE_LOW>;
> > 
> > 	conn-i2c {
> > 		i2c-parent = <&i2c0>;
> > 
> > 		/*
> >  		 * Here i2c devices available on the board
> > 		 * connected to the connector can be described.
> > 		 */
> > 	};
> > 
> > 	/* Same kind to description for other busses */
> > 	conn-pcie {
> > 		pci-parent = <&xxxxx>;
> > 
> > 		/*
> > 		 * The PCIe bus has abilities to discover devices.
> > 		 * Not sure this node is needed.
> > 		 *
> > 		 * If a PCI device need a DT description to describe
> > 		 * stuffs behind the device, what has been done for LAN966x
> > 		 * could be re-used [2] and [3]
> > 		 */  
> 
> I don't think anyone would connect something like LAN966x to the M.2 connector.
> M.2 cards have a defined purpose, like NVMe, WLAN etc... If anyone wants to
> connect another SoC like LAN966x, they would use non-M.2 connectors.

Hum, maybe yes, maybe not. I don't know what kind of hardware could be available
on a M2 connector.

One think sure is that a PCIe bus is available on the connector and so, potentially
all PCI devices could be wired on a M2 form factor.

LAN966x in PCI version is just a PCI device.

Anyway, Is it allowed to have sub-nodes in a port node ?

I mean, can we describe devices connected to a bus described by the port node ?

For USB and PCI it is probably not needed for common use cases but having a DT
description for devices on PCI and/or USB exists and is supported in the current
kernel

On SDIO, wireless devices can be described:
  Documentation/devicetree/bindings/net/wireless/

and so, sub-nodes will be needed.

As those devices need an address (reg property), #address-cells and
#size-cells will be needed.

This will end in a mix of sub-nodes describing devices and a sub-node
describing the endpoint connection.

#address-cells and #size-cells will conflict at some points.

Is a reg value for endpoints has the same characteristics as a reg value
for a SDIO device ?

How a BT devices is described under the UART available in the M2
connector ?

Best regards,
Hervé

