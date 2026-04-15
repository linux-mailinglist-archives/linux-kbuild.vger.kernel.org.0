Return-Path: <linux-kbuild+bounces-12789-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOqJA6ZW32ndRwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12789-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 11:13:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D940267E
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 11:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C8B53029791
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 09:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC7E3246EB;
	Wed, 15 Apr 2026 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4GZKgUQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A13115BC;
	Wed, 15 Apr 2026 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244037; cv=none; b=na45M0+Ra8Z8FVGViqmhk5a3xZKSo7UrLMu7qyobdesKXKDdzMxVbsbRsMsE2T2fJsR3mgOvmyu7ozo5B4x4Zei6nF8td4dgg36zUi4wwzsdVVm1S1kTvw1bk557R4ivgv4uZbvYPd3FAnO4jL4A8yQ0nvQSurIqz3mmyoHty7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244037; c=relaxed/simple;
	bh=XHcFesqTcaOkSuOln4bQvIcKY4DyL9z2YyP7unLltzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krwbDui9KKDeJOFN2UJNpe6fVGZ5LacrvPk+7frVj52cgHqY5kJdoYOfk1ivzw4y/mMyD0PgSDH/yEDMPU/cc5fFcz8ItKVHMFRr84YoR+dTGOtb7p34EQYoXW2hixUPdkzroUka8RN4KZG/u+ug9ePJoJau2mj1abMfVbT8rko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4GZKgUQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776244036; x=1807780036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XHcFesqTcaOkSuOln4bQvIcKY4DyL9z2YyP7unLltzk=;
  b=n4GZKgUQqDMry7ukJAZ8CieW6miim0Ez8LYNOd0PJyViZDbqvY04EgjW
   fk7opFqlHvihbIYouIYPNWEEQ5OknfFNSur54PNfS5tS3QVkh4gp3ZvIP
   npdCa/oElsPXEOFskZrxR0pjNLBFgslor70ADJwq4i5dL6F0CXwwG9Ufg
   nftBwHN/IV7CsWRycl95iT33rOcr+7nMtDHyymo+jjtXFXlMGZue0DAPa
   gcF3A6X5HnAlqjp1fzCuxFUKR1pqPvl2I6NPXQLIA+EVOOPtR2Z8vMsUU
   2kGy41FL7Bhg6oUmEZSh8snhRFBZRQ6pi5sR+z3sv9dYm4AHqyxk7ZP1q
   g==;
X-CSE-ConnectionGUID: xBnssV7sQJGFWH/O+01xTw==
X-CSE-MsgGUID: 4v8MOZs4T0iqz/qDk9I0rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88665396"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88665396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:07:15 -0700
X-CSE-ConnectionGUID: dig/invKSJuZ7wLgGQHR4w==
X-CSE-MsgGUID: XwsoHjG9TAOScEITg4Ykxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="260786988"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.34])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:07:09 -0700
Date: Wed, 15 Apr 2026 12:07:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E
 connectors in devicetree
Message-ID: <ad9VOqjTiLNM6keW@ashevche-desk.local>
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
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,bootlin.com];
	TAGGED_FROM(0.00)[bounces-12789-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A26D940267E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:31:24PM +0800, Chen-Yu Tsai wrote:
> On Tue, Apr 14, 2026 at 8:03 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Apr 14, 2026 at 06:29:02PM +0800, Chen-Yu Tsai wrote:
> > > On Tue, Apr 14, 2026 at 4:28 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Apr 14, 2026 at 01:03:19PM +0800, Chen-Yu Tsai wrote:
> > > > > On Tue, Apr 14, 2026 at 12:08 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > > > On Mon, Apr 13, 2026 at 07:33:12PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasivam wrote:

...

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

Yes,  see below what I replied...

> > somehow. Yes, probably many of them (or majority) will be enumerated as is,

^^^ "the majority" will work without any assistance.

> > but some may need an assistance via (dynamic) properties or similar mechanisms.

> Even if we wanted to add dynamic properties, there is currently no proper
> device node to attach them to.

Isn't that's node created dynamically as well and attached to the PCI bus?

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

Shouldn't it be described as a DT subtree? Sorry, I am not familiar with DT
enough to understand the issue you have.

> But maybe I'm overthinking the representation part. AFAICT for Qualcomm's
> UART-based BT bit part, Mani just had the driver create a device node
> under the UART (by traversing the OF graph to find the UART). If that's
> the desired way then the connector binding should mention it. And that
> works for me. But I think it's messier and also we're missing an
> opportunity to make the M.2 connector a standardized attachment point
> for overlays.

Okay, now it might get clearer to me, but still, I am not an expert.

> Mani, could you also chime in a bit on what you envisioned?

+1, please elaborate to me as well.

> (Added Luca from Bootlin to CC, as I think there are parallels to the
>  "Hotplug of Non-discoverable Hardware" work)
> 
> > > The latter part is solvable, but we likely need child nodes under the
> > > connector for the different interfaces. Properties that make sense for
> > > one type might not make sense for another.
> > >
> > > P.S. We could also just add child device nodes under the controller to
> > > put the generic properties, but that's splitting the description into
> > > multiple parts. Let's not go there if at all possible.

-- 
With Best Regards,
Andy Shevchenko



