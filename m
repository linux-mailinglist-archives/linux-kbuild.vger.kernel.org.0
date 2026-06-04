Return-Path: <linux-kbuild+bounces-13563-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B5HpL0P1IGql9wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13563-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 05:47:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FF63CB92
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 05:47:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=nhAHzopB;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13563-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13563-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87D313038F51
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2026 03:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C7E3403E6;
	Thu,  4 Jun 2026 03:45:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0712912FF69;
	Thu,  4 Jun 2026 03:45:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780544708; cv=none; b=dCKGHT12GcZlwsPX5eC0U0zWlbm0/TY+GjRzn8D2rBiYiqqm5NPNC2ReH+0H4DW8k9W+PPcJiZmUGBuSTYz8qzyQqApeOkipa8BKFMF36DhM6MtOnnaLA4sR+W2K8svzvF6fvq7zM4R0C+IqxGANoyNyoXbdVJvmXxYc8K0UGCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780544708; c=relaxed/simple;
	bh=+oKFCkpA9g6bvW2/EeTz/m6BG5XeVYlCSHSx217KAUI=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=ZQhiVdP4cTfZMmcfgaNp1XmYYNuRzd/vjCmR8jcSddpmmBUQV58vqX/2xBDpjaw0IVAFaJIgNIgraiSqxa90UxqDaoBnpP+qAITnyvFrCtwejDMUGIHn7iMWL153DN13BcrgZTu0QmaU3/OyC8N4i7dijjC78ybhOzCxkdhMRGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nhAHzopB; arc=none smtp.client-ip=54.92.39.34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780544675;
	bh=+oKFCkpA9g6bvW2/EeTz/m6BG5XeVYlCSHSx217KAUI=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=nhAHzopBUV1P7SEvvTHqSJ8csJVhkID8RWFSfZBIt8qmWhS6ao0UpHtaYjDcFWHWM
	 mZLDuD4elhFGNmdLbrZg7viNt3UUv36bWNt2FqgkxB2y34XtfxcyX9USvpsh7fQfeg
	 p0QaM5K7Yz/Sn51WO0x+vNi2uBIQh/v8PNV8FTkg=
EX-QQ-RecipientCnt: 6
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqTsBAZj3BNqi+E7MGSirmitosRUhGyHACY=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: Mt6pqlkqif3w2Xtn2uuya0GnWUGTAhR6KBt9wx8k37I=
X-QQ-STYLE: 
X-QQ-mid: lv3gz7b-6t1780544669t0f921ce6
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
Date: Thu, 4 Jun 2026 11:44:29 +0800
X-Priority: 3
Message-ID: <tencent_5A209D3D5BB5B16325067261@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20260603161732.52477-1-guanwentao@uniontech.com>
	<20260604013858.GB1329739@ax162>
In-Reply-To: <20260604013858.GB1329739@ax162>
X-QQ-ReplyHash: 2469154445
X-BIZMAIL-ID: 14692890567166091186
X-Address-Ticket:version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Thu, 04 Jun 2026 11:44:30 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NV3zG3Y1/ZrFpLoZQJkhQfaFKrtEr412aNiq6UVvwl8J5ujNdqxoUtSb
	s0NtFFqyAhuDHMtAHQmugWZiYTFQoRrIn5FVgkri80bQKrBNDgorlzL0//GS21bosAh3tAJ
	KrvCViuGKcqAMM5qg+bRXUYAGNHJznc+ogkNdPO7zfCkTVcY9MuTgEmbXd7axtUNnD/Xcl1
	nSWJfi1DiQAGRkArM4QGaA0MSwboIbazp7Ao51yVE8eYk77Jglz5+S9Fbm2c4zj7GAOnJMm
	O8PcS0konYZpH1aoI/01C1LaWuDT+3Vs/TVFJDzQLgQRUtoS4+I8FC6aE3TeldxVYNHD0YM
	cFId3hZ9v7Jutg1ygH3LHXt2IIE3rqaBoOTCZpIHShjgA0FJgsA2AWkd7A9mxXduoS9mBIR
	c7mkP1tZmyO82PoTQGYTZT6xSWFB8dRZC6/DqOijygI9kuJgbjA0A2dqDqCaUub3eNi/izh
	TGCl3NapPCIpdzH+hmAU+BbqXjeFZ9hMp8VRk2C3j33fbIkNkvsBSUwiHb45jDBDL53eHL2
	ITQrz5krXgyTDZskTpdVg7tBFYuzu0yyx9jT6nlyUVCrFqrDiKRX0lvS0C3wXZ/YxK8Tj3Y
	0UqWNmOqH9p+D73SfLqxJV/zEWsEN2ewZbOP+ezaEmXc2JK4L+fDiqLqCgEWvmSbbKcxLa+
	8024+3RHIcreDcY5Vbg7v9VogpJ3BCY1Jim5OZb5XnUclgCbyjzSBK7fVFFgNxT3eCp6zaa
	KB253sXasfsObLYsZB1uMPYjolppJmzkF2YB4a0RuogX/ay5UPTxdmbzqCQDbK51sw5lqpm
	PiRjnBOjbE17iPNU4HV64LmPX5xIlDO/pWKBN5Mku6KAfPfPLIYCPR+UI7y1XDYQM0nzoNo
	+oxohz+hZCWTD9Cc6bjmf8VpyCcChyhcWKGanui60hGXMTDiKsE4YRWAACiEo63tLd/sxyR
	dmIpud+n0CCzcmfYr5p4j2ZwiwUABh1uN1Kla/b/YOPyUZ+3YnujyCn0W1buujueuUfEzbf
	ub94IAhsR5RC6mfePKw9K4XZwet70hdgAKB9qLKm+e5S8j+IFOPVHzQkuuDqR0068fwviEV
	ieB3az0tnkJ3L6WuiMj3SSjgJGCTxtFpyAWxz0xO5Fm+ZE6FV4Mh9/z+KHVCAv/dOWnvvdi
	9itpAKH0im8BWG0=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	TO_EXCESS_BASE64(1.50)[];
	CC_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-13563-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_EXCESS_BASE64(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,uniontech.com:dkim,uniontech.com:from_mime,uniontech.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 150FF63CB92

SGVsbG8sDQoNCj4gT24gVGh1LCBKdW4gMDQsIDIwMjYgYXQgMTI6MTc6MzJBTSArMDgwMCwg
V2VudGFvIEd1YW4gd3JvdGU6DQo+ID4gVXNlIHJlYWRlbGYgdG8gZGlnIG91dCBpZiA8Zmls
ZT4ubyBjb250YWluIGEgX19leHBvcnRfc3ltYm9sXyouDQo+ID4NCj4gPiBJbnN0ZWFkIG9m
IG5tLCByZWFkZWxmIGlzIG1vcmUgZmFzdGVyLCBhbmQgc2lnbmlmaWNhbnRseSBpbXByb3Zl
IHNwZWVkDQo+ID4gd2hlbiBlbmFibGUgQ09ORklHX01PRFZFUlNJT05TLg0KPiA+DQo+ID4g
QnVpbGQgeDg2XzY0X2RlZmNvbmZpZ3MgaW4gMkM0VCBjbG91ZCBzZXJ2ZXIgd2l0aCBDT05G
SUdfTU9EVkVSU0lPTlM9eToNCj4gPiBXaXRoIHBhdGNoOg0KPiA+IHJlYWwgICAgMTdtMjEu
MDE5cw0KPiA+IHVzZXIgICAgNjFtNDguMzg4cw0KPiA+IHN5cyAgICAgNG0yNy43MDlzDQo+
ID4gV2l0aG91dCBwYXRjaDoNCj4gPiByZWFsICAgIDE3bTM5LjQzNXMNCj4gPiB1c2VyICAg
IDYybTI0LjY4NnMNCj4gPiBzeXMgICAgIDVtMy4yMDBzDQo+ID4NCj4gPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvdGVuY2VudF8yRkExNkUwQTE4RDZEMEMwNzAzRjVE
NDlAcXEuY29tLw0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlbnRhbyBHdWFuIDxndWFud2VudGFv
QHVuaW9udGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIHNjcmlwdHMvTWFrZWZpbGUuYnVpbGQg
fCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQgYi9z
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkDQo+ID4gaW5kZXggMzQ5OGQyNWIxNWU4NS4uNTRhOTFi
YzE0NGNjZSAxMDA2NDQNCj4gPiAtLS0gYS9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkDQo+ID4g
KysrIGIvc2NyaXB0cy9NYWtlZmlsZS5idWlsZA0KPiA+IEBAIC0yMzMsNyArMjMzLDcgQEAg
aWZkZWYgQ09ORklHX01PRFZFUlNJT05TDQo+ID4gICMgICBiZSBjb21waWxlZCBhbmQgbGlu
a2VkIHRvIHRoZSBrZXJuZWwgYW5kL29yIG1vZHVsZXMuDQo+ID4gDQo+ID4gIGdlbl9zeW12
ZXJzaW9ucyA9IFwNCj4gPiAtIGlmICQoTk0pICRAIDI+L2Rldi9udWxsIHwgZ3JlcCAtcSAn
IF9fZXhwb3J0X3N5bWJvbF8nOyB0aGVuIFwNCj4gPiArIGlmICQoUkVBREVMRikgLXNXICRA
IDI+L2Rldi9udWxsIHwgZ3JlcCAtcSAnIF9fZXhwb3J0X3N5bWJvbF8nOyB0aGVuIFwNCj4g
DQo+IFRoaXMgYnJlYWtzIG1vZHZlcnNpb25pbmcgZm9yIENsYW5nIExUTyBidWlsZHMsIGFz
IGxsdm0tbm0gY2FuIHJlYWQgTExWTQ0KPiBiaXRjb2RlIGJ1dCBsbHZtLXJlYWRlbGYgY2Fu
bm90LCBpdCBleHBlY3RzIHN0cmljdGx5IEVMRi4NCk9oLCBpcyBpdCB3b3J0aCB0byB1c2Ug
dGhlIGZvbGxvd2luZyBsb2dpYyB0byBkZXRlY3QgTExWTSBvciBMTFZNLUxUTyBvciBub3Qg
Pw0KK2lmZXEgKCQoTExWTSksKQ0KKyAgU1lNX0NIRUNLID0gJChSRUFERUxGKSAtc1cNCitl
bHNlDQorICBTWU1fQ0hFQ0sgPSAkKE5NKQ0KK2VuZGlmIA0KIGdlbl9zeW12ZXJzaW9ucyA9
CQkJCQkJCQlcDQotCWlmICQoTk0pICRAIDI+L2Rldi9udWxsIHwgZ3JlcCAtcSAnIF9fZXhw
b3J0X3N5bWJvbF8nOyB0aGVuCQlcDQorCWlmICQoU1lNX0NIRUNLKSAkQCAyPi9kZXYvbnVs
bCB8IGdyZXAgLXEgJyBfX2V4cG9ydF9zeW1ib2xfJzsgdGhlbglcDQoNCj4gSXMgdGhlcmUg
YW55IHBlcmZvcm1hbmNlIGdhaW4gd2l0aCBhZGRpbmcgJy1tMScgdG8gdGhlIGdyZXAgY29t
bWFuZCBzbw0KPiB0aGF0IGl0IHN0b3BzIGxvb2tpbmcgZm9yIGEgbWF0Y2ggYWZ0ZXIgdGhl
IGZpcnN0IGV4cG9ydCBzeW1ib2wgaXMNCj4gZm91bmQ/DQpTbWFsbCwgdGhlcmUgYXJlIG15
IHRlc3QgcmVzdWx0IGluIG1ha2UgeDg2XzY0X2RlZmNvbmZpZyArIGVuYWJsZSBDT05GSUdf
TU9EVkVSU0lPTlM6DQoxLiByZWFkZWxmDQppZiAkKFJFQURFTEYpICRAIDI+L2Rldi9udWxs
IHwgZ3JlcCAtcSAnIF9fZXhwb3J0X3N5bWJvbF8nOw0KcmVhbCAgICAxMG00NC4zNTlzDQp1
c2VyICAgIDM3bTQzLjU5NnMNCnN5cyAgICAgM20yLjQyNHMNCjIuIG5tDQppZiAkKE5NKSAk
QCAyPi9kZXYvbnVsbCB8IGdyZXAgLXEgJyBfX2V4cG9ydF9zeW1ib2xfJzsNCnJlYWwgICAg
MTFtOC4wMDhzDQp1c2VyICAgIDM4bTUxLjY0NHMNCnN5cyAgICAgM20yOS43OThzDQozLiBu
bSArIGdyZXAgLW0xIC1xDQppZiAkKE5NKSAkQCAyPi9kZXYvbnVsbCB8IGdyZXAgLW0xIC1x
ICcgX19leHBvcnRfc3ltYm9sXyc7DQpyZWFsICAgIDEwbTU2Ljg5MXMNCnVzZXIgICAgMzht
OC4xMzZzDQpzeXMgICAgIDNtMjguMDk2cw0KDQpUaGVzZSB0ZXN0IGJhc2VkIG9uIGRlZmF1
bHQgZ2NjIHRvb2xjaGFpbiBpbiB1YnVudHUgbm9ibGUuDQpJIHdpbGwgZG8gbW9yZSB0ZXN0
IHdoaWNoIHVzZSBsbHZtLW5tIGFuZCBsbHZtLXJlYWRlbGYuDQoNCkJScw0KV2VudGFvIEd1
YW4=


