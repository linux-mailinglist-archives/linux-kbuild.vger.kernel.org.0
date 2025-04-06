Return-Path: <linux-kbuild+bounces-6454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD7A7CE61
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 16:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D6D3B2C67
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 14:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BC621ABB0;
	Sun,  6 Apr 2025 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="oDFCi6kH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24121A45B
	for <linux-kbuild@vger.kernel.org>; Sun,  6 Apr 2025 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743948487; cv=none; b=ZCX8J0IxYJXgpHxaC0WZzuehy3VUZ6N0NSaST74wR+E063zxHQrG/8vdGglbZvMuOh6LyHeHQJCQtK2xeYzkVl/T7Sd8OPDlEaSgnpN1+F7QqUkMD3Jr59SlEOCBk0GZoxbHcomw+dDD3YXiPLRzHT4PpVq8NF2hYa9uymcHCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743948487; c=relaxed/simple;
	bh=8bNJAi8xxXq+/m14iR6Ou+lDszwsEnU976P/oQWgg08=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ofcaqwnCFW7qCPxSDuXziIy6MH65thFM9smDrCLBq3E5v2jj3WProTlPewKP3TENJyKDovWz845uKot/nIjaSmMPsPsjMTgdvVlDSZYjxnlH1+1E07fbg5Khl1XM2etA8weMcIi7x3cu4dBpdB/t12i71niA1W5SwH7UpMsn+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=oDFCi6kH; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1743948477; x=1744207677;
	bh=Fs70yQ+s38J5++rsuygjPAam7o8B1WNkzsc+ZqyqCuc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=oDFCi6kHVP9mLPsmce9qUBjFlWM48jbkQBovuCD3WHwtlc1IbZRyK+SZ29c9ygh4E
	 9gan9bp5dUqAYN+mOCXIO8FMtYzfx2Te+TDn8THk2B6QJBQAY5hfyHKCwvmCYpGyQU
	 B2Gerkd7dSpjONxS0sT/4zQN09jTEdmqh4abj5cXFnfG7t4+Ir6Y6cLfcKaA5H28si
	 KQaOSCOe7PZevjthcw8vBMwHPHqQQEjwyar3c4Vxqq0Kg5LoFpFqJR8hGEe4unkybW
	 ZO3RCM7ksLg6zrrt6YDcLqXcii24eYhhamIvDqtlN/9w3Sva0V6wQnSPUeaQgQP3+9
	 CpJn/qHbuvtpg==
Date: Sun, 06 Apr 2025 14:07:52 +0000
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Sean Nyekjaer <sean@geanix.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, Ramona Gradinariu <ramona.gradinariu@analog.com>, "Yo-Jung (Leo) Lin" <0xff07@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, =?utf-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
	<barnabas.czeman@mainlining.org>, Danila Tikhonov <danila@jiaxyga.com>, Antoni Pokusinski <apokusinski01@gmail.com>, Vasileios Amoiridis <vassilisamir@gmail.com>, Petar Stoykov <pd.pstoykov@gmail.com>, shuaijie wang <wangshuaijie@awinic.com>, Yasin Lee <yasin.lee.x@gmail.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 2/3] net: qrtr: Define macro to convert QMI version and instance to QRTR instance
Message-ID: <20250406140706.812425-3-y.oudjana@protonmail.com>
In-Reply-To: <20250406140706.812425-1-y.oudjana@protonmail.com>
References: <20250406140706.812425-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: aa0750afc961828b592cdebd97b546926de2b946
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Move QRTR instance conversion from qmi_interface into a new macro in order
to reuse it in QRTR device ID tables.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/soc/qcom/qmi_interface.c | 5 +++--
 include/linux/soc/qcom/qrtr.h    | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interf=
ace.c
index bc6d6379d8b1..cb57b7e1f252 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -14,6 +14,7 @@
 #include <linux/workqueue.h>
 #include <trace/events/sock.h>
 #include <linux/soc/qcom/qmi.h>
+#include <linux/soc/qcom/qrtr.h>
=20
 static struct socket *qmi_sock_create(struct qmi_handle *qmi,
 =09=09=09=09      struct sockaddr_qrtr *sq);
@@ -173,7 +174,7 @@ static void qmi_send_new_lookup(struct qmi_handle *qmi,=
 struct qmi_service *svc)
 =09memset(&pkt, 0, sizeof(pkt));
 =09pkt.cmd =3D cpu_to_le32(QRTR_TYPE_NEW_LOOKUP);
 =09pkt.server.service =3D cpu_to_le32(svc->service);
-=09pkt.server.instance =3D cpu_to_le32(svc->version | svc->instance << 8);
+=09pkt.server.instance =3D cpu_to_le32(QRTR_INSTANCE(svc->version, svc->in=
stance));
=20
 =09sq.sq_family =3D qmi->sq.sq_family;
 =09sq.sq_node =3D qmi->sq.sq_node;
@@ -236,7 +237,7 @@ static void qmi_send_new_server(struct qmi_handle *qmi,=
 struct qmi_service *svc)
 =09memset(&pkt, 0, sizeof(pkt));
 =09pkt.cmd =3D cpu_to_le32(QRTR_TYPE_NEW_SERVER);
 =09pkt.server.service =3D cpu_to_le32(svc->service);
-=09pkt.server.instance =3D cpu_to_le32(svc->version | svc->instance << 8);
+=09pkt.server.instance =3D cpu_to_le32(QRTR_INSTANCE(svc->version, svc->in=
stance));
 =09pkt.server.node =3D cpu_to_le32(qmi->sq.sq_node);
 =09pkt.server.port =3D cpu_to_le32(qmi->sq.sq_port);
=20
diff --git a/include/linux/soc/qcom/qrtr.h b/include/linux/soc/qcom/qrtr.h
index 4d7f25c64c56..10c89a35cbb9 100644
--- a/include/linux/soc/qcom/qrtr.h
+++ b/include/linux/soc/qcom/qrtr.h
@@ -13,6 +13,8 @@ struct qrtr_device {
=20
 #define to_qrtr_device(d) container_of(d, struct qrtr_device, dev)
=20
+#define QRTR_INSTANCE(qmi_version, qmi_instance) (qmi_version | qmi_instan=
ce << 8)
+
 struct qrtr_driver {
 =09int (*probe)(struct qrtr_device *qdev);
 =09void (*remove)(struct qrtr_device *qdev);
--=20
2.49.0



