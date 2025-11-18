Return-Path: <linux-kbuild+bounces-9665-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF663C6A24C
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 15:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8EFAE4F246D
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 14:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC893AC39;
	Tue, 18 Nov 2025 14:50:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945C22D9EC7
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477436; cv=none; b=WR6/F4p8XgrpUuRl/zrAjLFMw7hpqC9ai4lp4Hxwaohc0nc9IjAILkvx2gW+Jt44saJD+93JT5L7U6yBr5LO3rTubJy2qOZMXfO64Byj4q0xoj0qPgZNyL6GZlPXOQMwOIed1i17yGNqNtFF+ftBz2ECTWQpV+6Q5KGi0DXO8aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477436; c=relaxed/simple;
	bh=rZkmb7zFofZfvDjvYK75CVHmmfpZ76lCH7TYpvuCr9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9GvP9p5s6+2IV9jDCfrajp3Y+frFA6xa5LclqDkwNIteCn6xLFJmInhkUR6RUWo/J2DZnP/QyAzCaHYliYLFV0UA2Qjv30KfLLrKefyj5Vt4jQumcnK/o+IPRUtqTTUoS7RKHLkIOYv3KLiFWkOnzlYBVtd6N5iklIfL29p+5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d9n2N6Btgz9sSL;
	Tue, 18 Nov 2025 15:25:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycg5OWnpwCW8; Tue, 18 Nov 2025 15:25:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d9n2N5KGnz9sRg;
	Tue, 18 Nov 2025 15:25:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 90FBD8B769;
	Tue, 18 Nov 2025 15:25:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Qafumh8Gab3i; Tue, 18 Nov 2025 15:25:16 +0100 (CET)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DCE948B763;
	Tue, 18 Nov 2025 15:25:15 +0100 (CET)
Message-ID: <748c8f8c-23ed-4589-9521-a948cce40922@csgroup.eu>
Date: Tue, 18 Nov 2025 15:25:14 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] modpost: amend ppc symnames for -Os build
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20251118.131735.802732108462696577.rene@exactco.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251118.131735.802732108462696577.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkxlIDE4LzExLzIwMjUgw6AgMTM6MTcsIFJlbsOpIFJlYmUgYSDDqWNyaXTCoDoN
Cj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgcmVuZUBl
eGFjdGNvLmRlLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4g
QnVpbGRpbmcgYSBzaXplIG9wdGltaXplZCBwcGMga2VybmVsLCBnY2MgZW1taXRzIG1vcmUg
c3ltYm9scyB0aGFuDQo+IGN1cnJlbnRseSBhbGxvd2VkIGxpc3RlZCBpbiBzY3JpcHRzL21v
ZC9tb2Rwb3N0LmMuIEFkZCB0byBmaXg6DQoNCllvdSBzaG91bGQgc2F5IHdoZW4gdGhlIHBy
b2JsZW0gc3RhcnRlZCB0byBoYXBwZW4sIGFuZCB3aGF0IHRob3NlIA0KZnVuY3Rpb25zIGFy
ZSBzdXBwb3NlZCB0byBzYXZlIGFuZCByZXN0b3JlLg0KDQpBcyBhbiBleGVtcGxlIHNlZSBj
b21taXQgOGZlOWM5M2U3NDUzICgicG93ZXJwYzogQWRkIHZyIHNhdmUvcmVzdG9yZSANCmZ1
bmN0aW9ucyIpDQoNCkFsc28gY29uZmlybSBpdCBpcyBvbmx5IG5lZWRlZCBvbiBwb3dlcnBj
NjQsIGlmIHNvIG1ha2UgaXQgY2xlYXIgaW4gdGhlIA0KY29tbWl0IG1lc3NhZ2UuDQoNCkNo
cmlzdG9waGUNCg0KDQo+IA0KPiBNT0RQT1NUIE1vZHVsZS5zeW12ZXJzDQo+IEVSUk9SOiBt
b2Rwb3N0OiAiX3Jlc3RmcHJfMjAiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHUua29dIHVuZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJfcmVzdGZwcl8yNiIgW2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5rb10gdW5kZWZpbmVkIQ0KPiBFUlJP
UjogbW9kcG9zdDogIl9yZXN0ZnByXzIyIiBbZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmtvXSB1bmRlZmluZWQhDQo+IEVSUk9SOiBtb2Rwb3N0OiAiX3NhdmVncHIxXzI3
IiBbZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhDQo+
IEVSUk9SOiBtb2Rwb3N0OiAiX3NhdmVncHIxXzI1IiBbZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhDQo+IEVSUk9SOiBtb2Rwb3N0OiAiX3Jlc3Rm
cHJfMjgiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua29dIHVuZGVmaW5l
ZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJfc2F2ZWdwcjFfMjkiIFtkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHUua29dIHVuZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJf
c2F2ZWZwcl8yMCIgW2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5rb10gdW5k
ZWZpbmVkIQ0KPiBFUlJPUjogbW9kcG9zdDogIl9zYXZlZnByXzIyIiBbZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhDQo+IEVSUk9SOiBtb2Rwb3N0
OiAiX3Jlc3RmcHJfMTUiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua29d
IHVuZGVmaW5lZCENCj4gV0FSTklORzogbW9kcG9zdDogc3VwcHJlc3NlZCA1NiB1bnJlc29s
dmVkIHN5bWJvbCB3YXJuaW5ncyBiZWNhdXNlIHRoZXJlIHdlcmUgdG9vIG1hbnkpDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBSZW7DqSBSZWJlIDxyZW5lQGV4YWN0Y28uZGU+DQo+IA0KPiAt
LS0NCj4gICBzY3JpcHRzL21vZC9tb2Rwb3N0LmMgfCA0ICsrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2Qv
bW9kcG9zdC5jIGIvc2NyaXB0cy9tb2QvbW9kcG9zdC5jDQo+IGluZGV4IDQ3YzhhYTJhNjkz
OS4uMTMzZGZhMTYzMDhhIDEwMDY0NA0KPiAtLS0gYS9zY3JpcHRzL21vZC9tb2Rwb3N0LmMN
Cj4gKysrIGIvc2NyaXB0cy9tb2QvbW9kcG9zdC5jDQo+IEBAIC02MDIsNiArNjAyLDEwIEBA
IHN0YXRpYyBpbnQgaWdub3JlX3VuZGVmX3N5bWJvbChzdHJ1Y3QgZWxmX2luZm8gKmluZm8s
IGNvbnN0IGNoYXIgKnN5bW5hbWUpDQo+ICAgICAgICAgICAgICAgICAgLyogU3BlY2lhbCBy
ZWdpc3RlciBmdW5jdGlvbiBsaW5rZWQgb24gYWxsIG1vZHVsZXMgZHVyaW5nIGZpbmFsIGxp
bmsgb2YgLmtvICovDQo+ICAgICAgICAgICAgICAgICAgaWYgKHN0cnN0YXJ0cyhzeW1uYW1l
LCAiX3Jlc3RncHIwXyIpIHx8DQo+ICAgICAgICAgICAgICAgICAgICAgIHN0cnN0YXJ0cyhz
eW1uYW1lLCAiX3NhdmVncHIwXyIpIHx8DQo+ICsgICAgICAgICAgICAgICAgICAgc3Ryc3Rh
cnRzKHN5bW5hbWUsICJfcmVzdGdwcjFfIikgfHwNCj4gKyAgICAgICAgICAgICAgICAgICBz
dHJzdGFydHMoc3ltbmFtZSwgIl9zYXZlZ3ByMV8iKSB8fA0KPiArICAgICAgICAgICAgICAg
ICAgIHN0cnN0YXJ0cyhzeW1uYW1lLCAiX3Jlc3RmcHJfIikgfHwNCj4gKyAgICAgICAgICAg
ICAgICAgICBzdHJzdGFydHMoc3ltbmFtZSwgIl9zYXZlZnByXyIpIHx8DQo+ICAgICAgICAg
ICAgICAgICAgICAgIHN0cnN0YXJ0cyhzeW1uYW1lLCAiX3Jlc3R2cl8iKSB8fA0KPiAgICAg
ICAgICAgICAgICAgICAgICBzdHJzdGFydHMoc3ltbmFtZSwgIl9zYXZldnJfIikgfHwNCj4g
ICAgICAgICAgICAgICAgICAgICAgc3RyY21wKHN5bW5hbWUsICIuVE9DLiIpID09IDApDQo+
IC0tDQo+IDIuNDYuMA0KPiANCj4gLS0NCj4gUmVuw6kgUmViZSwgRXhhY3RDT0RFIEdtYkgs
IEJlcmxpbiwgR2VybWFueQ0KPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9u
Lm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZleGFjdGNvLmRlJTJGJmRhdGE9MDUl
N0MwMiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdDYmRmODFiZWNmZjc2NGIw
MGQ4YTcwOGRlMjY5YzcxNzYlN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3
QzAlN0MwJTdDNjM4OTkwNjUxOTU4NjUwMzk3JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5
SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6
TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDNjAwMDAlN0MlN0MlN0Mm
c2RhdGE9MkE0aWxxUXUlMkJOeGV5Y0JRVU1GSU42R1ZXM3g0amt3anBJd3dFelZhZzV3JTNE
JnJlc2VydmVkPTAg4oCiIGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnQybGludXguY29tJTJGJmRhdGE9MDUlN0Mw
MiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdDYmRmODFiZWNmZjc2NGIwMGQ4
YTcwOGRlMjY5YzcxNzYlN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3QzAl
N0MwJTdDNjM4OTkwNjUxOTU4Njc2ODI4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZi
WEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJ
c0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDNjAwMDAlN0MlN0MlN0Mmc2Rh
dGE9NnRvRnhjbnQxNk9XNk5MT0hCSkVBTjBERnkyVVdOWVY3R3haNWhxcHdsUSUzRCZyZXNl
cnZlZD0wIOKAoiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXRyZW9uLmNvbSUyRnJlbmVyZWJlJmRhdGE9MDUl
N0MwMiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdDYmRmODFiZWNmZjc2NGIw
MGQ4YTcwOGRlMjY5YzcxNzYlN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3
QzAlN0MwJTdDNjM4OTkwNjUxOTU4NjkzNDgyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5
SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6
TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDNjAwMDAlN0MlN0MlN0Mm
c2RhdGE9dTFqNU9HQ2JWd2NFRHdsZncwQ1poVEU3NVN5JTJCSmlUNFZBM09QZVNlYlg0JTNE
JnJlc2VydmVkPTANCg0K

