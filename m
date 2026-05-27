Return-Path: <linux-kbuild+bounces-13348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PzDFpzKFmr7sAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13348-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 12:42:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEAD5E2E39
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 12:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4614F30180A7
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 10:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5313F0AA0;
	Wed, 27 May 2026 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1QFjj8R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99553B5F63
	for <linux-kbuild@vger.kernel.org>; Wed, 27 May 2026 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878421; cv=pass; b=X6pxGQQpH5f3YYxS61FwW/ic2OIf4KtX2XP+hC+Yrop4WTFb9M28WzJnvcmqtjQc1bKbmDBnzYK1R30AN7yFZDQtQxZc26HmhY0PJRCCNha4N3J1WfW2R5z8XhIrtmy4vFbIzt/Cq2R0nLBRmdLjOp1Dlt9ialqQa2dZ70cy/AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878421; c=relaxed/simple;
	bh=LhCXi4ynK9XsA8U6wxzibm+NlbudUtrg1uXfOjcIuiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qp4muarcRHJ/ggypFQ0i9AAHZ04yPpU1YwwhPjYh69Hk8VVLC9nhnP+6dusQmZNreRdFBv1yQ2HIXrnTzGFJxIcQfiYaQgdOivomvbd3uJ4iZKx2ITt3VSwAB3JUjEDi3qjbjhNCOJTwKIUQrHLv8+ubBiZIEMslz4rgrJXehUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1QFjj8R; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f24905306dso1222396eec.2
        for <linux-kbuild@vger.kernel.org>; Wed, 27 May 2026 03:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779878419; cv=none;
        d=google.com; s=arc-20240605;
        b=GJFO5k6Pw0sq8uiWUcQiak/2cDQgQEqLrfJ92miceewbo9Wmu8+69l9Y9Uu4JlTV5P
         HzkcgR04fikARha9Xe415ByJ8vNwxQCb4QBx2I4I35QJR6ybRTYsdo8xGZfvCdkeNVxr
         rxpiuuhpsxVGefypi/3Jw7zahD8mmUz40RBVxNL70VB4Dv1rmTBVWTj7cgBDO6PYsmG2
         pvzz2W2lrX7eEmvekGVg3q9koawX3gcYloMb9gG9ezhlxaJPDykd3Q0t9kCrFuB+JYUD
         yAU6ZBzMs76R5xn6STyXR+CspK2s1jqp2PUXgSiQgJ+MNTehhrk4KzniMXcprB0+RRPo
         gJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XAZGaiOcB8aA7+J6WwMe16xHR2exTZJ0kI7DGbdbJ8w=;
        fh=l/FWtrlN3sULx0vN/1jimb6HEGlLxQ2LO83xGVigK0Q=;
        b=S+erPgrWnLzkNeq8rjjDg34BzNv4PHwMPeDEVTAVwd8wCzPJXIR/c9LQy5yp87ebwA
         EVVZKcWoUMQTu7C+QY/TQXWjT7CUiUvJgVQ/DqSMZ8o++hRzyTtUXMGhQiRWv3GSxd22
         M3SSL9SMM4Feq7Rs4DLBhLt718mcGMo/JyFRgnOvfRaJoXo33hgLZIDyQmy5PBoJTdEz
         +6kHZCa+wpUWGHMwZsO133BM19WUnU7vfvSXJGP1tfOVaN059XIjHL+ewoBa+3Oj+hNx
         gBz9zOvaEZ0Pe24uIzxCVBoXhenwNbvz6xPbBX3nXOHGPrjKxwpawldUpIeeQSTvp6fn
         0ZuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779878419; x=1780483219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAZGaiOcB8aA7+J6WwMe16xHR2exTZJ0kI7DGbdbJ8w=;
        b=A1QFjj8RSS3HN2IetGqFVjkSZR/GUSCG5narJ+g15TF8BkLbsndoJCKWYpxJGRBaoo
         zcyuVALarnDfyZsBG2hdt1i9MyJbGe8KbMGKXMJvKTKwRcx8BkbzRrYYIDCVF/9zVan/
         UPaWA8ckp4SMybGAmWzAv/cT8NoKrBNB/GmnvNwIqNbbTdISxhQ0xtGykb1t9RPFKFdW
         Y3NHck6ISRD+1ZBh4QERBvLDrmKlszBdmwLNSoF0LMka93x9cfPacXovzkCGFiCkXzEa
         jRCex4gVeAb/YDoTi1d7QJ9lAVqxqlgDdai9yBH8gpslXnY5+fWlKGnBVUQavrw1j1cQ
         nvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878419; x=1780483219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAZGaiOcB8aA7+J6WwMe16xHR2exTZJ0kI7DGbdbJ8w=;
        b=Ub2WiEkZmirO9C9Q2g6sJZS6QkU1jUSSB9PUsnlWDfx0d5hGm6O9BlfNTtwNKHaj0H
         R1cXBtELjiZE3Zjpud1cRBgO/5zESZRFpuj+aZ5A78kee/eTOmazTwSBBLsy4AwsgvE/
         SKqsaV3GpO3QHG1Qirigbk1BGAbwS59fX1z/9sQx7LLoLRIFRGJKlkKMHhkwd3liQ1a7
         JG3Dzda6t4OSAQMjjtAsq9MpHOSRYCyp7vXycmrxVoDxGQg7GjD3eMYGLT1kCXkHrIau
         3CG4KqbBXNEovz/eU4AKl2hbkANV+3rFtwiWw6VksnEBOsEYU7kbViiUolH2EkzVz8MF
         P/rg==
X-Forwarded-Encrypted: i=1; AFNElJ//O0BZfGj0HdcAKUuv1mBGWJ2wC4Xn41QCHPLqkCNxxYpD/TdiYdBNw1X/wi5oOBatggLN24LpN3OyMow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUlduhkqozMm6AZQ4/SfgPUph8vgGur+yxuQO8x96T2yn6t4Os
	MZBkW/gmo/0dVNFvTvEjOYl1J5mJ4XNH8s+MkmTUUsq0ZhJzgllwb+OHHRe5SmAwmM1DB0t41ay
	j+8pB+5DkEiXoRMlgM39SeHI2KehvDMQ=
X-Gm-Gg: Acq92OFcFl7EgkRqP4o5UmiiJZwIe0Rsaus56Zth/j+OoN17nwkhoeDRXs9wLuQ50Ye
	GG11Vhq3sWaF1sFE1MNOHHDTvgcpvProbUWPsXeHJ8hNM7CcmED77s/CaT99ysKH9UJygTxFbbG
	8X8CuldjlAzSYxEZuwiwNn6y04SqU4ttJtoebSEd2LRZ2EuJQiCdHoOKe3rZDP0pvQ4PCLQOl7Z
	8c8HhwaDoCzILhedxy8yJHh/mhdU77KS+FUw32QjB2eHy59JbGfa0pSHJ9ishPae4sAvoD0Os23
	t1cpDG4jDboFGja3t2ib9PFWqowS19EQiEMpCpD3A3V2GOAJzeveCbJP4Sc302EXr1adCDIj7eM
	XBMH+md/L/o0GgZZDA8ItR1lBQ2rP/bu9bg==
X-Received: by 2002:a05:7300:df44:b0:2e6:b55a:76c9 with SMTP id
 5a478bee46e88-30448cf0ceamr4288580eec.0.1779878418948; Wed, 27 May 2026
 03:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
In-Reply-To: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 12:40:05 +0200
X-Gm-Features: AVHnY4Lql03NZTymv80RmbDD7yYVLqeinfGjlCtjAB7LSrDOuZONN1IjPFX-Kg4
Message-ID: <CANiq72mEdCtw7YoddMBuZTpMv6EUZ68KiX1qpfEOtfwh0dT-HA@mail.gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13348-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,googlesource.com:url,mail.gmail.com:mid,garyguo.net:email]
X-Rspamd-Queue-Id: AAEAD5E2E39
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

Applied to `rust-next` -- thanks everyone!

    [ Reworded for typos. - Miguel ]

I also tested with a merge of `rust-fixes` + cross-compile + etc.

Cheers,
Miguel

