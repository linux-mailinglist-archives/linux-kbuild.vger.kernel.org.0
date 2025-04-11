Return-Path: <linux-kbuild+bounces-6573-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C044A851B9
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 04:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295941BA336F
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 02:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A8B27BF91;
	Fri, 11 Apr 2025 02:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="YUQJq/7I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A22AD5E;
	Fri, 11 Apr 2025 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744339869; cv=none; b=rdBPrZtkkPjciNCirQk2c3A4/zu4Qc7Fbkr7Sa1sOCp/CHwGFfoc2vQAV7iQng0B70jjjRorHhOE4vOxCemd1QUcUpUkCuDmAr7JJMe2CT7y5HwPWlJShNJ0X+fOntLN+4af/jv/nCUC9ASNzU4afZNcIteaLI/oCgWqAaT7t0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744339869; c=relaxed/simple;
	bh=fgryNa5zKi0ubunnKee26qgUsuQa2NNmIwewh06CCgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1rNmXQPZGWuGYZyxJv95T6awm6ygihYApVGdrWRL0sM03BZMDryA7JHhixaMlrn68rW2+bUgvEvCnEi4Eh8iWv27Zqmwc9Puwr8koGS7RxmygfRCfvOTBsGD6N3M/nhmFLOfzYDRTLsSYcM0CCGxRis0cmJl8M3m+uJmOu/tBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=YUQJq/7I; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744339858;
	bh=fgryNa5zKi0ubunnKee26qgUsuQa2NNmIwewh06CCgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=YUQJq/7IJCN60T8VvoYp5xIxY37lgeXEj7Sl9yiqGvB7Y9jM0vZt6mepp2ZYKIwkx
	 GifV+wUmaAVGtongz2iiCBo1+Hh7F5pCIA9F0mUkBVIfOn3ZWHRwK5DaDSNeDQMJ/Y
	 wnTxzZZmoBKRlKF3p0xbIvc2EZ5kmtaVU2b4ItIs=
X-QQ-mid: bizesmtpip3t1744339815t829151
X-QQ-Originating-IP: LC/XEJPQIUQsCRmlXxovOrl/EJd+6nGplA2WrNLXio0=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 10:50:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12992929127869699408
EX-QQ-RecipientCnt: 18
Message-ID: <A8ED9B14F380E4B2+7fc9a2e8-5661-4344-9ac2-481da95cc6f8@uniontech.com>
Date: Fri, 11 Apr 2025 10:50:12 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] A compilation failure occurs when landlock and
 RANDSTRUCT are combined with GCC 14.2.0.
To: =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Cc: gnoack@google.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, kees@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 nicolas@fjasle.eu, linux-security-module@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 =?UTF-8?B?6ZmI6bqf6L2p?= <chenlinxuan@uniontech.com>,
 =?UTF-8?B?5Y2g5L+K?= <zhanjun@uniontech.com>, =?UTF-8?B?6IGC6K+a?=
 <niecheng1@uniontech.com>, =?UTF-8?B?5YWz5paH5rab?=
 <guanwentao@uniontech.com>
References: <337D5D4887277B27+3c677db3-a8b9-47f0-93a4-7809355f1381@uniontech.com>
 <20250410.926dbc57c00b@gnoack.org> <20250410.Ahkoo7ihae8a@digikod.net>
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
In-Reply-To: <20250410.Ahkoo7ihae8a@digikod.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AcCCyMoaNchApTkF4A5pC4gu"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MXE8fio8DejkOlTwN+HkZ2iRb50HfFI3px6ZyfQzXOPtaPlK2G8WiPh+
	Mmut3ttxebf81MRnB9ee5hmdmmDVk8byzPsJWOgAjp0HXr3EISgJpykB6YlMYxgrLP3/J/c
	O2WvJRkwqCE8PI4SBOIQ8P2Sk16jrRtHGo9Lk5mEiQdK8zux+0Q/Xr4LaP+Nd51TB2mAIdJ
	1sojo69I6DqJkxHNKPtRgfDU0UWy8vzgo2mrkB/VlrzMUL+Br2bMcFMsb3gSfHGOkP9MCSf
	mHinVAUaD5j9/MEu+ROmhISvZoqtby8REBks1sc9Tj/202A/y+yfs6vRS/ayYmNHEVQLje6
	sfZ8JkkNkD7s7hDd6Gi1oRGeA6dL1+9s74nMlZbdBbwZPCqizT+w9u9gVnQwfEfV94Umw7b
	o6J3IjnroOY//BPtiTd+RJX4MSDCq/WmloC/G+skbCczZdvEpuXT1/uG2hGkBvBhYgt68nb
	jMEHDCoD3W2lvypcieHHLSnJH5aeSLTaNF9DBjo3vWLypZ4+j9ORBURxaEIJ8x37ehpHERZ
	/OUEwXh9uXLU7HUFJy4gh5DQjLHGYNP1ug3Lx8UXNiyHfOgDLtj3rPj1oDUAyvgFsPoE+gM
	xSQYw+zEy1FA+3+FUJfThB6ECnUFkP4wjhxLt6yyYWFLG/eOrwVAjeIe0hYZICycKimx7Y2
	+R/FgF2JkAZA6pZx2raQbdNUUlL1qM4Xxlx1CH7eOZMywJV54jDwCZwSW2vrfOqSawRbf6e
	/KhxQ1PjqY/0o0h28J5RFrquUda8oXqzwPCiRoNOJfkqJOKvMCbalqqEymFj+GO/nefjR95
	20NsdWUUuGTO8tNhPRAQQvbCYkAqXPBlh9tLxaxAPi7j+mxHK/ceEXIXayYEh3pa4uHnVGi
	XKu9BEBHB8YDEWzk6FuvQ3NvC5/lJAaCAbjTo0rJqeI81IqtGsu4fh5+4e65BJaEBToy+pW
	m0THyCYURT+sUOaBaZP/Sj1kRkeckRcZ0UI9SJZPGoe3HZjPGgS5p6JNLpeBLCGqEcY3f5S
	CPVDeZP504CF2XFV1F
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AcCCyMoaNchApTkF4A5pC4gu
Content-Type: multipart/mixed; boundary="------------FLHyHPO1D30HsUP8vKO5gYtQ";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Cc: gnoack@google.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, kees@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 nicolas@fjasle.eu, linux-security-module@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 =?UTF-8?B?6ZmI6bqf6L2p?= <chenlinxuan@uniontech.com>,
 =?UTF-8?B?5Y2g5L+K?= <zhanjun@uniontech.com>, =?UTF-8?B?6IGC6K+a?=
 <niecheng1@uniontech.com>, =?UTF-8?B?5YWz5paH5rab?=
 <guanwentao@uniontech.com>
Message-ID: <7fc9a2e8-5661-4344-9ac2-481da95cc6f8@uniontech.com>
Subject: Re: [Bug Report] A compilation failure occurs when landlock and
 RANDSTRUCT are combined with GCC 14.2.0.
References: <337D5D4887277B27+3c677db3-a8b9-47f0-93a4-7809355f1381@uniontech.com>
 <20250410.926dbc57c00b@gnoack.org> <20250410.Ahkoo7ihae8a@digikod.net>
In-Reply-To: <20250410.Ahkoo7ihae8a@digikod.net>

--------------FLHyHPO1D30HsUP8vKO5gYtQ
Content-Type: multipart/mixed; boundary="------------tnDSPJ2ztk0RQK4ARmV9VKjf"

--------------tnDSPJ2ztk0RQK4ARmV9VKjf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR8O8bnRoZXIgYW5kIE1pY2thw6tsIFNhbGHDvG4sDQoNCk9uIDIwMjUvNC8xMSAwMTow
NSwgTWlja2HDq2wgU2FsYcO8biB3cm90ZToNCj4+IFRoaXMgaXMgaW4gbXkgdW5kZXJzdGFu
ZGluZyBhIGR1cGxpY2F0ZSBvZiB0aGUgZGlzY3Vzc2lvbiBpbg0KPj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjUwNDA3LWtidWlsZC1kaXNhYmxlLWdjYy1wbHVnaW5zLXYx
LTEtNWQ0NmFlNTgzZjVlQGtlcm5lbC5vcmcvDQo+IFllcywgYSBuZXcgcGF0Y2ggaGFzIGJl
ZW4gc3VibWl0dGVkOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MDkx
NTExNTQud29yay44NzIta2Vlc0BrZXJuZWwub3JnLw0KDQpUaGFuayB5b3UgYm90aCBmb3Ig
dGhlIHJlbWluZGVyIQ0KDQpCdXQgSSdtIHN0aWxsIGEgYml0IGxvc3QuDQoNCldpdGggR0ND
IDE0LCBJIGNhbiByZXByb2R1Y2UgdGhpcyBwcm9ibGVtIGJ5IG1lcmVseSBlbmFibGluZyBs
YW5kbG9jayANCmFuZCBSQU5EU1RSVUNUIG9uIHRvcCBvZiB0aGUgYmFzZSB4ODZfNjRfZGVm
Y29uZmlnLg0KDQpJdCBkb2Vzbid0IGFwcGVhciB0aGF0IG1ha2luZyBHQ0NfUExVR0lOUyBk
ZXBlbmQgb24gIUNPTVBJTEVfVEVTVCBvciANCnJlc3RyaWN0aW5nIFJBTkRTVFJVQ1QgdG8g
b25seSBiZSBlbmFibGVkIHdoZW4gQ0NfSEFTX1JBTkRTVFJVQ1QgaXMgc2V0IA0KYWN0dWFs
bHkgYWRkcmVzc2VzIHRoZSByb290IGNhdXNlLg0KDQpJJ20gcXVpdGUgY3VyaW91cyB0byBr
bm93IHdoYXQgdGhlIGFjdHVhbCBkaXJlY3QgY2F1c2Ugb2YgdGhpcyBpbnRlcm5hbCANCkdD
QyBlcnJvciBpcy4NCg0KVGhhbmtzLA0KLS0gDQpXYW5nWXVsaQ0K
--------------tnDSPJ2ztk0RQK4ARmV9VKjf
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

--------------tnDSPJ2ztk0RQK4ARmV9VKjf--

--------------FLHyHPO1D30HsUP8vKO5gYtQ--

--------------AcCCyMoaNchApTkF4A5pC4gu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ/iDZAUDAAAAAAAKCRDF2h8wRvQL7k4R
AP9d0MMFidIuBt7QMhq+wOU60bUHjNOTKTNdPGrY5IOV2wD8D3aj3NLa9eLjBSKVcNvyIZ/6MGXU
cRwiiHlC0kHpLAg=
=rFvs
-----END PGP SIGNATURE-----

--------------AcCCyMoaNchApTkF4A5pC4gu--

