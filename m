Return-Path: <linux-kbuild+bounces-12272-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCn0IyjpxGkz5AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12272-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:07:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B87330DA2
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5027D30193BB
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 08:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226AB3A7F48;
	Thu, 26 Mar 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pw0lYK7n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD72B34D3A5;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512400; cv=none; b=MUG5MxpSPpwh/7qWmEkQts12wHrGJN2HJR7W6q/Z9B1bOg47fiGGzP/tGFL0Wb9O9d535CBsabH1JGV7sxvhLkJypapX+bAFba0SUtkxPQYh2qDjwabfHgNJwD5Zi7u0pU7nelal/Y5PF5Kog5zCnU8hOjuX3mmyNO1bpSSmLuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512400; c=relaxed/simple;
	bh=d6b5tGqYUx6+z9gficky9a1VVFlPor5JwCfeMzYcQjg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cEvg1/DpRrLrM0kARY8trwlrl/xnYAhvAQolcdpy7iqqC779CnlRroSkuPQeGX/9o6js6J+0ebYL5EE+pM76ngtuhuL7u2DC3hGlirdb3YF7RCMrRpx19YHOTxiAXK0wVt5i8/osVCAbYqKE44vYeybxeKuz5a7yBZpLH3cr4g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pw0lYK7n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A70DC19423;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774512400;
	bh=d6b5tGqYUx6+z9gficky9a1VVFlPor5JwCfeMzYcQjg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pw0lYK7nOrc87BJjF4nhZuHYgvTRIiyZl4BduxFdp7T4AS6acZVOIVjneDNKIAqzE
	 k/5n92+e5I6EMZgXyM2nfqsFSezMk3Ep1InmfXDoscX21omyBBz2hNSpUcXRZs9AAI
	 A0lTaizbdna775EqYA4KxAIqeGzp1e5E4kLrf4mR5Jb5ahBlRzHJBgUD361SDPcupu
	 EQkqQaAuEeHokegqlpyWALAH40KEKL6/i7ITEgocc8vpP7K89RsgmWOZUV9wSbBiNM
	 6TUcZKRV5mx79qF6b+AJtg6RXmnw25JAJRPIbNAoJDlsj4j7FDBpx7byboOuP0dk+0
	 ByX76VBvD89Ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27449106F2EF;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E connectors
 in devicetree
Date: Thu, 26 Mar 2026 13:36:28 +0530
Message-Id: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATpxGkC/3XRTW7DIBAF4KtErIsFw5/JqveourCZoUGq48Q4V
 qsody9OVIVFvEF6aL4nxFxZpilRZvvdlU20pJzGYwnubcfCoTt+EU9YMgMBRkoJ/BQSH4AT99p
 60wWP1jhWxk8TxfRzr/r4LPmQ8jxOv/fmRa63L0oWyQX3TkuFto8t6Pcx5+Z86b7DOAxNOdjat
 UDlwVQeilfQgkUSLgSz4dW/t0JKUXlVvI4dkUOBpqMNr2tfv18XTzG2GiFYBLvhzdMD6Mqb4hF
 9742QqFTY8PbplXSVt+v/hda3UYoWFb7wt8dyJjpfynrnx4ZY32Xi61Ca97vFNYJPQZbh2x9TJ
 KpTEwIAAA==
X-Change-ID: 20251112-pci-m2-e-94695ac9d657
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-acpi@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6213;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=d6b5tGqYUx6+z9gficky9a1VVFlPor5JwCfeMzYcQjg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpxOkIQ27nIdG+HSpuQkgQ+iXt5cDLBzdoizTmw
 u4CnZrALziJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCacTpCAAKCRBVnxHm/pHO
 9Si6B/4mpsKk3KIGc/++1wcwaummvgRQYCgAucKRk/JpZfipf3gQbNsYncxyyvH62TN7ssPFBmW
 RPwkHlYLgNjYo0CW0d3oW3zw1yCLiTnSpEIbuOoJTcGkvbbejj93wLXEYwIIYRFa4zIWrk4PHU/
 YqPMF4B6RRJHufdao7LXw7JQt6cewi/BaEu4Ilm5ceWuvHh8T728Le2EwhyiSOoRbKsxO1P5Zkq
 7/FvP6onMFELML95XPnc62fQ2M1GCnx3YFFQkP+hExhqJdeOm4FIy7p0go26raenyfCSqv6cKsU
 3HnNdYytwTmGEs1FQw2j3loeFf756dUvJN8EkEnTsf97/Pbo
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12272-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-kbuild@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 99B87330DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series is the continuation of the series [1] that added the initial support
for the PCIe M.2 connectors. This series extends it by adding support for Key E
connectors. These connectors are used to connect the Wireless Connectivity
devices such as WiFi, BT, NFC and GNSS devices to the host machine over
interfaces such as PCIe/SDIO, USB/UART and NFC. This series adds support for
connectors that expose PCIe interface for WiFi and UART interface for BT. Other
interfaces are left for future improvements.

Serdev device support for BT
============================

Adding support for the PCIe interface was mostly straightforward and a lot
similar to the previous Key M connector. But adding UART interface has proved to
be tricky. This is mostly because of the fact UART is a non-discoverable bus,
unlike PCIe which is discoverable. So this series relied on the PCI notifier to
create the serdev device for UART/BT. This means the PCIe interface will be
brought up first and after the PCIe device enumeration, the serdev device will
be created by the pwrseq driver. This logic is necessary since the connector
driver and DT node don't describe the device, but just the connector. So to make
the connector interface Plug and Play, the connector driver uses the PCIe device
ID to identify the card and creates the serdev device. This logic could be
extended in the future to support more M.2 cards. Even if the M.2 card uses SDIO
interface for connecting WLAN, a SDIO notifier could be added to create the
serdev device.

Testing
=======

This series, together with the devicetree changes [2] was tested on the
Qualcomm X1e based Lenovo Thinkpad T14s Laptop which has the WCN7850 WLAN/BT
1620 LGA card connected over PCIe and UART.

Merge Strategy
==============

Due to the API dependency, both the serdev and pwrseq patches need to go through
a single tree, maybe through pwrseq tree. So the serdev patches need Ack from
Greg. But Bluetooth patch can be merged separately.

NOTE
====

This series is based on bluetooth-next/master to resolve the conflict with the
Bluetooth patch. Other pathces should apply cleanly on top of v7.0-rc1.

[1] https://lore.kernel.org/linux-pci/20260107-pci-m2-v5-0-8173d8a72641@oss.qualcomm.com
[2] https://github.com/Mani-Sadhasivam/linux/commit/b50f8386900990eed3dce8d91c3b643fb0e8739d

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v7:
- Dropped the LGA binding change due to vendor prefix concern. This will be
  submitted later once I get clarity.
- Fixed several issues in the cleanup path of the pwrseq-pci-m2 driver which
  includes adding the .remove() callback.
- Rebased on top of bluetooth-next/master to resolve conflict with bluetooth
  patch.
- Link to v6: https://lore.kernel.org/r/20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com

Changes in v6:
- Added a check to bail out if the serdev device was already added during notifier.
- Collected tags
- Link to v5: https://lore.kernel.org/r/20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com

Changes in v5:
- Incorporated comments in the binding patch by using single endpoint per port,
  reordering port nodes, adding missing properties and using a complete example.
- Incorporated comments in the pwrseq patch (nothing major)
- Fixed the build issue in patch 2
- Collected tags
- Rebased on top of 7.0-rc1
- Link to v4: https://lore.kernel.org/r/20260112-pci-m2-e-v4-0-eff84d2c6d26@oss.qualcomm.com

Changes in v4:
- Switched to dynamic OF node for serdev instead of swnode and dropped all
  swnode related patches
- Link to v3: https://lore.kernel.org/r/20260110-pci-m2-e-v3-0-4faee7d0d5ae@oss.qualcomm.com

Changes in v3:
- Switched to swnode for the serdev device and dropped the custom
  serdev_device_id related patches
- Added new swnode APIs to match the swnode with existing of_device_id
- Incorporated comments in the bindings patch
- Dropped the UIM interface from binding since it is not clear how it should get
  wired
- Incorporated comments in the pwrseq driver patch
- Splitted the pwrseq patch into two
- Added the 1620 LGA compatible with Key E fallback based on Stephan's finding
- Link to v2: https://lore.kernel.org/r/20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com

Changes in v2:
- Used '-' for GPIO names in the binding and removed led*-gpios properties
- Described the endpoint nodes for port@0 and port@1 nodes
- Added the OF graph port to the serial binding
- Fixed the hci_qca driver to return err if devm_pwrseq_get() fails
- Incorporated various review comments in pwrseq driver
- Collected Ack
- Link to v1: https://lore.kernel.org/r/20251112-pci-m2-e-v1-0-97413d6bf824@oss.qualcomm.com

---
Manivannan Sadhasivam (8):
      serdev: Convert to_serdev_*() helpers to macros and use container_of_const()
      serdev: Add an API to find the serdev controller associated with the devicetree node
      serdev: Do not return -ENODEV from of_serdev_register_devices() if external connector is used
      dt-bindings: serial: Document the graph port
      dt-bindings: connector: Add PCIe M.2 Mechanical Key E connector
      Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
      power: sequencing: pcie-m2: Add support for PCIe M.2 Key E connectors
      power: sequencing: pcie-m2: Create serdev device for WCN7850 bluetooth

 .../bindings/connector/pcie-m2-e-connector.yaml    | 184 +++++++++++
 .../devicetree/bindings/serial/serial.yaml         |   3 +
 MAINTAINERS                                        |   1 +
 drivers/bluetooth/hci_qca.c                        |   9 +
 drivers/power/sequencing/Kconfig                   |   3 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c          | 346 ++++++++++++++++++++-
 drivers/tty/serdev/core.c                          |  28 +-
 include/linux/serdev.h                             |  24 +-
 8 files changed, 570 insertions(+), 28 deletions(-)
---
base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
change-id: 20251112-pci-m2-e-94695ac9d657

Best regards,
--  
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



