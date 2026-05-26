Return-Path: <linux-kbuild+bounces-13345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKuzGCvxFWp7fQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13345-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 21:14:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E15DBDCC
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 21:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 084813028F20
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 19:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7541D3C13E2;
	Tue, 26 May 2026 19:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="U4EcWHna"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3CD3C13E1;
	Tue, 26 May 2026 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822846; cv=none; b=RSil59wa3sZTVsbOarPOa/5WPstKhL9iZbYmO80kROcH3a8DYdGWpd5+S6QZOM6F6ewe5e+Sl/yEsjF9VS9f4aKHLTwfff+jSMVYWAKYuPevLSmsPZOLLjiUrgmt4FpkKt+aHI4ORsVXNMAVI90s1omZq1bm5Rb8pWWs7kaxOGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822846; c=relaxed/simple;
	bh=IjLlhiUz/fDBLtvKnmln56Pbcw6rMifWATra5y9j9aM=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=pMiRW0PEGXaLtrKtgtDX86JfFz4BNZtokm2zEfy6YbGNZo/eY1+jfqJ1W5qdup5hBVdIowrhvLUCkYX/rIIXuhi2+wJqRlXlPHdWrvLQ0Hs0fzhlS0+VxfLmh3tZD1VPdylJp8DQanSztAA8rIWNIYeME/e8xTRjFKJDC3FyEXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=U4EcWHna; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779822809;
	bh=IjLlhiUz/fDBLtvKnmln56Pbcw6rMifWATra5y9j9aM=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=U4EcWHna02zPjEbQjb/DtaP7xgsZBr+eXWvEqy+NLqTz6ixkqxk24RWb52jRqRr5j
	 nDnfWDtRcXDcJLMsRhoL4O1CMknox+iomp0CpsHCxdNUIrZWSnbPqhuZk5tNsmswet
	 GMT6Laakmad0pVnzs4ndtzCbjE6ge7AEr4L5aNgU=
EX-QQ-RecipientCnt: 5
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqTsBAZj3BNqi+E7MGSirmitosRUhGyHACY=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: j9gnqzLSfgKLkGQL9yRStdYZh/RYKgnRkKFC9bd7OlA=
X-QQ-STYLE: 
X-QQ-mid: lv3gz7b-6t1779822807t393a17b4
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?UGV0ciBQYXZsdQ==?=" <petr.pavlu@suse.com>
Cc: "=?utf-8?B?bGludXgta2J1aWxk?=" <linux-kbuild@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtbW9kdWxlcw==?=" <linux-modules@vger.kernel.org>, "=?utf-8?B?bWFzYWhpcm95?=" <masahiroy@kernel.org>
Subject: Re: [PATCH v2] genksyms: Support arm64 CRC32 hardware acceleration1~
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 27 May 2026 03:13:27 +0800
X-Priority: 3
Message-ID: <tencent_2FA16E0A18D6D0C0703F5D49@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <5d1b8b13-d590-497d-9185-609494135348@suse.com>
	<20260525080229.1570905-1-guanwentao@uniontech.com>
	<26c47a0e-7a9b-473a-818d-455e68476dd1@suse.com>
	<tencent_23032AC04EF146C803D19A6D@qq.com>
	<c135351a-d7cc-467b-a0c0-bea735fe850a@suse.com>
In-Reply-To: <c135351a-d7cc-467b-a0c0-bea735fe850a@suse.com>
X-QQ-ReplyHash: 1822101876
X-BIZMAIL-ID: 12359367781202862241
X-Address-Ticket:version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Wed, 27 May 2026 03:13:29 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MMnP0fEUKo/hGqe0Lk3OGXsRHsWPBqugZ7T720wqRVnx0AjYBuSxYtWY
	jrM/nBrwctBbD2GHZvwTlW982c5XR+rDyf22afzm6msLNBHgX6s5MnMhAI9HCpZCP5bl5Dz
	Vs2ZPKUGvxLha1h25sPSwraSSY6j4bMC+bQ5jjI/6cbbasLxR2cAwyDmnPyXc9Q1PZZcYVC
	0F6R9+6Y7vKwU7QvB/7VydhhBesb95BShrUFhvVUmWd5aSaM0DaXT+vNuLVF3bHI8HpqZHq
	K7HO00FUHyVRGyAnj8Vy0aRlRrv1HiCtfiF50ce4fMv/rO5KfWaXYpECJ6SpuGT45gWy/XQ
	892oIT6WXQeCIXmWY3UMDTK9kbLgcWtHRjo4uk/E6tXf/2WbKcAPqNnx7aP3YsMehVAhgUb
	800w5S+bpJpXTX/K54Yxtt1LSo7pdbOMxg8xZzAbF1cYmuuVIq+FK8Da6HpmInc0gIDk3rA
	yJ4DqUPFUikhH3cHNd7IwaH0JTSknbz3j7PplDG9ODwvniEFB1/hoqclhzli1rO39YIMABn
	Enu1kkglOcFBsSHhJpfpV/W0K/2OxWB94no5Aro9we/R+PuBP0nETsjiIyTjJ2FTUIWYavd
	XUskxDDt4GGulxFaTmwyckYObUv6rs7tuJEkLPH6vildoAbPRiFN1ukTIE0uDo9E5S+AMZ1
	I2Z8lZgGrdkWaU9Ux51NKOJhOsaM4wdYjAuO3Mw0eI08XKhkS/zlTobFdNbCsg1Ww5j5tDO
	Jorc6dhwwAyuaH30hiN01kH/bowHRXaZ8zUl/f3WUerPXEo70BP1PEoXkjuN0L4mztEHe/B
	kPlIRZ6HmzXP0OS+1BNiK8I8kKyySn+kQVeApiIngkTR0hWQntD0dAk80i3lrh2qQK51O/f
	AZShpIWlS7FO4OT0QLZxz5aEmFjIVoHiKHZ5Ib5US2WaWkb2/g0B/oF+3hTz8VyiyAWBFhh
	uef1GlwdpbwyY8KxUnkHq6CNOi+nOYzpgDT8/Db+7Q9fbPsZkyFSWq5l/JouhqodRjoydX7
	1VFvImf9p+BbhRj8rLpmxLIejLUA3o+mYInDIt/LffH/gYXclm2PoTxpaeaYnz+RelGg5LQ
	R4VLCv+9RcaAqrT4WavS5M=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [2.44 / 15.00];
	TO_EXCESS_BASE64(1.50)[];
	CC_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13345-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanwentao@uniontech.com,linux-kbuild@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	FROM_EXCESS_BASE64(0.00)[];
	NEURAL_SPAM(0.00)[0.682];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,uniontech.com:dkim]
X-Rspamd-Queue-Id: F19E15DBDCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8gUGV0ciwNCg0KPiBPbiA1LzI1LzI2IDM6NDEgUE0sIFdlbnRhbyBHdWFuIHdyb3Rl
Og0KPiA+PiBPbiA1LzI1LzI2IDEwOjAyIEFNLCBXZW50YW8gR3VhbiB3cm90ZToNCj4gPj4+
PiBBZGRpdGlvbmFsbHksIG1hbnkgZGlzdHJpYnV0aW9ucyBhbHJlYWR5IHN3aXRjaGVkIHRv
IGdlbmR3YXJma3N5bXMgbGFzdA0KPiA+Pj4+IHllYXIuIFVubGVzcyBzb21lb25lIHByb3Zp
ZGVzIGEgZ29vZCByZWFzb24gdG8ga2VlcCBnZW5rc3ltcyBhcm91bmQsDQo+ID4+Pj4gSSBl
eHBlY3QgaXQgd2lsbCBiZSBkZXByZWNhdGVkIHNvb24gYW5kIGV2ZW50dWFsbHkgcmVtb3Zl
ZC4gSXQgd291bGQgYmUNCj4gPj4+PiBtb3JlIHZhbHVhYmxlIHRvIHNob3cgd2hldGhlciB0
aGUgc2FtZSBvcHRpbWl6YXRpb24gaXMgd29ydGh3aGlsZSBmb3INCj4gPj4+PiBnZW5kd2Fy
ZmtzeW1zLg0KPiA+Pj4gSSBzZWUgZ2VuZHdhcmZrc3ltcyB1c2UgY3JjMzIgZnJvbSA8emxp
Yi5oPiwgd2hpY2ggZnJvbSB6bGliMWctZGV2IGFuZCB6bGliMWcuDQo+ID4+DQo+ID4+IEFo
LCBJIGZvcmdvdCBhYm91dCB0aGlzLCBzbyBnZW5kd2FyZmtzeW1zIHNob3VsZCBhbHJlYWR5
IGJlIHdlbGwNCj4gPj4gb3B0aW1pemVkLiBJIHRoaW5rIHRoYXQgaXMgdGhlIG1vc3QgaW1w
b3J0YW50IHRoaW5nLg0KPiA+DQo+ID4gV2hpY2ggd2F5IGRvIHlvdSBwcmVmZXI/IFRoZXJl
IGFyZSB0d28gd2F5cyBub3c6DQo+ID4gMS4gdGhpcyB3b3JrLA0KPiA+IDIuIGltcG9ydCB6
bGliIGxpa2UgZ2VuZHdhcmZrc3ltcyBhbmQgcmVtb3ZlIHRoZSBodWdlIGNyY3RhYiwNCj4g
PiBidXQgbmVlZCBtYWtlIHN1cmUgYW55IGFyY2ggZG8gbm90IGNhdXNlIHBlcmZvcm1hbmNl
IHJlZ3Jlc3Npb24/DQo+ID4gKEFzc2VydCB0aGUgdXNlciBsaWJzIHByZWNvbXBpbGUgd2l0
aCArY3JjMzIgaXMgcmlnaHQ/KQ0KPiA+IEkgZG8gc29tZSBlYXJseSB0ZXN0cyBzaG93IHRo
YXQ6DQo+ID4gMSkgemxpYiBpbiB4ODYgZmFzdCB0aGFuIGdlbmtzeW0gc29mdHdhcmUNCj4g
PiAyKSB6bGliIGluIGFybTY0IGRlYmlhbiBwcmVjb21waWxlIHNsb3cgdGhhbiBnZW5rc3lt
IHNvZnR3YXJlKGNyYzMyIG5vdCBpbiBhcm12OCkNCj4gPiAzKSB6bGliIGluIGFybTY0IHJl
Y29tcGlsZSB3aXRoICtjcmMzMiBzYW1lIHNwZWVkIHdpdGggZ2Vua3N5bXMgaGFyZHdhcmUN
Cj4gDQo+IEkgdGhpbmsgaXQgd291bGQgYmUgdXNlZnVsIHRvIGZpcnN0IGhhdmUgbW9yZSBk
YXRhIHNob3dpbmcgdGhhdCB0aGUgQ1JDDQo+IGNhbGN1bGF0aW9uIGluIGdlbmtzeW1zIGlz
IGEgaG90IHBhdGggYW5kIGNvbnRyaWJ1dGVzIHNpZ25pZmljYW50bHkgdG8NCj4gdGhlIG92
ZXJhbGwga2VybmVsIGJ1aWxkIHRpbWUuDQpJIGZvdW5kIHRoYXQgJ25tJyBpcyBzbG93IGFu
ZCBhIHJlYWxseSBjcmF6eSBidXQgc2lnbmlmaWNhbnRseSBpbXByb3ZlIG15IGJ1aWxkIHNw
ZWVkLA0KZnJvbSAxMW01MHMgZG93biB0byAxMW0xOHM6DQpkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9NYWtlZmlsZS5idWlsZCBiL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQNCmluZGV4IDBjODM4
YzQ2Ny4uZDViOWRiNmQzIDEwMDY0NA0KLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5idWlsZA0K
KysrIGIvc2NyaXB0cy9NYWtlZmlsZS5idWlsZA0KQEAgLTIzMSw3ICsyMzEsNyBAQCBpZmRl
ZiBDT05GSUdfTU9EVkVSU0lPTlMNCiAjICAgYmUgY29tcGlsZWQgYW5kIGxpbmtlZCB0byB0
aGUga2VybmVsIGFuZC9vciBtb2R1bGVzLg0KIA0KIGdlbl9zeW12ZXJzaW9ucyA9ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcDQotICAgICAgIGlmICQoTk0pICRAIDI+L2Rldi9udWxsIHwgZ3JlcCAtcSAnIF9fZXhw
b3J0X3N5bWJvbF8nOyB0aGVuICAgICAgICAgICAgIFwNCisgICAgICAgaWYgc3RyaW5ncyAk
QCAyPi9kZXYvbnVsbCB8IGdyZXAgLXEgJ19fZXhwb3J0X3N5bWJvbF8nOyB0aGVuICAgICAg
ICAgICAgXA0KICAgICAgICAgICAgICAgICQoY21kX2dlbnN5bXR5cGVzXyQxKSA+PiAkKGRv
dC10YXJnZXQpLmNtZDsgICAgICAgICAgICAgICAgICAgICBcDQogICAgICAgIGZpDQoNCkJS
cw0KV2VudGFvIEd1YW4=


