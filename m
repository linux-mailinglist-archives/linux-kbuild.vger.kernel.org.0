Return-Path: <linux-kbuild+bounces-13053-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGcuMnFe+2kuaQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13053-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 17:29:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A854DD3C4
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 17:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D4AF308D199
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 15:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C75305E32;
	Wed,  6 May 2026 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="LGNAtf49"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114AD2DAFA9;
	Wed,  6 May 2026 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080729; cv=none; b=auwNrLFObg1cFgthwNCK8jwLQqgKBhUnRsONNdXWrNepLSDNbIjWDgxFgqtkQ7oxHEJ6miXQ972a8icxejGotLl3C8oeYGHQVZ0cYfByq9jPxzgr0N+PWGCaY7eLETU+xiUqku/QOc4hlgDUxCJZktMTL4ev1OzyQN7ahWHQ1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080729; c=relaxed/simple;
	bh=i63iJcNMaiE/p9LCMpi+AM/NzWKPRpu68nl4anQnFU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/ot1AKlkydJRg58q7W31YVR+TM9fkh3IRdqIxOJIjIUFe1Baaibh2kPmX+D/0wnW2HSsx632IxOJOwB/1izbLGAUnQwwXg70C4pTksyvgdllB/1LOhbxPyxdkHtDfuM9OUVbD40CgpkbjS4Eq1od8rXnz36N8uKn/xjgfKCxkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=LGNAtf49; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 04904200C9;
	Wed,  6 May 2026 17:18:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 9E2081FAFEC;
	Wed,  6 May 2026 17:18:44 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id dO2hIEJ7GYUk; Wed,  6 May 2026 17:18:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id DCAA51FB1B4;
	Wed,  6 May 2026 17:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz DCAA51FB1B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1778080721;
	bh=i63iJcNMaiE/p9LCMpi+AM/NzWKPRpu68nl4anQnFU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LGNAtf49z2YqBMZzoyZnoMuLn130eQc9WyL93LRLmWbPRbHSM9murfbUMsbU4l4Ph
	 mkswjSGTIjNqyJx6LqYpsFD3lGAdkApgxaI/2eHHwe90PYmglz7sYAUukXwz7LscjM
	 brb1eYCWNRtDT3b0ws5zI3Y4OCgg/ysf7Pnj8yuoSNOyKc8iMCP7/CMgCx8fgiWdPw
	 s4oK7Vzn6PHyN/SlZebn2HNm90ccQLpRKZqKwQEfJDPMUyfA+R1f8XKAU1wJNBbe6I
	 SlyPXhyMy2je4YEmIhnvSNIo0dILCa7rF3nvh7qZkEwXQ93wvcROVsU6hYWvKKDD6G
	 fuQ0VufoJ6A1A==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id F-g4AgVRoQPq; Wed,  6 May 2026 17:18:41 +0200 (CEST)
Received: from [192.168.0.168] (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 40C501FB0C4;
	Wed,  6 May 2026 17:18:41 +0200 (CEST)
Message-ID: <5396a630-9b65-4455-9141-9f3fc520b3ec@tngtech.com>
Date: Wed, 6 May 2026 17:18:39 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] add SPDX SBOM generation script
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
References: <20260410212255.9883-1-luis.augenstein@tngtech.com>
 <177750859587.2042162.11401905742333459790.b4-review@b4>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <177750859587.2042162.11401905742333459790.b4-review@b4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XhCcPIg8oBMdynTX8OlVbiVD"
X-Rspamd-Queue-Id: C2A854DD3C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[tngtech.com:+];
	TAGGED_FROM(0.00)[bounces-13053-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tngtech.com:email,tngtech.com:dkim,tngtech.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[9]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XhCcPIg8oBMdynTX8OlVbiVD
Content-Type: multipart/mixed; boundary="------------0dbQz1xdPDsrIRlCYm7cpWvX";
 protected-headers="v1"
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
Message-ID: <5396a630-9b65-4455-9141-9f3fc520b3ec@tngtech.com>
Subject: Re: [PATCH v5 00/15] add SPDX SBOM generation script
References: <20260410212255.9883-1-luis.augenstein@tngtech.com>
 <177750859587.2042162.11401905742333459790.b4-review@b4>
In-Reply-To: <177750859587.2042162.11401905742333459790.b4-review@b4>
Autocrypt-Gossip: addr=maximilian.huber@tngtech.com; keydata=
 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
 /5CE/Cgrmg==

--------------0dbQz1xdPDsrIRlCYm7cpWvX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8zMC8yNiAwMjoyMywgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6DQo+IE9uIEZyaSwg
MTAgQXByIDIwMjYgMjM6MjI6NDAgKzAyMDAsIEx1aXMgPGx1aXMuYXVnZW5zdGVpbkB0bmd0
ZWNoLmNvbT4gd3JvdGU6DQo+PiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIGEgUHl0
aG9uLWJhc2VkIHNjcmlwdCBmb3IgZ2VuZXJhdGluZyBTQk9NDQo+PiBkb2N1bWVudHMgaW4g
dGhlIFNQRFggMy4wLjEgZm9ybWF0IGZvciBrZXJuZWwgYnVpbGRzLg0KPiANCj4gSSBzZWUg
dGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGJ1aWxkaW5nIEFSQ0g9YXJtNjQgdmlydGNvbmZp
ZyBzYm9tOg0KPiANCj4gICAgfCAkIG1ha2UgLXNraiIkKG5wcm9jKSIgQVJDSD1hcm02NCBD
Uk9TU19DT01QSUxFPWFhcmNoNjQtbGludXgtIENST1NTX0NPTVBJTEVfQ09NUEFUPWFybS1s
aW51eC1nbnVlYWJpLSBtcnByb3BlciB2aXJ0Y29uZmlnIHNib20NCj4gICAgfCBbRVJST1Jd
IEZpbGUgIi9zcmMvc2NyaXB0cy9zYm9tL3Nib20vY21kX2dyYXBoL3NhdmVkY21kX3BhcnNl
ci9zYXZlZGNtZF9wYXJzZXIucHkiLCBsaW5lIDMzLCBpbiBsb2dfZXJyb3Jfb3Jfd2Fybmlu
Zw0KPiAgICB8IFNraXBwZWQgcGFyc2luZyBjb21tYW5kIGFyY2gvYXJtNjQva2VybmVsL3Zk
c28zMi8uLi8uLi8uLi9hcm0vdmRzby92ZHNvbXVuZ2UgYXJjaC9hcm02NC9rZXJuZWwvdmRz
bzMyL3Zkc28uc28ucmF3IGFyY2gvYXJtNjQva2VybmVsL3Zkc28zMi92ZHNvMzIuc28uZGJn
IGJlY2F1c2Ugbm8gbWF0Y2hpbmcgcGFyc2VyIHdhcyBmb3VuZA0KPiAgICB8IC4uLg0KPiAg
ICB8IG1ha2VbM106ICoqKiBbL3NyYy9NYWtlZmlsZToyMTg0OiBzYm9tXSBFcnJvciAxDQo+
ICAgIHwgLi4uDQo+IA0KPiBJIHdvdWxkIGhpZ2hseSByZWNvbW1lbmQgcnVubmluZyBzb21l
IHJhbmRjb25maWcgYnVpbGRzIHdpdGggQVJDSD1hcm02NA0KPiBhbmQgQVJDSD14ODZfNjQg
aWYgeW91IGhhdmUgbm90IGFscmVhZHkgZG9uZSBzbyB0byBlbnN1cmUgeW91IGhhdmUNCj4g
Y2F1Z2h0IGFsbCBjb3JuZXIgY2FzZXMuIFRoaXMgb25lIHdhcyB1bmRlcnN0YW5kYWJseSBt
aXNzZWQgYmVjYXVzZSBHQ0MNCj4gYnVpbGRzIHJlcXVpcmUgYSBzZXBhcmF0ZSAzMi1iaXQg
Y3Jvc3MgY29tcGlsZXIgKHNwZWNpZmllZCB3aXRoDQo+IENST1NTX0NPTVBJTEVfQ09NUEFU
KSB0byBidWlsZCB0aGlzIGNvZGUuIFRlc3Rpbmcgd2l0aCBMTFZNPTEgd291bGQgaGVscA0K
PiB3aXRoIHRoYXQgc2luY2UgdGhlIGJ1aWxkIHN5c3RlbSBoYW5kbGVzIGNyb3NzIGNvbXBp
bGUgYXV0b21hdGljYWxseSBpbg0KPiB0aGF0IGNhc2UuDQoNClNvIGZhciwgSSBoYXZlIG1h
aW5seSB0ZXN0ZWQgd2l0aCB0aW55Y29uZmlnLCBkZWZjb25maWcsIGFsbG1vZGNvbmZpZywg
DQphbmQgdGhlIGNvbmZpZ3MgZnJvbSANCmh0dHBzOi8vZ2l0aHViLmNvbS9ncmVna2gvZ3Jl
Z2toLWxpbnV4L3RyZWUvbWFzdGVyL3N0YWJsZS9jb25maWdzLg0KQWRkaXRpb25hbGx5LCBJ
IGhhdmUgbm93IHRlc3RlZCBzb21lIHJhbmRjb25maWcgYnVpbGRzLiBTdGlsbCwgdGhlcmUg
DQp3aWxsIG1vc3QgbGlrZWx5IGJlIGVkZ2UgY2FzZXMgdGhhdCB3ZSB3aWxsIG9ubHkgZGlz
Y292ZXIgb3ZlciB0aW1lLiANCkhvd2V2ZXIsIHdoaWxlIHRoZSB0b29sIGlzIGRlc2lnbmVk
IHRvIGV4aXQgd2l0aCBhIG5vbi16ZXJvIHN0YXR1cyBjb2RlIA0Kd2hlbiB1bmtub3duIGNv
bW1hbmRzIGFyZSBlbmNvdW50ZXJlZCwgaXQgc3RpbGwgcHJvZHVjZXMgYSB2YWxpZCBTQk9N
IA0KYmFzZWQgb24gdGhlIGluZm9ybWF0aW9uIGl0IHdhcyBhYmxlIHRvIGNvbGxlY3QuIFNv
LCBkZXNwaXRlIG1pc3NpbmcgDQpjb21tYW5kIHBhcnNlciBlcnJvcnMgbGlrZSB0aGVzZSwg
dGhlIHRvb2wgcmVtYWlucyB1c2FibGUuDQpUaGVyZSBpcyBhbHNvIHRoZSAtLWRvLW5vdC1m
YWlsLW9uLXVua25vd24tYnVpbGQtY29tbWFuZCBvcHRpb24gdG8gbG9nIA0KbWlzc2luZyBj
b21tYW5kIHBhcnNlciBlcnJvcnMgYXMgd2FybmluZ3MgYW5kIGV4aXQgd2l0aCBhIHplcm8g
c3RhdHVzIA0KY29kZS4gSSBoYXZlIGRpc2FibGVkIHRoaXMgYnkgZGVmYXVsdCwgdGhvdWdo
LCB0byBtYWtlIHBlb3BsZSBtb3JlIA0KbGlrZWx5IHRvIHJlcG9ydCBhbnkgbWlzc2luZyBj
b21tYW5kIHBhcnNlciBpc3N1ZXMgdGhleSBlbmNvdW50ZXIuDQoNCj4+IG1vZHVsZXMgYXMg
cm9vdCBub2RlcywgdGhlIHNjcmlwdCByZWNvbnN0cnVjdHMgdGhlIGRlcGVuZGVuY3kgZ3Jh
cGggdXANCj4+IHRvIHRoZSBvcmlnaW5hbCBzb3VyY2UgZmlsZXMuIEJ1aWxkIGRlcGVuZGVu
Y2llcyBhcmUgcHJpbWFyaWx5IGRlcml2ZWQgZnJvbQ0KPj4gdGhlIGAuY21kYCBmaWxlcyBn
ZW5lcmF0ZWQgYnkgS2J1aWxkLCB3aGljaCByZWNvcmQgdGhlIGZ1bGwgY29tbWFuZCB1c2Vk
DQo+PiB0byBidWlsZCBlYWNoIG91dHB1dCBmaWxlLg0KPj4NCj4+IEN1cnJlbnRseSwgdGhl
IHNjcmlwdCBvbmx5IHN1cHBvcnRzIHg4NiBhbmQgYXJtNjQgYXJjaGl0ZWN0dXJlcy4NCj4g
DQo+IFRoaXMgZG9lcyBub3QgYXBwZWFyIHRvIGJlIGNvZGlmaWVkIGFueXdoZXJlPyBJIGNh
biBydW4gdGhlIHNib20gdGFyZ2V0DQo+IHdoZW4gdGFyZ2V0aW5nIEFSQ0g9YXJtIGZvciBl
eGFtcGxlLCByZXN1bHRpbmcgaW46DQo+IA0KPiAgICB8IFtFUlJPUl0gRmlsZSAiL3NyYy9z
Y3JpcHRzL3Nib20vc2JvbS9jbWRfZ3JhcGgvc2F2ZWRjbWRfcGFyc2VyL3NhdmVkY21kX3Bh
cnNlci5weSIsIGxpbmUgMzMsIGluIGxvZ19lcnJvcl9vcl93YXJuaW5nDQo+ICAgIHwgU2tp
cHBlZCBwYXJzaW5nIGNvbW1hbmQgc2ggL3NyYy9hcmNoL2FybS90b29scy9zeXNjYWxsbnIu
c2ggL3NyYy9hcmNoL2FybS90b29scy9zeXNjYWxsLnRibCBhcmNoL2FybS9pbmNsdWRlL2dl
bmVyYXRlZC9hc20vdW5pc3RkLW5yLmggYmVjYXVzZSBubyBtYXRjaGluZyBwYXJzZXIgd2Fz
IGZvdW5kDQo+ICAgIHwgW0VSUk9SXSBGaWxlICIvc3JjL3NjcmlwdHMvc2JvbS9zYm9tL2Nt
ZF9ncmFwaC9zYXZlZGNtZF9wYXJzZXIvc2F2ZWRjbWRfcGFyc2VyLnB5IiwgbGluZSAzMywg
aW4gbG9nX2Vycm9yX29yX3dhcm5pbmcNCj4gICAgfCBTa2lwcGVkIHBhcnNpbmcgY29tbWFu
ZCAuL2FyY2gvYXJtL3Zkc28vdmRzb211bmdlIGFyY2gvYXJtL3Zkc28vdmRzby5zby5yYXcg
YXJjaC9hcm0vdmRzby92ZHNvLnNvLmRiZyBiZWNhdXNlIG5vIG1hdGNoaW5nIHBhcnNlciB3
YXMgZm91bmQNCj4gICAgfCBbV0FSTklOR10gQ291bGQgbm90IGluZmVyIHByaW1hcnkgcHVy
cG9zZSBmb3IgL3NyYy9hcmNoL2FybS90b29scy9tYWNoLXR5cGVzDQo+ICAgIHwgW1dBUk5J
TkddIENvdWxkIG5vdCBpbmZlciBwcmltYXJ5IHB1cnBvc2UgZm9yIC9idWlsZC9hcmNoL2Fy
bS9ib290L2NvbXByZXNzZWQvcGlnZ3lfZGF0YQ0KDQpZZXMsIHRoaXMgaXMgbm90IGNvZGlm
aWVkIGluIHRoZSBzZW5zZSB0aGF0IHRoZSB0b29sIGRvZXMgbm90IHJlc3RyaWN0IA0KZXhl
Y3V0aW9uIHRvIHNwZWNpZmljIGFyY2hpdGVjdHVyZXMuDQpTaG91bGQgaXQ/DQpBcyBzdGF0
ZWQgYWJvdmUsIHRoZSB0b29sIGlzIGRlc2lnbmVkIHRvIGNvbGxlY3QgYXMgbXVjaCBvZiB0
aGUgDQpkZXBlbmRlbmN5IGdyYXBoIGFzIHBvc3NpYmxlLiBGb3Igb3RoZXIgYXJjaGl0ZWN0
dXJlcywgaXQgYmVoYXZlcyB0aGUgDQpzYW1lIHdheSwgaS5lLiwgYSB2YWxpZCBTQk9NIGlz
IHByb2R1Y2VkLCBidXQgdGhlIG1pc3NpbmcgcGFyc2VyIGVycm9ycyANCmluZGljYXRlIHRo
YXQgdGhlIFNCT00gaXMgbm90IGNvbXBsZXRlLiBJIHRoaW5rIHRoaXMgYmVoYXZpb3IgaXMg
bW9yZSANCnVzZWZ1bCB0aGFuIGRlbnlpbmcgZXhlY3V0aW9uIGZvciBvdGhlciBhcmNoaXRl
Y3R1cmVzIGVudGlyZWx5LCBidXQgd2UgDQpjb3VsZCBjaGFuZ2UgdGhhdCBpZiB5b3UgdGhp
bmsgb3RoZXJ3aXNlLg0KDQo+IFNhc2hpa28gcG9pbnRzIG91dCBhIG51bWJlciBvZiB0aGlu
Z3MgYXMgd2VsbDoNCj4gDQo+ICAgIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MDQxMDIxMjI1NS45ODgzLTEtbHVpcy5hdWdlbnN0ZWluQHRuZ3RlY2guY29tDQoNCkNv
b2wsIHRoYW5rcy4gSSBkaWRuJ3Qga25vdyB0aGlzIGV4aXN0cy4NCkkgd29ya2VkIHRocm91
Z2ggdGhlIGNvbW1lbnRzIGFuZCB3aWxsIHByb3ZpZGUgYWNjb3JkaW5nIGNoYW5nZXMgaW4g
djYgDQpvZiB0aGUgcGF0Y2ggc2VyaWVzIHNvb24uDQoNCkJlc3QsDQpMdWlzDQoNCi0tIA0K
THVpcyBBdWdlbnN0ZWluICogbHVpcy5hdWdlbnN0ZWluQHRuZ3RlY2guY29tICogKzQ5MTUy
MjUyNzU3NjENClRORyBUZWNobm9sb2d5IENvbnN1bHRpbmcgR21iSCwgQmV0YS1TdHIuIDEz
LCA4NTc3NCBVbnRlcmbDtmhyaW5nDQpHZXNjaMOkZnRzZsO8aHJlcjogSGVucmlrIEtsYWdn
ZXMsIERyLiBSb2JlcnQgRGFobGtlLCBUaG9tYXMgRW5kcmVzDQpBdWZzaWNodHNyYXRzdm9y
c2l0emVuZGVyOiBNb3JpdHogUHJpbnoNClNpdHo6IFVudGVyZsO2aHJpbmcgKiBBbXRzZ2Vy
aWNodCBNw7xuY2hlbiAqIEhSQiAxMzUwODINCg0K

--------------0dbQz1xdPDsrIRlCYm7cpWvX--

--------------XhCcPIg8oBMdynTX8OlVbiVD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJzBrWn4qHw5a0jAXeVyKys3c+zQFAmn7W9AFAwAAAAAACgkQeVyKys3c+zQW
pg//Xp9Dk8u2qO1O816H2l7mX+ON7zi5UmYnFVKdvMUq5+WzjiIWcmykbjzY9Ra5CPhoCKjQMicS
a6ZUp0kOtIMBhSWzGqjUniRfFljp95OqAKza+PiskPD/CjpzBnpviXWV+6Ew+lnLPLOT2gz07YMq
nQLal118Nrc4E0wp9ywDLbdQ4/g/9OlB9ahzm0aRtPOv320Vw5bwRc4OVhBNDDH4KK/Bzk1gK/cm
jbDAMF2TKUVgdLB2K9Xxg0r1zJMvCiY3aq//HtV9nGewH/WuYXGIq08qEHWcpJYivXOCYHdKgZsL
KkFWidK/J/8l+64vOjqsM/yKwfOj66e4PexUbpxUmU5HKZ7kYkkohpIP6z6evGmAeTfRlG74f+od
YKJSckctN/j0iWJtpFp0xz7WdMVFcKabBrZDK/1O0qOKJ9dMv5cM+edxY/LL4p6WrnXCbqLuvgzd
tcu+K2ZVr6SIxBdJicnfPgr35OnEVbDuxuBz5qCSA67pXy795Y1lPgreST69uZa0/Z+LvbPAbzIm
vFhdZpueXODWmfJlSODH38ODzkJT6oDnbWLlEbTlt6sSTooX/WKFOaYCrJNThnb4ZglT6FCD5IGl
LJb6TaCAAzDdd/VNm6HWOyz91DUcTJoqj8NKL3lgR3jOzC8T2zn3ZJk4bBMWpyiUkhkWDRC3La4T
Bmg=
=ZNZA
-----END PGP SIGNATURE-----

--------------XhCcPIg8oBMdynTX8OlVbiVD--

