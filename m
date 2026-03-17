Return-Path: <linux-kbuild+bounces-11996-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHbzHvvYuGmjkAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11996-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:30:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBA92A39CB
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D67DC304608E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 04:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038E337B40E;
	Tue, 17 Mar 2026 04:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8L6Qodh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F20374E73;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721803; cv=none; b=RhG6RGmX45fhyeudQFsr480w6hhVumeGCPcr+aDKZMfWBA8bShJc6JTyUITUucvEGsKDoF7kL0YP+TKM77yNrDLnZ+ukU9p3eqfodc/Dl0QPwo3Fuokjv5i2Iyxq3HWzbgsAJ8GhyJsdI6wV5FK2FxMEXitKRRed39eU/irACbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721803; c=relaxed/simple;
	bh=KEHRuQXTgrOKQFXJBk6d+nUf4A2TRz1DD0R55yMs2zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qrJQ6uwqnS7rFQa9DZX7bNlGv2ByOvanYS2J2BkiHRPNB5QoorjlRSaUM0xWp8azYtRuMFPoK7E30heYJQV/GKkQDP/6+QxQ81upGQtxzX81e0olM4yrPmlC690SUCR/pvlmiIdhp269prkDYjARA+KPilQP8I+F2FbWpMjKM5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8L6Qodh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 205FBC2BCF7;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773721803;
	bh=KEHRuQXTgrOKQFXJBk6d+nUf4A2TRz1DD0R55yMs2zE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P8L6QodhaqUtjsYjX6fJnaUSfbiAKpWyvT4f/MT9SqoYx0KDTDWML4sxYie3Y9Fqj
	 FypThZ7XgYZ4KUJ9SL8RmwlgRJOaMXpqggau6/VD9AW8fJobCoDaJ7tN9du0BXSpo8
	 WVT1Si3a4BMh4qKTIyPQ7W5hIhhyyD5un6IP3ikAngnqg5ezHoeeXgze+9Dori1mBf
	 gYgDtv2+MRxenRoMd8+mVNIY2unmO8Ns7hh+ZgSEQMMAYuW+ZwA+BlBq6rfQileZK5
	 fPwQ7q2AntmdMP2DXCjvot3FfPwdsBLolcu9x1diYIkM+rC6LT0LJL8p1agCm3CSU6
	 wHE6pOz7Sl7JA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D649FB5EB3;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 17 Mar 2026 09:59:55 +0530
Subject: [PATCH v6 5/9] dt-bindings: connector: Add PCIe M.2 Mechanical Key
 E connector
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-pci-m2-e-v6-5-9c898f108d3d@oss.qualcomm.com>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
In-Reply-To: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8239;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=ucsfrtxSU4fN4pYd3XMP8FLE2lLgcpnrofJ4vw1Qbzw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpuNjHmbb21IoOkX/TiCPD4iY/t169IZoLQ16T9
 U+cv6xy1keJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCabjYxwAKCRBVnxHm/pHO
 9Z7/B/wNYsHClmf8dED8oAe1qYL6EDK+kOYMGAvcAhMhfth91vCRPuFZ2+eI36QZT/860ThTZOW
 WBE+uMqxpr3ntlX4DytsY41Azp5g46S26lAx8KQ3bnffTeuFBqH+zYYM49KLk0//6XiK2ZyqDxW
 3ICU/QN6sLEVaTISylxHuHvk8atx+pbQluto3SResgmN7nfgO9ju1Wi5UXHvWru/q+t0v2YgVHF
 83F6qPygIgOkj/vdTo/m1b8WhCSbHAx3A1VCUlRWszNTUPQA16Ycd3YzHE7RijmLBEIuU8Ls0fM
 R8ybCWr+vS4eClQ8uk/TNnamYhBFiqfSv0QBtdfz2Z+D6ti6
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11996-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,0.0.0.4:email,0.0.0.3:email]
X-Rspamd-Queue-Id: EFBA92A39CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Add the devicetree binding for PCIe M.2 Mechanical Key E connector defined
in the PCI Express M.2 Specification, r4.0, sec 5.1.2. This connector
provides interfaces like PCIe or SDIO to attach the WiFi devices to the
host machine, USB or UART+PCM interfaces to attach the Bluetooth (BT)
devices. Spec also provides an optional interface to connect the UIM card,
but that is not covered in this binding.

The connector provides a primary power supply of 3.3v, along with an
optional 1.8v VIO supply for the Adapter I/O buffer circuitry operating at
1.8v sideband signaling.

The connector also supplies optional signals in the form of GPIOs for fine
grained power management.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 .../bindings/connector/pcie-m2-e-connector.yaml    | 184 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 185 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
new file mode 100644
index 000000000000..f7859aa9b634
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/pcie-m2-e-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCIe M.2 Mechanical Key E Connector
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
+
+description:
+  A PCIe M.2 E connector node represents a physical PCIe M.2 Mechanical Key E
+  connector. Mechanical Key E connectors are used to connect Wireless
+  Connectivity devices including combinations of Wi-Fi, BT, NFC to the host
+  machine over interfaces like PCIe/SDIO, USB/UART+PCM, and I2C.
+
+properties:
+  compatible:
+    const: pcie-m2-e-connector
+
+  vpcie3v3-supply:
+    description: A phandle to the regulator for 3.3v supply.
+
+  vpcie1v8-supply:
+    description: A phandle to the regulator for VIO 1.8v supply.
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: I2C interface
+
+  clocks:
+    description: 32.768 KHz Suspend Clock (SUSCLK) input from the host system to
+      the M.2 card. Refer, PCI Express M.2 Specification r4.0, sec 3.1.12.1 for
+      more details.
+    maxItems: 1
+
+  w-disable1-gpios:
+    description: GPIO output to W_DISABLE1# signal. This signal is used by the
+      host system to disable WiFi radio in the M.2 card. Refer, PCI Express M.2
+      Specification r4.0, sec 3.1.12.3 for more details.
+    maxItems: 1
+
+  w-disable2-gpios:
+    description: GPIO output to W_DISABLE2# signal. This signal is used by the
+      host system to disable BT radio in the M.2 card. Refer, PCI Express M.2
+      Specification r4.0, sec 3.1.12.3 for more details.
+    maxItems: 1
+
+  viocfg-gpios:
+    description: GPIO input to IO voltage configuration (VIO_CFG) signal. The
+      card drives this signal to indicate to the host system whether the card
+      supports an independent IO voltage domain for sideband signals. Refer,
+      PCI Express M.2 Specification r4.0, sec 3.1.15.1 for more details.
+    maxItems: 1
+
+  uart-wake-gpios:
+    description: GPIO input to UART_WAKE# signal. The card asserts this signal
+      to wake the host system and initiate UART interface communication. Refer,
+      PCI Express M.2 Specification r4.0, sec 3.1.8.1 for more details.
+    maxItems: 1
+
+  sdio-wake-gpios:
+    description: GPIO input to SDIO_WAKE# signal. The card asserts this signal
+      to wake the host system and initiate SDIO interface communication. Refer,
+      PCI Express M.2 Specification r4.0, sec 3.1.7 for more details.
+    maxItems: 1
+
+  sdio-reset-gpios:
+    description: GPIO output to SDIO_RESET# signal. This signal is used by the
+      host system to reset SDIO interface of the M.2 card. Refer, PCI Express
+      M.2 Specification r4.0, sec 3.1.7 for more details.
+    maxItems: 1
+
+  vendor-porta-gpios:
+    description: GPIO for the first vendor specific signal (VENDOR_PORTA). This
+      signal's functionality is defined by the card manufacturer and may be
+      used for proprietary features. Refer the card vendor's documentation for
+      details.
+    maxItems: 1
+
+  vendor-portb-gpios:
+    description: GPIO for the second vendor specific signal (VENDOR_PORTB). This
+      signal's functionality is defined by the card manufacturer and may be
+      used for proprietary features. Refer the card vendor's documentation for
+      details.
+    maxItems: 1
+
+  vendor-portc-gpios:
+    description: GPIO for the third vendor specific signal (VENDOR_PORTC). This
+      signal's functionality is defined by the card manufacturer and may be
+      used for proprietary features. Refer the card vendor's documentation for
+      details.
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: OF graph bindings modeling the interfaces exposed on the
+      connector. Since a single connector can have multiple interfaces, every
+      interface has an assigned OF graph port number as described below.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: PCIe interface for Wi-Fi
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: SDIO interface for Wi-Fi
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: USB 2.0 interface for BT
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: UART interface for BT
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: PCM/I2S interface
+
+    anyOf:
+      - anyOf:
+          - required:
+              - port@0
+          - required:
+              - port@1
+      - anyOf:
+          - required:
+              - port@2
+          - required:
+              - port@3
+
+required:
+  - compatible
+  - vpcie3v3-supply
+
+additionalProperties: false
+
+examples:
+  # PCI M.2 Key E connector for Wi-Fi/BT with PCIe/UART interfaces
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    connector {
+        compatible = "pcie-m2-e-connector";
+        vpcie3v3-supply = <&vreg_wcn_3p3>;
+        vpcie1v8-supply = <&vreg_l15b_1p8>;
+        i2c-parent = <&i2c0>;
+        w-disable1-gpios = <&tlmm 115 GPIO_ACTIVE_LOW>;
+        w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
+        viocfg-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+        uart-wake-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+        sdio-wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
+        sdio-reset-gpios = <&tlmm 120 GPIO_ACTIVE_LOW>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&pcie4_port0_ep>;
+                };
+            };
+
+            port@3 {
+                reg = <3>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&uart14_ep>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..565198d3b500 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21044,6 +21044,7 @@ PCIE M.2 POWER SEQUENCING
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-pci@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
 F:	Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml
 F:	drivers/power/sequencing/pwrseq-pcie-m2.c
 

-- 
2.51.0



