Return-Path: <linux-kbuild+bounces-10973-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDpHKjzYgGnMBwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10973-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 18:00:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1EECF49D
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 18:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F12A1303B16D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Feb 2026 16:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A41D37F8C3;
	Mon,  2 Feb 2026 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFYww28O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2925032F763
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Feb 2026 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050778; cv=none; b=hadorxZtu0iBoPu1LLoaYELqjvAwJaToRo5MHPLTgTo1eHtAGTSXfJJAe4vfKCnMMfe79R868N+oajtKiC6eE/tUWUKBxxyDMMhCbGs5mqUrbu8MF6zox2De8rKGcE0B7lL7NK6/gCQY7ID1VyfSzJQgPB+J1991TBRMM5kFn2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050778; c=relaxed/simple;
	bh=Usnw3Gatub1oxTffhK0WXeLvi39STFWovIQLvfzLBCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOevJm1msYH8kLN5cJXHSIiq2J2PEH+O5GDIoiv2Re4l6+LQ4WqXjfv+/lfvh+4R+3nxs52OlfZdRhivrMqs4y2ZkLL9jG+UZL6IScQHqm6EbdaXnrA0yDwsuTzNj7coKEIVrFALeVAj5z3MX1CKygn2G0hJ1pgqyAJCaSJ+EJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFYww28O; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7bceb6cd0so32452825ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Feb 2026 08:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050776; x=1770655576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvR2bhtkwHdzvpnOA5ZJ9EggNv6gPLY0gAmo2EM4ZPc=;
        b=GFYww28OQF8Dt84Qq7csZWIgO2vhu9SOwyI6XVChd0pfU96XGkMYq6Agk7NJfC7Dvj
         zGzbXup7E7vH3ke55ih/rNk62b/v0JI1qY6Fn+p1QHnOp+vCVSUW0vmS6EPQ5nC3aIIV
         3o0eMRccaZ2eYrrPy9rr6RQ7+bKjr2veApxyv84HbiIpdFC0TT01STJJDcGhnI6N4O0c
         +rqE3LWL/cMQPP3O+iyshlASpINeJx4EWaaLgrxFsqTvE/OScwkfTmFdBO9EbNG+QkAL
         9SOYfEhJNTpqubDwx5phWZn5wEpf1ltVrOpngDcEONeGX4zbQRcU2fOUQMKTofsKWOWb
         jupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050776; x=1770655576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cvR2bhtkwHdzvpnOA5ZJ9EggNv6gPLY0gAmo2EM4ZPc=;
        b=t+vg63WGPHbDvLzJB1XEb+HTRwkkJCwEnWVa7yoOtA0UPV7Ks41LJJePICmXxyDYCU
         6zqaX9Z7oeI/HELulrdpFynn4MHxWLnbmSZwclJEEZMcJMp5OHBiGE6oyFw7XdP5ArO+
         sP/DNTHrMqT2gyxArpuLZVg9dDCwY/BtdP3lTnXRUo6gUzT1QO/tlirX0+X0vIWVrqTq
         DdqF/VPEW07k1GXfdzkWbspRNj1CC/lJ03JwjFJybtKzTHedqBJ9c5xxCvX/LX6BC7Ag
         BPYQIhETKGx9Zwl3mGIwLUTSJ71b4QlDafb0vj8pJE3TGazAf5wOnAc8x7840H3RmYaZ
         ljVg==
X-Forwarded-Encrypted: i=1; AJvYcCXT5uzxynDmuyucSyVNB7vArYi4K1LVAfqe/jC59DscWrdBzQyitQWRxxyjpIbPvUy4Bxnj3JoW9WrVW5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJ4m4uQ+wmnZPIZ1i01+Fd9b5rX76ReZxzFWIEISEIr8sje+9
	Jv7N1vE6sKqOJoV7icqAmyA55OICLDpe3FiDbwQQ2TcFnnhEEAOK0Ahv
X-Gm-Gg: AZuq6aLaQKSzl6+kijlOh+6abyE77TGmBgo1uQn2PXTkyccN/ZQeD+rwZkuTSsxh0uC
	5YVuHgPIeQJL96VlAZAKYhruyvpdFqCqbw4gFGw6oiIXiWvZZYatLs1kyUF3lu/8WKD/baOoc5Q
	r5D8GKc1Krkv3lGVJ67KEPG4AkvcWONDPMEtyx/TSaVAKv8qWKvMtxI+Ckpd3UL5bsPmLmYsZ9a
	FtWu6cNUUIlW3hlsswgnRZnQn3QflLcu7gCdwUd3npyku71mMEzTkxYTrZq+52bqDSDMmsld3yR
	v0Dehb/A8d99uHSJSFF55H5Ju24xlwQqC8MDKAnoM9JORrC6H+sX/ZnxjYzB14m89PDUhp15mYC
	5jwUTvXaeZBywK+WYGerv5/MpETV4RFNyjKt+ZhtjSwNoYzyGjkO6+kKjs2NHCEPAm4Oc8g1czS
	nWkMM=
X-Received: by 2002:a17:903:2b07:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a8d96b1051mr138969065ad.20.1770050776360;
        Mon, 02 Feb 2026 08:46:16 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd74e9bbsm129294195ad.95.2026.02.02.08.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:46:16 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	charmitro@posteo.net,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	mlksvender@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v2] rust: Makefile: bound rustdoc workaround to affected versions
Date: Tue,  3 Feb 2026 10:46:13 +0900
Message-ID: <20260203014613.2708234-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
References: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	DATE_IN_FUTURE(4.00)[8];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-10973-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,gmail.com,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mlksvender@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB1EECF49D
X-Rspamd-Action: no action

On Mon, 3 Feb 2026, Miguel Ojeda wrote:
> On Mon, Feb 3, 2025 at 1:09 AM HeeSu Kim <mlksvender@gmail.com> wrote:
> >
> > The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
> > handle a rustdoc bug (rust-lang/rust#144521) where target modifiers
> > were not properly saved.
> >
> > This bug was fixed in Rust 1.90.0 (rust-lang/rust#144523). Restrict
>
> We tend to use `Link:` tags for these. Typically we write a line like:
>
>     Link: https://github.com/rust-lang/rust/issues/144521
>
> If you want to reference it inline, you can also just put the full URL.
>
> > Suggested-by: Gary Guo <gary@garyguo.net>
>
> Please add a `Link:` tag after this one pointing to his message.
>
> > Fixes: abbf9a449441 ("rust: workaround `rustdoc` target modifiers bug")
>
> I am not so sure this is a fix -- after all, when you use `1.88` or
> `1.89`, nothing would change. So it is more of a feature? i.e. the
> ability to use `1.90`.
>
> But I guess it could also be understood as "we should have applied
> this only for affected versions to begin with", but then it would be
> from a "code documentation" perspective, which is fine, but it is not
> something that e.g. we would need to backport. So I am leaning towards
> not having a `Fixes:` here.
>
> And this has another issue (though a different patch): the `sanitizer`
> modifier.
>
> By the way, I wonder if we would want at least a `rustc-max-version`
> (or an `-until` variant, or whatever) so that we can easily express
> that range in a single call, and document the bounds together (I could
> imagine that we could end up with a few of these over time, and then
> they start to shift versions, they get spread across lines, etc.).
>
> Perhaps the Kbuild maintainers can comment on whether that would be a
> good idea or whether they already have something.
>
> Cheers,
> Miguel

Thanks for the detailed feedback.

For v3, I will:
- Use full Link: tags for GitHub references instead of shorthand
- Add Link: tag after Suggested-by pointing to Gary's lore message
- Remove the Fixes: tag
- Add Cc: stable@vger.kernel.org # Useful in 6.18.y and later.

Regarding rustc-max-version, it would be useful for reading the code.
I'll wait for Kbuild maintainers' reply.

Best regards,
HeeSu Kim

