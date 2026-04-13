Return-Path: <linux-kbuild+bounces-12775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAy9EN4X3WnNZwkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12775-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 18:20:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38C3EEA88
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 18:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2350630493E3
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 16:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97F42D97B5;
	Mon, 13 Apr 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVzt9Sj5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC02D7DEF;
	Mon, 13 Apr 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096522; cv=none; b=rrhIMV6R9rp2xl34YuvNVNG98admKfHr3P6KlZDz+nj7O1VxviJECKzOwjvZ2fZbH8LrKIQiqkbVuaQ6TLJ1xWKEhm8EKZpQKXYl7/Q49DMEWWLF7h0dk5vidp8vpWQ8rhIn9bygsiZidr51gNB3IlXNJf78orDh71jtfuFNPW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096522; c=relaxed/simple;
	bh=qiSHxLPPIZVe0C4u4NCj88+quPA9WlsGUJ7L0/9iL+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3yKGC8C6oyj4ws8u6pSN0kJnu1ukeFvKndWeA2l0D46zmXzzPOQOcrElmy0zleeOgoOJB1XMgAWPRWFthDiE+PRVRKcyOu92iG5sscvhOjbxAecGDeS4OBOdgrHmMqqWcnQGup5UI2+i48kScfe+1vvGzkUElrqsI4bsb30VvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVzt9Sj5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C0DC2BCB7;
	Mon, 13 Apr 2026 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776096522;
	bh=qiSHxLPPIZVe0C4u4NCj88+quPA9WlsGUJ7L0/9iL+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVzt9Sj5x1vB5hUJ/ERGBDdbCHAA+xHGi+2Cab5YsuocOawxXcMHjs4QPVbmQMWHH
	 LBVP3W79Mk5i8k7mOvaIbXJJjX1s1EJbszc7MXKtUayDh5//la22v9tXBGKoLN13tc
	 eepA8AV6qgCa/rkuFtDGJ8EE/oTnnRWG43qYp5VgutsKmSxDuQlrIP9DLDsVqKeRSR
	 LtaLyidytcrvLFb7blWPjXw55+6nQYlanM9PABi0VRX/P7CFYTh19ZL0Ok2+YnB8pl
	 2FX3uftDhlsY8IDYJe1yV8chbX8VRNw3dXy4YHZRwsHp53Y0y/NTVPjB02cEI6vO+J
	 c1kgvd9F1CbtA==
Date: Mon, 13 Apr 2026 21:38:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E
 connectors in devicetree
Message-ID: <eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com>
 <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
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
	TAGGED_FROM(0.00)[bounces-12775-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A38C3EEA88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[Resending as my previous reply got bounced]

On Mon, Apr 13, 2026 at 07:33:12PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> > Hi,
> > 
> > On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasivam wrote:
> > > Hi,
> > > 
> > > This series is the continuation of the series [1] that added the initial support
> > > for the PCIe M.2 connectors. This series extends it by adding support for Key E
> > > connectors. These connectors are used to connect the Wireless Connectivity
> > > devices such as WiFi, BT, NFC and GNSS devices to the host machine over
> > > interfaces such as PCIe/SDIO, USB/UART and NFC. This series adds support for
> > > connectors that expose PCIe interface for WiFi and UART interface for BT. Other
> > > interfaces are left for future improvements.
> > 
> > Thanks for working on this. I started playing with it now that it is in
> > -next. The PCIe part works fine. I'm looking into how to fit the pwrseq
> > 
> > A couple questions:
> > 
> > - Given that this connector actually represents two devices, how do I
> >   say I want the BT part to be a wakeup source, but not the WiFi part?
> >   Does wakeup-source even work at this point?
> > 
> 
> You can't use the DT property since the devices are not described in DT
> statically. But you can still use the per-device 'wakeup' sysfs knob to enable
> wakeup.
> 
> > - Are there plans to do the SDIO part?
> > 
> 
> No, not at the moment. Feel free to take it up if you have the hardware and
> motivation :)
> 
> > - The matching done in the M.2 connector driver for pwrseq_get() seems a
> >   bit naive. It simply checks if the remote device in the OF graph is
> >   the same as the requesting device.
> > 
> >   I think this would run into issues with USB hubs. If I have a USB hub
> >   and two M.2 connectors, with both connectors connected to the same
> >   hub, pwrseq_get() is going to always return only one of the instances.
> >   This is because the USB hub has one device node with multiple OF graph
> >   ports.
> > 
> 
> Yeah, this is a known limitation. I'm trying to improve this part now and have
> the WIP commits here: https://github.com/Mani-Sadhasivam/linux/tree/pwrseq-bt-en-fixes
> 
> Once the merge window closes, I'll submit these.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

