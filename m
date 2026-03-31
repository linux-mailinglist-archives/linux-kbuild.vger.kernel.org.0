Return-Path: <linux-kbuild+bounces-12418-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKuJKLcCzGljNQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12418-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:21:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD436E8E7
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF5C030F8D30
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F1C3168FB;
	Tue, 31 Mar 2026 17:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPEFYjmW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A94315D21
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976970; cv=pass; b=WBe1OckDBT6SZvnEVICp+X2h5+4ggTgC0BXPDyCKG2lMXRaXRxUHVECM03oBGrIwahl9IqV0iBuX6qNYeJjybt2S8/0HeTNH2EJAh3IxN2bnYPTnVmbM7LD4fc+71kHvSVpzcz8+EEIPftx5y//4zMgtTwMVH+skug1TN02b/TM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976970; c=relaxed/simple;
	bh=WTRVHRp3YZnZVbE+0ZoSdIPjJ/az35/laG/IbVwaY3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtaBYMyZAxAclWY/cGN1f40+82OUbUXwLwNcJoBAyS45txLbaEUJKl9TG0DVnyKUb1jIfZWK6s5WHhQqGzw0DiOs5jFQmCYTEPxLDrNcRllLPhKeFQkXbxvqcmL1v3SdQPSvYv6XwEV1At8SJT2u63CxPkhUbQDUDuc3/JojK/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPEFYjmW; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12734af2cdcso219235c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976966; cv=none;
        d=google.com; s=arc-20240605;
        b=TFfp04Wq9b9mciVp7nRQQhf4Iy+4d8APmAEh9zX6Aougf1dPfP5BF49LZICOXSRj0e
         0YPfuLCannLHROtraEtJ368nn23qAg+oC0ThMCWldbrplJ8Xjmrv/FoqBFVPceJdti7p
         Tn/2FLsW9wY7WnKWR1f+rWwmrcAGSwWiJL5WbyVXBFP56oUmhooTO2RrXMKkch7XrVJL
         VzQsAYBCJr3XIfmO2gpz68D2gAqvm966ATSYPQvyAEa2FNO6UPyOG9gczJN3CWoHwFmu
         mi7oGefvhwUE8sA81A46MVu9XfPK2iDxGdisObV2RdchcmWMiHG1oe55RFm7f9JcB9vM
         cXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hmCH9wEuQvIKAkIe3dk/Nd8jQ97KUjGLE+pTGY9wyZI=;
        fh=5OJ42KObdRPyYzahfZqovc53SRqTYxUCeM7ljtdWyfs=;
        b=GIVTs09mOekV2RK38lHXvwgfR/GXjd5uIqgHlHl9YxrfslrZfiFbDYzh7D+1j9UL9s
         lPCbsxEU3h+TwUVM6gG4/fvu3iA6ijtGnIlfIs47wjMknHv2BJz11GHhTa7qw6sd/MJr
         QIFA0tI3YtrgLcG/X/+VXjemHilNqojjTeGK6qTp2B2S0lcl+QuaK8HYRFMlusrqABmV
         n3/NMFHYrPrGxAOZd8Oup5QyBBIz2nUUsGRkHqEyrYusbrSu8wtYfSvznCOtNkEFHNYm
         uGJTOWpEyBM/9AUOazQYYyZ9VHTGUsqjmvkIXvcgoQv4gmeLrx3MvO1LmBHeSLMoCmyw
         EJIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774976966; x=1775581766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmCH9wEuQvIKAkIe3dk/Nd8jQ97KUjGLE+pTGY9wyZI=;
        b=RPEFYjmWEKeAgqRxKPdWHE2heLDNY/RoMjWk2+Cgudw8yFsUUJLHt56vK1TCUfOfXx
         tEMx3hVh4CkkWaTve+bHJ//V7V0cgBHevePROUWh4mdx+Y7qeZ7YCUT3ymyOpvEpLTuA
         m5wjm6ukdM6cj6LxdC+6PtFDK3jalNQUybs80JcJ+brnn8x/sFBqTCn9cos7AG7ySBl3
         C8GCoy+gi/gqXOoFEnxZnDAglw2QRQECL9wX0mlkD9ZTFLpX3/Z/Pqk1++rxDV8EYXKm
         mkFoS3hoWd4csJAvMh6ZH0vGmso3l6npcKPddYk/A4DOnsOMq78m/Up2RWzQFTV3h663
         bx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976966; x=1775581766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmCH9wEuQvIKAkIe3dk/Nd8jQ97KUjGLE+pTGY9wyZI=;
        b=sPxo41GK6sGSy03BPFhzstGgjg4VZ+Qk8HG8tYPl7+Mf1vJzcIKwNRVecIYdpyLYsQ
         vaEYWYOKrT62u743QF8+lhR8BK+43Lpm18nB7VTOEhK//06DySJqZ8nWWw0GMTs4zI4s
         zB+M3lNnbauNMI669yhUZDCo/T5ZeY1ylYjWuX7xFxpqTYT0wmJXbcOgbNKGRfe/ekiu
         UGLTt/nwlxZGcjyJ7e8ZcoK3or+q5siCctpWFsRWrjGSK+Y9G5PX8arudhTDhxEaK3fm
         Rbeez1TYmO87Ptzet8QzH3AnWdKAh1jSPlPHJ+asHpMjC9UXvN+RxR3uWWa3FT8Kg7lQ
         75FA==
X-Forwarded-Encrypted: i=1; AJvYcCXnu10WbxidcFmzf0Lo1u5na1o8WJihOUv4KtTXJrdotrREiQynk6J1iV04pTm1ACKYS/+1JA8uPnr/Owg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP1cpFDRofY5uBzUYiSOVlebCmg5tY9QN5KVFUAvrdzEryoEuV
	2Ion8cHonY8Re7PUN0mbWq0LFRbiR2eDFV1Jyt0fLNWevyyV1ztqEMqxZPLqqdifoiY4bZQpg40
	nM/Cf1REKoXbab+MtQTcN8QiWFnHSNMgrXoHnDMI=
X-Gm-Gg: ATEYQzz1kwnwKZnb6b6iJRqEG9O2vRuERdK1JX1BDwdKXFaUwFYx6NPNlfgZiWiX/4+
	YarlhIcef5UzmCmj1oWX4VDd70MdCA29putNfuEAOXGbwvPRullgy1gI0kYf8v1++0amjhZr3qa
	aMO4XbmoPPeer06DWM6fWVUmRr7SrFSTzfEOZQEYbaFU+s+JPIP0EDiOR3hqRKhEGsvrB4QljJp
	L8fZWVUQ79ACzHw3Z/nJ5DFz1a4fPoD/Dg8IL48GWdXf0QSOO4vVCtH3mBQnIV8LilLmjBGJ6EL
	7d87ES0j8wFyOVymCzCHkTe5wR/906+newEPWY2toNohq5MMNJS3QqOn8bBiCb/geVe8QzuF0jl
	zQnUH8j4NKnD782aoyDgkY9K+IYQp1rNC2A==
X-Received: by 2002:a05:7022:660d:b0:128:d279:b8ea with SMTP id
 a92af1059eb24-12be65beca8mr58281c88.5.1774976966237; Tue, 31 Mar 2026
 10:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
In-Reply-To: <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:09:11 +0200
X-Gm-Features: AQROBzBS6-knL1zyoKnZ9aw9c60rLyHZCDFo7ofTsu_CS53BZFovGzzWB07mGSA
Message-ID: <CANiq72nH1cMgpQGGkbwCQd4bSEVarWteaQaXeZh3FNyNKauKKA@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12418-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19CD436E8E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 7:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Also, I am a bit confused -- does the compiler flag automatically
> recognize the names like `__ob_trap`? i.e. I see the docs mention
> using the attribute,
>
>     typedef unsigned int __attribute__((overflow_behavior(trap))) safe_ui=
nt;
>     typedef unsigned int __attribute__((overflow_behavior(wrap))) wrappin=
g_uint;
>
> But then we don't actually use it?

Ah, it does, it is a keyword, and I should have read the docs better.

From a quick test in Compiler Explorer it seems to be fine to define a
macro like the keyword:

    #define __ob_trap __attribute__((overflow_behavior(trap)))
    #define __ob_wrap __attribute__((overflow_behavior(wrap)))

That could be a bit more flexible in the name we pick on our side and
more like the rest of the attributes, but if the intention is to
eventually use that keyword in standard C or similar, I guess it is
fine.

Cheers,
Miguel

