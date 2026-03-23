Return-Path: <linux-kbuild+bounces-12160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEhLK9VBwWmqRwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12160-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:36:21 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495E2F30AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E61373034B15
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 13:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402CD3AA4F1;
	Mon, 23 Mar 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wm2uDFrT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B593399360
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272378; cv=pass; b=q+WZEHSnFLL1GIGzrieTrEMKdX4UREEmj5hq9kMyF95clFxYlu/8TiqO7JHbk1U4QrMiYqDNmfhWrdKyFgxbdnYH8iq1+ul6bN6SiqGhKGOFLA5SDGNiWzlKid0J97zxr7CuEd7sX8JOCRhw+hpOYxePsABkX19NM9HSj9xi2vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272378; c=relaxed/simple;
	bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9ePNe27jI630fQRfuJdwhpfczCshw+fzKKAhbcVg+CaEaZkEUqL2l5m7R3QFsDAbJPo2UOE9FSJs5CI2wZLIFLVLRz1GDJ1HM/hAbkF7cwraIgnxSniM0sS3hg9QyEFmbX9a2kyetetiovqc4JdlVfyawPgRSNjOd6pF27yPEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wm2uDFrT; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128bae6a35aso264140c88.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 06:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272376; cv=none;
        d=google.com; s=arc-20240605;
        b=OuOuHjfM9Cjt475Tz3jF0j4wZVGaLv2sbZygd0ZiB/JY3ZaZlf4N7y6hCFteig7MEz
         +W52jyo9ImbHySWZCi5T/E54NAYU8OWSTUMa2VB9GXgY01/EVD/wO07J8C7tTvR7rNiY
         Suc/Rmau2TUOHmbIxRimu3ay00kYEwZEwrl6VDbn1Pi/xBYfwF51WJsvV8Uqwg6yzIXx
         TZQQWReBGJ9UhRCsXoMk/Ogbv7Ed5f4gRVBsMD7E4hzCxBPj42pMQSg0vRkTxZT13OXQ
         QCrabI7Um2W6VLM0de6yVulsgwmUQormWk+w8TOLHFbXR02f5Un8fMc6gOHEmEZOMtmB
         HTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        fh=ARKRGRnEEjOHicvXvU6BzSB/qP6eWHKxv1LKpKkalcg=;
        b=FpRweemxgGid2Tw+BdqMJc1vW9uoV25EtnLu/4wnEDX0MXyQm49DYU+ivq0l2ekTUK
         KaleX+xNXjib7Zh3rnbtv4byas0qUaELVISsaiFS2HMcMtHtJH97J7z5juFDBa6ILi43
         8Wj7Y62xewPmu8ozPzDBCnf5CUmSU1KgyLZg8jg1risYyJskNHz1K7ezm89KratZf6gZ
         XJTlyRcB9D5oC926c8Hhv9Lt/0XnVLRD2LDAvW861jEWiPvKEtg62PpdzsfYBLTRjjFZ
         LWAiMD0u6aLOA5PVlXu+3znuXbEppYaIlqr6tWlmXqsM26ASYEzniWV/etk0z3a9QnMg
         YZ7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272376; x=1774877176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        b=Wm2uDFrT+eRpmlFnS/Hvf5z5vwv60QhSHnQXFhZ7CgtCXAspWKceeMpqTtlA3K5igQ
         o1UfOOWc2pmTwXpZRzmw5xx95bQ5adkP89+3Ta0B+lt/xxr0rxkucUJmbJ9r1kx3A3hd
         HM/8yaXNCrAjLKofYaIwafFSdlPY3vHuFYb4EPjmusRRmBI1AuCK1C87x3qzhuNJmv3y
         VMQeOWY1l0DtnfvhiGO+Ei/XWTGZJjBfuN4n+/EVn/ZBBMYTX9jKqsiPZ9UiCL2CvLX4
         MZ9SnY8RhLOzeLIvMFn4NAk6AUsk7ui3l9ycWl3EPBxr38r9bXEQ4mYcJATjmzcOHTDT
         AgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272376; x=1774877176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        b=fzKHNH+vEIWvv/LukL0GekaaNG+rSAyMbk4X/JxDZB+aml/qBGrqY2VX4Yt3SxaeWq
         PwyXXNyvw+pLKbqe96eUN6SQu+x5Lip+lg5983i/B14Y66e1aXo7rjNKNPWfnAuHZfUU
         31UrpUMbNRsk0qqQV8CazbNyJ6qwvfjH/GyXTQf6bYI8lEWQl6vSfb9AGuusd+uO86dS
         XUHGBUoLKyVEB22nntjaAWOG6wlymx2U8Txg0EHtRNo/CPoh/Y1uTXN/vNi8rczA5ZBw
         Wi/zKy113VEKijnfx8PvRhfWsnlcjozx6lyNHIv332zE45CMDXXoU5Yv4OvURTFfUNiR
         v9dw==
X-Forwarded-Encrypted: i=1; AJvYcCWsYgDx+apsec7LHtc7HUin+RkErDvKXBXUzxEbYipIQSmwz5gApTH6UsCh7lOXCJF8zyrce9cw1WkAD3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YygjgOfZfhyR49f+a61v2eFQ+0QLvZMIo7sI0Cz5CzJqCbzeSGl
	raEWS/jb3QnP0dOZi1LLRnVC52iphvE5myv08Cd7kxlm1okS0zzxnoF2rpP367RCoQgDxkH/k5g
	VQvnM9gtbUYZRXtqn/iapA0812zqNh9w=
X-Gm-Gg: ATEYQzzXKQQ74gpOUcFIJSpxeimCvpct0ydFrxEkoA4nPKhJjyS8q2YQ4KvQT1PP9hG
	CLy/DI5p0fo5kYnvHABig319rKNmKFb/YU9vsELuNw+Tln2u07eWgR+tpFV8rK+T4qL7ZcN30cF
	CiEhUF4T6a3ag26vmqRFEwJw05mAdHzZL6WouZkZQTQTZb/SRop97pLJI7GJIbaTFmmuxpsQcmT
	HWZSHaXG/9TWAG9r1hIhBeYhYTXsEVNtYX+YKtWs8nlxI8qbQ5Ek7CAbEBnpbkpr3zFfndZk37D
	NhnoWzcOHyrlfX5QE/yCOuU59uTNvruCrSkn3vQWr5+EC8KzNDKttAzT5sxFEQR2qjp9R2XoBdv
	rCPEPNR6vzHdoz0dCi9H5Kf1N5BAfi1rwDA==
X-Received: by 2002:a05:7300:3215:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c109938d44mr2298180eec.8.1774272376046; Mon, 23 Mar 2026
 06:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
In-Reply-To: <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:26:02 +0100
X-Gm-Features: AQROBzD3BkPQaIE4qxn0GaZ9qpo8tZ7H6ULFyxikznbiRv24VDJjkNXoA95umyo
Message-ID: <CANiq72=dh=jTORtmHfv3Z56qJoK4K-0Bpzew7CTYn1qO+sR9_w@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12160-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1495E2F30AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:03=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Why is Rust generating code for userspace thread accessors for kernel
> space, where userspace threads are meaningless. This is totally wrong.
> The kernel must not reference __aeabi_read_tp().
>
> Note: I know nothing about Rust, but I know enough to say the above is
> pointing to a fundamental issue in Rust for 32-bit ARM.

If it happens outside this patch series (i.e. the new opt-in mode),
then yeah, something is broken.

That is why I proposed to gate this new mode to the
architectures/configs where it is known to be OK (and where
maintainers may be OK with it etc.).

Cheers,
Miguel

