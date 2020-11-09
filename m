Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4325B2ABDB8
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Nov 2020 14:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbgKINsy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Nov 2020 08:48:54 -0500
Received: from alln-iport-3.cisco.com ([173.37.142.90]:64818 "EHLO
        alln-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgKINsy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Nov 2020 08:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1125; q=dns/txt; s=iport;
  t=1604929733; x=1606139333;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+rC6FP3TNck1fsu5tlDKlL3Y2RDPof8joSWrF1AxAKQ=;
  b=kCJBUexZuHbnFAaJZfma1a5D46i6LM7TMBlKYc5ejjW38BS0uPzNc2Fm
   SuWkirGqJjl7jdJm4QLj29ZGFUO4R+kt1g7a27IQiV+p+rqSI8Pz5c2IJ
   dOZaEAhIQ3xDhg8AFOjA5zRINnndHZRQG6j676C+66ehz5sPxOoxR9sMM
   8=;
X-IPAS-Result: =?us-ascii?q?A0DUCQCER6lf/40NJK1iHgEBCxIMQIN5gU0vLgqVU5wrC?=
 =?us-ascii?q?wEBAQ0BAS0CBAEBhEoCghICJTgTAgMBAQEDAgMBAQEBBQEBAQIBBgRxhWILh?=
 =?us-ascii?q?XMBBAF5BQsCAQghJQ8jJQIEDgWGDSCsd3SBNIpOgTiNPxuBQT+EIz6EBTmFd?=
 =?us-ascii?q?gScPZtpCiCCTZsNIqFwk06gRgIRFYEzOCOBV3AVgyRQFwINnGh0OAIGCgEBA?=
 =?us-ascii?q?wl8iwaBNQGBEAEB?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,463,1596499200"; 
   d="scan'208";a="576345433"
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Nov 2020 13:48:52 +0000
Received: from XCH-RCD-003.cisco.com (xch-rcd-003.cisco.com [173.37.102.13])
        by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 0A9Dmq6k022761
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Mon, 9 Nov 2020 13:48:52 GMT
Received: from xch-aln-004.cisco.com (173.36.7.14) by XCH-RCD-003.cisco.com
 (173.37.102.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 9 Nov
 2020 07:48:52 -0600
Received: from xch-aln-004.cisco.com ([173.36.7.14]) by XCH-ALN-004.cisco.com
 ([173.36.7.14]) with mapi id 15.00.1497.000; Mon, 9 Nov 2020 07:48:52 -0600
From:   "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco)" 
        <dzagorui@cisco.com>
To:     "masahiroy@kernel.org" <masahiroy@kernel.org>
CC:     "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] kbuild: use -fmacro-prefix-map for .S sources
Thread-Topic: [PATCH v3] kbuild: use -fmacro-prefix-map for .S sources
Thread-Index: AQHWsRJPpKcKNHVlGkuCBAHPiPYhnqm/255b
Date:   Mon, 9 Nov 2020 13:48:52 +0000
Message-ID: <1604929732138.17256@cisco.com>
References: <20201102120853.96855-1-dzagorui@cisco.com>
In-Reply-To: <20201102120853.96855-1-dzagorui@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [173.38.209.6]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.37.102.13, xch-rcd-003.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> Follow-up to a73619a845d5 ("kbuild: use -fmacro-prefix-map to make=0A=
> __FILE__ a relative path") commit. Assembler sources also use __FILE__=0A=
> macro so this flag should be also apllied to that sources.=0A=
>=0A=
> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>=0A=
> ---=0A=
>  Makefile | 2 +-=0A=
>  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/Makefile b/Makefile=0A=
> index ee2284a5cad2..81e480fc6805 100644=0A=
> --- a/Makefile=0A=
> +++ b/Makefile=0A=
> @@ -946,7 +946,7 @@ KBUILD_CFLAGS   +=3D $(call cc-option,-Werror=3Dincom=
patible-pointer-types)=0A=
>  KBUILD_CFLAGS   +=3D $(call cc-option,-Werror=3Ddesignated-init)=0A=
>=0A=
>  # change __FILE__ to the relative path from the srctree=0A=
> -KBUILD_CFLAGS  +=3D $(call cc-option,-fmacro-prefix-map=3D$(srctree)/=3D=
)=0A=
> +KBUILD_CPPFLAGS +=3D $(call cc-option,-fmacro-prefix-map=3D$(srctree)/=
=3D)=0A=
>=0A=
>  # ensure -fcf-protection is disabled when using retpoline as it is=0A=
>  # incompatible with -mindirect-branch=3Dthunk-extern=0A=
> --=0A=
> 2.19.0.dirty=0A=
=0A=
ping=0A=
=0A=
