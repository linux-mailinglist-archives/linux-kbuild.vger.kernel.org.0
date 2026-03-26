Return-Path: <linux-kbuild+bounces-12276-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDhhA2nqxGmi5AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12276-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:12:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BA8331003
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 09:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E0CE309077F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 08:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB733BAD8B;
	Thu, 26 Mar 2026 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+6lSDpr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D03396D2E;
	Thu, 26 Mar 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512401; cv=none; b=mZyZGFYzNPPfZX3uTSZQXuWRDIfvk0661HRiXlK8XhGqYgOjcWkiWIZxf52c4gxw+wKumrDIpJ6BE2PMuPjSO3EVo9iefFARZRT93IUqBAWLMB4wmYlGm/KGlHLpfDTYbRxTUWsnFE+i6weAKQw1sOU+WRd6fIhp9uMPgSOhF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512401; c=relaxed/simple;
	bh=2AsBGwIThIpmqCwadDnSVqcM3UljztlUDKiuJV6ebfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3QIjVNnsMds2b7xj6BmV6aitdtCVmku/FyH2dBucyWeL4Qbw+in7URsiW0N3pVNUSkjmSbnTLd1DNtlvEgXBi4/PdwO44iD01iUkvem2fNigTKjXEEsXVh6UpxIfy9v08bwR37Pp5NHugCofBiL+Bv0ofXMqIuzgONeRajNGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+6lSDpr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B62DAC2BCC7;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774512400;
	bh=2AsBGwIThIpmqCwadDnSVqcM3UljztlUDKiuJV6ebfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a+6lSDprNOXj7Wr5QuU1vtELg/UG8yKvETJTuzvyaNnCwvbPg7zfRw5M2wGdVpqNw
	 +jr62C3ESMWA32nmWzJgXEoXSxdTNKJDD7oCxNd9Yo9lAuuuIBE5NhwNEgoDh86vUz
	 1t/WZ8/ZPYyAIu3GR1wEu4OsYTHawAftRumvJvVzcIBQ9UkH0QGh4cjC/beowi5cuX
	 Fay1IOdvvVlYDmP3RVHr9g+vQf/Z+kda5xbUJ7dB601bcHCnBIQj0YeqoKuK6teT83
	 3Y/RDZf7UDn081kAxc1czZzQqFpbQXvV1vyV44JdmIQNiY+v5JIrJhjN1WkkxG3hfk
	 +GnUmmDsJFwIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD71F106F2F9;
	Thu, 26 Mar 2026 08:06:40 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 26 Mar 2026 13:36:34 +0530
Subject: [PATCH v7 6/8] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-pci-m2-e-v7-6-43324a7866e6@oss.qualcomm.com>
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
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=xxlRBzaeOOVwKEqmUYkOJFXC3ANMhHu28t1gqhr9CSk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpxOkNFmgti1XVSNenP+g8pG6IL8blsrurXDpzh
 k79D9yoxZyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCacTpDQAKCRBVnxHm/pHO
 9fXKB/9wkTCzxLPWXLcsLaEUQzhOwGY85NxrYHXpZ/e0OmuQesbj+0q8nNckfJU6STZPb9WMEHD
 9J3KRaRwlsMqh4wpJ41ISt7WEZPVK4thXDV9VICpsS2e0plH55eREGsWPIsOAuBqyXgDZTM1wAD
 tbuC+GJpkH9XFPKY8zeCa79dh2aMbGGCLtGOPlPOdVyMDOjxpb5F/F/v+aAoZaf+WotMWvkPWBd
 U+tPMoGnX3K7TxXY7E9amvB/m0rrTJx9jGuGONmAZzqD/UHPgxcWxTTSp9WPcDQha1+UYukEeE+
 wuLxtOo6yBTnr88Ldl3cCclgNIA3nwVD3JiL9huZ1xFf0ROD
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12276-lists,linux-kbuild=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-kbuild@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: B3BA8331003
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support for
getting the pwrseq device if the OF graph link is present. Once obtained,
the existing pwrseq APIs can be used to control the power supplies of the
M.2 card.

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # ThinkPad T14s gen6 (arm64)
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c17a462aef55..aaac3fb67d18 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -26,6 +26,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -2443,6 +2444,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
+								   "uart");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+			break;
+		}
+
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the

-- 
2.51.0



