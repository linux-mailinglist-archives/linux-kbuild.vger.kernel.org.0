Return-Path: <linux-kbuild+bounces-11989-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHGfMtHYuGmjkAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11989-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:30:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C132A38D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 05:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1286D301671E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 04:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782CE374E48;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FiSsisi0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4834232B9A9;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721803; cv=none; b=Cml4BS77KBAvg61uCcFMThQMqRJOWKUFOMOctzrnICC3HFarcxLTsVGDZdZqr8Uw6wx2mGMkiWM2+C/V9YqqzXl6EqIFDKJbHS3cAhDtL9FjKX8RZxL7B9nLlhJYqdMdCb4NnO7Alc09E9h1p1WNJbhWPnLxgwgo2yp6JOTxCb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721803; c=relaxed/simple;
	bh=X52v0ldx2BiySSXfXiJ1VT8igCvrWnyeybx/I/10gkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbkm4Va6e9UH2iOUNHENRTvq8HP/JVeiM6zEEI0rLuElFdhseb5IHu/Pt01FlAi3UxhvDb+nL6dgXdwBNxI7Rm4Z92qTrNrlT55FjaTYMs/Dx5jDWelaBJqYweV7U+TfnRpskSJsbTqbQnowyEs+hY0Joea44vozPyxUXn0dwJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FiSsisi0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10849C4AF0E;
	Tue, 17 Mar 2026 04:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773721803;
	bh=X52v0ldx2BiySSXfXiJ1VT8igCvrWnyeybx/I/10gkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FiSsisi04CjGpPT540X5+yjxvQtyM7S0Zj7hCr/RE0DrY4RBfMX1Pq9ng+ArdhpNf
	 IBecBnhkQgyQklz9mP7wWgXcQvHR4nKo8lFVf4z33BAFqNEavsKhsgn+UP5vmz12gZ
	 hKvGV3aW2aPubkniqwlc3dNOy5ERati0S2RU1IuVa0qorEcAdsQpdOwg/biNpLBdLK
	 j/YJREjWGIzLfc8Y0H3D2oIDigKWrGiuj9pQm/eSNkl7STqPvxqxSpWH6mJYmLjHAD
	 nodctrTi3B0mIN91yXTmZjzIZDqnFx5dnTuoJybeGIBfydJ1g8HomfG/HMWVjDK+Bs
	 lBaUGCJCEJU6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECFFFB5EB8;
	Tue, 17 Mar 2026 04:30:02 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 17 Mar 2026 09:59:54 +0530
Subject: [PATCH v6 4/9] dt-bindings: serial: Document the graph port
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-pci-m2-e-v6-4-9c898f108d3d@oss.qualcomm.com>
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=qc2byN8fzCzHCp/R/TbHmtEA/yB09rfLEQZF1FIZXLk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpuNjHzIlkekCrgGWcamJjp5Bq6wTTkw6dTyt+H
 X3gw2G7SNOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCabjYxwAKCRBVnxHm/pHO
 9XJGB/9ZxYiHOampZxJrCmyhY9H1GJN7K3WEXr1m9d6VtZqZg+8N6b41wlGb4ITXKf4xpe24euM
 y8z8pHsP6U3xi37uvgcjt+NgxNMXvMS1IOUZk+CYpiFXnAQXJxD1cUYFTa5PttTX1HUBmmNhQvJ
 uEJ4H/xWRhtAyzSNhs63upcGC/ScQ3FasLHmEJRX62C5O3uxPgm2gIrlkAtOLsn/pB9JsrA+gJJ
 DCLkdXm5HBTURYxMQBpsl682DemPNhr1h9AHZpND7zvdkL9iMOdW09Wn6hLUW8A5f26/VjObWr4
 rGTyXjE04zLvxhEWKVgW9f/E7528wwPdoGkTuTo79WzuiZT1
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11989-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-kbuild@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63C132A38D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

A serial controller could be connected to an external connector like PCIe
M.2 for controlling the serial interface of the card. Hence, document the
OF graph port.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/serial.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index 6aa9cfae417b..96eb1de8771e 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -87,6 +87,9 @@ properties:
     description:
       TX FIFO threshold configuration (in bytes).
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
 patternProperties:
   "^(bluetooth|bluetooth-gnss|embedded-controller|gnss|gps|mcu|onewire)$":
     if:

-- 
2.51.0



