Return-Path: <linux-kbuild+bounces-13336-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GjfKKuaFWrnWgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13336-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 15:05:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD735D605E
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 15:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50AAC302F736
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 13:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAAC3BFAEB;
	Tue, 26 May 2026 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EKza7bFe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED69B38330E
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800626; cv=none; b=UqVFQD1LSZy6ZhSVr0uzBZfC2v29ADOa1WwyLy2VBH7X1WlgrgBX9gD6YIfOqFZZhUWbn5vI5c6RlLFG83yySzjO5cfvhQ3LtT7MDyprn71+jQ2kSqQo/Qfp2b499LQJqbcOpc1zw2fkCAr3jPHQkj5WhYhAmJBvYjVFQ6F840s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800626; c=relaxed/simple;
	bh=cIV7eVLFj1WSRdO8UJfWGAKcQ4RL3tgfGuH1jAdS3kQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jtfs+4LGxGk24R+WVrrXG6H3m+u+XYlCmzE/yxujGD97PsZcNJ9JE5aCw730xLpPUSUZGboAEcoJJX5F1C5Fi/7CkuyYXFgJsq5+IyIgv4WWnXYKLUhmfPjgY3pTh5UZ6Lw5M3Fx3KTPC1JgK2p8krdoYB2aSQa1DKsm47paxtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EKza7bFe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so50130965e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779800623; x=1780405423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjNTcWc9bOGf723loCTUep8771/uj7ug5EPYZq+XxOs=;
        b=EKza7bFeRfOQx4baBBdJSdVBzM2bve8Vku8qcuHTL1cYVJoQa2hWXbtAPm6EKv+KnF
         IterkP4Vdog+meaG7Vze1zOImzDCFf+4VYTp7uhiBNH9SWeHBhz67Egxfm1Y+vIwLZkq
         iXkupGSTgn20E5+tdlHJ3VTYvJ9nWNOMRCMpxNamsJCwQ3jmAF7d/A4FhvgNh/dKB1k4
         jIdjIY35h4zCtboEngwh4wP1MQ8ujcO+wcL0uxiix57Hu9LdhlaJfHiWyzZZd8DrRvr4
         dWlyVvqCuyLlokSTAwAvFB6yTdsoOhP0YVuxsM1t5zz8rNsgqshkwHrtovjbfmMBXRwA
         jZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800623; x=1780405423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjNTcWc9bOGf723loCTUep8771/uj7ug5EPYZq+XxOs=;
        b=ZCBp6MpaNO70kVnUUG4oLzosZRfauKlS9QklM9aVu+pkXp766NQKGZ/ncyagwlYMqY
         ij6NULGeaONC0T8hclI6ySUQAmejp6DoMq6i0qI2c0XpVbImd+kIoG9dqXebPbiKuo/n
         Hyh2bwguTjMyjNGCMeNrwvwlSnodtxcfWn6O4pV4QFVUvFPOIOGwBpzakLBaWCDZR3fK
         D9kMpAh/578ojOLFcwuoWy0ZE+yZ3u+nmXZRYOSk/fGSLZ7yz/r7hWd/sixf5bbj9+by
         01yrtbE6MZTlJkztpw/OiNt8cBIxB7fdxn7vAHjPODW3hV+cJUkwybC2D+MndyZkYTX9
         SFKA==
X-Forwarded-Encrypted: i=1; AFNElJ8/BxQwz12oH6FcvHfHs/YJHKx8y8A2vZtu9LeeBK3u/U1dFbFLslF6/Mm5T4dGaAEJkhIb3Ff65VFycd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd/X8zx9opwFXnN2lTzMCHN8HekDOQv9F9Jz5UXGDen+5iP7y+
	AmMGPz4srNIRIChhr7qhVKAlV8bBUg8eq2Oa2iD5Ai4Ke7GymhATW6aEoeqSCxa8PZo=
X-Gm-Gg: Acq92OEHOFbHPHBvNdlEaexjrPAa/m4/M0mEUfz0K+ySzwKrWEXK0Pa1ROCUghNj2My
	vzCGq+WVOfA3yliJiYYf6IKXpk3P0kDekgQDYNfMcrxQdTgyrxcEbCQLgA0OdltRgrK2EURT5oK
	cUy0O6wHPGNZE/Itv/Jlssw7/GJ2W49NipvgEZpLfnA29vMBPRyKwhEryCxlWXbvwh+jQSSbW8O
	XIS+bbNUs7MGIJmsxlHEJP/Y6hCPqIm1CRDMDkTfiRkfOLVWHvVaO3aHq5JAMuecZldXqUgdtYG
	fheJ31SrKvgnDbmFruf2IHI/8VaEU1v0fAqJF28jUCGVuvXvUa6YDTH6ZTXuLCUPmp/u5QQztid
	pgWzoLI4gMWjldnHwlGc30ECU4LBppuK7ojbdG5olkl116R4cA5ykonrPYmkypMm+2XNqXo647o
	ob828IJRXrVU18DNmhcypJjNsElSHy5ejiNc987eZPIoC9
X-Received: by 2002:a05:600c:45ce:b0:490:52c0:73f1 with SMTP id 5b1f17b1804b1-49052c07823mr223327865e9.9.1779800622880;
        Tue, 26 May 2026 06:03:42 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561a198sm318501285e9.10.2026.05.26.06.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 06:03:42 -0700 (PDT)
Message-ID: <635fed3c-4e39-4357-acd1-13f1653f9e3d@suse.com>
Date: Tue, 26 May 2026 15:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/14] module: Move signature type check out of
 mod_check_sig()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?=
 <f.gruenbichler@proxmox.com>, Arnout Engelen <arnout@bzzt.net>,
 Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
 Christian Heusel <christian@heusel.eu>, =?UTF-8?Q?C=C3=A2ju_Mihai-Drosi?=
 <mcaju95@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org,
 debian-kernel@lists.debian.org
References: <20260505-module-hashes-v5-0-e174a5a49fce@weissschuh.net>
 <20260505-module-hashes-v5-9-e174a5a49fce@weissschuh.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260505-module-hashes-v5-9-e174a5a49fce@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,arndb.de,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,huawei.com,oracle.com,linux.dev,atomlin.com,oss.cyber.gouv.fr,vger.kernel.org,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,lists.ozlabs.org,lists.debian.org];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-13336-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,weissschuh.net:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3BD735D605E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/5/26 11:05 AM, Thomas Weißschuh wrote:
> Additional signature types are about to be added.
> As each caller of mod_check_sig() can have different support for these,
> move the type validation into the callers.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

