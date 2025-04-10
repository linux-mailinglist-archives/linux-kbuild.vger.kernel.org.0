Return-Path: <linux-kbuild+bounces-6565-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45969A83C25
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Apr 2025 10:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38D457A49F6
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Apr 2025 08:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D871D5CFE;
	Thu, 10 Apr 2025 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="bpcE7JJx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6716838F80;
	Thu, 10 Apr 2025 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272695; cv=none; b=Pl3YfOEJdp6BYge+8RR/bCiaYJZog8UAQRViNAcjg7KO9qD5avKdh1EyIdQm8lsbN1pE6jGpcDzvLn+qQNfTJPLh70YZ98dIXYIKnZpCcR8ozuTOD9Qq0hDO51oAoeRM/q8n5DsRK9rVZTg+okjP78YSZU34ZMHdyLoX9ijfeuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272695; c=relaxed/simple;
	bh=h1003F0QZGmGgkXcaTbt5rlum3PQM14c1jtQvYoOmmI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=cfEAmOapjhBiE9EuCEud+WbQkmDEq6C7DlYUCMI0M7DjMdA5yCL1e0sreCTRQIF/K060wl2fbq3GOaAMHjgiFr98phU0tkxCzUTpDtlKA28FyK7psdeOP3tBbctSpXKyApR18PW4Rz3WL8Kal9uzdrkOxUJQ5VB8+MxQ90VVmX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=bpcE7JJx; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744272681;
	bh=h1003F0QZGmGgkXcaTbt5rlum3PQM14c1jtQvYoOmmI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=bpcE7JJxIpSd5+0jpfAsuh2U8z7XdXYORpfbkIquMRKZmqHkNIwfcyv4/QAhyhpwl
	 Paz7P56V7en7X9wqF3lZPwGHTjDCI9atb59t694EHXc/JFSsxhbqnTSLINWtV6Ubnv
	 DyeqOxMqgb3Pw31jb9KL8cMAN0WV5pjEOIjl5CMc=
X-QQ-mid: bizesmtpip2t1744272677ta87555
X-QQ-Originating-IP: /h+wDAVJUlffUr78bBdsbBCNBZWqYQOKuYblzmS2FuQ=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Apr 2025 16:11:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11749788466428975768
Message-ID: <337D5D4887277B27+3c677db3-a8b9-47f0-93a4-7809355f1381@uniontech.com>
Date: Thu, 10 Apr 2025 16:11:15 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Subject: [Bug Report] A compilation failure occurs when landlock and
 RANDSTRUCT are combined with GCC 14.2.0.
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
To: mic@digikod.net, gnoack@google.com, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, kees@kernel.org, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-security-module@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rkKKFJ8ZZADublAHtF5vsiAg"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MQZ/dZQlO/THh3UJCihfMz999YL5l1BQuSyINAyHgpSlKiWJfEk7vjv/
	yRGpmgRqJlQ3f80UqRxQadksN6SmlIeb04Kc+jCbIq3CdN2CR3uXrzK8E5C//hVLKuoqH+f
	YXXzoggknlrQ7hnIeQvlx4QBg+blpjhSSNMYSgpN282yODrOFYcUtNRaCckQHa8iTcn/X9z
	zsRjpjFn9gOHblIdKbwjU7/YI2sPxt9Ui3wsY/2gRmhHOFXPx0Hld9zPUjIjxlV550ON1NP
	O8Amgv6cVuLcJVp1BFF6GoGWCbnqjQsci9acKtt20JqFkYeY4bYgZa5p5uwgvuaJLGSXrNn
	Gp8lnCdCZ7eE8HHHF1EsXzs7xrYy+qLEnOWMCRo9S1Umj7OBEvzrlnexONr7wpQKKrazLDW
	IldUzbjeaacGwPVlEtaugu62PsmERoPjmcYSXc2WAfL/LjcLUrSh0MgP+7YnKPK3feeyO2+
	W5u6XBLedG2zENiN+k+OM+SsB2tz53dNUugswtxttZsKEBEvg9LY5r3/ptq+enVeoa8Tpr8
	o4OsLcM0xLY8L0oz43F3eMe34qudrFwUdSbAw+C60YjtKsZgvRf3h5rSGX8JYx28Dp/cs3I
	xr/tUkS0jnc3SFBMtVgp0gszHShhB8OBC36M9cScZCu0B0N6mwuyUAJy7qAUb0E33law8Gg
	plLt0n4FAKvw8t/07TEsRhj0BfYlBN+JxgcnS/2Bsl/gicYcYGUj9LaKHQj7+M91IPc1x16
	nN3PstUvzTn4L+ugKOtigcwORXFNY/GuJ/fB5kGZB41FdtMBmBVvXThMNnWzU44IDhciDYA
	4oHEaVmRTgAiIHUNkytr0U/DEDI82rypS/YHVaQSSNp/UCxUNAg05lB98NBJ2b+xZB7dz7S
	Ld0c1erqilw0Mpg65r80/GrDjTx+kHrUp5LXRUY07KeV9DpaS8a4WjJlbK/1Mo6pqlobpcO
	9jouSZaxGKQrlPoh2bYcV4jlWBkLwbI6Z+84bh1kIHPKCYpmYnVs0WvqO
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rkKKFJ8ZZADublAHtF5vsiAg
Content-Type: multipart/mixed; boundary="------------4e5rwFPgEBCozYnellBD9s8v";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: mic@digikod.net, gnoack@google.com, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, kees@kernel.org, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-security-module@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Message-ID: <3c677db3-a8b9-47f0-93a4-7809355f1381@uniontech.com>
Subject: [Bug Report] A compilation failure occurs when landlock and
 RANDSTRUCT are combined with GCC 14.2.0.

--------------4e5rwFPgEBCozYnellBD9s8v
Content-Type: multipart/mixed; boundary="------------zGPahLwRiqRp0uKPNCcbdmlY"

--------------zGPahLwRiqRp0uKPNCcbdmlY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

WyBDb21waWxhdGlvbiBmYWlsdXJlIGxvZzogXQ0KDQoqKiogV0FSTklORyAqKiogdGhlcmUg
YXJlIGFjdGl2ZSBwbHVnaW5zLCBkbyBub3QgcmVwb3J0IHRoaXMgYXMgYSBidWcgDQp1bmxl
c3MgeW91IGNhbiByZXByb2R1Y2UgaXQgd2l0aG91dCBlbmFibGluZyBhbg0KeSBwbHVnaW5z
Lg0KRXZlbnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCBQbHVnaW5zDQpQTFVHSU5fRklOSVNIX1RZUEXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgcmFuZG9taXplX2xheW91dF9wbHVnaW4NClBMVUdJTl9GSU5JU0hf
REVDTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCByYW5kb21pemVfbGF5b3V0X3Bs
dWdpbg0KUExVR0lOX0FUVFJJQlVURVPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCBsYXRlbnRfZW50cm9weV9wbHVnaW4gDQpyYW5kb21pemVfbGF5b3V0X3BsdWdpbg0KUExV
R0lOX1NUQVJUX1VOSVTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBsYXRlbnRf
ZW50cm9weV9wbHVnaW4gc3RhY2tsZWFrX3BsdWdpbg0KUExVR0lOX0FMTF9JUEFfUEFTU0VT
X1NUQVJUwqDCoMKgwqDCoCB8IHJhbmRvbWl6ZV9sYXlvdXRfcGx1Z2luDQpzZWN1cml0eS9s
YW5kbG9jay9mcy5jOkluIGZ1bmN0aW9uIOKAmGhvb2tfZmlsZV9pb2N0bF9jb21tb27igJk6
DQpzZWN1cml0eS9sYW5kbG9jay9mcy5jOjE3NDU6NjE6aW50ZXJuYWwgY29tcGlsZXIgZXJy
b3I6IGluIA0KY291bnRfdHlwZV9lbGVtZW50cywgYXQgZXhwci5jYzo3MDc1DQoxNzQ1IHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnUub3Ag
PSAmKHN0cnVjdCBsc21faW9jdGxvcF9hdWRpdCkgew0KIMKgwqDCoMKgIHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXg0KMHg3ZjI3ZmE2YmRjYTcgX19saWJjX3N0YXJ0X2NhbGxfbWFpbg0KIMKgwqDCoMKg
wqDCoCAuLi9zeXNkZXBzL25wdGwvbGliY19zdGFydF9jYWxsX21haW4uaDo1OA0KMHg3ZjI3
ZmE2YmRkNjQgX19saWJjX3N0YXJ0X21haW5faW1wbA0KIMKgwqDCoMKgwqDCoCAuLi9jc3Uv
bGliYy1zdGFydC5jOjM2MA0KUGxlYXNlIHN1Ym1pdCBhIGZ1bGwgYnVnIHJlcG9ydCwgd2l0
aCBwcmVwcm9jZXNzZWQgc291cmNlIChieSB1c2luZyANCi1mcmVwb3J0LWJ1ZykuDQpQbGVh
c2UgaW5jbHVkZSB0aGUgY29tcGxldGUgYmFja3RyYWNlIHdpdGggYW55IGJ1ZyByZXBvcnQu
DQpTZWUgPGZpbGU6Ly8vdXNyL3NoYXJlL2RvYy9nY2MtMTQvUkVBRE1FLkJ1Z3M+IGZvciBp
bnN0cnVjdGlvbnMuDQptYWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjAz
OiBzZWN1cml0eS9sYW5kbG9jay9mcy5vXSBFcnJvciAxDQptYWtlWzNdOiAqKiogW3Njcmlw
dHMvTWFrZWZpbGUuYnVpbGQ6NDYxOiBzZWN1cml0eS9sYW5kbG9ja10gRXJyb3IgMg0KbWFr
ZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ2MTogc2VjdXJpdHldIEVycm9y
IDINCg0KDQoNClsgUmVwcm9kdWNpbmcgc3RlcHM6IF0NCg0Kb3MtcmVsZWFzZTogRGViaWFu
IEdOVS9MaW51eCB0cml4aWUvc2lkDQoNCkNvbXBpbGVyOiBnY2MgdmVyc2lvbiAxNC4yLjAg
KERlYmlhbiAxNC4yLjAtMTkpDQoNClRhcmdldDogeDg2XzY0LWxpbnV4LWdudQ0KDQpTdGVw
OiBtYWtlIGFsbG1vZGNvbmZpZyAmJiBtYWtlIC1qJChucHJvYykNCg0KDQoNClsgRnVsbCBj
b25maWcgXQ0KDQpXaWxsIGJlIHJlcGlsZWQgdG8gdGhpcyBtYWlsLg0KDQoNCg0KVGhhbmtz
LA0KDQotLSANCg0KV2FuZ1l1bGkNCg==
--------------zGPahLwRiqRp0uKPNCcbdmlY
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

--------------zGPahLwRiqRp0uKPNCcbdmlY--

--------------4e5rwFPgEBCozYnellBD9s8v--

--------------rkKKFJ8ZZADublAHtF5vsiAg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ/d9IwUDAAAAAAAKCRDF2h8wRvQL7tE7
AQDZyqgD8aXHYKfx+cF74l182O189kgmRS9eNUrD4P5RTgD+PcQjU8QZ48YNG+PaCWj1HIrLv9wB
dLzgpl4Tiru/uQA=
=G0nq
-----END PGP SIGNATURE-----

--------------rkKKFJ8ZZADublAHtF5vsiAg--

