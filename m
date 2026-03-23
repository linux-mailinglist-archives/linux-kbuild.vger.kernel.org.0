Return-Path: <linux-kbuild+bounces-12162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFswN3dEwWnpRwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12162-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:47:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C225D2F3424
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2FF9301E49C
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 13:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DFB3AC0C2;
	Mon, 23 Mar 2026 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeX1P13B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDFB3AB282
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272914; cv=pass; b=E8+HddI6GavMdv8se/UL7D4rjUOqqdC9unIoJ5g88h1/YrzdxPkkCh1LQHw9yMZe3h9q7+6XDBx4LDTjwAvOeNRTlOQ52LIruZ8EUB2sDI202R2gknNNS9gSpbAIGpKr4gBN3WMwESarwJsCbtnuHOR+pAeKJb5THcDXHpopqkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272914; c=relaxed/simple;
	bh=BWXOeU1wWl1XEOCGumiVY0N8hZzx/EKsLDL4oWg6ZXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUOStTnDumnqwF86YB8z+1tzMrYaYFNJGsuNCN1ykRaOBGShYZ1EwAYVSPrxJdHpfQ6iiH5smpx8CUcOJlxvDRebSLtJ9BpuMzUqkm76asyVYUTMmyBNJpo5l3T4tgqj2GkvPFgLUcfSDOCbZREcBcVU2AsySBFdos/gCUW7J3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeX1P13B; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0c4194b2bso150634eec.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 06:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272911; cv=none;
        d=google.com; s=arc-20240605;
        b=hyreY4Sm+Xs2vvM1A5Kj+S333EEkTZ3xJVIBZCaqV6BgGqSgMc7fBOuk9AdIASJaUq
         /FxBpLD5vjh4FwT+z3y0bil3g5YNlNSlyjKmiNXjmY4bwyR2DkYg6gjX3tNy1w8FfqWn
         TV5pAGd5WKWFlwCa1N+r2vdMK33Dj7hgqowwPxiCDrKhp+faw5oyhyMS5UeveO8sBY3D
         eHbEnI/DrDJKXWx+1MMfWByop2zo69HqozKQ87XL8mH//ukAeqQF4xY+v57kM7FFRfLl
         iloMb2CDoPdSWd3UxQo6GpamKAyyiSoQ3fZoW1Fkue5fjfp79EnD45oMEIwKAMPK5DLc
         NPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        fh=pWGqfTv6ImL/Wl8nBl0nIjNwaKGG20mnoEMgV8xRN2Y=;
        b=Skvarct9M+AEHQd1X9KHpvauYCoKmPGk0dfmZvbfowF4ag6iLRI8DMHG6HKVoE643i
         SRG2H55MZ6bDzhAUcV8+8yiXZEC5FBCrtLC+JnePhi9RtaO2otjLK+j6JLAfiBiCsfSE
         zir6rLxWVvi2itZNZdUsjTAVGUUsmocDK90/cxVI/pwNbtuI0CY7Ai3OIk5WYwBt6j3o
         3iKBDOIEjyOgLtZH18bgZ3k/ry6CjdSQ+LpRwh7sGatjpsAyMfFD2RL9bJMa4UIaUuI6
         Rb+VmGPKhoFIHbi1okINlH3IhiTuzMAxuFvCzotJ5UCa6Un2GI1+QQZt6AEWmCme17/C
         rQRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272911; x=1774877711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        b=VeX1P13BwSbJbjddWmNKWXJQlD5tsytNRzsoUJbqVt0D8mSNFc+XxeVXuiZckf5KKB
         lvQjCyj4VISIK4bLjI9jzpCqOUyy8R0rCByjapWLsyo6xPCrELNDvCfqaYsC0zsApaEk
         jdvT38WQPi9lG94ZOcp1eBhggCGg3Xg9lAhuw1G3rI3injo4thOz0plTIHFmloKsJtyV
         L745QE6T2YiPaGBZG40M1QwyE5skya2OUWpsOFh6frZeug4Wg3Z2GiZLI3F4qg2udo0O
         SRTwARfC2IyvzGXKAcBXZgqpVuD5TNFXziclJE9mlusQThv+kEb6o8JxXeVyyA9cl0wC
         bQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272911; x=1774877711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5oJqHAVX7zT2HPF6s22H5/MvQLO5sXIIazXAuipXIs=;
        b=c3Nl1b0aNYhjfA6C/dmmVCGmOzI9nTgXstJlvoxYpOIN0fjgUVwd2oOm+5oqTTVMSj
         LTQC8m5fKJZYcpSq0lwp4EipgyFl32NcwyJJSoEcfsarWpOP1yZ8aCR+mVkS5NL0RTpB
         qAhOQO42pXsEmqeqzLaQaaPN/Pe6vKolNfrFGB8Va9MPHbYadVjNdPCKXPrZylwtLUPo
         loRaQw7/y+modZjbhEfJWbW4T68sYxMF1TVku1aHEtXFLEUKVTgP2deTsAhaVqnQp/P0
         VWKnRIERwQuD/6BqxpZYCCkbnL66TelGO9dMzEtndHkrXfgCbaJKjHIRfhscUHqJX2xg
         viPA==
X-Forwarded-Encrypted: i=1; AJvYcCWTKR52i0K3WQ0xibOGCyweYDGpLrzJ8aRNAdZtRX5SaHbq96iJ0dQgGdyFgJC7CMvA3CsLEP9CjQaOSZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdjgQ7cjXtP86m12qznHVf/TTgGFRW2AHd0wrWG9ZHDXSVzl6W
	pMfyga4IaJap/kwtmxP7IK1FJW+J2FW6vLWEyw3lEbz62d0+IQmlB+J1HTBzYh6nNJmbiXnl2xz
	n5t91z/fvSYnC0L1II1KZkgnv20uFdSU=
X-Gm-Gg: ATEYQzxcLS4hxDQ+NGffE+dFy3oCCF3iJPcVRvFU3qKtA5IbTkiHmHldMRRnAK9/fjz
	YAZP4IVvSiwhjNFquvgUD6SRPEArFsE+zDCrEFch7TjFE4jAIcXVvPfcIYg74qZ66XTq6HIxaB0
	E0Je46JmqjvsK9aPfuzZzYgPXMV/ROju3Jqizhd4bYr13cIeTaNLqj7mim04qzezWE7ppfGfaKA
	LYvtXCgxOwJoKsyWzBnBx7zVwKSAlFovZBxbQAdqCHyi1gVSSd4B0k/Av7VorD6dzGm+VNIcCMh
	BMnxzMNPKapv4jFNUderTHOtNwG2Cz/jHfHlRfMDHR0ouW1fabbwmTM4cdvH3qbLP3DMciwsVU6
	6qtyPuM47Xu2dHtnpNm8tgBiZ+ZH6Bwlr3Q==
X-Received: by 2002:a05:7300:5711:b0:2c1:27c:75d3 with SMTP id
 5a478bee46e88-2c10956c2a3mr2435566eec.1.1774272911337; Mon, 23 Mar 2026
 06:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch> <DHA6SE9EMEQF.1PKVHEG18I5FS@garyguo.net>
 <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
In-Reply-To: <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:34:58 +0100
X-Gm-Features: AQROBzD7g_rNmuMWaBSXTkod6GcGExC_6-5XqRdaJnhqw3z7WBAm_JnLMPlOCtE
Message-ID: <CANiq72kD6HVrDTjQrTXDujyjA4Z5ELM6Nh8kFfVfNXrvpfU1wA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12162-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,armlinux.org.uk,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lunn.ch:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C225D2F3424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 2:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> So it sounds like my understanding is out of date. When the first
> Ethernet PHY driver was being merged, Rust could not access inline C
> functions. The binding had to replicate the functionality. But you are
> saying that Rust can now make use of inline C code, but not actually
> inline it? It results in a function call?
>
> What this feature does it actually allows inline C functions to be
> inline? So it is just an optimisation?

We have always been using the helpers to access the inline functions,
please see the top comment in `rust/helpers/helpers.c`:

   Non-trivial C macros cannot be used in Rust. Similarly, inlined C functi=
ons
   cannot be called either. This file explicitly creates functions ("helper=
s")
   that wrap those so that they can be called from Rust.

It doesn't duplicate the functionality, it simply forwards the call,
i.e. it is not as bad as a full copy-paste of the implementation.

This patch series aims to improve performance (cheaply in terms of
built time) because for Rust calling those helpers are not inline
anymore otherwise.

You may be referring, instead, to avoiding to have to write manually
the helper (the forwarder) -- for that, please see "Support static
inline functions in headers (by generating a wrapper)" at:

  https://github.com/Rust-for-Linux/linux/issues/353

(In fact, I had your previous mention of `skbuff.h` from Lore there :)

Assuming `--wrap-static-fns` works well etc., then it would be nice to
use it, yeah. But that is different from this patch series (and this
patch series would apply as well even if we use the automated wrappers
etc.).

I hope that clarifies.

Cheers,
Miguel

