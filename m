Return-Path: <linux-kbuild+bounces-6033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB18A59B8D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Mar 2025 17:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52140188967A
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Mar 2025 16:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD28235C1B;
	Mon, 10 Mar 2025 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AI4JO5DI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BBD236447;
	Mon, 10 Mar 2025 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741625191; cv=none; b=ZJtOS39TOnhR/pWE6STRTx1SCT3RI1pAZWmj0F9VKACarxHF88SK0LDIHFtIqYiyms22fiXkyQQjLCpoIC1afoDLUx7ZcWgL2YbGhjii1qFn4Htt4KnalxvqastpstMGwTVw5r3wKClQPuNRuphQ7xDizcpQoMtdj2JiAlto00M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741625191; c=relaxed/simple;
	bh=cz3uWPrm1wmLuYD60kksYE9PVAxln5zZPGeWh9tRU1w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B5NfnI/DJpMNWSXaM7mm2X1yD1YfSKUITi3fpgDR50hJHDCOBkJdN8f5f74Gt5E5sJ1igNZ68Yv4GmT0jV5YvJpN6EnUCLr51SFmnhjzbJkfSx1B3u0M7Gy6jN1+GUMgOsxfGX6NVUQ3CtQgKu62h5SQv6BlusNNHKc9rxCJ48Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AI4JO5DI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741625190; x=1773161190;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=cz3uWPrm1wmLuYD60kksYE9PVAxln5zZPGeWh9tRU1w=;
  b=AI4JO5DI4exMPGcBMo/BNqaIup/As9ldelRwSP6KEZeIoedfna7RHr+y
   t7G0j4e859SSninXeevudL6jgxqbz7aamFnCpyIaXXdJTK04akIz94oAA
   5m9uE5fOsQRnHvLeCdCgdtewjFhFpHZZ8WzLX57Y4eK/TcQmsFCVFwUwb
   JLwb9/WKv472W0lSOFP2gmUEbZGQpgdDGzj5nCDTWI++/boqoz8nm8N+q
   tnfZ4h7VxGczh7b2KUb5/j4PsMaGbFJgBrRJEJ05qwBNHRzC5XCThf9xB
   Jt6uSomifYHZqQeOB1BR+mZN4swq5IrSzNwpffYLSxRPRAL6qMebYrdMT
   Q==;
X-CSE-ConnectionGUID: c5+fxlGnT3+ix9X8E6p04A==
X-CSE-MsgGUID: AtAdX1QOR8a4+xQX9h7W8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42539667"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="42539667"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 09:46:29 -0700
X-CSE-ConnectionGUID: Gs02udYMTlawYTPW+hFG4Q==
X-CSE-MsgGUID: ijK+4ak5ROSsuxaULMezMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="120566188"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.59])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 09:46:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 10 Mar 2025 18:46:23 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
    linux-kbuild@vger.kernel.org
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] platform/x86: dell: Fix ALIENWARE_WMI dependencies
In-Reply-To: <D8COAMZV0RBJ.1C66Q3AVETTD8@gmail.com>
Message-ID: <078669ca-1995-3403-2f86-6c4554623125@linux.intel.com>
References: <20250309-dell-kconfig-fix-v1-1-38a2308d0ac6@gmail.com> <8d219429-b13f-2610-960e-58851d53696f@linux.intel.com> <D8COAMZV0RBJ.1C66Q3AVETTD8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-719778145-1741622711=:931"
Content-ID: <883eccab-95ef-a39c-760c-668fa29b92d1@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-719778145-1741622711=:931
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <21ff1675-6148-9a62-8efb-1caf842f1a0c@linux.intel.com>

Hi Kbuild/config people,

Could you please take a look at this select problem.

I attempted to solve this kconfig select logic problem a few years back=20
but IIRC, my solution leaked memory or had some other problem I could not=
=20
find solution to (and now the code has changed enough I couldn't even get=
=20
my buggy solution easily forward-ported so I just dropped the solution and=
=20
left just the test case into the patch).

As the Kconfig problem back then got resolved through other means, I never=
=20
mentioned this back then but seems the same problem likely happens here
in some other form (bool selecting tristate that ends up getting only =3Dm)=
=2E

On Mon, 10 Mar 2025, Kurt Borja wrote:
> On Mon Mar 10, 2025 at 9:29 AM -05, Ilpo J=E4rvinen wrote:
> > On Sun, 9 Mar 2025, Kurt Borja wrote:
> >
> >> If ACPI_PLATFORM_PROFILE is selected by ALIENWARE_WMI_WMAX, the former
> >> is forced to be at least =3Dm, because the latter is a bool.
> >>=20
> >> This allows the following config:
> >>=20
> >> =09CONFIG_ALIENWARE_WMI=3Dy
> >> =09CONFIG_ACPI_PLATFORM_PROFILE=3Dm
> >
> > Hi,
> >
> > selecting from =3Dy should not result in =3Dm for the other symbol. Thi=
s is=20
> > a bug in Kconfig infrastructure.
> >
> > I ran across this a few years back and even had a test case to prove th=
e=20
> > select bug but back then the original problem eventually was solved in =
a=20
> > different way which no longer hit the problem. I never could figure out
> > how to fix the kconfig logic though without breaking something and it=
=20
> > ended up into low priority bin and never got solved.
> >
> > Sadly, it seems I've lost the test case patch that exhibits the bug=20
> > somewhere... I'll try to look for it from my archived files.
>=20
> That's funny.
>=20
> I thought this was a Kconfig quirk, that resulted from the following
> hierarchy:
>=20
> Type=09=090=091=092
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D
> Bool=09=09n=09y

I think y should be 2 in both cases so select should cause the selected=20
symbol to becomes =3Dy but there's a logic problem deep in select logic in=
=20
the kconfig code.

I've attached the multi-select based reproducer test case. make=20
testconfig runs kconfig selftests and results in CONFIG_A3=3Dm despite=20
CONFIG_C3=3Dy selecting it.

Please do not apply the test case before the problem is fixed.

> Tristate=09n=09m=09y
>=20
> So a <bool> selecting the <tristate> would force it to be at least =3Dm.
>=20
> The same thing happens with depend, where a dependecy would be fulfilled
> for a <bool> if a <tristate> was at least =3Dm. That's why in the kernel
> robot report the linking error was also due to the HWMON dependency.
>=20
> Anyway, this patch could serve as a workaround if you feel it's
> necessary. I'm going to put the HWMON dependecy in the ALIENWARE_WMI
> symbol for my other series.
>=20
>=20

--=20
 i.
--8323328-719778145-1741622711=:931
Content-Type: text/x-diff; name=select_bug.patch
Content-Transfer-Encoding: BASE64
Content-ID: <09a16eda-c26d-f137-ce39-d230c7cd4d77@linux.intel.com>
Content-Description: 
Content-Disposition: attachment; filename=select_bug.patch

RnJvbTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50
ZWwuY29tPg0KU3ViamVjdDogW1BBVENIXSBrY29uZmlnOiBUZXN0IHRoYXQg
dGhlIGxhcmdlc3Qgb2Ygc2VsZWN0cyBpcyB0YWtlbg0KDQpETyBOT1QgQVBQ
TFkgV0lUSE9VVCBGSVhJTkcgS0NPTkZJRyBDT0RFIEZJUlNUISEhDQoNCldp
dGggZHVhbCBzZWxlY3QsIHRoZSBsYXJnZXN0IHNlbGVjdGlvbiBzaG91bGQg
YmUgdGFrZW4uIFRlc3Qgd2l0aA0KaW5kZXBlZGVudCBzZWxlY3RvcnMgYW5k
IG9uZXMgd2hpY2ggZGVwZW5kcyBvbiBlYWNoIG90aGVyLg0KDQpTaWduZWQt
b2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5p
bnRlbC5jb20+DQoNCi0tLQ0KIHNjcmlwdHMva2NvbmZpZy90ZXN0cy9kdWFs
X3NlbGVjdC9LY29uZmlnICAgICAgICAgfCA0MCArKysrKysrKysrKysrKysr
KysrKysrKw0KIHNjcmlwdHMva2NvbmZpZy90ZXN0cy9kdWFsX3NlbGVjdC9f
X2luaXRfXy5weSAgICAgfCAgOCArKysrKw0KIHNjcmlwdHMva2NvbmZpZy90
ZXN0cy9kdWFsX3NlbGVjdC9kZWZjb25maWcgICAgICAgfCAgNyArKysrDQog
c2NyaXB0cy9rY29uZmlnL3Rlc3RzL2R1YWxfc2VsZWN0L2V4cGVjdGVkX2Nv
bmZpZyB8IDEwICsrKysrKw0KIDQgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0
aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzY3JpcHRzL2tjb25maWcv
dGVzdHMvZHVhbF9zZWxlY3QvS2NvbmZpZw0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzY3JpcHRzL2tjb25maWcvdGVzdHMvZHVhbF9zZWxlY3QvX19pbml0X18u
cHkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9rY29uZmlnL3Rlc3Rz
L2R1YWxfc2VsZWN0L2RlZmNvbmZpZw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
Y3JpcHRzL2tjb25maWcvdGVzdHMvZHVhbF9zZWxlY3QvZXhwZWN0ZWRfY29u
ZmlnDQoNCmRpZmYgLS1naXQgYS9zY3JpcHRzL2tjb25maWcvdGVzdHMvZHVh
bF9zZWxlY3QvS2NvbmZpZyBiL3NjcmlwdHMva2NvbmZpZy90ZXN0cy9kdWFs
X3NlbGVjdC9LY29uZmlnDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXgg
MDAwMDAwMDAwMDAwLi43NzZkZGM0ZThiZjkNCi0tLSAvZGV2L251bGwNCisr
KyBiL3NjcmlwdHMva2NvbmZpZy90ZXN0cy9kdWFsX3NlbGVjdC9LY29uZmln
DQpAQCAtMCwwICsxLDQwIEBADQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KKw0KK2NvbmZpZyBNT0RVTEVTDQorCWJvb2wgIkVuYWJs
ZSBsb2FkYWJsZSBtb2R1bGUgc3VwcG9ydCINCisJbW9kdWxlcw0KKwlkZWZh
dWx0IHkNCisNCitjb25maWcgQTENCisJdHJpc3RhdGUgIkExIg0KKyMgaW5k
ZXBlZGVuZGVudCB0cmlzdGF0ZSBzZWxlY3RzIHRyaXN0YXRlDQorY29uZmln
IEIxDQorCXRyaXN0YXRlICJCMSINCisJc2VsZWN0IEExDQorIyBib29sIHNl
bGVjdHMgbGliDQorY29uZmlnIEMxDQorCWJvb2wgIkMxIg0KKwlzZWxlY3Qg
QTENCisNCitjb25maWcgQTINCisJdHJpc3RhdGUgIkEyIg0KK2NvbmZpZyBC
Mg0KKwl0cmlzdGF0ZSAiQjIiDQorCXNlbGVjdCBBMg0KKyMgdHJpc3RhdGUg
ZGVwZW5kcyBvbiB0cmlzdGF0ZSBhbmQgc2VsZWN0cyB0cmlzdGF0ZQ0KK2Nv
bmZpZyBDMg0KKwl0cmlzdGF0ZSAiQzIiDQorCWRlcGVuZHMgb24gQjINCisJ
c2VsZWN0IEEyDQorDQorDQorY29uZmlnIEEzDQorCXRyaXN0YXRlICJBMyIN
Citjb25maWcgQjMNCisJdHJpc3RhdGUgIkIzIg0KKwlzZWxlY3QgQTMNCisj
IGJvb2wgZGVwZW5kcyBvbiB0cmlzdGF0ZSBhbmQgc2VsZWN0cyB0cmlzdGF0
ZQ0KK2NvbmZpZyBDMw0KKwlib29sICJDMyINCisJZGVwZW5kcyBvbiBCMw0K
KwlzZWxlY3QgQTMNCmRpZmYgLS1naXQgYS9zY3JpcHRzL2tjb25maWcvdGVz
dHMvZHVhbF9zZWxlY3QvX19pbml0X18ucHkgYi9zY3JpcHRzL2tjb25maWcv
dGVzdHMvZHVhbF9zZWxlY3QvX19pbml0X18ucHkNCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLjYxM2Q4MDEwMTRlOA0KLS0t
IC9kZXYvbnVsbA0KKysrIGIvc2NyaXB0cy9rY29uZmlnL3Rlc3RzL2R1YWxf
c2VsZWN0L19faW5pdF9fLnB5DQpAQCAtMCwwICsxLDggQEANCisjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorIiIiDQorVGVzdCBkdWFs
IHNlbGVjdCBzaG91bGQgc2VsZWN0IHRoZSBsYXJnZXN0IHNlbGVjdGlvbi4N
CisiIiINCisNCitkZWYgdGVzdChjb25mKToNCisgICAgYXNzZXJ0IGNvbmYu
ZGVmY29uZmlnKCdkZWZjb25maWcnKSA9PSAwDQorICAgIGFzc2VydCBjb25m
LmNvbmZpZ19jb250YWlucygnZXhwZWN0ZWRfY29uZmlnJykNCmRpZmYgLS1n
aXQgYS9zY3JpcHRzL2tjb25maWcvdGVzdHMvZHVhbF9zZWxlY3QvZGVmY29u
ZmlnIGIvc2NyaXB0cy9rY29uZmlnL3Rlc3RzL2R1YWxfc2VsZWN0L2RlZmNv
bmZpZw0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAw
MC4uZmEwNDc1ZmE3NGFiDQotLS0gL2Rldi9udWxsDQorKysgYi9zY3JpcHRz
L2tjb25maWcvdGVzdHMvZHVhbF9zZWxlY3QvZGVmY29uZmlnDQpAQCAtMCww
ICsxLDcgQEANCitDT05GSUdfTU9EVUxFUz15DQorQ09ORklHX0IxPW0NCitD
T05GSUdfQzE9eQ0KK0NPTkZJR19CMj15DQorQ09ORklHX0MyPW0NCitDT05G
SUdfQjM9bQ0KK0NPTkZJR19DMz15DQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9r
Y29uZmlnL3Rlc3RzL2R1YWxfc2VsZWN0L2V4cGVjdGVkX2NvbmZpZyBiL3Nj
cmlwdHMva2NvbmZpZy90ZXN0cy9kdWFsX3NlbGVjdC9leHBlY3RlZF9jb25m
aWcNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAu
LjFjMDYzNTZkOGIxYw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvc2NyaXB0cy9r
Y29uZmlnL3Rlc3RzL2R1YWxfc2VsZWN0L2V4cGVjdGVkX2NvbmZpZw0KQEAg
LTAsMCArMSwxMCBAQA0KK0NPTkZJR19NT0RVTEVTPXkNCitDT05GSUdfQTE9
eQ0KK0NPTkZJR19CMT1tDQorQ09ORklHX0MxPXkNCitDT05GSUdfQTI9eQ0K
K0NPTkZJR19CMj15DQorQ09ORklHX0MyPW0NCitDT05GSUdfQTM9eQ0KK0NP
TkZJR19CMz1tDQorQ09ORklHX0MzPXkNCg0KLS0gDQp0ZzogKDgwZTU0ZTg0
OTExYS4uKSBrY29uZmlnL2R1YWwtc2VsZWN0LWNhc2UgKGRlcGVuZHMgb246
IG1hc3RlcikNCg==

--8323328-719778145-1741622711=:931--

