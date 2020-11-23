Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE122C10BE
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 17:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730953AbgKWQes (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 11:34:48 -0500
Received: from alln-iport-5.cisco.com ([173.37.142.92]:46556 "EHLO
        alln-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729972AbgKWQd4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 11:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=633; q=dns/txt; s=iport;
  t=1606149235; x=1607358835;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=87sHuO10/Ispffs/a7o66pVO01VXPbZdOIeCRlAKvW0=;
  b=DWhgRFwsuzqtjgTOgGBCEOXzLcsXeQA/jPNCCa5gtgLqHevivCD9O4MQ
   bAl8KL1kLGcOqSoQ+RS3eT9NO2mJtXms/nHIBqe4dxHr+dM68cQ2psFl7
   7u1Yzp2jx4X8mDhFQkNJCx5bhWUXRgEiczc/QgzGkxrATYtf8L44gyqCr
   w=;
X-IPAS-Result: =?us-ascii?q?A0C+AQBz47tffYMNJK1iHQEBAQEJARIBBQUBQIE+BQELA?=
 =?us-ascii?q?YN2LziVWJwuCwEBAQ0BAS0CBAEBhEoCgisCJTcGDgIDAQEBAwIDAQEBAQUBA?=
 =?us-ascii?q?QECAQYEFAEBhkiFcwECAgF5BQsCAQghJQ8jJQIEDoYSIK8adIE0imKBOAGNP?=
 =?us-ascii?q?xuBQT+EIz6EPoV2BJxOm3gKIIJOmx4igwiefbQ8AhEVgTM3IoFZcBWDJU8XA?=
 =?us-ascii?q?g2caIErAgYKAQEDCXyMOwGBEAEB?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.78,363,1599523200"; 
   d="scan'208";a="613307398"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 23 Nov 2020 16:33:54 +0000
Received: from XCH-ALN-005.cisco.com (xch-aln-005.cisco.com [173.36.7.15])
        by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 0ANGXsuY012714
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Mon, 23 Nov 2020 16:33:54 GMT
Received: from xch-aln-004.cisco.com (173.36.7.14) by XCH-ALN-005.cisco.com
 (173.36.7.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Nov
 2020 10:33:53 -0600
Received: from xch-aln-004.cisco.com ([173.36.7.14]) by XCH-ALN-004.cisco.com
 ([173.36.7.14]) with mapi id 15.00.1497.000; Mon, 23 Nov 2020 10:33:54 -0600
From:   "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco)" 
        <dzagorui@cisco.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
CC:     "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] kbuild: use -fmacro-prefix-map for .S sources
Thread-Topic: [PATCH v3] kbuild: use -fmacro-prefix-map for .S sources
Thread-Index: AQHWsRJPpKcKNHVlGkuCBAHPiPYhnqm/255bgA4Yo8aAA74XgIAEVg3x
Date:   Mon, 23 Nov 2020 16:33:54 +0000
Message-ID: <1606149233925.5885@cisco.com>
References: <20201102120853.96855-1-dzagorui@cisco.com>
 <1604929732138.17256@cisco.com>
 <1605704642269.72893@cisco.com>,<CAK7LNAQuoNeMTMqCssT8iHQJOfqwt7NTLHow_4ebrxCZoi_KCg@mail.gmail.com>
In-Reply-To: <CAK7LNAQuoNeMTMqCssT8iHQJOfqwt7NTLHow_4ebrxCZoi_KCg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [173.38.209.6]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.36.7.15, xch-aln-005.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> I fixed the first sentence:=0A=
>=0A=
> Follow-up to a73619a845d5 ("kbuild: use -fmacro-prefix-map to make=0A=
> __FILE__ a relative path") commit.=0A=
>=0A=
> to=0A=
>=0A=
> Follow-up to commit a73619a845d5 ("kbuild: use -fmacro-prefix-map to=0A=
> make __FILE__ a relative path").=0A=
ok, i see=0A=
=0A=
=0A=
> > Assembler sources also use __FILE__=0A=
> > macro so this flag should be also apllied to that sources.=0A=
>=0A=
> I fixed "apllied" to "applied".=0A=
thanks, sorry for this typo=0A=
=0A=
=0A=
=0A=
> Maybe, "that sources" should be "those sources".=0A=
yes=0A=
=0A=
=0A=
Thanks,=0A=
Denys=
