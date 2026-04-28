Return-Path: <linux-kbuild+bounces-12902-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPUWJ2b38GkpbgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12902-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 20:07:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1EE48A6DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 20:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB34A30384A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 17:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E048733DED1;
	Tue, 28 Apr 2026 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLrbqULd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEBA334C1D
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395681; cv=none; b=OsRZrgVAsIfWV/1IGcj2wykHE2U11HfkoNIOOhZGV21f5Ct+E2uVzhcdtfyLGjj9I89zNF23UAo57EaXbZxaU28ssahtQBegprIhDalHDn3BGKh1+4dLkHuMulTmast0mLpT26eAm7tytyukRQ7b3+jCV+TolPCFc/yz3DvtsIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395681; c=relaxed/simple;
	bh=24rly7mTR46SDbTB9/GpQSpB0zd1Sg4TfmU1mBbtSvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TgnsroqugKhjbxT6dQ6Yaz26NTjlGLV1u4anKamF2OI/iUoBLKZ9qFuvxryACf5SSzrfVhrzPZsa+0e96E6r08fb08IhtuVTNRtxtWVj4C5RaXX+CujP1r2Wq58rbwx9/nImHwWcRdthdryD7VgGZzyd3JNTj+Cxrjf74UWe3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLrbqULd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d64313c39so9014559f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777395679; x=1778000479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=24rly7mTR46SDbTB9/GpQSpB0zd1Sg4TfmU1mBbtSvw=;
        b=CLrbqULdQIzR8A8Zn7tf756a+u48fg7UF0UZ0JVC8xYnNxP71vYXEcGT+H6RvEGtTD
         8jqfLKsIvz/GDJh8ZtwBvYOyDsa7wlD7g/HsGYI6HVdcgpl5STYh7+rcxb8cnhuvUFBE
         ceVFsqfOSCyyjvbu1WPwKo3vpe93XhIva7slM8uonlUTbSzMPfvNP901ysdI9qE22yyx
         FFZjhIhvxN97/EcZJwcZEv6Tom4Y6sx/L1Jxevipi1Nwwovdde9g2LM0jPOD1kb+5Ue9
         W26KfXJw/SNvTmFRjE5ayrcdwY/MnejsKZ4aF1yO/UoZrM1k2yHnTgkEjQUOuvJ/RFAs
         628g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395679; x=1778000479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24rly7mTR46SDbTB9/GpQSpB0zd1Sg4TfmU1mBbtSvw=;
        b=bcv6/Gp2m4bDDFx+3ejIWBJauWFJbXVUtgaqCpL/xa79V0hNlvAI1Edzp9WrRvxRAR
         4UIIsT9CLPqUR8+kZikKK3o/l19DqwErd6nNv1ChoJWee7RvuqBxqmUYbcGfElM0jrfN
         hW5L9FoC+VyrLwJM8mawQ/SiVw9o/KknOXtYpY6IG2Ix7UwDqZ0dSCYa6hHQbzIDM78I
         InxOE47F3XT8moa3KZfsUxuTSLJ+WOdbzLqMrAGUzGToVDPDURWYaZBcxOmEIpR0gQOm
         1JVNFljzHQWEXre5K3kol397DQ4azUO6/ee6QmHz9Zfxky6iidWYHr3xgCAs64oEIQ/3
         QKmg==
X-Forwarded-Encrypted: i=1; AFNElJ/P7KKu210RIAiuJ//BbuyB7aN8LFUrGx64kmrPtcdEIqAaEC4EVebghJTRdhQxdrMdx1a+JQoKya1OEdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjj5ciZwS2/QLMK9sqCDhZZSPrhTf4aokcRJDM2ATDGCsW8+xF
	a6TLNgyuylUXPSnp1kGa75gSdV37OGZpM7mWCJdeTwMD1fGBuWVyloGg
X-Gm-Gg: AeBDiesmGDGM5EcK2qjaEX/GJZIRyAbu5O2Aee37qA5FPaUZ5tz3LAMWs7LbWASoi4G
	ACBKPYlB9QIqqfJPbDNekqFAEhji2BrU23/N7imuv3GJZgXN75e7No7+Bb6ejct8e8UgFhwrd0d
	D6N3GG3gQ8tJiidYrzAo9s+E77K4tB1lVbWi3XTqiKrOKYE7G/uydMBZgsmPTs9XKmY7TWL8e2B
	ugf61X7s8rjgkOE4S8Hm9zNqyMpwx5Yy7PET1NgS/OaGC/7Vz7FB3oKIgLxrnACumuw/vT3yt3f
	WlCcp/6t8JnFZ3uXvjZlgDDk2KgGOiQXmOLNckENlWTk1zapMVb28aXrSFfh4Ndez9Pzrvn/E2g
	SjcgqVJA0DFYx+JiY3uVQ9YIkcxAfAf9osujyNL9dn54ofm//g2yTxGfE83UTSMTW7OuoQmVGlF
	2H48u0kp6KQyBG3ImYvLW0GS6KAbvoJCzWWDan6E9eNwacG3PTXgpq62f2X7EtE2tSj3St8g==
X-Received: by 2002:a05:6000:2586:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-44790753399mr154751f8f.29.1777395678473;
        Tue, 28 Apr 2026 10:01:18 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f5b50ccsm6953389f8f.24.2026.04.28.10.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 10:01:17 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d72badf8-7d70-4caa-96a9-d77e00bbb536@gmail.com>
Date: Tue, 28 Apr 2026 18:01:15 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Arnd Bergmann <arnd@arndb.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, ljs@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com>
 <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9D1EE48A6DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12902-lists,linux-kbuild=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[arndb.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 9:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
> It would also be helpful to reduce the number of hard dependencies
> and ideally only rely on packages that are already shipping in common
> distros.
>
> From the dependency list, it appears that the majority of dependencies
> here are only indirectly pulled in by 'reqwest'. I guess is only
> required for dead-link checking, so maybe that part could be
> made optional?

Thanks Arnd, I've done a deep dive on this, and found a number of ways
to reduce the size of the vendored dependencies:

1. replace the reqwest dependency with the smaller ureq,
2. remove rustls as a dependency, and instead expect the user's system
to have openssl,
3. filter out unneeded artifacts (e.g. none of their tests or
docs),
4. filter out non-linux platform support

With all of this, the size of the entire tool source with dependencies
is under 50mb (about the same as the perf tool).

And then an internet connection can be avoided when using Make.

- Julian Braha

