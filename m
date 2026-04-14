Return-Path: <linux-kbuild+bounces-12783-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CElREgEv3mnxogkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12783-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 14:11:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F83F9D8F
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 14:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF1B430B449D
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FA93E6382;
	Tue, 14 Apr 2026 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lN9Q2rzP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64D73DB62F;
	Tue, 14 Apr 2026 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168242; cv=none; b=uS6ZdEjLYwyrVGQIZuQQQgZW4/RA2czv3FhxajkvAxY7jNwVdbrbov/2gLt/Fei68Y7rpdO4a8PTFsEzpn36iLEKPJNdpiL2Iv8WHt5Nc/YvIwdryTYrvxkpgPFWgfLWnewQoc+BgzFS0/6FmBdq+t3lD3POw3ZG3S4ndcJlEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168242; c=relaxed/simple;
	bh=XuIfQdpw4dKQfCeaOqVZ7TbeHDY8p+W1bg0oUq5Xcpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duPDK8usu33ogXrLOG77e2GVKWHC2U2VdP4JF26SptPUtHmtvxSAIeKj/UQgwClJbfohNP0AkXdwHIdNsOKDD4soYRxW8/lAdnDFZJGBMSN6rcRPyVkK19R8pXlXX8EILcbI/HM+COPYVs7v9+xF9+jZIkAeBoWWrajTdTQU7Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lN9Q2rzP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776168240; x=1807704240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XuIfQdpw4dKQfCeaOqVZ7TbeHDY8p+W1bg0oUq5Xcpc=;
  b=lN9Q2rzP7UNbVDxTqq0P5GLkM5FhBiiUY12jnOJZyCAJWH4xfOH+HaPI
   7clhRQWG07r97n4K4mP9OXeo6Hue8rtDUgQidtHsZ6LSEbbZUEvkdI1YD
   sw6sC6AzADSmhP2zpj1eUVWKNJbWLNyQXX8Z+8RelmXairOB8A6RHbphb
   RioHUldlYXWaIDomLCOV4q+/QFXLX9EqwjzQ74yJy13qZQSNUcPf3kxpG
   gd+44rxzj/xlYz7rd2kGjY8gtC0Bg/Pdm6g1zy4CJkM+pYfUPQbRUTGRv
   9jglgQDL6yp7AvGuVVD9dHkekR1rYjVLZm60ykPSDMD+eOZRZ4wENyyiC
   w==;
X-CSE-ConnectionGUID: IHwHzcgoSCinzMuTWDxZOQ==
X-CSE-MsgGUID: xEByJX8ESQm3mChoWEWfcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87745630"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87745630"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:03:58 -0700
X-CSE-ConnectionGUID: rZmnoAiLSyyixPks5Niq+A==
X-CSE-MsgGUID: u6gN3YWoRqmtKm6D9wpUcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230009608"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:03:51 -0700
Date: Tue, 14 Apr 2026 15:03:48 +0300
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E
 connectors in devicetree
Message-ID: <ad4tJN27opdEooA7@ashevche-desk.local>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com>
 <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
 <eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
 <CAGXv+5E=tujhtZjwi6Qm7hk3Ks74UzTQHWq82NiTEw1+vYod5g@mail.gmail.com>
 <ad36pIu-0dutL7Nk@ashevche-desk.local>
 <CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org];
	TAGGED_FROM(0.00)[bounces-12783-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: C19F83F9D8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 06:29:02PM +0800, Chen-Yu Tsai wrote:
> On Tue, Apr 14, 2026 at 4:28 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Apr 14, 2026 at 01:03:19PM +0800, Chen-Yu Tsai wrote:
> > > On Tue, Apr 14, 2026 at 12:08 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > On Mon, Apr 13, 2026 at 07:33:12PM +0530, Manivannan Sadhasivam wrote:
> > > > > On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> > > > > > On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasivam wrote:

...

> > > > > > - Given that this connector actually represents two devices, how do I
> > > > > >   say I want the BT part to be a wakeup source, but not the WiFi part?
> > > > > >   Does wakeup-source even work at this point?
> > > > >
> > > > > You can't use the DT property since the devices are not described in DT
> > > > > statically. But you can still use the per-device 'wakeup' sysfs knob to enable
> > > > > wakeup.
> > >
> > > I see. I think not being able to specify generic properties for the devices
> > > on the connector is going to be a bit problematic.
> >
> > This is nature of the open-connectors, especially on the busses that are
> > hotpluggable, like PCIe. We never know what is connected there _ahead_.
> 
> I believe what you mean by "hotpluggable" is "user replaceable".

From the OS perspective it's the same. From platform perspective
there is a difference, granted.

> > In other words you can't describe in DT something that may not exist.
> 
> But this is actually doable with the PCIe slot representation. The
> properties are put in the device node for the slot. If no card is
> actually inserted in the slot, then no device is created, and the
> device node is left as not associated with anything.

But you need to list all devices in the world if you want to support this
somehow. Yes, probably many of them (or majority) will be enumerated as is,
but some may need an assistance via (dynamic) properties or similar mechanisms.

> It's just that for this new M.2 E-key connector, there aren't separate
> nodes for each interface. And the system doesn't associate the device
> node with the device, because it's no longer a child node of the
> controller or hierarchy, but connected over the OF graph.
> 
> Moving over to the E-key connector representation seems like one step
> forward and one step backward in descriptive ability. We gain proper
> power sequencing, but lose generic properties.

The "key" is property of the connector. Hence if you have an idea what can be
common for ALL "key":s, that's probably can be abstracted. Note, I'm not
familiar with the connector framework in the Linux kernel, perhaps it's already
that kind of abstraction.

> The latter part is solvable, but we likely need child nodes under the
> connector for the different interfaces. Properties that make sense for
> one type might not make sense for another.
> 
> P.S. We could also just add child device nodes under the controller to
> put the generic properties, but that's splitting the description into
> multiple parts. Let's not go there if at all possible.

-- 
With Best Regards,
Andy Shevchenko



