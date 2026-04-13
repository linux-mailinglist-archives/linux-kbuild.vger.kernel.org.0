Return-Path: <linux-kbuild+bounces-12770-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NL+BFCj3GktUwkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12770-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 10:03:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 626043E8B94
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 10:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C49A305E9CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2026 07:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E031939FCB1;
	Mon, 13 Apr 2026 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n2eA5xLj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EF39902D
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066908; cv=none; b=TUAM3qb9XaeGYO8YMRL1NPK1u/LWVHUw2L/Ir0Q6WYk8jN9H8rH73q2kxqQhoHZh5ic2yP080Ft69n3EEy88/NayO3eLb6FFjh4hAYzRNBPcRTcOXYfw96rr7AYzOgnPWyCUMxoiqwP7L4k2dH0FTfAavoTA1OLoORaAh16PelI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066908; c=relaxed/simple;
	bh=6XIKxYQuO3AS12c9nvyzAZXTAEomu+IKjck0wFYzM/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgzz+L6UID6R4nJMcpdvDd+6k19s8DdFPvxU3T/R3bqd+PF+tSpyeszqfdXzALsRQDuiYsulLZh+rCinFpc4hc3MUHFQ60FpDJmrFO9wy3qiukRT0IbV5IPqDz5w4eczn8zKPvtk8GvQ2Yp54cTPCZ1uKpACRupcXwupwvCDajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n2eA5xLj; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so1508714a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2026 00:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776066906; x=1776671706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WW3N60RcuwkdOk7B+SAX7DubiMOl+LSl+vKA0bH61pA=;
        b=n2eA5xLjfunVYz0xjYz9m2uo/Q5HulRTIs/WrvRx/1ZymvNoGJayo2b8Lp2phPC9tz
         nfoNNwzUl2PbY9Svi2khZiKB82kLid02qDSL+HUqPidslt1lZZHjoTiApN1Zch3LCN0g
         krYaJR2pZ75mSZxJwEQcy2kUeC55brSBdrEns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066906; x=1776671706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WW3N60RcuwkdOk7B+SAX7DubiMOl+LSl+vKA0bH61pA=;
        b=ViRA1lLI705+Sgux5Eux1nC7r0ldZzUuNBCelfaXWWKjGONrUEVezt7skcAdoxeezz
         6f1DoP6yuvHjm6eNALLLJEdMFkVCWWzf2+qUB/PwkwaxORFOgHpObremE40eKA2YYRPt
         EaOngTdxpE2BFDwglUWoNl6i0NT/Rm15GuktFgrDqpY+Mt03ZqI04ADxKJX5xnRKBvma
         svwkb+mtEZAooyNtBMKCgI3jV/WoK1gmWzJvB1XuKW40ukUpwWQ4XlS42QF0NnGUMIU3
         73+EPoJw9Wz1Ar1l3kddBny34iGRu1EjePwSxgqrjKTH2EiaatLW3FFIb1+1hpScsWjG
         jdng==
X-Forwarded-Encrypted: i=1; AFNElJ/y+RLPTBrIjdz1tVNuyXLk+dc4AwHT8akRzIg1uk1+pP/Dgr41eoG0G1mrALBmjFhT9Lb2sBgggyt4h3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo2LIwU6BiL847rd8brL6xOj+JGyxhiK+FHfH9n3PPFzzO1AlO
	4V3XrYCQaMUjFCCdiSqJw394zvV/0S5r6t41QKhlMFLyKkMFtrLqGyql6HgCRLoN+w==
X-Gm-Gg: AeBDievo1VdFqrbO6677WYM2YNd64moHlHAXoDR1RS8uzTNcnvKpO+MscImKZJOtwje
	h6jVSjzlJT8RU+eAf3POPuhu8zOFZIin266ltSDIvNaCMd9gACBtDjA7dhuJ3iZbnG+fJ//mqNV
	IGWoxbtOhAwNtEBvzPSbmo9nu2FpDVVUXB2DfcVMCM8MD+l/7VXK+wE+Gd7VlNYDpEYK9xpv/jN
	uN/7t5otFV6zUFoY7giGfDPpkM6ZP6tpS6+GGd9Kh4wzjBWzUodXROnXJejgsNSTSYsAHwKMcU2
	P7XKBRHgW/ad+Qovelb19+M8bCWiyC/BCCOJy7lQESp1UsMoozCxGZrhhXQ/JYN4C1+lbQKlGIC
	TffqTpmHeimjqnMbmKinlai8+lxM9UaH+xXOar7Izwr+QwbP2TKgk0ybqYHarptAbXrYOnfzKpN
	ABbJnfuUPSFLXNHihYctvw1VQj3yvC7u9cjDbd9Bwca+7ZxvqJg/3qYQ==
X-Received: by 2002:a17:90a:fb57:b0:35f:b3b9:3bf3 with SMTP id 98e67ed59e1d1-35fb3b94609mr2085139a91.10.1776066906196;
        Mon, 13 Apr 2026 00:55:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:201d:8:2a1c:32da:452:ff77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45fdaa77dsm20114165ad.49.2026.04.13.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:55:05 -0700 (PDT)
Date: Mon, 13 Apr 2026 15:54:59 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <20260413075459.GA2626902@google.com>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-12770-lists,linux-kbuild=lfdr.de];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[chromium.org,none];
	RCPT_COUNT_TWELVE(0.00)[32];
	R_DKIM_ALLOW(0.00)[chromium.org:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.263];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,chromium.org:dkim,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 626043E8B94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series is the continuation of the series [1] that added the initial support
> for the PCIe M.2 connectors. This series extends it by adding support for Key E
> connectors. These connectors are used to connect the Wireless Connectivity
> devices such as WiFi, BT, NFC and GNSS devices to the host machine over
> interfaces such as PCIe/SDIO, USB/UART and NFC. This series adds support for
> connectors that expose PCIe interface for WiFi and UART interface for BT. Other
> interfaces are left for future improvements.

Thanks for working on this. I started playing with it now that it is in
-next. The PCIe part works fine. I'm looking into how to fit the pwrseq

A couple questions:

- Given that this connector actually represents two devices, how do I
  say I want the BT part to be a wakeup source, but not the WiFi part?
  Does wakeup-source even work at this point?

- Are there plans to do the SDIO part?

- The matching done in the M.2 connector driver for pwrseq_get() seems a
  bit naive. It simply checks if the remote device in the OF graph is
  the same as the requesting device.

  I think this would run into issues with USB hubs. If I have a USB hub
  and two M.2 connectors, with both connectors connected to the same
  hub, pwrseq_get() is going to always return only one of the instances.
  This is because the USB hub has one device node with multiple OF graph
  ports.


Thanks
ChenYu


> Serdev device support for BT
> ============================
> 
> Adding support for the PCIe interface was mostly straightforward and a lot
> similar to the previous Key M connector. But adding UART interface has proved to
> be tricky. This is mostly because of the fact UART is a non-discoverable bus,
> unlike PCIe which is discoverable. So this series relied on the PCI notifier to
> create the serdev device for UART/BT. This means the PCIe interface will be
> brought up first and after the PCIe device enumeration, the serdev device will
> be created by the pwrseq driver. This logic is necessary since the connector
> driver and DT node don't describe the device, but just the connector. So to make
> the connector interface Plug and Play, the connector driver uses the PCIe device
> ID to identify the card and creates the serdev device. This logic could be
> extended in the future to support more M.2 cards. Even if the M.2 card uses SDIO
> interface for connecting WLAN, a SDIO notifier could be added to create the
> serdev device.
> 
> Testing
> =======
> 
> This series, together with the devicetree changes [2] was tested on the
> Qualcomm X1e based Lenovo Thinkpad T14s Laptop which has the WCN7850 WLAN/BT
> 1620 LGA card connected over PCIe and UART.
> 
> Merge Strategy
> ==============
> 
> Due to the API dependency, both the serdev and pwrseq patches need to go through
> a single tree, maybe through pwrseq tree. So the serdev patches need Ack from
> Greg. But Bluetooth patch can be merged separately.
> 
> NOTE
> ====
> 
> This series is based on bluetooth-next/master to resolve the conflict with the
> Bluetooth patch. Other pathces should apply cleanly on top of v7.0-rc1.
> 
> [1] https://lore.kernel.org/linux-pci/20260107-pci-m2-v5-0-8173d8a72641@oss.qualcomm.com
> [2] https://github.com/Mani-Sadhasivam/linux/commit/b50f8386900990eed3dce8d91c3b643fb0e8739d
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Changes in v7:
> - Dropped the LGA binding change due to vendor prefix concern. This will be
>   submitted later once I get clarity.
> - Fixed several issues in the cleanup path of the pwrseq-pci-m2 driver which
>   includes adding the .remove() callback.
> - Rebased on top of bluetooth-next/master to resolve conflict with bluetooth
>   patch.
> - Link to v6: https://lore.kernel.org/r/20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com
> 
> Changes in v6:
> - Added a check to bail out if the serdev device was already added during notifier.
> - Collected tags
> - Link to v5: https://lore.kernel.org/r/20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com
> 
> Changes in v5:
> - Incorporated comments in the binding patch by using single endpoint per port,
>   reordering port nodes, adding missing properties and using a complete example.
> - Incorporated comments in the pwrseq patch (nothing major)
> - Fixed the build issue in patch 2
> - Collected tags
> - Rebased on top of 7.0-rc1
> - Link to v4: https://lore.kernel.org/r/20260112-pci-m2-e-v4-0-eff84d2c6d26@oss.qualcomm.com
> 
> Changes in v4:
> - Switched to dynamic OF node for serdev instead of swnode and dropped all
>   swnode related patches
> - Link to v3: https://lore.kernel.org/r/20260110-pci-m2-e-v3-0-4faee7d0d5ae@oss.qualcomm.com
> 
> Changes in v3:
> - Switched to swnode for the serdev device and dropped the custom
>   serdev_device_id related patches
> - Added new swnode APIs to match the swnode with existing of_device_id
> - Incorporated comments in the bindings patch
> - Dropped the UIM interface from binding since it is not clear how it should get
>   wired
> - Incorporated comments in the pwrseq driver patch
> - Splitted the pwrseq patch into two
> - Added the 1620 LGA compatible with Key E fallback based on Stephan's finding
> - Link to v2: https://lore.kernel.org/r/20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com
> 
> Changes in v2:
> - Used '-' for GPIO names in the binding and removed led*-gpios properties
> - Described the endpoint nodes for port@0 and port@1 nodes
> - Added the OF graph port to the serial binding
> - Fixed the hci_qca driver to return err if devm_pwrseq_get() fails
> - Incorporated various review comments in pwrseq driver
> - Collected Ack
> - Link to v1: https://lore.kernel.org/r/20251112-pci-m2-e-v1-0-97413d6bf824@oss.qualcomm.com
> 
> ---
> Manivannan Sadhasivam (8):
>       serdev: Convert to_serdev_*() helpers to macros and use container_of_const()
>       serdev: Add an API to find the serdev controller associated with the devicetree node
>       serdev: Do not return -ENODEV from of_serdev_register_devices() if external connector is used
>       dt-bindings: serial: Document the graph port
>       dt-bindings: connector: Add PCIe M.2 Mechanical Key E connector
>       Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
>       power: sequencing: pcie-m2: Add support for PCIe M.2 Key E connectors
>       power: sequencing: pcie-m2: Create serdev device for WCN7850 bluetooth
> 
>  .../bindings/connector/pcie-m2-e-connector.yaml    | 184 +++++++++++
>  .../devicetree/bindings/serial/serial.yaml         |   3 +
>  MAINTAINERS                                        |   1 +
>  drivers/bluetooth/hci_qca.c                        |   9 +
>  drivers/power/sequencing/Kconfig                   |   3 +-
>  drivers/power/sequencing/pwrseq-pcie-m2.c          | 346 ++++++++++++++++++++-
>  drivers/tty/serdev/core.c                          |  28 +-
>  include/linux/serdev.h                             |  24 +-
>  8 files changed, 570 insertions(+), 28 deletions(-)
> ---
> base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
> change-id: 20251112-pci-m2-e-94695ac9d657
> 
> Best regards,
> --  
> Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 

