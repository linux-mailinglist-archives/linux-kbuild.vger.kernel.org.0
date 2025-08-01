Return-Path: <linux-kbuild+bounces-8263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755AB17CAE
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Aug 2025 07:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648A91C2301E
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Aug 2025 05:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C4670805;
	Fri,  1 Aug 2025 05:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fWRPRYa4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE9BB660;
	Fri,  1 Aug 2025 05:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754027946; cv=none; b=S+E3/zme1lci7K/Wb0OVkCosb6L4VirgR98Uvp83pwiAAFsa5L+idizgaNYXwzC+DxKHlyC1Oxa3wYm5jKjjjPuZIODWsINp7U2MKwki2otA+AqH/qapMVgeAHSpwOB63opiuEVWuL5eETiXpduszIWxIyk8jwzarnJDMmUTh8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754027946; c=relaxed/simple;
	bh=TFvqmtcImAqa5Bexq4o48IS0BaB9Rj36ckv1GO81Z5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=giLd+t3FxKAbsHx9sTqS+Nn+qClElK7CHcEud4HKYYVq87L0lDme1a6vnCBqalicCjd0e4/d/kcV4+OirP0DOyU21wC/zOVdpajAhQWqIvsLdrRKLaXIGXrBT1Dqq0qSPHmeP2mVqy/2iGAmUWTuWQgtTlgjQURIoNbSI3+ObSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fWRPRYa4; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1754027882;
	bh=TFvqmtcImAqa5Bexq4o48IS0BaB9Rj36ckv1GO81Z5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=fWRPRYa4YH5M17CP0vKphcUSxPDADbXqDPwB+dS51ALiK3toxcal36P9Ae5tco8uX
	 AW3kq8WNGu40+i3D56oG2xWuepCnhbbwiq0U6W8G0vNoUKfGcImhb1pdB9Z6oZdaXL
	 2ezR3bqL0vAdQmN6odX32jObTOMZdKGnWVnDpz7g=
X-QQ-mid: zesmtpip2t1754027843tc5d9a561
X-QQ-Originating-IP: 9polwzB6wHNRa9OZhoNU/nu10Gz2XWZDq7AVf6MVhxY=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 01 Aug 2025 13:57:21 +0800 (CST)
X-QQ-SSF: 0001000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17402468212891621763
EX-QQ-RecipientCnt: 12
Message-ID: <671CE9DD76801AE4+34f3e3b7-4684-4fe2-80a9-93de1dde9c31@uniontech.com>
Date: Fri, 1 Aug 2025 13:57:21 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/testing/vma: Fix function parameter declarations
 for GCC 8.3 compatibility
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Jun Zhan <zhanjun@uniontech.com>, linux-kbuild@vger.kernel.org
References: <EFCEBE7E301589DE+20250729084700.208767-1-wangyuli@uniontech.com>
 <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>
 <CB890ABC56C2FA67+56b95783-ed70-4744-9fc5-f2d93ddf2c12@uniontech.com>
 <37b606a7-17c6-4865-a78a-ddde1bc15649@lucifer.local>
 <d31803bb-fb32-4a94-aa89-83b02757d650@suse.cz>
 <12cba6b8-6853-477d-aa6d-23180c2fec75@lucifer.local>
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
In-Reply-To: <12cba6b8-6853-477d-aa6d-23180c2fec75@lucifer.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------omK4SvbleiFzIO0VTu0P9FLk"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OMR9O8S7q+mY8et+CsmlYSqHfvVwmvOfhnZp+ZDSGvA3vYpdluyr7ht7
	GTHdF9gx2J2RVobMkzyfZ6NFDL3pUWZPJ3vq3koJ3WTM8wPiOoWrE6t/MX478poeNkSCnzL
	T6SQHsGMlxLtxEuQ5CbZgqnTiS9FaFCsmykRn8VsJM7+HRJIjF6knrfN93tHVUu3CCoUHmN
	PvTPy0fz1g8m/MhPWiOZqvIxB0rPr8sYYyLl0teJUEsjVMvNvW/+HssFOsUQttrO7qpl7GH
	RgbW4bFwNP9PeIqNzi3dxEo0yiKjy5+puNud6q2wko8kduwMZPf9LBVefQcGAe2x0yxYR9+
	urKzOdq7X2GK+pJPVeykBK7SLCcjgaaLn+eI/XZo/nJVWWJHqDtqI36d2DAEFMpWn8GjyMl
	s3VKU/AdFQuXwh+xU/kuUxwPgSMd6rqdLnRep+iXWTimRFLgmnELDl2pmbLzjAPfPln8j3M
	Eh5DLmiVdlJkTTV36rDFYS88xKQoGokNxfVCEXKlQSbfcqcuAJ0Q0/uuYZJeWA93lanBn3e
	Ad4eu3cPMM9kAzDnazFxpSJLS73UrDzbdg80F28SG6x670DulaXMOQvJaTUBlqd9LStDKlE
	a4gQrSWbB3HjSXPjd+rw2bok+7wjD85kDe2DaJdkOOA9C44oXJN+Ky49SKoQxcgOQLiXYOY
	J+1eN5AYyrIlBt08Q1QjoXLB2LA0gPXMP2d8ouegj4SloPjgoaOE5mOh6I4I9+SNmq3+dh3
	dd4DFA4kF7CYS0jY5mNEDqWReIL4IfRxKZ/42p3VeuqGhdNT55O0CG3+aIhBtg/CepzO0n4
	NYmZy4S2h0fsBXaY9BSe8N/9C9bFV2DiD8YgiZo6vSS6HbfmDWl38ORzotjIbt8kidUedSL
	bGSqOBVZ29yg5AmIPGGZ4NZ+dISgprKbrkMvHLUl6jEaiJ8Xt32d5FNtb/1ym2JnahM6jYE
	GP4FpGGLBLpFWwMKuF26WWMzTEDtgs44pFDugH3bZsmmdciFMtZ7umeVKXAHbYq8nmL4DTs
	DgnoGiehIMX7GedS6eL2fRFqr9lCx7rrpf4sM1QXrwlCeXq9j13MayXXZKfS3EGuHExNnf2
	deAAJFzQ+TuseJ3WgZbghAkMJjKixH75irijOdmHFK6w/BbeMxnFCb55zmaVEzded8Wxux8
	i4mlQC37canccuY=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------omK4SvbleiFzIO0VTu0P9FLk
Content-Type: multipart/mixed; boundary="------------n0lrM6oL0crQJSHrsvvooW83";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Jun Zhan <zhanjun@uniontech.com>, linux-kbuild@vger.kernel.org
Message-ID: <34f3e3b7-4684-4fe2-80a9-93de1dde9c31@uniontech.com>
Subject: Re: [PATCH] tools/testing/vma: Fix function parameter declarations
 for GCC 8.3 compatibility
References: <EFCEBE7E301589DE+20250729084700.208767-1-wangyuli@uniontech.com>
 <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>
 <CB890ABC56C2FA67+56b95783-ed70-4744-9fc5-f2d93ddf2c12@uniontech.com>
 <37b606a7-17c6-4865-a78a-ddde1bc15649@lucifer.local>
 <d31803bb-fb32-4a94-aa89-83b02757d650@suse.cz>
 <12cba6b8-6853-477d-aa6d-23180c2fec75@lucifer.local>
In-Reply-To: <12cba6b8-6853-477d-aa6d-23180c2fec75@lucifer.local>

--------------n0lrM6oL0crQJSHrsvvooW83
Content-Type: multipart/mixed; boundary="------------jeVl055xXeAO1sWb0pOt76Sp"

--------------jeVl055xXeAO1sWb0pOt76Sp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpPbiAyMDI1LzgvMSAxMzoxNCwgTG9yZW56byBTdG9ha2VzIHdyb3RlOg0K
PiBXYW5nWXVsaSAtIGNvdWxkIHlvdSBjaGVjaz8gSWYgaXQncyBhcyBzaW1wbGUgYXMgdGhp
cywgZmVlbCBmcmVlIHRvIHNlbmQgYSBwYXRjaA0KPiBtYWtpbmcgdGhpcyBjaGFuZ2UuDQo+
DQo+IFRoYW5rcywgTG9yZW56bw0KPg0KSXQncyBub3QgdGhhdCBzaW1wbGUsIG9mIGNvdXJz
ZS4uLiBUaGF0IGRpZG4ndCB3b3JrLg0KDQpJJ2xsIHRha2UgYW5vdGhlciBsb29rLg0KDQpU
aGFua3MsDQoNCi0tIA0KV2FuZ1l1bGkNCg==
--------------jeVl055xXeAO1sWb0pOt76Sp
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

--------------jeVl055xXeAO1sWb0pOt76Sp--

--------------n0lrM6oL0crQJSHrsvvooW83--

--------------omK4SvbleiFzIO0VTu0P9FLk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaIxXQQUDAAAAAAAKCRDF2h8wRvQL7oYM
AP9lRoFGnWOM70vOjy0/9CONc4lAMiPiucvTz6WV5iX+DgD8C6fBaLmgn5oomfV0WYsliayofzpb
aDIrjD4Qd8AVMQs=
=ChJs
-----END PGP SIGNATURE-----

--------------omK4SvbleiFzIO0VTu0P9FLk--

