Return-Path: <linux-kbuild+bounces-12159-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBLQEuM8wWkZRwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12159-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:15:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBB2F2A10
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 963693013C48
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 13:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7B738C431;
	Mon, 23 Mar 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhkgXr2V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E56739C014
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271664; cv=pass; b=Ft4msXf/EA6mWfgwnjq98A3CiKi+s+GRB4ZOOnhDDocQ62Ngn+FU5wbJjENeQK78fXJVvIcBZwSPSaVf9BGaFh0/1pWPJKGcCdJhQ3SrQwGTjlgs6FfNiNXwhwnt9ZZZcAiAUPRhimCFlDew3ufoFpQXNEpS2T2SfKG454s6Cf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271664; c=relaxed/simple;
	bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRDIF9lzf3Np2xOnXCnOKfv2LvBkpwA6wvLvrCxCQvWz4niHk4pDA2ABUt4yf93q+p747wy8PSi12pBXHLyBZCaps+McHF83YXb16v41w0I3N4gOFqtM2HI1kRrMJn+uYa5cOv5oNP5KbOngiIN0PsBBVv9llgl3dtcU65OM+28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhkgXr2V; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1277863a912so355450c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 06:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774271663; cv=none;
        d=google.com; s=arc-20240605;
        b=Urn5XIjaxlcb8DyqkPVtKlBDvomREC/KOlseLQGFnS+HFsNuL/Q2eYo6MtdvVYQaSP
         aU9F0cn11MQbujvB7mSkf4LBxcvMbx64DK0q7MXQu5Ni2pKPgmagZ8kZYUMKqYzQA6ay
         7PRr7SFgW4VMXNCRN/tPHSlqz74hDangBGeJRmm4K54wJDDs6EqzJ1kFbWuA6X9ZPD6I
         d9PCd0qdMI1OYYN6/laS01Tpv9QmHd8Pam3N4ct27VNv0tdA8upQvBmmfO9u1eEhfmOp
         tPEYD2gXXr7w+Xg6v+BQNpiM4Fd6QbD89WDLzMKizbz6w8FIOfVUJgSpGjW3/2Y8AdMO
         bvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        fh=gOPxIcTHHjRbp39kAFdxQ7McKqcXRZmh1+AmIr6Aedw=;
        b=aRguMSJRbbkcSer2iTwUsteb1i6cnE8xJ5wZgNFc3mThrgn9MHje6C7ocZ2p0d1PnK
         wQkCa+FcKuZkNVH1A6RaQYLsYo34ZqAVAiG4hXipl1Eqsrh7bosD+ZwOUil1WfubGaiH
         Na0zMvrj7L6DIuB8Ko5WfPWCMxpog/nfEp9Wc7NWmLGWH5H38eVmh5GiBOO1RAWYFyW1
         kEQHnRLj3q54BGdYEZj0oBXDgp6wISz80yiWvy9wcoycvVMeQ9zLHjN5tUEA1V8CyAoK
         tF5i1Gs6r48q8eVGOJChztkZu41U/ICVXIPmeXuBtpTI8IZeeWzN+xT867fPWOtfdJ3h
         XcOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271663; x=1774876463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        b=UhkgXr2V7tpzLNRFhXHdVzmzKn0tK70enlEv/WAQKa6/uHaKn5MWn9v4P6qJ6h65WL
         uEDEsJnFa5ItfdbxAuSmqonU1fh+hAMegLQ+3TeR2VL6Dy6bGFe9D3Y7ECuQBfB9ASSo
         CKkKtAQEkFceLQxmP3BnHfO7MdhoqfMVU/GQ1hUGIGxAdReGqt2ibHusJrtdI4/udHky
         gKNQR0nFaguUyDTqtM0GKUjYA7M5L4WIRj5SNT8MHthUhX/68BWCQ07wvHwbAu1Selol
         nTOCqKzGgDCosrkoWakKLcjbFWsZFHoASn3d8niN2MlFTARhcWaeypZRLXlp46Tzo5kz
         xjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271663; x=1774876463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBYCnrWUYKFuRRnPBj94PpkY2ZwRFNgR7IvcxQJbGJ4=;
        b=EcHcQEsP2k/BXeMXbaWCC2wIFgdsK+CDZ37jfIfB+Ul0sAEij6FmBfqQiPDaOXm5Yt
         e1AfCplDYD3eZZ7Z/q6Dpji/UaaWatiIb/Lf/74W2YOBrrUyAXV1ekKTk6efwzeIomZt
         inizSAnI7tBC3KfPT8CsYRcu9hADJhO3gXzJK0FRlftXGOonByzBGN+eKXXkdUXPZTMB
         lwUc8f4GBzNhnV/KGwoCfZFeQXb8M/W4y6aeoFJoh/U8tfta5mH69G8Y4oHurqZEjG0G
         NaW/7qOpg+Or7rE+q2L8WLLhAU6Q+wcPuX2o0j1+2keHeZHOnFFHS0UbzS4jM/fQbIYh
         SiSA==
X-Forwarded-Encrypted: i=1; AJvYcCWG4y3u3OcZKmfLj9nh9EppFOpmCjFJUaYZSgbEPL2mWUsmIKx+7EKCBNiUimmFKShw3ZYuRTrKrWp1vUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfwcKgXpgy038sFmc/U0rLxSbkhYuXJJeL/zDHbZnXSEwYRP5l
	bT9LXuxo9FuLiDYBqBfwZOQlrbxsY0CE7PwaWAHuvZ0kPfgJfR7ieIWLyR+P1A63wnn30cSZDX6
	Zhdja09XrLvGiKMrkBGmlu0bxBshEX+Y=
X-Gm-Gg: ATEYQzznb4i1hSqRo7dTAHpGcvXlIHdUsMCFOwokDqzkgKvNi3uAJYXXIPjFdlcSMZW
	zWFbaTQ7BCq2sc5ki87CvM+g/kxQYz2f2ZRKPPdStWrJ8REMb3CNYJjYvVizYNAESY2CwzCotyP
	LeMLcCxgww2Y7yO5pO8kJuN23BJwxyBqzf4MOHq6VVkGyOG4sVmlF+nRD7SOPL/SeVmBfaTVgnG
	4fmru/NjUgPZbHk4j3CLAzvDTvIugOhBmXepwA0lXxgQ5LB2uimDw8OIA8bNB2gc7MOGodAgBEm
	ULQY5N8gXhTsQ2O1rmJo3nkUOkh0L79ZA9qDwF7EiajgBGF3PirXIlschXz3ebriJfKt3qqJnVS
	J9zSK8hm54MBrqYWA6g8CXRY=
X-Received: by 2002:a05:7022:f8d:b0:11e:332:1e01 with SMTP id
 a92af1059eb24-12a726a9b6amr2560622c88.3.1774271662774; Mon, 23 Mar 2026
 06:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
In-Reply-To: <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:14:10 +0100
X-Gm-Features: AQROBzCU6xTHp3fepOJZJySC8VZYOKbiHafZdHuv7S9AawfpKcVFscMWOGjChLE
Message-ID: <CANiq72kbp6cDnNsKb+rPHiEJzOa-EnvR2HHthM-VtT2GMukY-A@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
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
	TAGGED_FROM(0.00)[bounces-12159-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,armlinux.org.uk,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 37EBB2F2A10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 1:55=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> The current proposed code for netlink needs this feature, because it
> needs access to inline C functions. Is the implication, following a
> chain of dependencies, that netlink would only build on x86_64 and
> arm64?
>
> If you want netlink on um, arm32, riscv, loongarch you would need a
> different implementation of the binding?

I still don't follow -- this new mode is opt-in, and only a couple
architectures (or whoever decides to support it) would be able to
opt-in. Nothing else changes.

> And a completely different question. Are there other work in progress
> solutions to allow the use of inline C functions? For networking, in
> particularly MAC and protocol code, anything which needs to access a
> struct sk_buf, a solution to this problem will be required. Do you see
> this "fairly exotic approach" as just a sort term bridge until some
> other "boring approach" is ready?

This series is really just a way to increase performance, i.e. it
doesn't really change what we can do.

Cheers,
Miguel

