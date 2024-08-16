Return-Path: <linux-kbuild+bounces-3034-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDD953FC1
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 04:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2C6D1F251D7
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 02:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F0440855;
	Fri, 16 Aug 2024 02:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="XOFtkm+W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9BC3BBF0
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Aug 2024 02:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723775753; cv=none; b=oNNFVTqZ/5ErTMhx7GaL5GaHE+ZjCbKeIyTGMxP3dkH6p8LaEtvwDHHQ9AkDZNNjY+Ee8YA2YTtymuPSxm+XiOqE4wclOriW5x6FCk1u+Mj2hqDT071OKHG7BfZCww26EEkYHngR4HTG8NtTAcDg5EdC0mAheB2EGgo3N/Cd7l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723775753; c=relaxed/simple;
	bh=hmo1VEgB5EAEZqCOsy/hjbF0O4DfXhlKP3N6OuFJG38=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=NkEURoAO4W0lT7XIAIIxp0cGcpNy9a+3lT7Md1lqmhj6IFgyRTp1E9KiMGM1M4yJWNUlwHXgkYYwrG9k+guyXK3yqM630X87CqyH53Dw0n50pW9u9OGGW8V1IrAmt833J8pq6fFtRQdFuU6UGdULMtYqPmeocMm4kaRI3iZTveg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=XOFtkm+W reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=kcIOikwO2T53/7IYL4bRR9CXCWw16Xjt/0pX3Q5kVPY=; b=X
	OFtkm+WBvHnGFH8zKbjQYGbFpz/EoaUuj9z6pAvsay82qkL4w27vU5rDxVTVuFC+
	TzrspdTz127xvDeEbOFKL/DJE1UNwTcmff32bQE/Rwgg584t3djGqaBmS/wth8I+
	TtdKUMSUcunwgHNsMlGsk7qsk1QuOxb5a1xBZuq68U=
Received: from tianyuanhao3$163.com ( [59.46.133.34] ) by
 ajax-webmail-wmsvr-40-128 (Coremail) ; Fri, 16 Aug 2024 10:20:10 +0800
 (CST)
Date: Fri, 16 Aug 2024 10:20:10 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "Masahiro Yamada" <masahiroy@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>, linux-kbuild@vger.kernel.org, 
	"Chen-Yu Tsai" <wenst@chromium.org>, 
	"Simon Glass" <sjg@chromium.org>, 
	"Viresh Kumar" <viresh.kumar@linaro.org>
Subject: Re:Re: [PATCH 1/1] kbuild: Only build dtc if needed
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <CAK7LNASTXOe5_VR2n79EFbp6a=hLoKKstoy31zf1nZv2PXjcaA@mail.gmail.com>
References: <20240815110059.4912-1-tianyuanhao3@163.com>
 <CAL_JsqJOb=WvP85VN1R+ERj3pRnddwcDjwyW4OOx5vL4W6RC7A@mail.gmail.com>
 <CAK7LNASTXOe5_VR2n79EFbp6a=hLoKKstoy31zf1nZv2PXjcaA@mail.gmail.com>
X-NTES-SC: AL_Qu2ZAfucu0Aq5iGYYOkfmksSgOg6X8CxuP8g3IRWO5x+jA7p9R0nbXZ6Hnnt4PyJFQCWuyGucSl3zM16W6VcQqEtnudwYBv0U5hDHW/xD2aIxQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2204647a.20c4.19158fc37fd.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3H9dat75mKRokAA--.43344W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXAs9jWXAnSgplQADsI
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNC0wOC0xNiAwOTo1Mjo1NywgIk1hc2FoaXJvIFlhbWFkYSIgPG1hc2FoaXJveUBrZXJu
ZWwub3JnPiB3cm90ZToKPk9uIEZyaSwgQXVnIDE2LCAyMDI0IGF0IDc6NDHigK9BTSBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gK01hc2FoaXJvCj4+Cj4+ICh1c2Ug
Z2V0X21haW50YWluZXJzLnBsIGluIHRoZSBmdXR1cmUpCj4+Cj4+IE9uIFRodSwgQXVnIDE1LCAy
MDI0IGF0IDU6MDHigK9BTSBUSUFOIFl1YW5oYW8gPHRpYW55dWFuaGFvM0AxNjMuY29tPiB3cm90
ZToKPj4gPgo+PiA+IEF0IHByZXNlbnQgTGludXggYWx3YXlzIGJ1aWxkcyBkdGMgaWYgQ09ORklH
X0RUQyBpcyBkZWZpbmVkLCBldmVuIHdoZW4KPj4gPiBEVEMgaXMgcHJvdmlkZWQuIFRoZSBidWls
dCBkdGMgaXMgbm90IGFjdHVhbGx5IHVzZWQsIHNvIHRoaXMgaXMgYSB3YXN0ZQo+PiA+IG9mIHRp
bWUuCj4+Cj4+IFRoYXQncyBraW5kIG9mIGEgZWRnZSB1c2VjYXNlLCBzbyBJJ20gbm90IHN1cmUg
aXQgaXMgd29ydGggdGhlCj4+IGNvbXBsZXhpdHkuCj4KPgo+SW5kZWVkLiBOb3Qgd29ydGggdGhl
IGNvbXBsZXhpdHkuCj4KPgo+T3ZlcnJpZGluZyBEVEMgaXMgbm90IGEgZ2VuZXJhbCB1c2UuCj5J
dCBpcyBhIGtub2Igc28gdGhhdCBzb21lb25lIGNhbiB0ZXN0IHRoZSBsYXRlc3QKPmR0YyBmcm9t
IHVwc3RyZWFtLgo+ClNvbWUgbWV0YSBkaXN0cmlidXRpb25zIHN1Y2ggYXMgWW9jdG8gYW5kIEJ1
aWxkcm9vdCBjb21waWxlIGEgY29tbW9uIGhvc3QgZHRjLCB3aGlsZSBBVEYsIFUtQm9vdCwgYW5k
IExpbnV4IGNhbiBzaGFyZSB0aGUgc2FtZSBob3N0IGR0Yy4KPgo+PiBXZSBjb3VsZCBhbHNvIGp1
c3QgbWFrZSBDT05GSUdfRFRDIHZpc2libGUgc28gaXQgY2FuIGJlCj4+IGRpc2FibGVkLiBPciBt
YWtlIGl0IGEgcGF0aCBkZWZhdWx0aW5nIHRvIHRoZSBidWlsdC1pbiBvbmUuIE1heWJlCj4+IE1h
c2FoaXJvIGhhcyBzb21lIGlkZWFzLgo+Cj4KPkxldCdzIG5vdCBkbyBhbnl0aGluZy4KPgo+Cj5U
aGlzIHBhdGNoIGlzIE5BQ0suCj4KPgpJZiB5b3UgdGhpbmsgdGhlcmUgaXMgc3RpbGwgcm9vbSBm
b3IgZGlzY3Vzc2lvbiBvbiB0aGlzIHRvcGljLCBJIGNhbiBzcGxpdCB0aGlzIHBhdGNoIGludG8g
dHdvIGFzIFJvYiBzdWdnZXN0ZWQuCj4KPgo+Cj4+Cj4+ID4gVXBkYXRlIHRoZSBNYWtlZmlsZSBs
b2dpYyB0byBidWlsZCBkdGMgYW5kIGZkdG92ZXJsYXkgb25seSBpZiBEVEMgb3IKPj4gPiBGRFRP
VkVSTEFZIGlzIG5vdCBwcm92aWRlZC4KPj4KPj4gT3ZlcnJpZGluZyBmZHRvdmVybGF5IGlzIG5v
dCBldmVuIHN1cHBvcnRlZCBjdXJyZW50bHkuIEFkZGluZyBzdXBwb3J0Cj4+IGZvciB0aGF0IHNo
b3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgo+Pgo+PiA+IEFsc28sIGFkZCBhbiBmZHRvdmVybGF5
IHdyYXBwZXIgdG8gaGlkZSB0aGUgYWN0dWFsIHBhdGggZGlmZmVyZW5jZXMgb2YKPj4gPiBmZHRv
dmVybGF5IGZyb20gdGhlIG1ha2VfZml0LnB5IHNjcmlwdC4KPj4KPj4gVGhhdCdzIHVnbHkuCj4+
Cj4+IFJvYgo+Cj4KPgo+LS0KPkJlc3QgUmVnYXJkcwo+Cj5NYXNhaGlybyBZYW1hZGEKLS0KQmVz
dCBSZWdhcmRzClRJQU4gWXVhbmhhbwoK

