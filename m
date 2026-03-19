Return-Path: <linux-kbuild+bounces-12085-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PxACbBgvGlxxQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12085-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 21:46:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA82D25A9
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 21:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11555319E3C2
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 20:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D253F7E87;
	Thu, 19 Mar 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6S3c4V6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4DB23ABBF
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952653; cv=pass; b=bG8hi1KQCcqMc8Zavu4jE2Y/CV63uJ1r9hu9G/jCTfg7HZZ8ouI3Qz51Qo/PP1hTqTf3uvJ+W6ispWdgPo8qXcgA2w+qs44wBulkZMxVyKzQhRdztl0q63ErNecrooSFYClEuTZEzX4hcY7/MQ/bIMI/CGZlRJM+a+qnfX49TQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952653; c=relaxed/simple;
	bh=CPhiTWTBujSlqTPCMuWqa0R9rRxBfdH+7ETOkTgDBak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG2q6WlREJ1PYZ/s1/ccZhk+uMXWtgTM9dmCXY7CqYh7NgTs+OSU0P8peXR/6dJQimoziIWW6nYnbDKZW8blyUbWHAfdYDKRUIO9EWb49Tu0wBPooBN2KGvoJ8+bMFdMq9dgHjvEPuPrZfOVkUpCLIo2KfaaoftuKXZcM2AcaOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6S3c4V6; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-124b07e5fe4so148464c88.3
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 13:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773952651; cv=none;
        d=google.com; s=arc-20240605;
        b=ihA3Z4DYTBoqzeDrotwFRvVXNE3hvCXYWLZVQO7fuc1Qd93xRIsSX4/toiLZZxH55p
         542f1gykTXgNa8RVAofs4K8+w6yuHKMwkpyWWPHCX9tiFohvWFenFg5Z5k/0RQCpuI4h
         G25NQK3wTmdWMoJsL7dUjT1QGrg91GUNXWOTb24u0CIjN4tTJu5YsNIp7zpN6UbyaAw/
         nYvChYJUqCjI937Dn7OeJsVnfGhuHvXtqcuYanWq0QULLdkeaV5U4ISGL61IjxRB/MAJ
         J989wDdvL+9q13lhKzU4WCeQuP+EgLLuLnMfeRwrnGPDlGrRvKe5wyZIcZ8z/x+cRuVB
         wogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PG6TOeTlBYopJNbZYyJpmVT0/rfT4F5f7g2trnXU4aI=;
        fh=mv2Tir2zHz6pOIRhK1g6Z5NV61kxcvTJ+2u1/8cLbJc=;
        b=ZNLVANihz4nzUACVrFJSmpexQ5JchsGmEL8VEXBESqHVpMqseZ/0QOBKZEXWEI1V3X
         bDeLrIpYcfH7WVFJp96d1BWhrM3DDLJzf6VdF1yq5OOrSbBEcOiYYPhBlwg07qtc0YkD
         X67cbIrqlP/QxRA1EuO7Sj8ZCxad9a9ZfyVjexyXyXqAJ/V8s+z2ETFsfF/aaHcVMTFJ
         g5KWS7Kk/OpTG8N3MtWFTuNzFOHABJ1PHmhVU6xBnTcjA/jwqVJEOx9DzOKfJ84+djdo
         Akde3rykqdE4JPrjdRbEj662aSNEMKbO3zpngJlXi87by9unvYEPftqK54Lf/CcSbqjR
         HWNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773952651; x=1774557451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PG6TOeTlBYopJNbZYyJpmVT0/rfT4F5f7g2trnXU4aI=;
        b=V6S3c4V6grGjlPkHEpjMHimbjm9+IhrbX8Xv9qnaK+QfcUhaWsdwreYy71w79VsvMZ
         hUqBaOj9NwqF6VUp06m47WXUowA2w3m0jQw5c2aoYMOg2XMGxoJxQUjqcWXqh4+iSp8Q
         X3efrQkHaNiNA0LLVmmddC4/GCbdDV6BKOsm1XETjOIIoCjnHreMIoke2NCTry+ojC/m
         6z+wD3pBbDNf9C+5s0xNQqI8w5vHkRbRjijgqwkGM1pDxx7WET4CQHbjrHtJ+WbFwma7
         gmSJsmK0zkYGeCWPEncHUKnbQOzdsnK+2u6qEJSPtZzSWZbKM+oLAwC7LnunCkX82Vmf
         RI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952651; x=1774557451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PG6TOeTlBYopJNbZYyJpmVT0/rfT4F5f7g2trnXU4aI=;
        b=r/APGDY/flwJcZF6K4oi2mUqZaH2gAUN9I++c2G7VEJp1idHsU9X0Sxr0TNZEbwViM
         C5NitpiyiFFm+rorS1PmnkadaAQIC8TPoPLBJaEIimsMQTW+sX5/A0YONfIW0sXE/1JQ
         OjHtVvxgVI/pdlawPuovm5dbdJgI4XFeFUNMWJ+pbJmUgklPYBcrDz1ab1HAC8Cmu/s2
         DKYs3dsXf7BdDBjq59eCJNfOgGhqNBe4ckWFP+cPGgTt88yA5CnwYKSzi5OTX9B50mmC
         exRhXC72bIcJDBsNG8YrdWO3gKwjeDgJJn9U+AJPflOZ5NQL7NkAmj5TBDiRjXGd1Z6R
         OfUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGjZH1R54r3PC3XwFBIlzfSmMYikjXc32LUKoRgPkWUxkynGCY1DIYPywrXnG7LHNow22S0R3yn5Nmb0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3CG+BkM0LF0UVPojqjE5cuV0hWNDLbPos1ltCda4GydFqgE7m
	mqFjrXzemWgSaNNhztdY2u8S6hIG6a4nQGr7tuzAGa4gJUTHqpL/uxLV8eU6vGV1ilicuTRfMr4
	gu5gVnDp/aABQwZVz1IEBqMqd0QO52Jw=
X-Gm-Gg: ATEYQzz7giGU8cFLVNtQFAHvGakWzxt55TKz26WseC+7UXqU3jb3EUN4OTpIaGkN8vn
	q4kKnECm7QzhdF43psjHDn8JP1ZiP/HfuK9HyT3qTSoEJjK/IyjZ4a3LEGMaD4XB/Bo29f/2FzZ
	TeldP/aQ8Oe9zvyFYC3t+nCm+2gQEl/bewWnBzUiADBkxTXNZCZ+7BdUihmFhfq/wNxGwsrAxHE
	m2iohoULCxHcKxVW1K4AjC5ZchI5RjhiwwVFESkyv+ueVg8gzUY9nOSxlILKMtobUfO55lcfvcV
	rAVPKCU9ehCnLum5uc9Yi+919pSIUjx0/mGRcx5Sncw6ZsjAj/CbMTm3gT7MH02qMiPLVmHPUWT
	SGB11vyuZ2hYh42tpuIXnSp4=
X-Received: by 2002:a05:7300:f195:b0:2c0:c961:4b98 with SMTP id
 5a478bee46e88-2c1098bc5dbmr179708eec.7.1773952651428; Thu, 19 Mar 2026
 13:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net> <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net>
In-Reply-To: <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Mar 2026 21:37:19 +0100
X-Gm-Features: AaiRm53aYTZYVqlOaDrgZzFQV_MQE0hGpsZgGOA7E3ahUoW4EZWbp0QSXJaW4mc
Message-ID: <CANiq72kFkcukzLjLKEJhaQqpdFJKcymnvi4qS+Higsx3_8y6JA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12085-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,protonmail.com,umich.edu,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.797];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 7CEA82D25A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 8:09=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I don't know if there's an established practice on renaming CONFIG option=
s when
> this sort thing happens though.

Generally, we try to keep users' configs working.

In the past, it was quite painful / pitfall-y to do so, so to make it
easier, the `transitional` keyword was added recently -- a couple
references:

    Documentation/kbuild/kconfig-language.rst

    f9afce4f32e9 ("kconfig: Add transitional symbol attribute for
migration support")

I hope that helps!

Cheers,
Miguel

