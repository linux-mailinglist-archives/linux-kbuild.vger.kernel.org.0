Return-Path: <linux-kbuild+bounces-2611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C4938476
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 13:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E087C2812CE
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 11:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F262F870;
	Sun, 21 Jul 2024 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="qgKCVSRH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward206a.mail.yandex.net (forward206a.mail.yandex.net [178.154.239.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A03FE4;
	Sun, 21 Jul 2024 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721561878; cv=none; b=WEcePOGq9ygy6m616M1sBXIfYElU5YpEmktNCMuntsvtyXNXYg6q7RDdWNHUEMZ4mBAYYBpZ1+9Dtd66xhpc8Iy0lMWDgGR215AVj8ao1czTEMnai4Eohyz16X3HHCdXlnRFJMDw+D7QZjRHWkxlqlqBVY25+WcSuUh8qodF15k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721561878; c=relaxed/simple;
	bh=dVZ3mJwUqx0JZWB6HE9/U2wqRzOY6T9qFkeYDT8b+mg=;
	h=Date:Subject:From:To:CC:Message-ID:Mime-version:Content-type; b=Sa2FemPrKyDoC+z9gw2o/wW+GbnOHPG1Q5zaxrwNsSANDFzSEYZcXU/kwVI7Iq2Yjthxq4+9N9r9qY4MvMFOsXF5rr2eqiwX/qhoKWzvYyOS0VudaxPbyj88jwYlyYX88NUf2c79LuDv/Rp+yRWK4/OLb2Ky93WjsNFpyOkMzqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=qgKCVSRH; arc=none smtp.client-ip=178.154.239.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
	by forward206a.mail.yandex.net (Yandex) with ESMTPS id 4A334650D0;
	Sun, 21 Jul 2024 14:37:45 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:26bf:0:640:efa0:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 689FB60917;
	Sun, 21 Jul 2024 14:37:36 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id XbKEDM4oEuQ0-hGbF1Fuy;
	Sun, 21 Jul 2024 14:37:35 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1721561855; bh=+AxDBEZ+NCtHbhlME5+tAv5H7FdjBO8oIgOMDjt1xb4=;
	h=Message-ID:CC:To:From:Subject:Date;
	b=qgKCVSRHtVulRsCHRl5g+qop0D1pqPz3IuSOIqm/pVOeNXx+Uhp++/qftSXLRfRFp
	 sioG3mWdJ3V88lSwCUr0A57lVv7pf7ZPxWEUAwL8Qnz5xwK1JmYXT8YgO2zDAIW57A
	 ayCLeRvR+XH6EkLinMFph/I4Nn0cG83cNCpW5oww=
Authentication-Results: mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
User-Agent: Microsoft-MacOutlook/16.85.24051916
Date: Sun, 21 Jul 2024 14:37:33 +0300
Subject: [PATCH]: kbuild doc typo fix
From: =?UTF-8?B?0JTQsNCy0YvQtNC+0LI=?= =?UTF-8?B?INCY0LLQsNC9?=
 =?UTF-8?B?INCQ0LvQtdC60YHQtdC10LLQuNGH?= <davydoff33@yandex.ru>
To: <linux-doc@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>,
	<corbet@lwn.net>,
	<masahiroy@kernel.org>
CC: <nathan@kernel.org>,
	<nicolas@fjasle.eu>
Message-ID: <1935A993-DAB0-4092-A1FE-B6501EE8E0DC@yandex.ru>
Thread-Topic: [PATCH]: kbuild doc typo fix
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-version: 1.0
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

In this part of the documentation, $(CC) is meant, but gcc is written.

Signed-off-by: Ivan Davydov=C2=A0<mailto:davydoff33@yandex.ru>
---
diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/make=
files.rst
index 991ce6081e35..be43990f1e7f 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -578,7 +578,7 @@ cc-option
   Note: cc-option uses KBUILD_CFLAGS for $(CC) options
=20
 cc-option-yn
-  cc-option-yn is used to check if gcc supports a given option
+  cc-option-yn is used to check if $(CC) supports a given option
   and return "y" if supported, otherwise "n".
=20
   Example::
@@ -596,7 +596,7 @@ cc-option-yn
   Note: cc-option-yn uses KBUILD_CFLAGS for $(CC) options
=20
 cc-disable-warning
-  cc-disable-warning checks if gcc supports a given warning and returns
+  cc-disable-warning checks if $(CC) supports a given warning and returns
   the commandline switch to disable it. This special function is needed,
   because gcc 4.4 and later accept any unknown -Wno-* option and only
   warn about it if there is another warning in the source file.
@@ -606,7 +606,7 @@ cc-disable-warning
     KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-but-set-variable)
=20
   In the above example, -Wno-unused-but-set-variable will be added to
-  KBUILD_CFLAGS only if gcc really accepts it.
+  KBUILD_CFLAGS only if $(CC) really accepts it.
=20
 gcc-min-version
   gcc-min-version tests if the value of $(CONFIG_GCC_VERSION) is greater t=
han
---




