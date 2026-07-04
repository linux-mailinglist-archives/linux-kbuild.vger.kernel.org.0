Return-Path: <linux-kbuild+bounces-13933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hHTVK20JSWp8xwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13933-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Jul 2026 15:23:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA07707B28
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Jul 2026 15:23:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dY4mC5da;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13933-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13933-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7942301177B
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jul 2026 13:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFA43A8732;
	Sat,  4 Jul 2026 13:23:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B9F3A380C
	for <linux-kbuild@vger.kernel.org>; Sat,  4 Jul 2026 13:23:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783171433; cv=none; b=eRxyLRopx01PXKLK/EprZhEqAZ+bhB1FJiD2DntUd8iH/OVV1ySyTevjST+1pfE+3ECzD9TeKtEzMnD08HQgfZDm2h2NaVzgvA7RnsrdCSpF7rF5fUwfQigmYHPmp5VYrN42sG+5eCOOpZI/vGo3RciPNRJS8zCpiWdfYnzCyl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783171433; c=relaxed/simple;
	bh=N1CcU0AWdwex01N/1zK6qktwhq0E3Pj15yq8zzSGzzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzA+5zm1KqLHAyk36gBQDFbNAxgS6EoSZ/tXmeQtYBjd1jON1/Fs+vOOUziISa1UpKIahMOVhMhAiTTzpax5PRuovLPM0MkmvL3bTmCkJHYQOE+XJnA0WWsCAYDZxI60zAuaAkh9WMw4XVRUa8ZY+4F55U0/g7e/CuLc0hbywYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dY4mC5da; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4745492ed3aso959453f8f.1
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Jul 2026 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783171431; x=1783776231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy8JgD1t44BZahTr2SwVw+yYZzU4iR+NXyCIO+T8rP8=;
        b=dY4mC5dalNOz9wy9CVeqd/V9yy/dTfQxpzyaMW6jvgu30UtIKpRPzmJlcwaksP1e+r
         SEvXYrfwpcJh5nWXTUQlVWvEpeAJSg5Y1yPRCG2PWmnFqnMzQAHa7IHF01iu034aYU8y
         mr7FnujQrWaD3SQfJBVqPxjSKaf7xya2OFFkldf06znBRj95P+0q6djqU02lR2RbOx1Y
         ShRFVMXSOaoEPst6yC/boafytxWaUWNpRQDdabzmoTER7WClJrbWejyj0RZlmeIKeQaD
         107QJLoqQQDZYBOxaEyGg70Q+pxBu5LWUDQNlBM19P864sQsI8QfujpsF+NitpYH2t9X
         mVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783171431; x=1783776231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy8JgD1t44BZahTr2SwVw+yYZzU4iR+NXyCIO+T8rP8=;
        b=b3TRyoydETE17i+9TbjwvFGf+NNm+1ccon1xtf/wWvl10CGqUKMLcPWRpP0bzgdjju
         mPhuWFfZKsMfgi2yR2AEjzHI9nqOlrxP2Cjv/t96EMv3ApcuiTP2PWE/XkR2NhyXvjr8
         aZ7y6dXEn03UiQjEYjVdA+XYS3a824Ki1E5xVs/YYiZygCF9IImCnYX4clU99RPEdJ2A
         +OIFfpzRHpbxVeuqIyMJKkwh4awNTx9nAlRwbBZFHNaVjLyZ5h94xTm1iVRNPQsDqLW1
         t+Bd6b171rTv6jIga1CNrQ8fe2/ARQrIBhXPWug1Gr+T1qDluELBfOULV53t43qgj3dc
         r80Q==
X-Gm-Message-State: AOJu0YxKrLaH338ze6kBqoEdtAZYuVCpvQn/4JI42ui92lE5zjApPril
	ic/d8DDmA7gxXSiEdeulXfDuBAoCCOKU4FzkRODYxjnDcElkfv9Yn5De
X-Gm-Gg: AfdE7ckxgqqOHP6qDQ/9LnGgDahhb1aT8s6hObQllo+qh3cQwL4qBxTTNaLocnr3Y+n
	6NWD+tiBFPloSSoqnJxwUYC0V2CLTUP2uGDqirTr5u8KsdTWCi6zShYU9iCSERXJRc9jxncyjyO
	460w4yhcMdU1eVHpyfdKRvXvh8qqUgYjKdcynpxjo7f4DI/zKCfveu5v8TDvkFybdHa0T5POwfn
	4UokpXenA6EerTATmNmgHsvbNM0VK2hHlkTeJDyvvIi0qzxTX05Png3sqnpaV3Vbhs/UA6tBBzh
	m4VFgxBe+ZAHwL2hh5d3VMBfq8buY1mw9XTX3EAvSUGNRLRELHqRni/f3y/cjIPfXRtfTJG4fRV
	bAlSbOvYoT3rniNaubY0SJS1s5WRWYUtiedmb+0pNOhKVYNqIjS9nv8ZwvNzgIgAHddOIGTPn0t
	mk932IH9K1IJpRHdA4QgYdbGFpdIsxOEyqJScG2QBwN5EIxGrqGjx6sg+xOuWJw0ECLTRHvUAXK
	64XwuxR
X-Received: by 2002:adf:f288:0:b0:475:f100:360d with SMTP id ffacd0b85a97d-47aac5e3774mr2995573f8f.60.1783171430438;
        Sat, 04 Jul 2026 06:23:50 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm8234031f8f.27.2026.07.04.06.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 06:23:49 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <955bf67f-309d-45d4-ac0d-2f53577aa18e@gmail.com>
Date: Sat, 4 Jul 2026 14:23:48 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: Support conditional deps using "depends on X
 if Y"
To: Graham Roff <grahamr@qti.qualcomm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Arnd Bergmann <arnd@arndb.de>, jani.nikula@linux.intel.com,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13933-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:grahamr@qti.qualcomm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:corbet@lwn.net,m:linux-kbuild@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nico@fluxnic.net,m:arnd@arndb.de,m:jani.nikula@linux.intel.com,m:masahiroy@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DA07707B28

Hi all,

On 12/15/25 23:06, Graham Roff wrote:
> Previously such optional dependencies had to be expressed as
> the counterintuitive "depends on X || !X", now this can be
> represented as "depends on X if X".

I have always found both of these:
'depends on X || !X'
and:
'depends on X if X'

to be unintuitive and confusing to read.

Yes, I understand from the docs that the purpose is to disallow
FOO=Y with BAR=M, like in this example from the official kconfig docs:
```
config FOO
      tristate "Support for foo hardware"
      depends on BAR if BAR
```

However, in my testing, neither of these constructs are necessary to
achieve that.

A very standard 'depends on BAR' also disallows FOO=Y with BAR=M.

As I'm working on my SMT solver for Kconfig, I need help understanding
what else I'm missing about these two constructs.

Unless it's just more readable to you all than 'depends on X'?

- Julian Braha

