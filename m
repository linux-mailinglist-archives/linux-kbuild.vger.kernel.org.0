Return-Path: <linux-kbuild+bounces-12273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH+zHivqxGkz5AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12273-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:11:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C99D330EFC
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08EF0304D26C
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 08:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD723B47C6;
	Thu, 26 Mar 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnXZ9FiZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7103537CD;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512400; cv=none; b=eKTP7PaVv8glxdFyyuAAg1DPY2mUvBhj8tO4GfwADbDT9lSicC+AOrCIurQnjs8cLeVcBfH6a1oV1n3uz9bI4HZVlzT85iqgEul0kS0aUkrjAvVy0oZzZGvARkgTUUBOfEvCZ9NAB81fS5uuxTkNPgAgND/Y0ulBjqWMkkLob/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512400; c=relaxed/simple;
	bh=X52v0ldx2BiySSXfXiJ1VT8igCvrWnyeybx/I/10gkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNIXCNptX+QBWUAgoOuL400SYWdXVG3YL3qzDqU02SsMxbMvI+koyRsJ72LUyJ+Rybl5jy+Bv6GiGKJQm+QzQuVjpLnIcMs01hGfrz/e0+/jAlE3YQ+URg0WSp130KjrO72f+bKCLIJkkiN9iNhhVJ+IPhy4mJcCSgOAne1AZOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnXZ9FiZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D50AC2BCB3;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774512400;
	bh=X52v0ldx2BiySSXfXiJ1VT8igCvrWnyeybx/I/10gkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cnXZ9FiZJO07lH7c8N+4PRQ0nBt/Iz5xd10sPTmdIIO5FsiXZuwuhh+E3XMKxHJoL
	 QHyUkuRThVytC/ncZQ8GtKlkzKdanfYgV1ZSyDRtt9po03LNkH69bt+b8dWZnxaCZr
	 Pukx5x+07CSkST3JyqedSVBYNiEQgVTobohsZ/yfHC1LkWGY98t+gbvx7d94rkJhwa
	 ISfB8m+sWwNRD35TP61kVkTlVvO0yE+7fxG1mrYEG4nZ9ywlvV2r1r+fTFNTFPVoQE
	 Qps3a7YoIKSkuF6MSwlgNcjLrdHz0Bh5/pCvxmASuwGxme3m4AUF1trrcPpUWuMqwa
	 vl0Ay9b0EKc9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D82106F2F7;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 26 Mar 2026 13:36:32 +0530
Subject: [PATCH v7 4/8] dt-bindings: serial: Document the graph port
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-pci-m2-e-v7-4-43324a7866e6@oss.qualcomm.com>
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
In-Reply-To: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=qc2byN8fzCzHCp/R/TbHmtEA/yB09rfLEQZF1FIZXLk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpxOkNQN3BCrM40WJtL9uWP4V1zzoPquvR9XRuT
 qPlpNFft4SJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCacTpDQAKCRBVnxHm/pHO
 9cqxB/9nM/NqwHMkBhn6LLzN01Y/BmAMfwT0KUBc0IZ6gCfXsLcmCRxye/Pjs2o8B/q/vN64EgT
 9d/o9udXUY7qta76IHCkCeqjx+4q6EWzVvpyHCCWkq9bL3bCtMeK5uzUsA20zk8eTdWtUaMWe17
 x5DiFM4DLGrjMDBROKMowpDli9vTbZmX70udpV8FOg3k8bA/FV8EhdcuErMMkOqZBRxokoM57x0
 wYFoGQQ5Oji9qRoEro92B6GLZoZAnzHH/rrKY3++egop5Y/axN2gu1X87v+KJs/9rdpVhoCOss5
 tDNDpwzdKOm6GgnuGgN7yqEeiNKz/APxuArDOAhZLkO+U/LU
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12273-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C99D330EFC
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



