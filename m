Return-Path: <linux-kbuild+bounces-8267-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C15EDB17F46
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Aug 2025 11:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76BACA847BD
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Aug 2025 09:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CF4222582;
	Fri,  1 Aug 2025 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="mjTQDnR5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F23322E3E8;
	Fri,  1 Aug 2025 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040509; cv=none; b=oX7eFaJkLGYmR+p3gmnoz6fX1wP2vcmr/SWrNWW9Rf7v0TTrGJSXShv/t7n2vcuIoAJB+KaJ8Oo1naUZVr2+lugzM5xymkUNTqChSJ6pXGFzJ+Djn2f2wnRPbk+wc4ci4z4XFPkj/6lu+ge1yarAgvbBhgc9R375YiUkicomDbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040509; c=relaxed/simple;
	bh=Rh8xkW+ufhMGgv7blqxjQLVMUq0GO1Fv91E3kx6M6o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwtTD6Na7Ro1sdaqEMvdRoZdzv99R9BsPigpxf9QSgHw/wgUHyWPuJDc4R313ydyIySyuEgKCepvk25mR+2DyfV360O+KqvlK+Ks2aRoo+uuW1QIoQCEEmW3aGX1rqo4683hgwWExtce1UOjOYRfk/qdGHxOQn35FMZJjz10k44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=mjTQDnR5; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1754040451;
	bh=Rh8xkW+ufhMGgv7blqxjQLVMUq0GO1Fv91E3kx6M6o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=mjTQDnR5Wd73WK2BjIn/+vjnzIDVKEWab2txTcxfV/a6qis5J5MGSdB1E5ToeG1dX
	 XPp4CZ2j0hQV66BAh4XJ8svJsNmy/07lAB/0gQMzwS/WLlZB4oxem4LPEW08h5ZZmi
	 WJ1OfqzjEesq6Qmdc1E3alz2vUxfNXAhuP64f/Cc=
X-QQ-mid: zesmtpip2t1754040412t009af24f
X-QQ-Originating-IP: 2jgu5Ybud9JkDWmV6wAJSyrKtDhCEzc3RzZEawk0UlQ=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 01 Aug 2025 17:26:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5954868880669564702
EX-QQ-RecipientCnt: 12
Message-ID: <E6DF1F491EEF7B1E+9ce0f7cf-7463-48cd-b80f-1fe0cb1ea70d@uniontech.com>
Date: Fri, 1 Aug 2025 17:26:50 +0800
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
 <671CE9DD76801AE4+34f3e3b7-4684-4fe2-80a9-93de1dde9c31@uniontech.com>
 <20baf9ac-9328-4110-97f1-91e9e76b8914@suse.cz>
 <27488afa-1d53-43eb-bc68-8e950d804000@lucifer.local>
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
In-Reply-To: <27488afa-1d53-43eb-bc68-8e950d804000@lucifer.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tqVatPxkL60d1StyO0S0iNcS"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Ocs76G12hfvkA1KylAFpcsJUgAXi1YDRyj44Vpme7fK3udH72Amx79RH
	Gu6Xkzt7doIb3W0B+UJigxYD+F+i42J+d1eiq9Dv1jKhEYu/Smo/TKGkPS9bw8445mgVvFC
	HNOkPDdptfgx/5o+HS/VAqhGj2XMbMHd3MOaSJVVTbLG6Erh0Neyfr5SmUXE/KVGD8QEQaG
	bU7tJo2hyIDFtdUGRD2COXWEb4Cx6KOIU76pVQcQVTLRvt2zC9LEXwmAZUfDD8rn3eYUuar
	ss+xBOPF7FRFmALyyaUOxUN6EbUU9toXfavCZY8dszlcRwgZ4fAOkfmAYzLbDObZbLNMHWa
	QyIGSNM0OwdmYmsthg8dG/ZMSxe23KKiO+M2Z46a/QufCZWkDGPs52qR6PB/J5cJmND4ssc
	TWkwSY0lsdZRDaxadBMAVtbCOIbFUglvrUYKVxpweCJRg2cLG800GiumSE0ELnTOLUFvLWI
	IoelorGIYKUqcz8iQH7PG5GrSYnF/H0Slr0rnz/c0X7oWZgaDOwfnZq+9lgQ4Q2tPaxyw1T
	yM13Lti8EpjEpCaeKFFt7A/ZGC6LylWWQnKuYHqPYFOqCflkBsg1z9qG8xoYDEqpMHeFGUR
	ztt/n5g1OcXvPRUaazXBoWqZjhwK7SmEEXf6vkAjudYKhNjlZPP9AsHPlaotQTBQXXVAeKE
	M4jGfWhwW+ylC0JnGgRHS9iqJ5MHNfYRli1GyrWGtiSIl85D3pVMwgK6IHJieosueHEYGII
	ggPpis5ZhYnnuiTjgaPEo3k2bqCyYjv1+IxgoBnwiGY8qhLxDSXEu+TwEn06jpD/mJ+8W8F
	W1gscR2cFphyWg87kQiAoZlPUfS2hYsMktokaqaFbaD26Ioi6BdLYUmpbdqzIXYOMI2C5H+
	A9jWdvCUpH7s8OlXg/SNRFRMPcJ0Z2Gb19NfbkOa4eXpISza6mQMqTmF9El4Vyt3n6yk6hb
	xk1WJr1PpU096nOsL4ZhScaDsKnEOtfgmqw4mnvtfQQEFHCWlnDOJ/9edxEMYZ60jJ05TSQ
	y0dh7+PQJ2Uz+S8gavrL+4nJ2rrXXuLMEAvAn1yH9dugy6yxqv27FBSwcOgEbxv59FtXOzl
	KAATgotIQ5HUBavmJiVNN6RmDQKP3OoGgOvVDqDMSYZNFVdrjRsVpktPdRyidX+aQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tqVatPxkL60d1StyO0S0iNcS
Content-Type: multipart/mixed; boundary="------------TQ0K7J2nc88Gt4fgir3x1kEm";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Jun Zhan <zhanjun@uniontech.com>, linux-kbuild@vger.kernel.org
Message-ID: <9ce0f7cf-7463-48cd-b80f-1fe0cb1ea70d@uniontech.com>
Subject: Re: [PATCH] tools/testing/vma: Fix function parameter declarations
 for GCC 8.3 compatibility
References: <EFCEBE7E301589DE+20250729084700.208767-1-wangyuli@uniontech.com>
 <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>
 <CB890ABC56C2FA67+56b95783-ed70-4744-9fc5-f2d93ddf2c12@uniontech.com>
 <37b606a7-17c6-4865-a78a-ddde1bc15649@lucifer.local>
 <d31803bb-fb32-4a94-aa89-83b02757d650@suse.cz>
 <12cba6b8-6853-477d-aa6d-23180c2fec75@lucifer.local>
 <671CE9DD76801AE4+34f3e3b7-4684-4fe2-80a9-93de1dde9c31@uniontech.com>
 <20baf9ac-9328-4110-97f1-91e9e76b8914@suse.cz>
 <27488afa-1d53-43eb-bc68-8e950d804000@lucifer.local>
In-Reply-To: <27488afa-1d53-43eb-bc68-8e950d804000@lucifer.local>

--------------TQ0K7J2nc88Gt4fgir3x1kEm
Content-Type: multipart/mixed; boundary="------------NJ0Ouas1UcZlNeN45oWbpBos"

--------------NJ0Ouas1UcZlNeN45oWbpBos
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTG9yZW56bywNCg0KU2hvdWxkIEkgc3BsaXQgdGhpcyBpbnRvIHR3byBjb21taXRzPw0K
DQpBcyBWbGFzdGltaWwgQmFia2Egc3VnZ2VzdGVkLCBwZXJoYXBzIGl0IHdvdWxkIGJlIGJl
dHRlciB0byBhZGQgYm90aCB0aGUgDQp8LXN0ZD1nbnUxMXwgYW5kIHwtV25vLXVudXNlZC1w
YXJhbWV0ZXJ8IGZsYWdzIHRvIA0KfHRvb2xzL3Rlc3Rpbmcvc2hhcmVkL3NoYXJlZC5ta3wu
DQoNClRoYW5rcywNCg0KLS0gDQpXYW5nWXVsaQ0K
--------------NJ0Ouas1UcZlNeN45oWbpBos
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

--------------NJ0Ouas1UcZlNeN45oWbpBos--

--------------TQ0K7J2nc88Gt4fgir3x1kEm--

--------------tqVatPxkL60d1StyO0S0iNcS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnoEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaIyIWgUDAAAAAAAKCRDF2h8wRvQL7lPQ
AQDXdQzg8+lpn6zUmbt70QKi1AuoG5+Usxc/NbXtyfPcZwD3Rk0Ti1tWRPUGhMHS/yj+RufLJ2RF
mImA1H6MIilWCw==
=W2yw
-----END PGP SIGNATURE-----

--------------tqVatPxkL60d1StyO0S0iNcS--

