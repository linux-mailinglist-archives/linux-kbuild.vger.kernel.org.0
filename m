Return-Path: <linux-kbuild+bounces-13167-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPjCMBUpB2ppsQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13167-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 16:09:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D658551077
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 16:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C080300808F
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 13:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51311481FBD;
	Fri, 15 May 2026 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="ADhEG4B+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F1E481654;
	Fri, 15 May 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853456; cv=none; b=Hs929QWAa3uYjFcKleMremGpXk8sSoxqPPfXAkveQU7Uo+hD5yQa/q5+AAbkeVywp7ej18qbY2W1eATBguoKvtBMkZmWMmxyXbrsc/uUqBWY2Kxl3l1wiaqf1K+bOuIC1f3ngkn8+CLrWHBSJPG2FaVcp37w3xH6XClQ75Rd2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853456; c=relaxed/simple;
	bh=StD4rAsh5GFr7p6vlsKYtQzTm21GAueOvxKyOjM0H8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hS3o43REjfOCledM17DVyjRhMmHEgYFaGCluhq7lE8oo2RHoNtpdJtWb4HUjIBy+9m/z3QJBBh11OMSO6QtgTNc+3jpHhzwsO1fOSkQNJ/RheXvr+AdwE8K2UrudaghVN9bngHI+51LDb+2QCFKYKnrRAwASEqAbk/Z5aS0BwMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=ADhEG4B+; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id A18B6200B5;
	Fri, 15 May 2026 15:48:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 8315B1FAFE6;
	Fri, 15 May 2026 15:48:54 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id kaJvIl7qyKb4; Fri, 15 May 2026 15:48:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id D4D511FB079;
	Fri, 15 May 2026 15:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz D4D511FB079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1778852933;
	bh=StD4rAsh5GFr7p6vlsKYtQzTm21GAueOvxKyOjM0H8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ADhEG4B+psTpLXAwnFFplaUlZT0tWwLE+BrNKMz4Z5YaoZxAK3G9ygb8sJocys3C4
	 V01TI6U6xIs3VQuaLELc/AJm4BSWa3js9YVeIrQP64gS33vqlM8Sg0u5axCHtQIa7e
	 c+PjqOyR+JQp6YtvQ0lveyGcC9NVTz62UFWrDUz+bmKR2XoGD7uBuzL/sesRhWhCqj
	 XeUYlV8+GxQ07SNCnSZBpKN/NmcORzaiAo5bYU1/V2O4EO+3mdXtBi6b0IEUFOALnm
	 Psxz6Ch1V1zBh/fXhPVvqMoJeiCkGYTylBSP6zw8y4BGOV8Ww81XjyD0THUac786bH
	 iPr+x6ygZmhyw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Ng88jDr6WPcL; Fri, 15 May 2026 15:48:53 +0200 (CEST)
Received: from [192.168.0.168] (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 6EB911FAFE6;
	Fri, 15 May 2026 15:48:53 +0200 (CEST)
Message-ID: <80eb0431-06f3-4d76-a2d9-b9df383ca323@tngtech.com>
Date: Fri, 15 May 2026 15:48:47 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] add SPDX SBOM generation script
To: "Bird, Tim" <Tim.Bird@sony.com>, "nathan@kernel.org" <nathan@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg KroahHartman <gregkh@linuxfoundation.org>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 "maximilian.huber@tngtech.com" <maximilian.huber@tngtech.com>
References: <MW5PR13MB5632E740EE09E377C6E076E7FD062@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <MW5PR13MB5632E740EE09E377C6E076E7FD062@MW5PR13MB5632.namprd13.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V7uOQLUrjIlNFZpqvds5LojZ"
X-Rspamd-Queue-Id: 3D658551077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13167-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[tngtech.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gen-kernel-hwcaps.sh:url,tngtech.com:email,tngtech.com:mid,tngtech.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V7uOQLUrjIlNFZpqvds5LojZ
Content-Type: multipart/mixed; boundary="------------GgHFVAZK0FaplsbpZ4bJIGn6";
 protected-headers="v1"
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: "Bird, Tim" <Tim.Bird@sony.com>, "nathan@kernel.org" <nathan@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg KroahHartman <gregkh@linuxfoundation.org>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 "maximilian.huber@tngtech.com" <maximilian.huber@tngtech.com>
Message-ID: <80eb0431-06f3-4d76-a2d9-b9df383ca323@tngtech.com>
Subject: Re: [PATCH v6 00/15] add SPDX SBOM generation script
References: <MW5PR13MB5632E740EE09E377C6E076E7FD062@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB5632E740EE09E377C6E076E7FD062@MW5PR13MB5632.namprd13.prod.outlook.com>
Autocrypt-Gossip: addr=maximilian.huber@tngtech.com; keydata=
 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
 /5CE/Cgrmg==

--------------GgHFVAZK0FaplsbpZ4bJIGn6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiA1LzEzLzI2IDIwOjI1LCBCaXJkLCBUaW0gd3JvdGU6DQo+IEhleSBLZXJuZWxTQm9t
IHBlb3BsZSwNCj4gDQo+IEkgZ290IHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZSB3aGVu
IHVzaW5nIEtlcm5lbFNCb20gKGJvdGggd2l0aCB0aGUgdjUgcmVsZWFzZSBhbmQgdGhlIHJl
Y2VudCB2NiByZWxlYXNlKQ0KPiANCj4gSSB3YXMgZG9pbmcgYSBhbiBhcm02NCBkZWZjb25m
aWcgYnVpbGQuICBJIGNhbiB3b3JrIGFyb3VuZCB0aGUgcHJvYmxlbSB1c2luZyB5b3VyIGhh
bmR5DQo+ICItLWRvLW5vdC1mYWlsLW9uLXVua25vd24tYnVpbGQtY29tbWFuZCIgb3B0aW9u
IHRvIHRoZSBzYm9tIGdlbmVyYXRvciwgYnV0IHRob3VnaHQgSQ0KPiBzaG91bGQgcmVwb3J0
IHRoZSBpc3N1ZS4NCj4gDQo+ID09PT0gZXJyb3IgbWVzc2FnZSA9PT09DQo+IC4uLg0KPiAg
ICBHRU4gICAgIHNib20tc291cmNlLnNwZHguanNvbiBzYm9tLWJ1aWxkLnNwZHguanNvbiBz
Ym9tLW91dHB1dC5zcGR4Lmpzb24NCj4gW0VSUk9SXSBGaWxlICIvaG9tZS90YmlyZC93b3Jr
L3RvcnZhbGRzL2xpbnV4L3NjcmlwdHMvc2JvbS9zYm9tL2NtZF9ncmFwaC9zYXZlZGNtZF9w
YXJzZXIvc2F2ZWRjbWRfcGFyc2VyLnB5IiwgbGluZSAzMywgaW4gbG9nX2Vycm9yX29yX3dh
cm5pbmcNCj4gU2tpcHBlZCBwYXJzaW5nIGNvbW1hbmQgL2Jpbi9zaCAtZSAvaG9tZS90Ymly
ZC93b3JrL3RvcnZhbGRzL2xpbnV4L2FyY2gvYXJtNjQvdG9vbHMvZ2VuLWtlcm5lbC1od2Nh
cHMuc2ggL2hvbWUvdGJpcmQvd29yay90b3J2YWxkcy9saW51eC9hcmNoL2FybTY0L2luY2x1
ZGUvdWFwaS9hc20vaHdjYXAuaCA+IGFyY2gvYXJtNjQvaW5jbHVkZS9nZW5lcmF0ZWQvYXNt
L2tlcm5lbC1od2NhcC5oIGJlY2F1c2Ugbm8gbWF0Y2hpbmcgcGFyc2VyIHdhcyBmb3VuZA0K
PiA9PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IGFyY2gvYXJtNjQvdG9vbHMvZ2VuLWtl
cm5lbC1od2NhcHMuc2ggaXMgYSBzaW1wbGUgc2NyaXB0cyB0aGF0IGRvZXMgc29tZSBzaW1w
bGUNCj4gdHJhbnNmb3JtYXRpb25zICh1c2luZyBzZWQpIG9uIGxpbmVzIGZyb20gdGhlIGlu
cHV0IGZpbGUuICBBcyB5b3UgY2FuIHNlZSwgdGhlIGJ1aWxkIGNvbW1hbmQgdGFrZXMNCj4g
YXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL2h3Y2FwLmggYW5kIHRyYW5zZm9ybXMgaXQg
aW50byAkS0JVSUxEX09VVFBVVC9hcmNoL2FybTY0L2luY2x1ZGUvZ2VuZXJhdGVkL2FzbS9r
ZXJuZWwtaHdjYXAuaA0KPiANCj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBlYXN5IHRvIGFk
ZCB0byB5b3VyIGNvbW1hbmQgbGluZSBwYXJzZXIuICBKdXN0IHdhbnRlZCB0byBicmluZyBp
dCB0byB5b3VyIGF0dGVudGlvbi4NCj4gDQoNClllcywgdGhhbmtzIGEgbG90IGZvciByZXBv
cnRpbmcgdGhlIGlzc3VlLg0KZ2VuLWtlcm5lbC1od2NhcHMuc2ggaXMgYSBuZXcgc2NyaXB0
IHRoYXQgd2FzIGFkZGVkIGEgbW9udGggYWdvLg0KSSB3aWxsIGFkZCBhIGNvcnJlc3BvbmRp
bmcgY29tbWFuZCBwYXJzZXIgd2l0aCB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+IEdyZWF0IHRv
b2wsIGJ5IHRoZSB3YXkuICBJJ20gdGFsa2luZyBhYm91dCBpdCBhdCBPU1NOQSBuZXh0IHdl
ZWssIGFuZCB3YXMganVzdCBkb2luZyBzb21lIHRlc3Rpbmcgb24gZGlmZmVyZW50DQo+IHBs
YXRmb3Jtcy4NCg0KQ29vbCEgSGFwcHkgdG8gaGVhciB0aGF0IDopDQoNCkJlc3QsDQpMdWlz
DQoNCi0tIA0KTHVpcyBBdWdlbnN0ZWluICogbHVpcy5hdWdlbnN0ZWluQHRuZ3RlY2guY29t
ICogKzQ5MTUyMjUyNzU3NjENClRORyBUZWNobm9sb2d5IENvbnN1bHRpbmcgR21iSCwgQmV0
YS1TdHIuIDEzLCA4NTc3NCBVbnRlcmbDtmhyaW5nDQpHZXNjaMOkZnRzZsO8aHJlcjogSGVu
cmlrIEtsYWdnZXMsIERyLiBSb2JlcnQgRGFobGtlLCBUaG9tYXMgRW5kcmVzDQpBdWZzaWNo
dHNyYXRzdm9yc2l0emVuZGVyOiBNb3JpdHogUHJpbnoNClNpdHo6IFVudGVyZsO2aHJpbmcg
KiBBbXRzZ2VyaWNodCBNw7xuY2hlbiAqIEhSQiAxMzUwODINCg0K

--------------GgHFVAZK0FaplsbpZ4bJIGn6--

--------------V7uOQLUrjIlNFZpqvds5LojZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJzBrWn4qHw5a0jAXeVyKys3c+zQFAmoHJD8FAwAAAAAACgkQeVyKys3c+zTx
zRAAoYyyh1TbRbe9YEuq9t68tHFXTrb7acDI56jdzaVYH2ALQePjTrmFUNLLW3kzjkWLOX1tQUC6
YleTQBMKYk1E0B1As0p/he0pr6G6noTZl1RQ+/Z6dy5F3sgrrQA78BIbrFHk+GlX6CIRVThaPsH5
SvkJfIrp9H3QgM48wRnEEasnosfY7bFKFt1TD4NyKuGBJn41WjTR/YPiWLTBpQJtDeRzHrCWgcwO
abVwAshHzkBcK9SuwNd9BLU6G34814NA/M/ZQb5usdcdQcR1h+YJOc4c7WqKZWQ4yLlxD+VPSNat
N6+R5jAyL6uMRT21yAL0oT95wyzKAb2w8D6iLQ3EhzNI3srVWxn34cTCURb/pvc3jqxi2D74iq0V
dpYsYJe6ttEMet9SejQinnKwvFAG5gkl+9h8DZZw5LDbKDgEhggmMwPwKp/C1PHU8y789O8wSKOF
6jC7nhNzxoykvmCf/JDJvC3qLgz1FDDqlvgtP0U8OpCXmfPKZ5hqwi3+oPxNw4Vw2IvFaFAk1K3D
ZDU5e+grYekH+6X4i1vjVTLYNUpZJ6Z8ElwIL7/MjsyguZ8s8er0qRDfmOjVpHvmeB9W5UPBzv7w
W91K/UBgQXOz6FWymNXrqxvMTv7GSf/ICBT1JX7WZw/1yz0UAxy+P2L3lfgSxZyhnjhXOw9uFbrZ
0W0=
=iuLR
-----END PGP SIGNATURE-----

--------------V7uOQLUrjIlNFZpqvds5LojZ--

