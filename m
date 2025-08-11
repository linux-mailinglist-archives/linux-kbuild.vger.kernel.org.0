Return-Path: <linux-kbuild+bounces-8337-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EA2B1FF5E
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 08:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 977733A4DFA
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 06:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF9E2853E2;
	Mon, 11 Aug 2025 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SLFHEtaH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C4E72600
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Aug 2025 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754893749; cv=none; b=GP8GhOIOmGTebm86wIepVZq2nJcGVIz/JV/K9UzFz/Cc0RHmPkd717bpzKcPeQmISudYoiXyQczI7TbYaZJ+o0+RmELYvNwwd70yLvWAr8Sjq9K/Nj3ygsNvsyeB9vminOEtRczhlTI5x/X4lUDLcTYtk03GgQPwnat87aDH3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754893749; c=relaxed/simple;
	bh=BThZM1W0FTk/n8fRNDJbVF1zDWqCtCEEHzUYcHp5W68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=obDbHIiagoqVDAzyJWcaRor7H1WNa61TUvj97vJC6eCkIlNJjy4jv2/8LaCdw8LqbS/K6Kf9baFxJpdt3FR0DpPjHgE4Q6trKVBHutbVG5bp7xCjyUU3toKD770mAUg6se1soPRas8SyC+6SPePTLJNcLrHrP4uw6C0J0+//puQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SLFHEtaH; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=BThZM1W0FTk/n8fRNDJbVF1zDWqCtCEEHzUYcHp5W68=; b=S
	LFHEtaHCZ8jzxrJHvQuAU9YTd8hguQH2sAnwXNQAth7HGNbRJmtsYRXpM/EDqBPC
	J0fhhsorcsARkuK7Lw10LzYKINhbZ6LRey+9mNwRQQZ5xQl3XfKbHd/Sq4YeZb3q
	lINocasnyjfN3qc6m9qiruUCErb8YENVoxs7wOlCs8=
Received: from bigclouds$163.com ( [114.247.186.99] ) by
 ajax-webmail-wmsvr-40-119 (Coremail) ; Mon, 11 Aug 2025 14:28:56 +0800
 (CST)
Date: Mon, 11 Aug 2025 14:28:56 +0800 (CST)
From: "longguang.yue" <bigclouds@163.com>
To: "Nicolas Schier" <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, masahiroy@kernel.org
Subject: Re:Re: [PATCH] Makefile: mrproper deletes signing_key.x509
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <aJerjQGmXXcpTtBB@fjasle.eu>
References: <20250809120405.22957-1-bigclouds@163.com>
 <aJerjQGmXXcpTtBB@fjasle.eu>
X-NTES-SC: AL_Qu2eBvSSvE8o4CScZekfmksTj+c+W8ayu/ku245WNp9wjD7p+is5UnRSNkTc4e60KhGzmgmGQR5c2P1qUIhJZ486q7I/07zbZ1RhGoJVgup4Og==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1ac1d3e3.58ad.19897d159ff.Coremail.bigclouds@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dygvCgDX_1eojZlokDwXAA--.2250W
X-CM-SenderInfo: peljuzprxg2qqrwthudrp/1tbiNhakQ2iXKVv0+gAHsD
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

Tmljb2xhcyBTY2hpZXIsIEhpOgoKICBJdCBzaG91bGQgbm90IGRlbGV0ZSB4NTA5LmdlbmtleSBi
ZWNhdXNlIG9mIGl0cyBleHNpdGVuY2UgaW4gZ2l0aWdub3JlLgpOb3JtYWxseSwgdXNlcnMgd2Fu
dCB0byBrZWVwICBhIHNlbGYtZGVmaW5lZCB4NTA5LmdlbmtleSwgIGJ1dCBtcnByb3BlciBkZWxl
dGVzIGl0LCBvbmx5IGRlZmF1bHRfeDUwOS5nZW5rZXkgaXMgZWZmZWN0aXZlLiAKQWZ0ZXIgYXBw
bHlpbmcgdGhpcyBwYXRjaCwgdXNlcnMganVzdCBuZWVkIHRvIGNvcHkgc2VsZi1kZWZpbmVkIHg1
MDkuZ2Vua2V5IGludG8gY2VydHMgZGlyZWN0b3J5IG9uY2UuCgpUaGFua3MuCgoKQXQgMjAyNS0w
OC0xMCAwNDoxMTo1NywgIk5pY29sYXMgU2NoaWVyIiA8bmljb2xhcy5zY2hpZXJAbGludXguZGV2
PiB3cm90ZToKPk9uIFNhdCwgQXVnIDA5LCAyMDI1IGF0IDA4OjA0OjA1UE0gKzA4MDAgbG9uZ2d1
YW5nLnl1ZSB3cm90ZToKPj4gZGVsZXRlcyB0ZW1wb3Jhcnkgc2lnbmluZ19rZXkueDUwOSBhbmQg
cmVzZXJ2ZXMgdXNlci1kZWZpbmVkIHg1MDkuZ2Vua2V5Cj4KPmNhbiB5b3UgZWxhYm9yYXRlIHRo
ZSBhY3R1YWwgcHJvYmxlbSB3aXRoIHNvbWUgbW9yZSBkZXRhaWxzPwo+Cj5jZXJ0cy9zaWduaW5n
X2tleS54NTA5IGlzIHJlbW92ZWQgZHVyaW5nICdtYWtlIGNsZWFuJyB3aGljaCBpcyBhIGRlcGVu
ZGVuY3kKPm9mICdtcnByb3BlcicuCj4KPidtcnByb3BlcicgaXMgbWVhbnQgdG8gcmVtb3ZlIGV2
ZXJ5dGhpbmcgdGhhdCBtaWdodCBpbmZsdWVuY2UgYSBzdWJzZXF1ZW50Cj5jYWxsIG9mIGtidWls
ZCBmb3IgdGhlIHNhbmUgYXJjaGl0ZWN0dXJlLgo+Cj5XaXRob3V0IGZ1cnRoZXIgZGV0YWlscyBJ
IGNhbm5vdCBzZWUgYW55IHByb2JsZW0gaGVyZS4KPgo+S2luZCByZWdhcmRzLAo+Tmljb2xhcwo=


