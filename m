Return-Path: <linux-kbuild+bounces-13323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELMqA+FRFGryMQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13323-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 15:42:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 668DB5CB4D0
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 15:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53CC53006B01
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 13:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6E435F19A;
	Mon, 25 May 2026 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="aK9/B6fL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710E383300;
	Mon, 25 May 2026 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716514; cv=none; b=PZ2x2l5XiGUD4+6H7XBTCDqK1mLdPyBmLAIao0yIbh4ZXoiLWahFQTqyHssVLny8ndKxPQjh+TRkY5f2d9X7h49U45l1LnKW7jfl/Giy7qFrU1nT7WRrHk1pq1s/gAF9UvGdbPD517X4VLbsY7JyJtXbhHE/xQa19XdCFjGx3AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716514; c=relaxed/simple;
	bh=Nc/Jb5csnsx5gDgcPsmWWNNTtsoY2CvIv3mmQ/YO8ek=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=mGRylS9tOc/Dn83R2Llrd5jKd0Yxm2IIsjPw3HbKwP/juGmE81DmuPIHHGpTLqX4Qw9U343sNFaHPN7IvperwOn0GJWzKMlcZMDTItRBCrAKMLmUMSCLxuDUD7mM0fFmFc+E/z0EeNlHq9orzqd4IV18ck9+8CE6tin6iCLoN5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=aK9/B6fL; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779716466;
	bh=Nc/Jb5csnsx5gDgcPsmWWNNTtsoY2CvIv3mmQ/YO8ek=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=aK9/B6fLpETZVzKQ28Kd04mu+4TBbLuiV9RyT1i2gKbPKJVDqvMr7SaNnf8LrX92i
	 KO9cW5Ybmuks/2Tcc2aADI5eNdXR0lP4gayIlFiPL5dzhv4HXhE7VRaRQaoEHSoZJn
	 3qiCdGXejTNj/fyTedCtoidykXFTS1vVdhR3FCWc=
EX-QQ-RecipientCnt: 5
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: D4aqtcRDiqTsBAZj3BNqi+E7MGSirmitosRUhGyHACY=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: VenZ0hzj9GNcUaoHOrbn1qGc9ix9OI1ffzh2IXBKFawfaInuxooZrdEAAV+70/uGJaaqK3cz/RG8ea8Wh7EPjA==
X-QQ-STYLE: 
X-QQ-mid: lv3gz7b-6t1779716464td61e0df7
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
Date: Mon, 25 May 2026 21:41:04 +0800
X-Priority: 3
Message-ID: <tencent_23032AC04EF146C803D19A6D@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <5d1b8b13-d590-497d-9185-609494135348@suse.com>
	<20260525080229.1570905-1-guanwentao@uniontech.com>
	<26c47a0e-7a9b-473a-818d-455e68476dd1@suse.com>
In-Reply-To: <26c47a0e-7a9b-473a-818d-455e68476dd1@suse.com>
X-QQ-ReplyHash: 1755302232
X-BIZMAIL-ID: 12752282045284709240
X-Address-Ticket:version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Mon, 25 May 2026 21:41:05 +0800 (CST)
Feedback-ID: lv:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NTNLxPxYD/4Isf3zWHXhvhMZYJXOCa7NxMiMh0cO8SWOwRMKAh4/gd05
	Vwg3XedJNYsK09MuCTvnLOTvKpMOAolHxOEcFaYoIwziNW6cgrhrWramN6xme4FLlecKWBq
	p1rjTuj6+705Tu/Sf3Zb+8X1QO4Qu4G59fgkQ1Zfi+I98O2edRkIyBuL3DC6Hyi3iQZwhNU
	GzQhaS7r5upnT1RkcQsL2CbEYvkOdQZx6HWqO4f7VdWb11KwY4kK9OWkDOqdJ4TdjnzMvED
	A0xEgiRLqtS7F60dGtfNk/J77hH4AsaOtSUWdUdw49YWkndAAAp2odjesmNX3sPf4VSWMYT
	nph/8lDqUxLhsKf05C4FQiyHuiu1gJo3Nqflx+H855nI1ZweFREj4NupNug4mkx89Jgl+Te
	LgHaiBWzkcyhrFgv3xBg2rIklasiywdLzfimMjH0XOGhI2sWJ4ltwWVT6UGAu86nUMQtvBg
	/Q5hqwFL0uy3Jk/d+9JfjXZiJ5fWB5GEzxHNeqqMf3/oNpM4r0rFWs2/tchSLtXD0ehZ7gv
	PBnXtauaG8kqL+0tstNMuzyCO74JWmW9AablucI2XoamxWtnSJd/tXEacApuSCK0yDUuy/L
	qInHqAX6fiaaFvieTpf/Qma9V31/2oN1Kp/cmOR364tSqzFO1Gc4aK8TSym2kVskmAgsaIx
	IUKkSaEpvlas0FA6oohHHZ27299i2eqf7RZSTDTSc3uU6zxYQ5L8F9a7ux41nzLy5rBUeyC
	BkWkkqvxMlb15LVF/8Zaqt4Z9Izcurcc7iIgh3il+FcxqRiDvIG+lWdqt3gLcV6kR3Dbya+
	M+D0lDUOSXU+Cbxh57BXWwnajjPNQ87MKzxv4FIl1jF/V+0ZAkGbBwdawJfxH1iuu54Wvh7
	gQpG8dZNVX6Uw410Z0bIUzgHoSK0Fv31AT/Pj51VBBIGQ//3FPpAjYvkMEau+yO8kaEGGrq
	zH5HnJ4cjDd71StGCJv3SFdh2abLYdpBNq8Ov/7KqYrrnEuSU2ipz5rzYfVVL8q11vwqyE+
	sawiPK0VUdLXRjAVxkFEBbZ+km6chcpXt+eDJYA16E5p/zeugGfJlxVEbXtJ6MA+yXfVfUp
	g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [2.44 / 15.00];
	TO_EXCESS_BASE64(1.50)[];
	CC_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
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
	TAGGED_FROM(0.00)[bounces-13323-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanwentao@uniontech.com,linux-kbuild@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	FROM_EXCESS_BASE64(0.00)[];
	NEURAL_SPAM(0.00)[0.732];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,uniontech.com:dkim]
X-Rspamd-Queue-Id: 668DB5CB4D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pk9uIDUvMjUvMjYgMTA6MDIgQU0sIFdlbnRhbyBHdWFuIHdyb3RlOg0KPj4+IEFkZGl0aW9u
YWxseSwgbWFueSBkaXN0cmlidXRpb25zIGFscmVhZHkgc3dpdGNoZWQgdG8gZ2VuZHdhcmZr
c3ltcyBsYXN0DQo+Pj4geWVhci4gVW5sZXNzIHNvbWVvbmUgcHJvdmlkZXMgYSBnb29kIHJl
YXNvbiB0byBrZWVwIGdlbmtzeW1zIGFyb3VuZCwNCj4+PiBJIGV4cGVjdCBpdCB3aWxsIGJl
IGRlcHJlY2F0ZWQgc29vbiBhbmQgZXZlbnR1YWxseSByZW1vdmVkLiBJdCB3b3VsZCBiZQ0K
Pj4+IG1vcmUgdmFsdWFibGUgdG8gc2hvdyB3aGV0aGVyIHRoZSBzYW1lIG9wdGltaXphdGlv
biBpcyB3b3J0aHdoaWxlIGZvcg0KPj4+IGdlbmR3YXJma3N5bXMuDQo+PiBJIHNlZSBnZW5k
d2FyZmtzeW1zIHVzZSBjcmMzMiBmcm9tIDx6bGliLmg+LCB3aGljaCBmcm9tIHpsaWIxZy1k
ZXYgYW5kIHpsaWIxZy4NCj4NCj4gQWgsIEkgZm9yZ290IGFib3V0IHRoaXMsIHNvIGdlbmR3
YXJma3N5bXMgc2hvdWxkIGFscmVhZHkgYmUgd2VsbA0KPiBvcHRpbWl6ZWQuIEkgdGhpbmsg
dGhhdCBpcyB0aGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcuDQoNCldoaWNoIHdheSBkbyB5b3Ug
cHJlZmVyPyBUaGVyZSBhcmUgdHdvIHdheXMgbm93Og0KMS4gdGhpcyB3b3JrLA0KMi4gaW1w
b3J0IHpsaWIgbGlrZSBnZW5kd2FyZmtzeW1zIGFuZCByZW1vdmUgdGhlIGh1Z2UgY3JjdGFi
LA0KYnV0IG5lZWQgbWFrZSBzdXJlIGFueSBhcmNoIGRvIG5vdCBjYXVzZSBwZXJmb3JtYW5j
ZSByZWdyZXNzaW9uPw0KKEFzc2VydCB0aGUgdXNlciBsaWJzIHByZWNvbXBpbGUgd2l0aCAr
Y3JjMzIgaXMgcmlnaHQ/KQ0KSSBkbyBzb21lIGVhcmx5IHRlc3RzIHNob3cgdGhhdDoNCjEp
IHpsaWIgaW4geDg2IGZhc3QgdGhhbiBnZW5rc3ltIHNvZnR3YXJlDQoyKSB6bGliIGluIGFy
bTY0IGRlYmlhbiBwcmVjb21waWxlIHNsb3cgdGhhbiBnZW5rc3ltIHNvZnR3YXJlKGNyYzMy
IG5vdCBpbiBhcm12OCkNCjMpIHpsaWIgaW4gYXJtNjQgcmVjb21waWxlIHdpdGggK2NyYzMy
IHNhbWUgc3BlZWQgd2l0aCBnZW5rc3ltcyBoYXJkd2FyZQ0KDQpCUnMNCldlbnRhbyBHdWFu



