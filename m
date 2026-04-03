Return-Path: <linux-kbuild+bounces-12627-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IFPJ+xJz2m9uwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12627-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 07:02:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE4390FF6
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 07:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BCF8301D49C
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 05:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFC62877E8;
	Fri,  3 Apr 2026 05:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7WonNGD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8A21EE03D
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Apr 2026 05:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775192550; cv=pass; b=gjp7qE+HhmH2oTfBm47a+MreFoMCVRutypnGvQe8HU16a6NjlhP1QLsK4Nkhe850qxsBXegPTudr9DS057902kMXDaSLMimrQnJIIP+rN5XPIalpdWtBmFwULTLJRZFLaBLwpM0/ms6omw6tu5zY3MiAOXesJqoDQ2jBwv9Kock=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775192550; c=relaxed/simple;
	bh=i7LG7WVLotIAfEJyQ5yIMhIvpukdW6Pq0bA5sjiBmFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snJt7pNM6kl+aqyn58acZfDzDhfR66D0/2aCGcE65F5ZTQzTHVjel6dj6ZdxuO6gzwyt/27GQYVUzQpUimMI8OXPO1cvWc3Llc2McNxlhtiQ5okZB2AkHvnqVwaIWrIPQJHDDYJjNl2JY6pqzwoTuvaK8DspDXgZyS6cwqPTaSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7WonNGD; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b8095668ebso114707eec.2
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 22:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775192549; cv=none;
        d=google.com; s=arc-20240605;
        b=e7JbV+RR76eGKq/zQXSq+FCtiktgbZ2HKcsA8hBXXe/0SOahMAuQOnjMT6bEztWl2o
         weUdeu243vt7RsNvo2DbRrEEtcjoa5+A3pw45AgFuOejxsF0yvBjSXYLKzMx/0nKVixJ
         GQRspr+suqq008PYZjvKbiwqQxyGfOjjJ5F+UoV3G8SDuzUOg3zdOipfwXC0lGbWyjrz
         PSt3BffeinM8lmsv0PLdnJHq40+hSXwaDzNY1HuWZkN3hv1Mukti2PB6knknptAlthFx
         hBJyhPRdafPO1krD47qwhOB99geuY9HO1GFnETGaGVjB4u1bltW+CLTAPllAxR8dyPTi
         Mw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VT5X+dKC6n3IqZ3uOSrTarCGYIJN54lVZ+LFd2nINF0=;
        fh=aEaN/Kk42vcvMQP+t5aFtVFc6dQsOVWL6bxS6ReYrGg=;
        b=Wat38oKjf32h+jMGn5HvOG7mNTr/c0UGUxTpFI8QfBWYJzGy739XWJ14xgn2GMClq8
         ZJBuR38sCXHCWs8Hp8Xu/urw1OXwUyyTd55jn+KF4H9D0Jgw7NNExiTpUyegkseGWm6u
         mffxs949bKc0BmGkWy2WGV6auic/RYMmtHJ74Y83NxB2X3p5sX+sgNDsq9XssZ94+pDz
         jzJKZlvcLEebjzcZXCy3bDVpO7K9gKskEqPqHdcEkMGMp3McF8Z/CWLiNU0BReBPOyDz
         UY4EWO0XDuqKeekY8NwCuzjErc50rhecocvWqgfCr+xhkYAXxfBkeGrAVY/2+1u5P9t+
         v18A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775192549; x=1775797349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT5X+dKC6n3IqZ3uOSrTarCGYIJN54lVZ+LFd2nINF0=;
        b=E7WonNGDNs5TE6dWIbqAbXlSIIogm3biCdHvYgRFh77uvBxaMUMLJ3t6r0tOU9dkQY
         3qgKsH5zfeaVtn8jFmw3X7k6aFtYGHZvcIcT7WNQBJQDYUSlzjA7kSJW6Nk1IzD9uWaL
         8dSLV9J3oO4p23xbMTF4mMNgXKMmZb8D//4RG80qfdpUiJNaaAw53hsJXGuyNkt4BGa4
         GOemaGhGgBBr8xZ1ZENioHCOp0hAeuL3Qr6JESw34Is03aYNMx4E1LMKf2t6n1fez/tM
         L01pv35RIr5qUhQjv9Ab2jOr0ciWGy23/X6BW4AMcclBM+kDDyNiFu+L0HDocuo48iAJ
         Z+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775192549; x=1775797349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VT5X+dKC6n3IqZ3uOSrTarCGYIJN54lVZ+LFd2nINF0=;
        b=ABNhyEZuD3ZbwBhMeASbqQXA2YnuTHJMGBCBOOOwsRhFWI2biu7VyKP4HRz/uWHzyO
         7NAkytUlkCOZRhrv+bRPh3oUPDMxfed0vU7HUaiH42syCYn6uqFt7cKTEKWc6ztaIcSO
         K2n24FFkfnkhKFtbV/HF79dJoyEtEhuNkgeKeyE+UXvuKYNuO0YGuDe/cnq1P58fUs+L
         FjC/XvJz7rChalrDoHndgUjzPt/Tk3XCXpTl3kV/HIU/vPK26OWQgaC76TB4ZMJzWxnm
         mujfIjNb8cuNJTCSNMkVdgyaeHBZhwCIgge0fJTe5R9efqkTIv22LZd9qB+Vk6QyXLe9
         ppOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoW9ZGguwPqzHcjc8Di9x9p22pVE2hFBRywm1A1PP36Gma+Qm8ZU0cA3VvlPc26Xi2k+vhZavArHl6Ou0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYtHEVMKpe1iG8Iwcrh/JJHG0sFn4Xu8gLtlZVktaqRCU/4AE7
	AQIMic/n1X0H1A9SlZRvekU7JqyyeaqLm4VY7/2MBh35JtKYqG1LKjpQFoaH0wAgWlCk63IY+gR
	GZuENIUc48dHgCkh9TLe713BVcNHo/bM=
X-Gm-Gg: AeBDiesl3o5Y6Ck2Bpn6WIGxt3dIBnegszSi/9OEodi75q1Ie1kvNBzgv13bQwOY5fR
	nISwc38PXkuTz0ckLJW9QHw36kShdaPx+h7HtGAd75b2ZiJKuqDaBaPSIYpvY2PJqIdSbF7wFRY
	zl8OOy4Gt9fubC2VZ5RbFvF2WQzXVnJGijvs5wjl6s/d19u9K2cw5Vbj9K4qe6ghQh0FLGF8TVW
	gGNV2EgQ5lYnGB8FBg4iGB9Kuyq1MJA5/5aZJcYiWGiskqwhSSbN/va8p1Lh/8O+zCCHdf0XDXO
	+VW7PyM1GpHbi+PkLWYLmrKTxzhuK5kbWrJ3QUd187/Ax5Sczf/LuS2V5xCuIxSH1yMfLlwwMtP
	p/976aMZ6T7HqduMXcr6+38M=
X-Received: by 2002:a05:693c:414e:10b0:2cc:5eb3:1bef with SMTP id
 5a478bee46e88-2cc5eb33392mr93762eec.8.1775192548678; Thu, 02 Apr 2026
 22:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
In-Reply-To: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 07:02:15 +0200
X-Gm-Features: AQROBzCLkIhzg9zAkotab4uQuB7e2H78CnQz7FhuaVKW1iyHFMCBt1gLFYLInDY
Message-ID: <CANiq72nLAqkMbiNcExVnYZxLN1g7tr4EZpUj_pwvWrjR+zaoLA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rust: add AutoFDO support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12627-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A1AE4390FF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This patch enables AutoFDO build support for Rust code within the Linux
> kernel. This allows Rust code to be profiled and optimized based on the
> profile.
>
> The RUSTFLAGS variable was suffixed with *_AUTOFDO_CLANG to match the
> naming of the config option, which is called CONFIG_AUTOFDO_CLANG.
>
> This implementation has been verified in Android, first by inspecting
> the object files and confirming that they look correct. After that,
> it was verified as below:
>
> 1. Running the binderAddInts benchmark [1] with Rust Binder built as
>    rust_binder.ko module, using a Pixel 9 Pro.
> 2. Collecting a profile on an Pixel 10 Pro XL using the app-launch
>    benchmark, which starts different apps many times, on a device with
>    Rust Binder as a built-in kernel module. (C Binder was not present on
>    the device.)
> 3. Using the collected profile, run the binderAddInts benchmark again
>    with Rust Binder built both as a rust_binder.ko module, and as a
>    built-in kernel module.
> 4. In both cases, Rust Binder without AutoFDO was approximately 13%
>    slower than the AutoFDO optimized version. Built-in vs .ko did not
>    make a measurable performance difference.
>
> All of the above was verified in conjuction with my helpers inlining
> series [2], which confirmed that this worked correctly for helpers too
> once [3] was fixed in the helpers inlining series.
>
> Link: https://android.googlesource.com/platform/system/extras/+/920f089/t=
ests/binder/benchmarks/binderAddInts.cpp [1]
> Link: https://lore.kernel.org/r/20260203-inline-helpers-v2-0-beb8547a03c9=
@google.com [2]
> Link: https://lore.kernel.org/r/aasPsbMEsX6iGUl8@google.com [3]
> Reviewed-by: Rong Xu <xur@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

If Rong/Han or Kbuild want to pick this up, then:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, please let me know -- thanks!

Cheers,
Miguel

