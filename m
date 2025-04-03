Return-Path: <linux-kbuild+bounces-6394-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5030A79A4F
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 05:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49EF1171D73
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 03:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030E414EC73;
	Thu,  3 Apr 2025 03:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BRl/HrHH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5C71854;
	Thu,  3 Apr 2025 03:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743649617; cv=none; b=LVyxpG15QkPWXddaeuMjyqF9SVnT6nmCmBOt2JcmruPSzBUbq4wgcfbn9lHnH7KS4agaAxMRZNfdCH2dJeWypM6EFyNnM3IA5/D1zjM/Ac5RMfMVBZratyc6+WgWgy1cV9aQt7Bzcs79Zhyr/UiTD1VmM1/9cuRtOBsBoePyJBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743649617; c=relaxed/simple;
	bh=rLITyRfuG4belOwBKg3TPRziIg6FbQl4SzE1StqCq8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFj4JEegZdTs1cOIBBDZN0dOPg6rrp4jGUH2amJUZWsgaaOqdY9EkgTGws/WaxU2v3fzxtIhzmtcSZCiBGxRIjrsFPiBG7VFYTtaGpNxla3sdXdm3mdMLfR3FVQfIQThZvgzJ/2liw74ERZoxzuyhvsfwXXpCy3t+iepz5As9qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BRl/HrHH; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1743648351;
	bh=rLITyRfuG4belOwBKg3TPRziIg6FbQl4SzE1StqCq8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=BRl/HrHHDpAA1ScdOhwK1YzHrUowwbbrtIESjvn9rbuHRYZWiD+dd7DxW38qFYlna
	 4E685x01bIqoGjtdvC9UEtBjLtd4PGbjszVhNEW/SXTkS1+jA/dh5rE/hZFlLhYhXy
	 RRWituptaG/j+wMHeop60B/cZt0S99E6cHisLMYI=
X-QQ-mid: bizesmtpip3t1743648313t5yaiik
X-QQ-Originating-IP: RFtzrLpKnP/K71HWrxjfeOmzO8W6e3p+ikpskL0q4h0=
Received: from [IPV6:240e:668:120a::212:156] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Apr 2025 10:45:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10175989082792756746
EX-QQ-RecipientCnt: 10
Message-ID: <F0F0E660A98E4FA3+de115480-b3ee-4f33-b90f-a8f3badc97de@uniontech.com>
Date: Thu, 3 Apr 2025 10:45:11 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: deb-pkg: Add libdw-dev:native to
 Build-Depends-Arch
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 samitolvanen@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com
References: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
 <3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@suse.com>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GT5Iwsqm6RPcnXW9aW5iCtlm"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Ny/zgNEl+21dx8wQrtloB49pQdi+iTZUNi9WpUaMz4ut56wpVTXdx18t
	+FNE24niNyQvaLqFVnnM5ylzkB3OWFQbCz1ShnyDOI+D/rIBR0J2rddorsz8L0IqfOXnkTy
	XcpqJ6sOcRsJX+f55zM/xnogl6ikQR+4X2wjl2+G1MnoMYcOtHFGxTlNP/arbxbxslSly5l
	LpgDJ/2AuB83acCU6WrD3aMudUzZ3h8IWSnlM4p6RiwghhdAmnttnzMsejlgVxTUkMqFAfS
	hF0DG0uYS3Pc3s07h6H3XZMHwQEyxRPZmhT3+DlB0mY9wl07z2b+JrgraJfIYUkoEfNx8PY
	zLoyUe/TDaKD1zztHpyCfTaxI+PS97PCzD7lWZSLtEIjpt7sUQhSzizi+td68RHHYt+xWtU
	IGMObV1J0P5IC0Kp2Hin9qd1/YAaM8EYh2eCgaGvP8v1Bwo3HWQHC9vMuYIn7ymEEDdUT8D
	tcGCwc05z60f8Xqi1S5h6sSozwCxf+u2G9qHdj4FT61rH5ZWHU3VQEJaigGWW5+JauFzUdA
	Guoj2N2NlmQi0F8SguosSv6c/TNkKDGkQ+g4QKDEU7XotEIfamzTXIrOq9qjB4q1MdULm76
	1aWc2eZmle/9/nCpBDBCOSiebL/wPrs5LMun20rKduYWHgvSrrN5VyJAvhV9e7s0KWGFEZS
	PVe0QI7+6kJ0goo6Fa+N+lMDSYNxK4KrDGx2K4Z0EIIEhXSR2J1fDilJr8OFBCN5Jk1CDt1
	ppbJr4aMQWd56Vyged++ZTjrj3/eoT8XPAi+S6GuyboaI1O2rMSI2tM8TsOGtQJgewAZXio
	sdzfIsvrZc0QyDQ49qT1s2iW7fFcP8TJyGJZ7ee7xIYT1csRYljRNRHr521bvCZgw+yU0qH
	OpVglE4KlEvvsDZkM5+W5NJD+KIx/SyU2cU8F90Z32q6BVedfaY2Oay9BFjTiVr8qWelPtD
	tvfIOBYso5Vjw9+fuL3BPi4/32BiQ7jxov1m7OIR0IrDUWRgV1UEUTca5jzssrf5QWQ8ScH
	Hg0AaLCA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GT5Iwsqm6RPcnXW9aW5iCtlm
Content-Type: multipart/mixed; boundary="------------jtuHwCs0RCXavlm8oMPuv05q";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 samitolvanen@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com
Message-ID: <de115480-b3ee-4f33-b90f-a8f3badc97de@uniontech.com>
Subject: Re: [PATCH] kbuild: deb-pkg: Add libdw-dev:native to
 Build-Depends-Arch
References: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
 <3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@suse.com>
In-Reply-To: <3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@suse.com>

--------------jtuHwCs0RCXavlm8oMPuv05q
Content-Type: multipart/mixed; boundary="------------RmFQqNnw4Ux1a3iITTA7H1NT"

--------------RmFQqNnw4Ux1a3iITTA7H1NT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGV0ciwNCg0KT24gMjAyNS8zLzI4IDE4OjE5LCBQZXRyIFBhdmx1IHdyb3RlOg0KPiBJ
ZiBzY3JpcHRzL3BhY2thZ2UvbWtkZWJpYW4gaXMgdXBkYXRlZCBpbiB0aGlzIHdheSB0aGVu
IEkgdGhpbmsNCj4gc2NyaXB0cy9wYWNrYWdlL21rc3BlYyAtPiBzY3JpcHRzL3BhY2thZ2Uv
a2VybmVsLnNwZWMgc2hvdWxkIGJlIGFkanVzdGVkDQo+IGFzIHdlbGwgZm9yIGNvbnNpc3Rl
bmN5Lg0KPg0KPiBGaWxlIHNjcmlwdHMvcGFja2FnZS9rZXJuZWwuc3BlYyBjb250YWluczoN
Cj4gQnVpbGRSZXF1aXJlczogKGVsZnV0aWxzLWxpYmVsZi1kZXZlbCBvciBsaWJlbGYtZGV2
ZWwpIGZsZXgNCj4NCj4gZWxmdXRpbHMtbGliZWxmLWRldmVsIGlzIGZvciBGZWRvcmEvUkgg
ZGlzdHJvcywgbGliZWxmLWRldmVsIGlzIGZvcg0KPiAob3BlbilTVVNFLg0KPg0KPiBJZiBJ
J20gbG9va2luZyBjb3JyZWN0bHksIGEgbmV3IGRlcGVuZGVuY3kgdG8gbWFrZSBkd2FyZi5o
IGF2YWlsYWJsZSBmb3INCj4gYm90aCB3b3VsZCBiZToNCj4gQnVpbGRSZXF1aXJlczogZWxm
dXRpbHMtZGV2ZWwgb3IgbGliZHctZGV2ZWwNCj4NCkFscmlnaHQsIHRoYW5rIHlvdSBmb3Ig
dGhlIGZlZWRiYWNrLg0KQnV0IGl0IGFwcGVhcnMgdGhhdCB0aGUgZGVwZW5kZW5jeSBwYWNr
YWdlIGlzIG5hbWVkIGRpZmZlcmVudGx5IG9uIA0KRmVkb3JhIGFuZCBvcGVuU1VTRS4NCkkg
d2lsbCBleHBhbmQgbXkgdGVzdGluZyBzY29wZSB0byBhZGRyZXNzIHRoaXMgaW4gdGhlIHBh
dGNoIGFuZCB3aWxsIA0KcmVzdWJtaXQgaXQgb25jZSB0aGUgbWVyZ2Ugd2luZG93IGhhcyBj
bG9zZWQuDQoNClRoYW5rcywNCi0tIA0KV2FuZ1l1bGkNCg==
--------------RmFQqNnw4Ux1a3iITTA7H1NT
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------RmFQqNnw4Ux1a3iITTA7H1NT--

--------------jtuHwCs0RCXavlm8oMPuv05q--

--------------GT5Iwsqm6RPcnXW9aW5iCtlm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ+32NwUDAAAAAAAKCRDF2h8wRvQL7jai
AP4n2fC6x7vxBTlSUqHb/nouRPoqWlBdVzRUmSy6oebBAgD/ZVJtpAQheoAHN7HcDdr+vrL90Gmh
QWxuOGkI9FGG8Qc=
=/wjx
-----END PGP SIGNATURE-----

--------------GT5Iwsqm6RPcnXW9aW5iCtlm--

