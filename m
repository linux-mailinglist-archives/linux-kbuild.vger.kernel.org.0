Return-Path: <linux-kbuild+bounces-12802-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG2HAzef4GlukQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12802-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 10:35:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AEA40BA1B
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 10:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 547DB302FDED
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 08:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255FD3932C7;
	Thu, 16 Apr 2026 08:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EI2+kHOe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E95391E75;
	Thu, 16 Apr 2026 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328496; cv=none; b=dxYCSUZe+DZDDHhv4D5rZD7BjBUCrBGYmmC4wlD0MdsOruK/yMkqGlbfvDXvteC7AlOvDhQnp6pCvbOBNRRPNrapoQRKokp1GrywJtWiyWT8/IDI+UY9nEXqeXvXapCnNW7kQIR5iDcAzgWD3Tk3pPL9aUp3hWflQIQ4Jj2v/c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328496; c=relaxed/simple;
	bh=aM4+d7l5SobaIHWwosmsIax5/zWaIyefWpD4h8VccEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfCi2DKV9pLA0D8ukdn0RngqAcPLWDRB/J1HPrAmJ9Y7TxpfHCbzgg5828TUv1KvGuwCBCaQs1F0MerKUvFHYtOjuZvhNlcjwY7iRhszjx61WB8CBK7IoUI0p/YqMGRsxM37jKFi1lzPODYGMsj9tAtOqiVUM+XHIsPwvgCryIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EI2+kHOe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59AEC2BCB3;
	Thu, 16 Apr 2026 08:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776328496;
	bh=aM4+d7l5SobaIHWwosmsIax5/zWaIyefWpD4h8VccEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EI2+kHOe/DSVW7CnFneR5MVopc93u+GXckFYs8+VSkPIcMFQWRZgP5q80n6iB1eiX
	 aoNUEwlqhXD+o+H9Eh11VuiH+quE4tAbQTtlE80W7c2LYprKl/R7Qjni/yScZ14lDN
	 Wvc1heA3ps2ph6X5y2R8R9fPI0wghozxYGHyPeDwvjLCQp0CS+CXJU7Cnh67pjqPQm
	 xG53TF8arOZmLIP9mOWvsmIDxybYzZ+Lbj0Ug/slhEhOriwaIrC2pN0DQqauKZ7hdx
	 MeMVb/IVzD9Jq2gRYN0O0zx/vHqqSqA30ro36X42rb6yE9cdu+ySyEC0vvg2SKuHBU
	 FwYQLiWDwwJ8w==
Date: Thu, 16 Apr 2026 14:04:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-acpi@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E
 connectors in devicetree
Message-ID: <7kpwgrxgtrpavmm2aezv66csuumma6wzsqtwvmojwgrtiqasjf@gczv34l6pnma>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com>
 <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
 <eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
 <CAGXv+5E=tujhtZjwi6Qm7hk3Ks74UzTQHWq82NiTEw1+vYod5g@mail.gmail.com>
 <ad36pIu-0dutL7Nk@ashevche-desk.local>
 <CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
 <ad4tJN27opdEooA7@ashevche-desk.local>
 <CAGXv+5EPA29G-fsH=wWOD8AK6TZFezFhsE0NHPYj_Pt3nT+d_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EPA29G-fsH=wWOD8AK6TZFezFhsE0NHPYj_Pt3nT+d_w@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[74.135.232.172.asn.rspamd.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12802-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,oss.qualcomm.com,kernel.org,linuxfoundation.org,linux.dev,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,bootlin.com];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E9AEA40BA1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:31:24PM +0800, Chen-Yu Tsai wrote:
> On Tue, Apr 14, 2026 at 8:03 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Apr 14, 2026 at 06:29:02PM +0800, Chen-Yu Tsai wrote:
> > > On Tue, Apr 14, 2026 at 4:28 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Apr 14, 2026 at 01:03:19PM +0800, Chen-Yu Tsai wrote:
> > > > > On Tue, Apr 14, 2026 at 12:08 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > > > On Mon, Apr 13, 2026 at 07:33:12PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasivam wrote:
> >
> > ...
> >
> > > > > > > > - Given that this connector actually represents two devices, how do I
> > > > > > > >   say I want the BT part to be a wakeup source, but not the WiFi part?
> > > > > > > >   Does wakeup-source even work at this point?
> > > > > > >
> > > > > > > You can't use the DT property since the devices are not described in DT
> > > > > > > statically. But you can still use the per-device 'wakeup' sysfs knob to enable
> > > > > > > wakeup.
> > > > >
> > > > > I see. I think not being able to specify generic properties for the devices
> > > > > on the connector is going to be a bit problematic.
> > > >
> > > > This is nature of the open-connectors, especially on the busses that are
> > > > hotpluggable, like PCIe. We never know what is connected there _ahead_.
> > >
> > > I believe what you mean by "hotpluggable" is "user replaceable".
> >
> > From the OS perspective it's the same. From platform perspective
> > there is a difference, granted.
> 
> Yes. I just wanted to clarify.
> 
> > > > In other words you can't describe in DT something that may not exist.
> > >
> > > But this is actually doable with the PCIe slot representation. The
> > > properties are put in the device node for the slot. If no card is
> > > actually inserted in the slot, then no device is created, and the
> > > device node is left as not associated with anything.
> >
> > But you need to list all devices in the world if you want to support this
> 
> Why would I need to? The PCIe slot representation just describes a
> PCIe bridge. Granted this might not be entirely correct, but it's
> what we currently have.
> 
> And even then, there are properties like memory-region or wakeup-source
> that are generic and aren't tied to specific devices.
> 
> > somehow. Yes, probably many of them (or majority) will be enumerated as is,
> > but some may need an assistance via (dynamic) properties or similar mechanisms.
> 
> Even if we wanted to add dynamic properties, there is currently no proper
> device node to attach them to.
> 

There are dynamic device nodes that we need to create for hotpluggable devices,
if we need to pass the DT properties to the driver. Like how we do it for PCIe,
serdev. You cannot describe static device nodes in DT for devices attached to
swappable cards like M.2.

> > > It's just that for this new M.2 E-key connector, there aren't separate
> > > nodes for each interface. And the system doesn't associate the device
> > > node with the device, because it's no longer a child node of the
> > > controller or hierarchy, but connected over the OF graph.
> > >
> > > Moving over to the E-key connector representation seems like one step
> > > forward and one step backward in descriptive ability. We gain proper
> > > power sequencing, but lose generic properties.
> >
> > The "key" is property of the connector. Hence if you have an idea what can be
> > common for ALL "key":s, that's probably can be abstracted. Note, I'm not
> > familiar with the connector framework in the Linux kernel, perhaps it's already
> > that kind of abstraction.
> 
> I'm not arguing for a even more generic "M.2" connector. The "key" is
> already described in the compatible. I'm saying we should have some way
> of describing the individual interfaces (PCIe, SDIO, USB, UART, I2S, I2C)
> on the connector so further nodes or properties can be attached to them,
> either with overlays or dynamically within the kernel. Right now the
> are only described as individual ports, but we can't actually tie a
> device to a OF graph port.
> 

If there are properties that apply to the interfaces, *not devices*, then you
can add them to the relevant endpoint node:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml#n167

> But maybe I'm overthinking the representation part. AFAICT for Qualcomm's
> UART-based BT bit part, Mani just had the driver create a device node
> under the UART (by traversing the OF graph to find the UART). If that's
> the desired way then the connector binding should mention it.

What do you mean by 'connector binding should mention it'? You cannot hardcode
the device node in the connector binding, because it is not part of the
connector binding itself. For example, the UART device node that is created for
the WCN7850, already has a binding:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml

What the driver does is, just creating that node under the serdev controller as
if the device was described statically in the DT.

For the wakeup property you asked earlier, it depends on the interface. If the
interface supports "in-band" wakeup like USB/SDIO, you can add the property in
the relevant controller node statically itself. For example, with USB XHCI
controller, you would know that the controller will support wakeup or not
statically. So you will add that property to the controller node. Then, if the
user has enabled the wakeup for a specific USB device like keyboard/mouse
through sysfs, then wakeup will just work. Here, we don't need to create the
USB device node at all.

But if the interface supports physical wakeup, like UART_WAKE# in M.2 SDIO Key
E, then based on the presence of that property, you would configure wakeup in
the connector driver itself. But this is not present as of now.

> And that
> works for me. But I think it's messier and also we're missing an
> opportunity to make the M.2 connector a standardized attachment point
> for overlays.
> 

I don't envision using overlays for the M.2 connectors. It is not strictly
needed, unless the connector is non-standard.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

