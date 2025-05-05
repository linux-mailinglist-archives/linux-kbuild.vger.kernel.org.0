Return-Path: <linux-kbuild+bounces-6932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91350AA9161
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 12:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB3C517207B
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8261D799D;
	Mon,  5 May 2025 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="kGbTJnuo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pGc2eNKb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB77335957;
	Mon,  5 May 2025 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746442324; cv=none; b=Vb3ReWHHOS318xtmGDcakr8S5RLoWWRBLYySGEQoCvS8j6duks/U58SBZwBS97LqVM1/IW51t9JWnDmayG60JirOBXLk2zm4RlwNF5gwmj0wWFBGSdwOH244dqM7wGfaIbK/GUffLp0EsOseaa5z05TMdklfrWM2aKKVxpHFy5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746442324; c=relaxed/simple;
	bh=RK1eyP2ZljTCRkJ4RVJkl3vxW3ohe9Sry8gpdIqxQNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMxRnR5ehLbWuAoT5MUZEtwnnev2DI4TVpJukbPewSuUNwHQPzP25ao7iV6kHPwVnPTHTa93wouyu0M92jiJSrP52n5zmqHNxG8ki9KGKOuO5lt2SAF2tXOkxx1j6jh5fSbiM3OA4QZWk9/qtgDtuzEM84NIRnRHvGSYOyoPQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=kGbTJnuo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pGc2eNKb; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A2B4A1140214;
	Mon,  5 May 2025 06:52:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 05 May 2025 06:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1746442320; x=1746528720; bh=cs1MbfEG74
	eSURrPQeGOX9BwA20sO8ioD/mt2r4S4Vo=; b=kGbTJnuoQdk+OGWOWawaO16bDK
	iR+PhEIm2qIsFMZ8vhebmr1bJvaeaQ5OJcy67U3g0LV2fHidVOtzfcbWpkXkLmkd
	qgKlsXFhLbGJ6fGJbgPnQbvgp0l6K+1tWT9UNVj86NVx6gN0g+CAQfaNNwoAY4Jm
	PMZu2lwvTXwHlaA2y9duS+iVO1pa1gyjwCeKizMTP3vXRDM5AyDIGXH6IDdCHVUz
	un9cs5lQVDOnqT9c9QVZWs2o1DM0DdtnEbchOCfX7Wd+QtHTw7Zebi0c2IY9Fp8C
	z1xFsZBIROj6sGW636ooT14RTLZrsXXDTdb3Xqe9t01pBVo3CTImtAQZSh7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746442320; x=1746528720; bh=cs1MbfEG74eSURrPQeGOX9BwA20sO8ioD/m
	t2r4S4Vo=; b=pGc2eNKbd22C+j2X3sT2zQ6SRvA+/5ToJesDx6+aC2q82syy/0O
	nf2I9iyJBn0Xv2gfaTN7DlfBjdg3CKVTbFnOFYZwD/KSC0IaFGfGZPq1DEzLmJzq
	glC/6g8PeVVVqSnmhgYIgscFse8xV9GPaiulpEXNgljJDyYd4KA0LG6VsjHNSDqP
	M+olY4PXybEwucsbPcGlSXAd71aQ/9A7dqb39sTxGMLZoDuGs/yDpL0Qv4kbxFti
	kqQChsgex43FLGaWq0gJfqX3wvLjhVFneSTW+wR+qZH+a+R9adZm7RpWKy8544SH
	+Au2bjRwbjqYmHBqGXkFe5GHmfQfnf6EB2Q==
X-ME-Sender: <xms:T5gYaDETK9SSnzP82xIlq0JytcF2J-lJNPSv4Ne5b28YsDMumjjgZg>
    <xme:T5gYaAVOt4AZJpY8vWhxLDHJ6akusEYODCz0aZ_JA948RrbyUBnkbVnYtdA54qcnU
    Q4cSLIxHAMUsq5nX0g>
X-ME-Received: <xmr:T5gYaFIOIbjIICGT__GVmLu87PfJSbmXryn6x-GRasWGbW32B3Z8yTQk__6r4IU9nfMUXTfVtFyiw-L3Sr-1C5GFrPox6nC0DMY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesmhdtreertddt
    jeenucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqe
    enucggtffrrghtthgvrhhnpefhffekjeevveejjefgfeetuddtffdvueetudekjeeltdeu
    vefhgfektdevjedvteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddutddrshhone
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgr
    nhhnrghurdhnvghtpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgt
    phhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehtii
    himhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepshhtrggslhgvsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:T5gYaBExbK0PF4LYmLrqkf185okQnS-AKZTHfm35HHdIwvRXlvoknQ>
    <xmx:T5gYaJXuFUFS6aRn5eplOSIzZoDIIdMCjKe8-kWRRH7DQSzEbKN0zA>
    <xmx:T5gYaMMP8xL4_4qa-1iMTA0M0IAYSGCsfk-LeTV9eTn_Uq57SO2DBQ>
    <xmx:T5gYaI15CIahDnBBdArF6Zh6vtIRik1n-FUvo6XjHfwxysTorgvSAA>
    <xmx:UJgYaLWJkSkpoQpTZVGp19KOjTwuGL4L4khK0kCUDV1zxOYgx-2_Ho7w>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 May 2025 06:51:59 -0400 (EDT)
Date: Mon, 5 May 2025 12:51:56 +0200
From: Janne Grunau <j@jannau.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: FAILED: patch "[PATCH] drm: Select DRM_KMS_HELPER from" failed
 to apply to 6.6-stable tree
Message-ID: <2f79e1ab-5a22-4617-8bec-d2122194964f@app.fastmail.com>
References: <2025050504-placate-iodize-9693@gregkh>
 <7cb8c3e1-52c3-498f-92af-b8b61a2ce8e8@app.fastmail.com>
 <2025050530-monotype-eligibly-e5b1@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mI5u5h1lqTVs7IFY"
Content-Disposition: inline
In-Reply-To: <2025050530-monotype-eligibly-e5b1@gregkh>
X-ThreadId: T3ebf7c1616c89bf4


--mI5u5h1lqTVs7IFY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hej,

On Mon, May 5, 2025, at 10:49, Greg Kroah-Hartman wrote:
> On Mon, May 05, 2025 at 10:33:49AM +0200, Janne Grunau wrote:
>> Hej,
>> 
>> On Mon, May 5, 2025, at 09:53, gregkh@linuxfoundation.org wrote:
>> > The patch below does not apply to the 6.6-stable tree. If someone
>> > wants it applied there, or to any other stable or longterm tree, then
>> > please email the backport, including the original git commit id to
>> > <stable@vger.kernel.org>.
>> >
>> > To reproduce the conflict and resubmit, you may use the following
>> > commands:
>> >
>> > git fetch https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/ linux-6.6.y
>> > git checkout FETCH_HEAD
>> > git cherry-pick -x 32dce6b1949a696dc7abddc04de8cbe35c260217
>> 
>> This works for me without conflicts. Are there git configs which might
>> influence this? The only noticeable thing is that the position of the
>> DRM_DEBUG_DP_MST_TOPOLOGY_REFS entry shifted 82 lines down. I looked
>> at the history of drivers/gpu/drm/Kconfig and the config
>> DRM_DEBUG_DP_MST_TOPOLOGY_REFS block hasn't changed since v5.10. So I
>> would expect the cherry-pick to work.
>
> It applies cleanly, but breaks the build badly.  Try it and see :)

Indeed. The issue is caused by turning CONFIG_DRM_KMS_HELPER from 'm'
to 'y' while leaving CONFIG_DRM as 'm'. This is clearly broken and not intended.
It's exactly what Documentation/kbuild/kconfig-language.rst warns about. OTOH
it also warns about using both 'depends on' and 'select' on the same symbol
which blows up here.
I don't see which change between in v6.6..v6.12 for scripts/kconfig could have
changed this.

Using "select DRM_KMS_HELPER if DRM" fixes the linux-6.6.y build. I only
discovered this as possible solution from the commit message of commit
77a92660d8fe ("kconfig: remove wrong expr_trans_bool()").

CC-ing kconfig maintainer for clarification if "select DRM_KMS_HELPER if
DRM" is a valid solution for this issue. Commit causing issue replicated below
for context.

thanks,
Janne

--mI5u5h1lqTVs7IFY
Content-Type: text/x-patch; charset=iso-8859-1;
	name="0001-drm-Select-DRM_KMS_HELPER-from-DRM_DEBUG_DP_MST_TOPO.patch"
Content-Disposition: inline;
	filename="0001-drm-Select-DRM_KMS_HELPER-from-DRM_DEBUG_DP_MST_TOPO.patch"
Content-Transfer-Encoding: base64

RnJvbSAzMmRjZTZiMTk0OWE2OTZkYzdhYmRkYzA0ZGU4Y2JlMzVjMjYwMjE3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogSmFubmUgR3J1bmF1IDxqQGphbm5hdS5uZXQ+DQpE
YXRlOiBUdWUsIDQgTWFyIDIwMjUgMjA6MTI6MTQgKzAxMDANClN1YmplY3Q6IFtQQVRDSCAx
LzFdIGRybTogU2VsZWN0IERSTV9LTVNfSEVMUEVSIGZyb20NCiBEUk1fREVCVUdfRFBfTVNU
X1RPUE9MT0dZX1JFRlMNCg0KVXNpbmcgImRlcGVuZHMgb24iIGFuZCAic2VsZWN0IiBmb3Ig
dGhlIHNhbWUgS2NvbmZpZyBzeW1ib2wgaXMga25vd24gdG8NCmNhdXNlIGNpcmN1bGFyIGRl
cGVuZGVuY2llcyAoY21wLiAiS2NvbmZpZyByZWN1cnNpdmUgZGVwZW5kZW5jeQ0KbGltaXRh
dGlvbnMiIGluIERvY3VtZW50YXRpb24va2J1aWxkL2tjb25maWctbGFuZ3VhZ2UucnN0Lg0K
RFJNIGRyaXZlcnMgYXJlIHNlbGVjdGluZyBkcm0gaGVscGVycyBzbyBkbyB0aGUgc2FtZSBm
b3INCkRSTV9ERUJVR19EUF9NU1RfVE9QT0xPR1lfUkVGUy4NCkZpeGVzIGZvbGxvd2luZyBj
aXJjdWxhciBkZXBlbmRlbmN5IHJlcG9ydGVkIG9uIHg4NiBmb3IgdGhlIGRvd25zdHJlYW0N
CkFzYWhpIExpbnV4IHRyZWU6DQoNCmVycm9yOiByZWN1cnNpdmUgZGVwZW5kZW5jeSBkZXRl
Y3RlZCENCiAgc3ltYm9sIERSTV9LTVNfSEVMUEVSIGlzIHNlbGVjdGVkIGJ5IERSTV9HRU1f
U0hNRU1fSEVMUEVSDQogIHN5bWJvbCBEUk1fR0VNX1NITUVNX0hFTFBFUiBpcyBzZWxlY3Rl
ZCBieSBSVVNUX0RSTV9HRU1fU0hNRU1fSEVMUEVSDQogIHN5bWJvbCBSVVNUX0RSTV9HRU1f
U0hNRU1fSEVMUEVSIGlzIHNlbGVjdGVkIGJ5IERSTV9BU0FISQ0KICBzeW1ib2wgRFJNX0FT
QUhJIGRlcGVuZHMgb24gUlVTVA0KICBzeW1ib2wgUlVTVCBkZXBlbmRzIG9uIENBTExfUEFE
RElORw0KICBzeW1ib2wgQ0FMTF9QQURESU5HIGRlcGVuZHMgb24gT0JKVE9PTA0KICBzeW1i
b2wgT0JKVE9PTCBpcyBzZWxlY3RlZCBieSBTVEFDS19WQUxJREFUSU9ODQogIHN5bWJvbCBT
VEFDS19WQUxJREFUSU9OIGRlcGVuZHMgb24gVU5XSU5ERVJfRlJBTUVfUE9JTlRFUg0KICBz
eW1ib2wgVU5XSU5ERVJfRlJBTUVfUE9JTlRFUiBpcyBwYXJ0IG9mIGNob2ljZSBibG9jayBh
dCBhcmNoL3g4Ni9LY29uZmlnLmRlYnVnOjIyNA0KICBzeW1ib2wgPGNob2ljZT4gdW5rbm93
biBpcyB2aXNpYmxlIGRlcGVuZGluZyBvbiBVTldJTkRFUl9HVUVTUw0KICBzeW1ib2wgVU5X
SU5ERVJfR1VFU1MgcHJvbXB0IGlzIHZpc2libGUgZGVwZW5kaW5nIG9uIFNUQUNLREVQT1QN
CiAgc3ltYm9sIFNUQUNLREVQT1QgaXMgc2VsZWN0ZWQgYnkgRFJNX0RFQlVHX0RQX01TVF9U
T1BPTE9HWV9SRUZTDQogIHN5bWJvbCBEUk1fREVCVUdfRFBfTVNUX1RPUE9MT0dZX1JFRlMg
ZGVwZW5kcyBvbiBEUk1fS01TX0hFTFBFUg0KDQpGaXhlczogMTJhMjgwYzcyODY4ICgiZHJt
L2RwX21zdDogQWRkIHRvcG9sb2d5IHJlZiBoaXN0b3J5IHRyYWNraW5nIGZvciBkZWJ1Z2dp
bmciKQ0KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNClNpZ25lZC1vZmYtYnk6IEphbm5l
IEdydW5hdSA8akBqYW5uYXUubmV0Pg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MDMwNC1kcm1fZGVidWdfZHBfbXN0X3RvcG9fa2NvbmZpZy12MS0xLWUxNmZkMTUyZjI1
OEBqYW5uYXUubmV0DQpTaWduZWQtb2ZmLWJ5OiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3Nh
QHJvc2VuendlaWcuaW8+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyB8IDIgKy0N
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tj
b25maWcNCmluZGV4IDJjYmEyYjZlYmUxYy4uZjAxOTI1ZWQ4MTc2IDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmln
DQpAQCAtMTg4LDcgKzE4OCw3IEBAIGNvbmZpZyBEUk1fREVCVUdfRFBfTVNUX1RPUE9MT0dZ
X1JFRlMNCiAgICAgICAgIGJvb2wgIkVuYWJsZSByZWZjb3VudCBiYWNrdHJhY2UgaGlzdG9y
eSBpbiB0aGUgRFAgTVNUIGhlbHBlcnMiDQogCWRlcGVuZHMgb24gU1RBQ0tUUkFDRV9TVVBQ
T1JUDQogICAgICAgICBzZWxlY3QgU1RBQ0tERVBPVA0KLSAgICAgICAgZGVwZW5kcyBvbiBE
Uk1fS01TX0hFTFBFUg0KKyAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSDQogICAgICAg
ICBkZXBlbmRzIG9uIERFQlVHX0tFUk5FTA0KICAgICAgICAgZGVwZW5kcyBvbiBFWFBFUlQN
CiAgICAgICAgIGhlbHANCi0tIA0KMi40OS4wDQoNCg==

--mI5u5h1lqTVs7IFY--

