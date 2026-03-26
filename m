Return-Path: <linux-kbuild+bounces-12283-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEYlBTA7xWn/8AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12283-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 14:57:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE945336641
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 14:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A74933103312
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 13:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054342F12CE;
	Thu, 26 Mar 2026 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fI2GbrqY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4D2DA769
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532874; cv=pass; b=ZAu9OPzRfDTUQdHjXm97PSVEWJ7vdjZlD2VEWid8ko2Wv6fxv5FWDTlc1tx4xkDIX7AQ9eRdG8nvvmLGeHxQbYau2wy/msghOZA/MtzAnBlb5ei4m3lwQ8Z1l1YiAS++JwDmBlmyqV1nL3rlbN+zrtQZmRIqht+VmQiNuP0p7wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532874; c=relaxed/simple;
	bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZgvebJi6xPc50oIjVUkfGQ7ez9YiyL6AmnE+B0p3MGSWoEPMucPgPwMCvgz0qXPfWArO8nH3mIJPE9EeW3z8ZEeU9B59jFJMOBU/Nm5bsrvv3HNyGAyWcQOEzBBeBu4ZRzamSdfJhedk+b89BfGp/xUcuXjAbH5GK0SWI5D1CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fI2GbrqY; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bda3b4318dso102094eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 06:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774532873; cv=none;
        d=google.com; s=arc-20240605;
        b=UpPHaBlCMIM2X9rSxw4xE/CU5dSkTAx60vjc3Dgcn8NGiIgt2b9riMGnTdiG40ROhh
         r6kLhrNOvFMTU+rIy9JNK0jh7uzRvb+DE5m/fQL+ugrZHQZsCaG4zUxnOy/aZxyT5W9N
         V0IJzdeBHYXNCbAoOEgLLlK7MYYGGT3KS0oH75PZEMJSV229WcUfZci/Je2Dq6GgJ3Bi
         EUYydDIfPPfCKPGTPLLxOeP6tcdsE185WI1DUGljyRqpC9PLhCfqZLkMg0x6asCLX831
         A8fYRO0kO8aS/Fj6dfkeK7aQ5I26fxrRLGQ1vImJWWkc7Ku98CimUF6mPXwoPlBMDq/h
         NYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        fh=0avshZgQcE5r8DpYAj6MFdJ3g2L7jy0GAfrJI5XxKv0=;
        b=KIwRasRTsQdGVosdXMPl9a3OMBRzc2rlWTI9muKzFfAkA4WjUbD3wU14dz4TgUzk5b
         MMYXRUGILenZ4oC3zHSOtXGAMbf4DuQnOsOdYYKVetzvd+LJbkPD7h8K9d0r8193J3rv
         OVIJdM3khpWuFBURXIHggvtQPWQg/RqtNZIJ0BzhjZK3rJ1BJgADCzClT1ciilcGxIdq
         wOFpjo13S1Gsq2N+XQ8vIrv8ue8rv4xnTKkzz+zst8btM0MxLoZ1qZhq5FG06u5OhvSG
         xs0HpZQJUYWKKfSBH9/+yYddOrbJXvAjX/EQ6xPrFnq4GdB27/42pE4RE6IBVp/PCF24
         b/Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532873; x=1775137673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        b=fI2GbrqY+FKMq/Yhjn1+J7rikfGysJyAQrvZWzvQqfnY75bZWstkrpjLrfSOwvGzyC
         P2nynUMumF69eA3lhgAEBvvs6w7XOjVZUdwCEyu0CqZgDFVp4iuOW1qaFYUzaelrMMmn
         sKunTY9dctcIaFjXGYQ8jPaPevQys7cBNYEDvxaHo5K9ChROR6q2sbVBKqqrmLc8L9TR
         5BMe1zhdk0gujENlUYhbpn7JXmJ+tqvnW5yE5j7OZi8xRskaT8/vThoh/46S1/Z57ChP
         3WGVMYLlXJPJ+o55Xvv90mgX75kczcG7DbtVDOfZ+7acTwN0O1o3lGDeNE78NAWRJlv9
         Wu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532873; x=1775137673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        b=KO8T9FGiOs4z+pB7l5BmIxrdcFBf3bGJ4ou0GgTmd/yVmj1jGDSSZLz9q7DYk8EKYx
         7B4gYa4V4nRPQl7r4Vpg1L/19exGyMAC0XjmNhDQvHbpdvB0sMY5UkVl6U8kGZ9F8BOG
         ukvDlYMtKyfxdQeIkSr3xjWWlTIv6vk3a3bP8WibZEjNysdHH6uH4aF4Bcg52WBbuRRF
         tbz49dSYy9fO+COb1DZCODkSL0oEVug8i6VpHfzrgnK/YrtMCwMyb/2HH5ZxsVtvJT9l
         Y18A2QE7RVpaYDBj+xCdN+plufIVrAfWrv0tB+LSxI7SgM3VWVI/dkoqkzA5KgZ65Hc1
         3tcA==
X-Forwarded-Encrypted: i=1; AJvYcCX0rGZrH5M3KrNNm3nLLqOga6I7ghWCc4bNTBN4rSyUan7PUiRI5teUYR7rZL5z0lJp2nLsSeS0SoMXtsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCSnQgwlddpK9/14i3hnyEwaAAy8fr4NjoO9okN8xQrk8hKxbW
	q650Egl9ltqBrVAx2S3f9/XepJDh0TiKer8yHzPUBLpnu0dNzAVkYL2mMXO32FfI5l+FjKdDJFR
	4bMX/SlD1dyUNT4wKEcVXzgmQeDkV/hw=
X-Gm-Gg: ATEYQzwJ6eB8wSxjFebPvZNwBTzpINsHnqEvGrHNhqImJFr6bCgbFuMW/iKCKdB9Hr4
	JgUyFSfIFfXdntpEP7Oa/IPuhqDGDJX6eLkqfrSc4D7WWO68qewT/kGiyvuN32x7NgJx+YAtj5r
	C/eP7jrtOptxkv7A41Z4nhUcJxlJR5Wxn2HGBGi0K9bB0zuXQBxp9nABwbwrTZvJTeQWsBrBSDR
	euXqX5AceDjqE09nWBXXlg+NrWkiPXf0C8f6c5+Opl4P1zeGRcaOFLdO8mJgxGby9IhYgblc29p
	zP3UB0qQlSY7E04rYrWLJi89IPa11lHR/ewycoEiiclA22VJe6iPNdwY4U08+OET+7LuascoPUQ
	UGZGTEoI5r+auRykTv5P8vuk=
X-Received: by 2002:a05:7301:5f8a:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2c15d282067mr2176054eec.2.1774532872905; Thu, 26 Mar 2026
 06:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
In-Reply-To: <acUGAsjYvNvTEO92@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 14:47:40 +0100
X-Gm-Features: AQROBzCEnROF6sNSCO8peAhuS8KhaF6UHZKXXIBMm9aT2zIjtnika7P390Hajek
Message-ID: <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Alice Ryhl <aliceryhl@google.com>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12283-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[google.com,gmail.com,kernel.org,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[armlinux.org.uk,kernel.org,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,google.com,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BE945336641
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 11:10=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
> target. It should probably not be -linux target to avoid this? Probably
> it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
> CPU_32v7, so we should not need to consider the other variants.

I think Christian tried several targets back then and eventually
picked that one.

Christian: what was the reason to pick the `-linux-` one? e.g. was
there something you wanted to rely on that target spec that you
couldn't enable or disable via `rustc` flags or similar?

Cc'ing a few folks.

Thanks!

Cheers,
Miguel

