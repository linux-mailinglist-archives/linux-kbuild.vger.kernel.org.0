Return-Path: <linux-kbuild+bounces-12772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKMjMF/53GnXYgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12772-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 16:10:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4897F3ED188
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 16:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 463863051A97
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 14:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F399E3CF024;
	Mon, 13 Apr 2026 14:03:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51F43CB2C1;
	Mon, 13 Apr 2026 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776088992; cv=none; b=YZceBHgH4bUMaps8QTPAPDTRV0J6kkPj+/M5WeNmMP2isXzJV/9Em9nF9+Tmu06pC+YLxm6kOBmo6Qqm9Mj+OpDgGvwcouJ58/8/1dp6wxJmwukDSDaZjRuE3+GQmf/IBqYyAd+pAwwqLgC5ixMzVK6anX8QrEqIslYIgsbvVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776088992; c=relaxed/simple;
	bh=ZujmsWUiIlgFWuYStOUbuRgZOWkohs/X7TyfIkjFDX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efDZ2JdPE90FGg9ogvnnpHIbKTrfSznnGKNM10b1x33TwmWyA9///HlchC6Nc/o7urdMZKzL/xfm1NKAPB6iCc5nJK4qZEtxelDFnoqRYnk+nzbJEamrUn+Dpl6LI/EMRClzTd9AX5FXHtJhCGRfGMV6l8v8mXU8L87XeXa7bBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE95C2BCAF;
	Mon, 13 Apr 2026 14:03:03 +0000 (UTC)
Date: Mon, 13 Apr 2026 19:32:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-acpi@vger.kernel.org, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E
 connectors in devicetree
Message-ID: <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413075459.GA2626902@google.com>
X-Spamd-Result: default: False [2.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12772-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4897F3ED188
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series is the continuation of the series [1] that added the initial support
> > for the PCIe M.2 connectors. This series extends it by adding support for Key E
> > connectors. These connectors are used to connect the Wireless Connectivity
> > devices such as WiFi, BT, NFC and GNSS devices to the host machine over
> > interfaces such as PCIe/SDIO, USB/UART and NFC. This series adds support for
> > connectors that expose PCIe interface for WiFi and UART interface for BT. Other
> > interfaces are left for future improvements.
> 
> Thanks for working on this. I started playing with it now that it is in
> -next. The PCIe part works fine. I'm looking into how to fit the pwrseq
> 
> A couple questions:
> 
> - Given that this connector actually represents two devices, how do I
>   say I want the BT part to be a wakeup source, but not the WiFi part?
>   Does wakeup-source even work at this point?
> 

You can't use the DT property since the devices are not described in DT
statically. But you can still use the per-device 'wakeup' sysfs knob to enable
wakeup.

> - Are there plans to do the SDIO part?
> 

No, not at the moment. Feel free to take it up if you have the hardware and
motivation :)

> - The matching done in the M.2 connector driver for pwrseq_get() seems a
>   bit naive. It simply checks if the remote device in the OF graph is
>   the same as the requesting device.
> 
>   I think this would run into issues with USB hubs. If I have a USB hub
>   and two M.2 connectors, with both connectors connected to the same
>   hub, pwrseq_get() is going to always return only one of the instances.
>   This is because the USB hub has one device node with multiple OF graph
>   ports.
> 

Yeah, this is a known limitation. I'm trying to improve this part now and have
the WIP commits here: https://github.com/Mani-Sadhasivam/linux/tree/pwrseq-bt-en-fixes

Once the merge window closes, I'll submit these.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

