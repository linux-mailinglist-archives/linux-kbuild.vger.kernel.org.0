Return-Path: <linux-kbuild+bounces-10420-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAC9CF5076
	for <lists+linux-kbuild@lfdr.de>; Mon, 05 Jan 2026 18:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 994E13007676
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jan 2026 17:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030263054D0;
	Mon,  5 Jan 2026 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="el1pXq7q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from earwig.ash.relay.mailchannels.net (earwig.ash.relay.mailchannels.net [23.83.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4882E28750C;
	Mon,  5 Jan 2026 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767634871; cv=pass; b=pETPLzI/WlpP1fUp81y0+x9uuAq8ha/bqvuT4FNBgIg5QUGrgf0dpYC0O9vrymGZCSeUZAc6G86L2TJ3KokVwTWEz+z0+EsxJx7gqcsDoAZRE+gLk7E2nIXKFHVo8zXNwEK7yc+agg93Uc4pUoUNjiyYkgyDcdGDBj7aWKId1w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767634871; c=relaxed/simple;
	bh=afR4gIGQqWhtKSR1X6mRLeY3XvSaFBMOEvA0r09mFAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en7uGfq1YhrFE2EZt46YGlJbZco0oONq62e0xnHFd7Hpdg+4zZlJwOruLzhDpoEYV8GDf/vfVM1nL6RBlPkXPJkxxGyucgEP0M62/JYk9uteHbfgplM7DmZRPVA4zaS1QLSQ3GRTVdUYMinV2OH3QDK4agcDDPZ5tdAvM0j2Vm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gotplt.org; spf=pass smtp.mailfrom=gotplt.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=el1pXq7q; arc=pass smtp.client-ip=23.83.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gotplt.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 83EEB1222CA;
	Mon, 05 Jan 2026 10:58:33 +0000 (UTC)
Received: from pdx1-sub0-mail-a207.dreamhost.com (100-112-117-24.trex-nlb.outbound.svc.cluster.local [100.112.117.24])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id C7EDB12141B;
	Mon, 05 Jan 2026 10:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1767610710;
	b=yDaTHnunXJtHF1PfK/rKts/kNyY9OSz1ehYlnrSWv2j0FJ7+SY1cBIJbOQKNBLTFX+m+Xj
	YP0WAAEOlUVbLIdGGBEfFmgPsAOK4f29csQFaA0AnZ2MN02m8E/lvxBn/CMK0liqh61lty
	Q24mK6w9H0wumSr2I2p2Kpsd00i1pq3+V02VzF+ZOol1sAIudCo5tvE2e70mDUhGaBomva
	SAPpk91dh7ERVFIZjbUkXzLICteXfypeV1/0IRGePPxCnOkqT69OL0JZ0GYYx12+HLKveB
	13ye+z+KIXgupqCreSfaoMJQUAa4V/GETevGF1JYClfAYpJxp6n04ID7EnB+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1767610710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=cNmAC3AVapO1Aew1Ac2I+U6usxxH3KR/0xXLpeGV+Do=;
	b=IECAN491GkOpwdje5h1E80O+A9zqT7fjr2aWt3pHSd4etSy8RbCIbmSPQcpnB/R6Y7dlsC
	35CiPU4mXGyH6hNwaNcgevNJ7YosJ4sTQJWJKQEda7QZRu4cCBKfjnuF6Cs3PGDYLTYDzb
	uGuqo1gc+zrI1ZccLx+ooeS9DoBe6FMYLOSLsZf8lE9b5McI8e9U93RsiaD2WfAJu0OFb2
	JaOQoDjpeY4evi+1GhyrZe6qV554cZG1sN93XYm7MXgsEfojG4cJGZzfZm2OLP6havDnWp
	Q3eozlhl+S2EPc21imUraZcvQICdPKDH7i1R21ldONZ3HGT7pdaDkJvkZXbQWw==
ARC-Authentication-Results: i=1;
	rspamd-85db7f4c96-t7gj4;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Tank-Battle: 5df69bd121c8e0dc_1767610713071_630209668
X-MC-Loop-Signature: 1767610713071:3562879293
X-MC-Ingress-Time: 1767610713070
Received: from pdx1-sub0-mail-a207.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.112.117.24 (trex/7.1.3);
	Mon, 05 Jan 2026 10:58:33 +0000
Received: from [192.168.0.135] (unknown [38.23.181.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a207.dreamhost.com (Postfix) with ESMTPSA id 4dlB9d0Rx9z2D;
	Mon,  5 Jan 2026 02:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1767610710;
	bh=cNmAC3AVapO1Aew1Ac2I+U6usxxH3KR/0xXLpeGV+Do=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=el1pXq7qeqARVsRQgySVTc8sbPJZjNYilZVwzUIguE51RPtjZu0tjbqIsq+lAm/Fh
	 MMk6tA5Db0T4g2wvhKp8acteRO/d2R9/eIjpv90MyHwaoVYwnHB8GuNEaQAwvQetVe
	 KqnoRvM8xF65YvdaXssbc2aplhU6H0+X4dk46Kp0hX46ykF2pPqi3MCeVs2CQ1ieGX
	 8uj35Et1QZcvQ1BF1Xa8zbfRn62UBnB4H7S7G9F4UPK8JlRHPEPImlHSUhiRWHHM3F
	 M5e1eZh7xmobNQiYDhti2Mo2Dt1r+y318qQvTYgQgGdxLXqJ0JDS2QTNP7VSWwq/A/
	 BXhmZ35ZIC5Lg==
Message-ID: <68d83837-cc78-43d0-a084-d783b9de83e9@gotplt.org>
Date: Mon, 5 Jan 2026 05:58:27 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: Add -fdiagnostics-show-context to
 bindgen_skip_c_flags
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 stable@vger.kernel.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 clang-built-linux <llvm@lists.linux.dev>
References: <20251217150010.665153-1-siddhesh@gotplt.org>
 <20251217224050.1186896-1-siddhesh@gotplt.org>
 <CANiq72n0BtCxAsXOaNnSMWC-aW2bNTPzN=4VGb+ic8YA6jhsAw@mail.gmail.com>
Content-Language: en-US
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <CANiq72n0BtCxAsXOaNnSMWC-aW2bNTPzN=4VGb+ic8YA6jhsAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-04 15:53, Miguel Ojeda wrote:
> On Wed, Dec 17, 2025 at 11:41 PM Siddhesh Poyarekar <siddhesh@gotplt.org> wrote:
>>
>> but clang does not have this option, so avoid passing it to bindgen.
> 
> This looks indeed correct, although it is not yet in a released GCC
> (testing quickly in Compiler Explorer, GCC 15.2 doesn't have it, but
> GCC trunk has).

Yes, sorry I didn't mention that in my commit message; it's mentioned in 
Kees' commit message (7454048db27d6).

> I will apply it -- Cc'ing ClangBuiltLinux and Kbuild so that they are aware.

Thank you!

Sid

