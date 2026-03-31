Return-Path: <linux-kbuild+bounces-12424-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMfKJNUEzGm4NQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12424-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:31:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976336ED8A
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0093031A5C6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4609345753;
	Tue, 31 Mar 2026 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ILQuwpw6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2E9344040
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977432; cv=none; b=QKxF0+gafY9aisZC6EBkAMzraXCO8OUyM2694mWv6UuwFtNkz2J/0RGau0cetNfSNqYMB+t7+t5OiiaRLHrv7dDOgdDl7V4TExKGGmkgcNC9mMLBXHXRKnGh6G1r3TPt5IMwSPMfE32XyceFXaFrc0aUi3AAPpK7Yb3zFpVQyLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977432; c=relaxed/simple;
	bh=X8mgB91EilmZX84/+DAl/QEGzBiT68+EQBIZrGj6ois=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeZ1CWDh8hu04ABgi9om2QrNq+MqSPzeRupgSQBGQ9C+/7fA7l3OcmveffLiSnQv47sSPO7QbE/T943LoZiDZ07fSq0HpKWKM/wMqZBdXgWL006uE38SPDqPeN0vs87mTOzQR3X9HQpUd5be7zHqROwNHHOHSYS3Jylk/k57704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ILQuwpw6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66db0cf6a4aso174092a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774977430; x=1775582230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RzhkbeYcTn/pueZLzsl1uKI6wC45DhSkVKoC+DMZrjs=;
        b=ILQuwpw6NXNe40AtPUs6bgS1p8n4kcysdqjPoCfihNaRVSQwO++b7qYj5d9pLe3rVW
         jHAKVn+l2LkxJ5ULDMZFGLuzS8HS6pzsLEG0cuSqMS7mdUB9V3HpceSmPyuBojZTXJqm
         xbYTCT6/XGPtxkKS18CEpjaXOeoJBXA2OOM/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977430; x=1775582230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzhkbeYcTn/pueZLzsl1uKI6wC45DhSkVKoC+DMZrjs=;
        b=mM4WHYY7GSiW2jNJFuNZ9SmcIcBIscgEtb/L3LUKSbT7agzxwIcuHsjF5pEjU6kJvV
         pCFlvp3H/SzyB1dPJNMxuTQLWbikanpFFk4U3qUCx5Mv2SqEJcN30qBTmb7WaXjgrenV
         X3OFEG6xvG7/smHt5T8ovfathOgUd9tqaJv7xX/EevVeL4dUTCrVCYl5G4dHA1jGchl8
         mPpGgjNfsmqnHx9yO8Op3+wZZq3pkioddCoutxHCMhIEqhXFa2bmnMllibtYsfoFkHjE
         ouukTGRT7zttquMPy8FCZWmh3fZR4IVB1B+WOweRSYSCdv8LVlemzGVFBmxQxcx4Gi3U
         vRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh0QmPolijPvEB6qVGE44yp+a7Urh1SNflCa23fj0de/rN/acT1x9ne/2SKZ0iH8YXHbBbEsQnvU2o48w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSfhjujsHKSAw04nf60avEswZtz49q+EDQQmCrtR5kVAu0UCl
	PLh1hlw061u5yk0hTNMqB/gmhTbX/Cb3tD4Pz3XFu1sfqLDAgRHGRwJZKI68KswYjOSuDTS1nyu
	XVpxInxRKjA==
X-Gm-Gg: ATEYQzzBG4QTRk3jRf6vup/7u3p9yeSTJKf963jgH0LHTcam+AWr8jtEFNjG8h8xwFb
	usi8DjNrxHOlQbDWEXI//osivMAN75SBIUUtWyO98mlWCVvmvrqbjzApvSFBtnw0/9AZVUoqyH/
	5TaceN5RaN0Qkhqqih9QsJOL+c9/Xstfg9Nm5+g6sJfL2CSoeFD/2jROyR7jUlw8jgiu/XTPaLa
	2sYBdH+H3hDJelNG7kY6iKSby2MO1g6BkyeT1s1SQEgSndGDbOrfG8MRYHZX1BGbY2fF1UfgMY6
	NWt6vLp2KG3otu7NmrN0Bcp3JBGAgWgcsHraySHCf4SV5xQCmbIHObcQff53ICMk20qc23yRXJn
	pQp9c5ahUVPfhdrhYExxcjU48agEtG3BHkriafOSE34nuwlIQT9ePH4k9rR32l+BhMiheWaqj1T
	QBiCwO7N3ogiQp9ophyC6aXsiwd1egQoe3KCczyU0rBJZ0BpOfrbT9H7+AVy2B6kGJSeCyKym9+
	I5Jhv5kOWw=
X-Received: by 2002:a05:6402:321a:b0:66b:b46f:cbda with SMTP id 4fb4d7f45d1cf-66dafeb846cmr222467a12.1.1774977429568;
        Tue, 31 Mar 2026 10:17:09 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7275ff49sm3396264a12.6.2026.03.31.10.17.09
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:17:09 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9358dd7f79so54292166b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:17:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2RVMxEJjHDhM+B6dH7eg2hFWveKPUI89ZWlvsweFDFWp9e5z5GjXgaJY5gDeFgJb8TuCw4moeVgI7r7E=@vger.kernel.org
X-Received: by 2002:a17:907:a604:b0:b97:b9d5:4ae4 with SMTP id
 a640c23a62f3a-b9c138e5f3bmr33991866b.20.1774977427566; Tue, 31 Mar 2026
 10:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-3-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 10:16:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
X-Gm-Features: AQROBzBItZBmx5_N-ynlPw8E_7o3PG43Wcm0ba7e3I2MR7-9HUZsFelf3Nv9M7s
Message-ID: <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12424-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,arndb.de,linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4976336ED8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 09:37, Kees Cook <kees@kernel.org> wrote:
>> +
> +  typedef unsigned int __attribute__((overflow_behavior(trap))) safe_uint;
> +  typedef unsigned int __attribute__((overflow_behavior(wrap))) wrapping_uint;

This is fundamentally broken sh*t.

Stop thinking that trapping is "safe".

It damn well isn't. A dead machine is not a safe machine.

Any patches that call trapping behavior safe will ne NAK'ed by me.,

We have decades of peoiple using BUG_ON() as a safety measure, and it
has been a HUGE PROBLEM.

There is no way in hell that we are ever adding implicit BUG_ON()
things that are this hidden, this easy to use, and then mislabeled as
being "safe".

Guys, that's the same logic as having a airbag in your car that just
shoots you in the head. You're certainly "safe" from the vagaries of
bad healthcare. But dammit, if anybody thinks that a "bullet to the
head" should be called "safe", then that person damn well shouldn't be
involved with kernel development.

So NAK NAK NAK NAK.

The only safe trapping behavior is something that has a clear an
unambiguous and simple to use way to *HANDLE* it. Not just "mark it
trapping".

              Linus

