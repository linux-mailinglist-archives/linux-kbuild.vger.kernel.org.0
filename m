Return-Path: <linux-kbuild+bounces-13587-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RkWNHsquImpucAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13587-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 13:11:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 75321647A2A
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 13:11:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=CbjAjcB6;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13587-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13587-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A084300623A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 11:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08993E3178;
	Fri,  5 Jun 2026 11:04:37 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27794B8DCC;
	Fri,  5 Jun 2026 11:04:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657477; cv=none; b=Q7TCW1RQon5CzGYkBYvWEep5Be+yj6HflEAMtm9bCyACnrsZ6pK2IsDELL7QPTKE9ULLuO8M8p9vG9FokSJVh8vS42Vbi7S2tnVTMN5NTExLwl1aulHNwM7Sa/0HWW+9yN5I+bqyCUXBOv/fcefyyBMLV1AxBh3OM18mKzRp5yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657477; c=relaxed/simple;
	bh=H1xBDaAGz5WVnS9//Ddq0lrm2Lg1Gwm/6vLjexVk7/M=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=ITDvFm7CaUjEagr0YjsE7BdoWS/c2l9Jkn76QErdoUufbfU+UpW5gBKVceOzlFcONT7lqurOOENa/t34S36qj2u5n/WXSmZ4JaWed3uRh5tfTcuQKo+7w0qMKi5nVPzEujZGPK20ouEYT6yUNw9FuXmxlhED8uKGvNd/5Qgqs8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=CbjAjcB6; arc=none smtp.client-ip=54.207.19.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780657432;
	bh=H1xBDaAGz5WVnS9//Ddq0lrm2Lg1Gwm/6vLjexVk7/M=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=CbjAjcB6jSQ04n3PaniRYGWyVrhIdspv5a0Q1B1U5mWdlH2QWSkFl4QtPdsKHt43Z
	 KNAWuCXnXkWO40g4Wj30mSQa5Dw8Wi2NArCJ+4nOjIITkxwTHgwzXg+cOKG6OxLRvI
	 qpmNK9IBjR7JUoRhb53TqWasKv7rJXV0/hRZLrYw=
EX-QQ-RecipientCnt: 6
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqTsBAZj3BNqi+E7MGSirmitosRUhGyHACY=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: kAsM2eGyfbbUujh4pXfS+hJP5npwiKzl1l7Y83fIsjY=
X-QQ-STYLE: 
X-QQ-mid: lv3gz7b-6t1780657425t0531bdf9
From: "=?utf-8?B?V2VudGFvIEd1YW4=?=" <guanwentao@uniontech.com>
To: "=?utf-8?B?TmF0aGFuIENoYW5jZWxsb3I=?=" <nathan@kernel.org>
Cc: "=?utf-8?B?bnNj?=" <nsc@kernel.org>, "=?utf-8?B?dGFtaXJk?=" <tamird@kernel.org>, "=?utf-8?B?bGludXgta2J1aWxk?=" <linux-kbuild@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?UGV0ciBQYXZsdQ==?=" <petr.pavlu@suse.com>
Subject: Re: [PATCH] kbuild: try readelf first in gen_symversions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 5 Jun 2026 19:03:45 +0800
X-Priority: 3
Message-ID: <tencent_2829A9D625FB697316C9450F@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20260603161732.52477-1-guanwentao@uniontech.com>
	<20260604013858.GB1329739@ax162>
	<tencent_5A209D3D5BB5B16325067261@qq.com>
	<20260605062206.GA661512@ax162>
In-Reply-To: <20260605062206.GA661512@ax162>
X-QQ-ReplyHash: 4287062859
X-BIZMAIL-ID: 16952138947243987087
X-Address-Ticket:version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Fri, 05 Jun 2026 19:03:46 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: N4H/3gszCnCfp8McTaPFYbHDhbe/BFu8YtL/gmMm5X+GbuQqIj1AsuTp
	nJB2MENpX+vnAX7eiYCJ9KDqcNW4U9Z2BSypfie/SIrMxQk553FjtZ5Db6d9Dy2ec8YCBw4
	monAO1K9zewuI/gfiG44ZcOFYZUOAvY6r/wCMmYs7I/IQfdWR8yfnZsWFU+UNzQ5NojlYLY
	m1bSKdjLuGwyEGuRhGZ7hjwbZnporLeXnewSXyKHXOvEGulM91Cd5cRVqad+jCVdzwPOwpy
	5GOjfq3K4o1lYTWHs500FrKoaI9T6YOIMKre075sEc8rt50Pa7Ygn04zyVwNbWjtRf9OVzg
	lZvOmajzOHkyJGMS+C5LD4n/PILxLXr/ccg1dMkcHIhJZyhu9ZEo5irGHFPiWhaU3lOyAPe
	Sy6AqPK/XxZt03NwL8cP8cJKKXrtcWsarjbd0+UrIWcO0nQNLSrjPpJy5KBXVot27qs5/qO
	DMtdKoNmZ8QCrf5EG2cwh2XLvpQVoneCCCeXkN+CDsXtvRTIpEu3Y3PdwO7bnYsaGlik5UA
	jFji1qfe0JArcrMyKhOL0draY6hpbTOecOVtGSK3WO6JtKO1meBU5snO3EPTJyExwp+iBHE
	j8+B4XX/oXIY0HgShsb60nnqgmlKGVyDVsId9go/RafJQnkXJLRZPJMEbCdWLPpag+6tMEU
	fivy9JCBtUEY8745WroE/Z8vv8m2oBNUMcKii3cLTXQ+ChIn1JYClBVWnze9LIV9jTb1oGO
	N44ks/uhjB/+8Y7+zI4uhgmWC+lRgu30mde6TkHLrk38nP1UVcdwatny1IajI5kJ2Gsc5HX
	Bpanj37vNrdusSOwpZk0tJqFRZ4UWMQWzfR5/n5pVcdyc8c/ipUSmTFa8mmEjkQvFpWskkE
	95btm7pMwXVuVSxwvpM9yi20Os4w1DKzfmcWD0LOSKBVZ2uR1YPOvnm7dFbCmXo1LkBe9Q9
	ak1DhnEU66RaFQyyouZagUBIljH1i4c/oDNu+hrKEwEoWiRfPvdjFJ5wCTjEXPKC19CDZWT
	xfUwPA0QNn01TSl/PIaT8sKdQy2F9cb2fWhFrgpK1u3SGOO+HL9UUoTL24Lksv3m7Yo626Z
	e0Z1kaA0aGytOzT0pzUJux5lquqmRvNKwMFI/B2XtiFBtq+aslAkjQy1Dp0WKOz/4H3a0it
	0u/q
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	TO_EXCESS_BASE64(1.50)[];
	CC_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:tamird@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:petr.pavlu@suse.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[guanwentao@uniontech.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanwentao@uniontech.com,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13587-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_EXCESS_BASE64(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,uniontech.com:from_mime,uniontech.com:dkim,vger.kernel.org:from_smtp,makefile.build:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75321647A2A

SGVsbG8sDQoNCj4gVGhpcyBzaG91bGQgcHJvYmFibHkgYmUgQ09ORklHX0xUT19DTEFORyB3
aXRoIGZsaXBwZWQgYnJhbmNoZXMgYnV0Li4uDQpSaWdodCENCg0KPiAnLW0xJyBhcHBlYXJz
IHRvIGdldCB1cyA1MCUgKDEycykgb2YgdGhlIHNwZWVkIHVwIG9mICdyZWFkZWxmJyAoMjRz
KSBpbg0KPiB5b3VyIGVudmlyb25tZW50IHdoaWxlIHN0aWNraW5nIHdpdGggJ25tJy4gSSB3
b3VsZCBiZSBtb3JlIGluY2xpbmVkIHRvDQo+IHRha2UgdGhhdCBjaGFuZ2Ugc2luY2UgaXQg
aXMgc21hbGwgYW5kIGNvcnJlY3QsIHJhdGhlciB0aGFuIHN3aXRjaGluZyBvbg0KPiBOTSBv
ciBSRUFERUxGLCBhcyBJIGRvbid0IHRoaW5rIGl0IGlzIHdvcnRoIHRoZSBhZGRpdGlvbmFs
IGNvbXBsZXhpdHkuDQo+IEZXSVcsIG9uIG9uZSBvZiBteSB0ZXN0IG1hY2hpbmVzIHdpdGgg
OCBjb3JlcyBhbmQgMTYgdGhyZWFkcywgdGhlDQo+IGRpZmZlcmVuY2UgaXMgbXVjaCBsZXNz
IG5vdGljZWFibGUuIEkgdGhpbmsgdGhhdCBpcyBnb2luZyB0byBiZSBpbiBsaW5lDQo+ICB3
aXRoIG1vc3QgZGV2ZWxvcGVyIGFuZCBidWlsZCBmYXJtIGhhcmR3YXJlLCByYXRoZXIgdGhh
biBhIDJDLzRUIG1hY2hpbmUNCj4gbGlrZSB5b3UgbWVudGlvbiBpbiB0aGUgaW5pdGlhbCBj
b21taXQgbWVzc2FnZS4NClNvcnJ5LCBpdCBzZWVtcyBteSBjbG91ZCBzZXJ2aWVzIHByb3Zp
ZGVyIGNhdXNlIG15IHJlc3VsdHMgIHVwIGFuZCBkb3duOigsDQphbHNvIG1heWJlIGZpcnN0
IGNvbXBpbGUgdGltZSBub3Qgc3RhYmxlLCBzbyBJIHRlc3RlZCBpbiBhIDIwIGNvcmVzLzI4
IHRocmVhZHMgDQpiYXJlIG1ldGFsIGVudmlybWVudCAsIGhlcmUgaXMgdGhlIHJlc3VsdDoN
Cg0KSW50ZWwoUikgQ29yZShUTSkgaTctMTQ3MDBIWCArIDMyR0IgKyBOVk1lIHNzZA0KZ2Nj
IHZlcnNpb24gMTIuMy4wIGJpbnV0aWxzIDIuNDYNCmNsYW5nIHZlcnNpb24gMTguMS43DQpz
b3VyY2Uga2VybmVsIHRhZyB2Ny4wDQoNCnN1bW1hcnk6DQoxLiBzdGlsbCBiZW5pZml0IGZy
b20gbm0gdG8gcmVhZGVsZiBpbiAyMGNvcmUvMjh0aHJlYWRzDQooSSB0aGluayB0aGVyZSBt
b3JlIGNvc3RzIGluIGxpYmJmZCBpbiBubSwgc2hvdyBoaWdoIGNvc3QgZG93biBpbiBzeXMg
dGltZSwNCkkgZ3Vlc3MgaXQgY2F1c2UgbW9yZSBtZW1vcnkgYWNjZXMgYm90dGxlIG5lY2sg
dG8gZWZmZWN0IG92ZXJhbGwgY29tcGlsZSBwcm9jZXNzKQ0KYnV0IHNlZW1zIG5vIHRoZXNl
IGRpZmZlcmVudCB3aGVuIGNoYW5nZSBsbHZtLTE4LW5tIHRvIGxsdm0tMTgtcmVhZGVsZg0K
Mi4gLW0xIHNlZW1zIG5vIGV4cGVjdCBlZmZlY3QuLi4NCg0KdGVzdCBzY3JpcHRzOg0KaHR0
cHM6Ly9naXN0LmdpdGh1Yi5jb20vb3BzaWZmLzgzMmJhYTlhNjk4NjM0M2RkZGJlNTMwZmJl
ZTU3ZjUyDQoNCk1ha2VmaWxlLmJ1aWxkLW5tLW0xICA6ICdncmVwIC1xJyAtPiAnZ3JlcCAt
bTEgLXEnDQpNYWtlZmlsZS5idWlsZC1vcmlnIDogb3JpZyBNYWtlZmlsZS5idWlsZA0KTWFr
ZWZpbGUuYnVpbGQtcmVhZGVsZiA6ICdOTScgLT4gJ1JFQURFTEYgLXNXJw0KTWFrZWZpbGUu
YnVpbGQtcmVhZGVsZi1tMTogJ05NJyAtPiAnUkVBREVMRiAtc1cnICwgJ2dyZXAgLXEnIC0+
ICdncmVwIC1tMSAtcScNCg0KZnVsbCByZXN1bHQ6DQoxLiBydW4geDg2XzY0X2RlZmNvbmZp
ZyArIG1vZHZlcnNpb25zIHgzKGJhc2UpDQogICAgICAgIGlmICQoTk0pICRAIDI+L2Rldi9u
dWxsIHwgZ3JlcCAtcSAnIF9fZXhwb3J0X3N5bWJvbF8nOyB0aGVuICAgICAgICAgICAgIFwN
CnJlYWwgICAgMm0yLjg3NnMgICByZWFsICAgIDJtMi41NzhzICAgcmVhbCAgICAybTIuMjYy
cw0KdXNlciAgICA0Mm0xNS44NzFzICAgdXNlciAgICA0Mm0zNS4yNTBzICAgdXNlciAgICA0
Mm0zMy42NzlzDQpzeXMgICAgIDVtNTIuOTA0cyAgc3lzICAgICA1bTUyLjQ3OHMgICBzeXMg
ICAgIDVtNDkuMDA5cw0KDQoyLiBpZiAkKFJFQURFTEYpIC1zVyAkQCAyPi9kZXYvbnVsbCB8
IGdyZXAgLXEgIF9fZXhwb3J0X3N5bWJvbF87IHRoZW4NCnJlYWwgICAgMW01NC45MzFzICAg
cmVhbCAgICAxbTU1LjE5MnMgICByZWFsICAgIDFtNTUuMjA3cw0KdXNlciAgICA0MW00LjE2
MnMgICB1c2VyICAgIDQxbTcuNzU0cyAgIHVzZXIgICAgNDFtNS43OTFzDQpzeXMgICAgIDRt
OC40MjJzICAgc3lzICAgICA0bTguNDMxcyAgIHN5cyAgICAgNG05LjIxOXMNCg0KMy4gaWYg
JChOTSkgJEAgMj4vZGV2L251bGwgfCBncmVwIC1tMSAtcSAgX19leHBvcnRfc3ltYm9sXzsg
dGhlbiAgICBcDQoNCnJlYWwgICAgMm0xLjg2NXMgICByZWFsICAgIDJtMS44NjZzICAgcmVh
bCAgICAybTIuMTA4cw0KdXNlciAgICA0Mm0zMi44OTFzICAgdXNlciAgICA0Mm0zNS4wNDdz
ICB1c2VyICAgIDQybTMzLjgzNHMNCnN5cyAgICAgNW00OC4wNDVzICBzeXMgICAgIDVtNDcu
NzAwcyAgIHN5cyAgICAgNW00OC4yMDBzDQoNCjQuIGlmICQoUkVBREVMRikgLXNXICRAIDI+
L2Rldi9udWxsIHwgZ3JlcCAtbTEgLXEgJyBfX2V4cG9ydF9zeW1ib2xfJzsgdGhlbiAgICBc
DQoNCnJlYWwgICAgMW01NS4zODZzICAgcmVhbCAgICAxbTU2LjUyOHMgICByZWFsICAgIDFt
NTUuNDg5cw0KdXNlciAgICA0MW02LjE1NnMgICB1c2VyICAgIDQxbTEyLjMyMXMgICB1c2Vy
ICAgIDQxbTEwLjU0NXMNCnN5cyAgICAgNG0xMC4wOTNzICAgc3lzICAgICA0bTkuODM4cyAg
IHN5cyAgICAgNG05LjM2N3MNCg0KNS4gTExWTSBydW4geDg2XzY0X2RlZmNvbmZpZyArIG1v
ZHZlcnNpb25zIHgzKGJhc2UpDQogICAgICAgIGlmICQoTk0pICRAIDI+L2Rldi9udWxsIHwg
Z3JlcCAtcSAnIF9fZXhwb3J0X3N5bWJvbF8nOyB0aGVuICAgICAgICAgICAgIFwNCg0KcmVh
bCAgICAybTM1Ljc1OHMgICByZWFsICAgIDJtMzIuNjk2cyAgIHJlYWwgICAgMm0zMi4xMjdz
DQp1c2VyICAgIDU4bTIuNDE2cyAgIHVzZXIgICAgNTdtNTUuMDMwcyAgIHVzZXIgICAgNTdt
NTQuODA2cw0Kc3lzICAgICA0bTIwLjczNXMgICBzeXMgICAgIDRtMTguNDczcyAgIHN5cyAg
ICAgNG0xOC4wOTBzDQoNCjYuIExMVk0gaWYgJChSRUFERUxGKSAtc1cgJEAgMj4vZGV2L251
bGwgfCBncmVwIC1xICcgX19leHBvcnRfc3ltYm9sXyc7IHRoZW4gICAgICAgIFwNCg0KcmVh
bCAgICAybTMyLjQ0OHMgICByZWFsICAgIDJtMzIuNDE5cyAgIHJlYWwgICAgMm0zMi41MDlz
DQp1c2VyICAgIDU3bTU3LjI2MnMgICB1c2VyICAgIDU3bTUzLjAwMXMgICB1c2VyICAgIDU3
bTQ4Ljg0MnMNCnN5cyAgICAgNG0yMC41MDhzICAgc3lzICAgICA0bTIwLjY5M3MgICBzeXMg
ICAgIDRtMjAuNDkwcw0KDQo3LiBMTFZNICBpZiAkKE5NKSAkQCAyPi9kZXYvbnVsbCB8IGdy
ZXAgLW0xIC1xICcgX19leHBvcnRfc3ltYm9sXyc7IHRoZW4gICAgICAgICBcDQoNCnJlYWwg
ICAgMm0zMi4wMDNzICByZWFsICAgIDJtMzEuOTAwcyAgIHJlYWwgICAgMm0zMi4yNzZzDQp1
c2VyICAgIDU3bTQ1Ljc4NnMgICB1c2VyICAgIDU3bTQ2Ljk4MnMgICB1c2VyICAgIDU3bTQ5
LjkwN3MNCnN5cyAgICAgNG0xOC4xODRzICAgc3lzICAgICA0bTE3LjkyM3MgICBzeXMgICAg
IDRtMTguMzU0cw0KDQoNCjguIExMVk0gaWYgJChSRUFERUxGKSAtc1cgJEAgMj4vZGV2L251
bGwgfCBncmVwIC1tMSAtcSAnIF9fZXhwb3J0X3N5bWJvbF8nOyB0aGVuICAgIFwNCg0KcmVh
bCAgICAybTMzLjM2NXMgICByZWFsICAgIDJtMzIuMTg2cyAgcmVhbCAgICAybTMyLjExNHMN
CnVzZXIgICAgNTdtNDkuNTMzcyAgIHVzZXIgICAgNTdtNDcuODY1cyAgIHVzZXIgICAgNTdt
NDYuNTkxcw0Kc3lzICAgICA0bTE5LjgwOXMgIHN5cyAgICAgNG0yMC42NTJzICAgc3lzICAg
ICA0bTE5Ljk1NHMNCg0KOS4gTExWTSBMVE9fVEhJTiBydW4geDg2XzY0X2RlZmNvbmZpZyAr
IG1vZHZlcnNpb25zIHgzKGJhc2UpDQogICAgICAgIGlmICQoTk0pICRAIDI+L2Rldi9udWxs
IHwgZ3JlcCAtcSAnIF9fZXhwb3J0X3N5bWJvbF8nOyB0aGVuICAgICAgICAgICAgIFwNCg0K
cmVhbCAgICAzbTU5LjQxMXMgICAgcmVhbCAgICAzbTU1Ljk0NXMgICByZWFsICAgIDNtNTYu
NTU3cw0KdXNlciAgICA1OW0zOC44NzdzICAgIHVzZXIgICAgNTltMjAuMDA3cyAgIHVzZXIg
ICAgNTltMTkuMDA5cw0Kc3lzICAgICA0bTIxLjU4MnMgICBzeXMgICAgIDRtMjIuMzEzcyAg
IHN5cyAgICAgNG0yMy43OTNzDQoNCjEwLiBMTFZNIExUT19USElOICBpZiAkKE5NKSAkQCAy
Pi9kZXYvbnVsbCB8IGdyZXAgLW0xIC1xICcgX19leHBvcnRfc3ltYm9sXyc7IHRoZW4gICAg
ICAgICBcDQoNCnJlYWwgICAgM201NS43MjJzICAgcmVhbCAgICAzbTU2LjY0MXMgICByZWFs
ICAgIDNtNTcuOTc5cw0KdXNlciAgICA1OW0yMS44NjVzICAgdXNlciAgICA1OW0yNS42MzRz
ICAgdXNlciAgICA1OW0yMC44NzJzDQpzeXMgICAgIDRtMjEuMzAzcyAgIHN5cyAgICAgNG0y
NC4xNzRzICAgc3lzICAgICA0bTIyLjY5NXMNCg0KRnVsbCBsb2c6DQpodHRwczovL2dpc3Qu
Z2l0aHViLmNvbS9vcHNpZmYvMWNkN2UwYTA1NTNjODQxNmRkMTNhN2U5MjU5MGE0NDANCg0K
SWYgeW91IGhhdmUgYW55IG90aGVyIGlkZWFzLCBpIHdpbGwgaGFwcGx5IHRvIHRlc3QgdGhl
bSwNCmkgd2lsbCB0cnkgdG8gdXNlIGxsdm0tbm0gaW5zdGVhZCBvZiBubSB0byB0ZXN0Lg0K
DQpCUnMNCldlbnRhbyBHdWFu


