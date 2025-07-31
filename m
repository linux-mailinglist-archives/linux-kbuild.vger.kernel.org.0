Return-Path: <linux-kbuild+bounces-8256-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59380B16A9B
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 04:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FD07171EBF
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 02:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8CE19ABDE;
	Thu, 31 Jul 2025 02:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="cdlIuucb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA373136348;
	Thu, 31 Jul 2025 02:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753930645; cv=none; b=QKVQKEcF4eaLeYfLjj2GtY+5I3DsaitufCH2e/vAC1Nb1dcs1F2pB8ouQUho6gLqZQ4vRWD/KhMoWqemkV7A7m3uCGvrWUPw67pjsuGX3KGevEKiso8ejVlbjQDH4/lvWKZd3blqrTKugl2bk3om4suiKhgmq0Vj2DeVkFuJXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753930645; c=relaxed/simple;
	bh=MgbZ3YyNWnwH2YIV4X4szaoztLdViaFZVXSfMrwpF8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FumpcujNvqPdM4rBmrQdiywEidZ/oBjgQfanfxCUDJwSVM3nG6bTktyAMHqx5fUwxodY9kD23ZS1z2HWr9SR30wRcDLCrSoXQ7yyH8ShNFz9ongOkVtZmKmCr1HVFxUZRU7crI2Qe0uWY05kJ+/IuSUQgMkFZmyWTocHLFLcQ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=cdlIuucb; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1753930574;
	bh=MgbZ3YyNWnwH2YIV4X4szaoztLdViaFZVXSfMrwpF8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cdlIuucbaq/Nx4rOkomjybf+zhjwZFurw/u7EW4BpKa3l/Cz9heQupXdj1XNrbCBf
	 eQ9EY7klIT8QW/kz9y5fJjSxBMHdikwpGwtLucr0IaWETuWb38zaTE6vLAxxcWfKbF
	 Tq3q02SGoAC/kDp10s2hWyr+BbvWbBJL3vzFu8Mw=
X-QQ-mid: zesmtpip3t1753930534tc3c683a5
X-QQ-Originating-IP: 31YheQE0waYNv4OuiEWCRbjjtK1GdnDLJ6NrBrV6QB0=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 31 Jul 2025 10:55:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10925081017224793869
EX-QQ-RecipientCnt: 12
Message-ID: <CB890ABC56C2FA67+56b95783-ed70-4744-9fc5-f2d93ddf2c12@uniontech.com>
Date: Thu, 31 Jul 2025 10:55:32 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/testing/vma: Fix function parameter declarations
 for GCC 8.3 compatibility
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, niecheng1@uniontech.com,
 guanwentao@uniontech.com, Jun Zhan <zhanjun@uniontech.com>,
 linux-kbuild@vger.kernel.org
References: <EFCEBE7E301589DE+20250729084700.208767-1-wangyuli@uniontech.com>
 <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>
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
In-Reply-To: <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IvwDcfDvu0SkH02Eh8025qiE"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OST2d686M2k2lfT27lqzImNt0uyjqr1GLVt9r6CxohpXWB9znx1VWiy/
	mEwJabWaQe4nSCI6Eh+hYLZ1jjhhchGs2+PCMCwaF1nRKMXFXg6xFVl6jdPR5a0iqfkRCLU
	IHBzxEudILFLcyWQJ2phvWEhBmKN8Z5PRoN0a7ejGi5R+XvHTnD5H9VOw3cn8SeCQIz/kk4
	jZWP3D2dch1dc9YtRnyxtSMfqodLpgrcEDvnuvhDHa/az2n3uMOHzZIUw8Yci4vrKdgvq0J
	obqFTwbG9UAZLM95a4HXslPzYcYIxx6fJlPBTOG0saIakRaQJ6Ks0wA5adWVVP9ZQ4siVn5
	aLzIwHuTXyuCWTilpO3A4mkKErKbTgxbqa9+a+UWFdw27xpsygsrtZh6r18h+FIoD9UP6cc
	OftYU5Z6Ebni/35BsUILtwIUcHXtpLtJr7Rt1bVKVqnEXothL9E67WMPN1nXntf4PqxMw3I
	9L+p37QE0kebKlFdvapmKlZPysrl23Jv9PloGIKo8eEQd7YG5G9W7SYvzr4SMeKjaC8EXH0
	2p8s8vnYW20nYoGZ1WExwsm7IOyCFF19nEDH9IXwiZiJxc0tCFfhWEG6raKRzE5Rqaws3u9
	3sp7vvWq0I4qKLDgxHqoiS4babDlqW9yHk4ZNMxY4rFwrZVDieHDHtPKdT9dtIbey9nU8h+
	m4TV6M0LyoLcNktArgxIAFMf9ZcT7UAuCi7RToCyb/U6UW13+nh5cVtNkqbR0ebF3kfZu+6
	2hsT9WOB8sjCFez52JBB//wZULvRFfSd0gBAQ4eUVx+NdQJyPDSk8Fg59zVJbt4ZsE6g5c9
	W6It7qEd9MiV/f8R4mdK6k6dwEePaaiLPGsenkUaS2yS+IbCzl7q+bn/4MKAGLBYC6wOZz1
	fqXEg4MNGrdSDcK1+k6KOT8h0HwhZRxj/rhADeITE+fi3zI2+44efGVjFxE+w2hJem+S1lF
	TEODXsyQR9UZq6V/fy1iRagcDsW1aUoS06oUfDDE020Su1bl94Nyuvro8q299unK8OyUqNF
	9GZ5N/M0yNq6ZxJw2GVGleS1nN+rHH0dNIwL89WxAlunx3ppFg
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IvwDcfDvu0SkH02Eh8025qiE
Content-Type: multipart/mixed; boundary="------------4K1WZL7K3syHT0zLd9vYGe9R";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, niecheng1@uniontech.com,
 guanwentao@uniontech.com, Jun Zhan <zhanjun@uniontech.com>,
 linux-kbuild@vger.kernel.org
Message-ID: <56b95783-ed70-4744-9fc5-f2d93ddf2c12@uniontech.com>
Subject: Re: [PATCH] tools/testing/vma: Fix function parameter declarations
 for GCC 8.3 compatibility
References: <EFCEBE7E301589DE+20250729084700.208767-1-wangyuli@uniontech.com>
 <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>
In-Reply-To: <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>

--------------4K1WZL7K3syHT0zLd9vYGe9R
Content-Type: multipart/mixed; boundary="------------I4Ek084y2FxmUsLmcyEuhTCG"

--------------I4Ek084y2FxmUsLmcyEuhTCG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTG9yZW56byBTdG9ha2VzLA0KDQpPbiAyMDI1LzcvMjkgMTc6MDYsIExvcmVuem8gU3Rv
YWtlcyB3cm90ZToNCj4gT24gVHVlLCBKdWwgMjksIDIwMjUgYXQgMDQ6NDc6MDBQTSArMDgw
MCwgV2FuZ1l1bGkgd3JvdGU6DQo+PiBUaGUgTGludXgga2VybmVsJ3MgbWluaW11bSBHQ0Mg
dmVyc2lvbiByZXF1aXJlbWVudCBoYXMgYmVlbiBidW1wZWQNCj4+IGZyb20gNC4zIHRvIDgu
MywgYnV0IHRoaXMgdG9vbCBzdGlsbCBmYWlscyB0byBjb21waWxlIHdpdGggR0NDIDguMy4N
Cj4gV2h5IHBlb3BsZSBrZWVwIHJlcG9ydGluZyB0aGlzIGZvciBteSBWTUEgdGVzdCBzZXJp
ZXMgYnV0IF9ub3RfIHRoZSBrZXJuZWwNCj4gYXMgYSB3aG9sZSBJIGRvbid0IGtub3cuDQo+
DQo+ICQgZ3JlcCAiXCopOyIgaW5jbHVkZS9saW51eC9tbS5oIHwgd2MgLWwNCj4gOQ0KPg0K
PiBeLS0tIElmIHlvdSB1c2Ugc3VjaCBhIGNvbXBpbGVyLCB0aGUga2VybmVsIHdvbid0IGJ1
aWxkLg0KPg0KPiBTbyB0aGUgYnVnIGlzIHdob2V2ZXIgaXMgc2F5aW5nIGEgdmVyc2lvbiBv
ZiBnY2MgdGhhdCBkb2VzIHRoZSBiZWxvdyAoSSdsbA0KPiB0YWtlIHlvdXIgd29yZCBmb3Ig
aXQgdGhhdCB0aGlzIGlzIGluIGEgbm9ybWFsIGNvbmZpZ3VyYWl0b24pIGlzIE9LIGZvciB0
aGUNCj4ga2VybmVsLg0KPg0KPiBJdCdzIGNsZWFybHkgbm90Lg0KPg0KPiBPaCBqdXN0IHRv
IHVuZGVybGluZSB0aGluZ3M6DQo+DQo+ICQgZmluZCBpbmNsdWRlL2xpbnV4IC1uYW1lICcq
LmgnIHwgeGFyZ3MgZ3JlcCAiXCopOyIgfCB3YyAtbA0KPiAxODk5DQo+DQo+IFNvIHkna25v
dy4NCj4NCj4+IE9sZGVyIGNvbXBpbGVycyB3b3VsZCBmYWlsIGlmIGRpZCBub3QgaW5jbHVk
ZSBwYXJhbWV0ZXIgbmFtZXMgaW4NCj4+IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyB0aGF0IGNv
bnRhaW5lZCBwYXJhbWV0ZXIgdHlwZXM7IG5ld2VyIGNvbXBpbGVycw0KPj4gYXJlIG1vcmUg
bGVuaWVudCBhYm91dCB0aGlzLg0KPiBZb3UncmUgdXNpbmcgYSBjb21waWxlciB0aGF0IHdv
bid0IGJ1aWxkIGxpbnV4LiBTdG9wIGl0Pw0KPg0KPj4gRml4IG1hbnkgZXJyb3JzIGxpa2Ug
dGhpczoNCj4+ICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSB2bWEuYzoxMDoNCj4+ICAgIHZt
YV9pbnRlcm5hbC5oOiBJbiBmdW5jdGlvbiDigJhhcmNoX3ZhbGlkYXRlX2ZsYWdz4oCZOg0K
Pj4gICAgdm1hX2ludGVybmFsLmg6MTIxODo0MDogZXJyb3I6IHBhcmFtZXRlciBuYW1lIG9t
aXR0ZWQNCj4+ICAgICBzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF92YWxpZGF0ZV9mbGFncyh1
bnNpZ25lZCBsb25nKQ0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+DQo+PiAgICB2bWEuYzogSW4gZnVuY3Rpb24g4oCYZHVtbXlf
Y2xvc2XigJk6DQo+PiAgICB2bWEuYzoyODE6MjU6IGVycm9yOiBwYXJhbWV0ZXIgbmFtZSBv
bWl0dGVkDQo+PiAgICAgc3RhdGljIHZvaWQgZHVtbXlfY2xvc2Uoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICopDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+DQo+Pg0KPj4gUmVwb3J0ZWQtYnk6IEp1biBaaGFuIDx6aGFuanVuQHVuaW9u
dGVjaC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nWXVsaSA8d2FuZ3l1bGlAdW5pb250
ZWNoLmNvbT4NCj4gTkFLLg0KPg0KVGhhbmtzIGZvciB0aGUgaGVhZHMtdXAhIEkgbm90aWNl
ZCB0aGF0IGNvZGluZyBzdHlsZSBpbiB0aGUga2VybmVsIGNvZGUgDQphcyB3ZWxsLg0KDQpI
b3dldmVyLCBHQ0MgOC4zICh3aGljaCBkb2VzIG1lZXQgdGhlIGtlcm5lbCdzIGNvbXBpbGVy
IHZlcnNpb24gDQpyZXF1aXJlbWVudHMpIGNhbiBjb21waWxlIHRoZSBrZXJuZWwgY29kZSBu
b3JtYWxseSwgYnV0IGl0IGNhbid0IGNvbXBpbGUgDQp2bWEncyB0ZXN0IGNvcnJlY3RseS4N
Cg0KQ291bGQgdGhlIGlzc3VlIGJlIHJlbGF0ZWQgdG8gZGlmZmVyZW5jZXMgaW4gY29tcGls
YXRpb24gcGFyYW1ldGVycz8gDQpJJ2xsIG5lZWQgdG8gc3BlbmQgc29tZSB0aW1lIGxvb2tp
bmcgaW50byB0aGlzIG1vcmUgY2xvc2VseS4uLg0KDQpCeSB0aGUgd2F5LCB0aGlzIGNvZGlu
ZyBzdHlsZSBoYXMgYmVlbiBhIEdOVSBDIGV4dGVuc2lvbiB1bnRpbCB0aGUgSVNPIA0KQzIz
IHN0YW5kYXJkLiBTbywgdW50aWwgdGhlIGtlcm5lbCdzIEMgbGFuZ3VhZ2Ugc3RhbmRhcmQg
aXMgdXBncmFkZWQgdG8gDQpDMjMgKHdoaWNoIHNlZW1zIHVubGlrZWx5IHRvIGhhcHBlbiBh
bnl0aW1lIHNvb24sIHBlcmhhcHMgeWVhcnMgZG93biB0aGUgDQpsaW5lKSwgaXQgYWN0dWFs
bHkgbWFrZXMgc2Vuc2UgdG8gbW9kaWZ5IHRoaXMgc3R5bGUgZm9yIGEgcHJhY3RpY2FsIA0K
cHVycG9zZS4uLg0KDQpbIENjIHRoZSBrYnVpbGQgbGlzdC4gXQ0KDQpUaGFua3MsDQoNCi0t
IA0KV2FuZ1l1bGkNCg==
--------------I4Ek084y2FxmUsLmcyEuhTCG
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

--------------I4Ek084y2FxmUsLmcyEuhTCG--

--------------4K1WZL7K3syHT0zLd9vYGe9R--

--------------IvwDcfDvu0SkH02Eh8025qiE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaIrbJAUDAAAAAAAKCRDF2h8wRvQL7ofF
AP9uzDaVXJpePVW7A1LWIO7EFvEMZ0Ww89aZfSRBDXJKdAEArKSnnLp3GdzCgUX2YfG84LJp7Sr+
rkgxUj5hEo6rKgU=
=H+qA
-----END PGP SIGNATURE-----

--------------IvwDcfDvu0SkH02Eh8025qiE--

