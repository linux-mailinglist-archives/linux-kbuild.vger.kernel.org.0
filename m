Return-Path: <linux-kbuild+bounces-12641-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBWlAAa50mlEaAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12641-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:33:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1B39F744
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DB5E302835C
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 19:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF172F7462;
	Sun,  5 Apr 2026 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVCEwxRe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FB72F532F
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Apr 2026 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417496; cv=pass; b=P9XX4lSPC9nBUU73HumFDE9mthzWOnRq/BX8pRO3p71R1qcSlQtXSxouK8+XeG0aA4+UhUkQ2cmDXCX1LQxJ2Ka9ouCMlBbFMQgt2SAy1FtLLut3nywnsjUt7QdM8dyGZD1vHyzfqi3MYd71HWRPvWGgESPLoRxLiiXnlHeZamA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417496; c=relaxed/simple;
	bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHa1jc3KXbXCVu5JIKhbKvDuo2/luW33/j8SQSDeG4+ZLetJBJWM3V1gcvp3ZBmwgNvsC+qlLWBaKKtiacRv6IAyiTCY/jSVDND0BvWVUBRhiDiHkABlba0UGpaz600JyjIOdvcZ1gCnI+qQavNp1g55KtiL5+QuUQKZ/1N2RWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVCEwxRe; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ce4b60f855so34089eec.2
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Apr 2026 12:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417495; cv=none;
        d=google.com; s=arc-20240605;
        b=MHOf8qm7qJZdw564Y144IEzGYfiVUNBCFeZU+4Xwl0IqcYDqd/LeAc8d2dmEz0cSSj
         B6fvfNDeHnVNfjlq8F9v8qIdDEt4Ipobb8UeSunKZerbVGG00GDQU3VFA46d/zJUNVfO
         eBHMfozDMgNu1LRE2di0/g+jwqBPfTJ4tkqU2RHfSARUdy3YtAE0mNnqO4cVK9wHp/Bk
         EbshuFZ6ww2VvabR2a5rrPxykSd4oi2FFuGkWWZ9s0Lpr1Iioh6JvSrODSxuFFHGCd63
         +z5NBq1YagwTsA2GWIXaeFBHlTM5bpIO0dDGJvSAClF7yzBg2SPK0gmCXy7xDdF+haMB
         taqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        fh=qACJW4AmFAHgDbmhtv+KpRn+e/KDHh0LsKvCUWCkk4w=;
        b=haoXOAgeCozfwbxbZIwFTG+BjH9rDcXGffHCeSx2kmHfhoOzzzSl2p9yb/z4XHoiDF
         CqhRkJhJJO/ePjHlY7M+aohyldatgm1OZeDxdWS/SoEDbTdHT9ET4To1td5G2t2G/Xzl
         O1ooq9qZfGrUUmX0H+GiDHsrfcslf3BfJk+ysKZQJo5hKN1sknfXNM7gsj4WmKJFEeTJ
         /i/7gqPAa3ZpSm18BKHsU2zWiNaWwITJ1XNFBa6d6b0mwv3gLwECL1nZIqIZGJYnpgCw
         xVfHaUmRVqmrIFnT9MsigQkbVF2x4G6oVyagZE7RuLV5b2N+ThVK2WURfT4SNJlHT8TP
         NEcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417495; x=1776022295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=lVCEwxReXi9mN7cmASayUr5PgOSdAvJhNeYBKcnYoLBzpIgT0TuwJ/Jk3k0JnGksn9
         LPLA3K3hqKAwZ1+Gu0W8fbUQE7/Wf/eIofzPngWRiYCxfRQ15HFeQRREpXcs19Fk93cS
         AtImrKZrFpPYme34oYo9XVkw75r/UkbvOYlYg1wBNtM3FO5qvq/+NCimsomC8oVNMQhG
         HJ4hnag0EWFRXm2UKFVOIWvh0vo0JDsJ36HGzINS6PP6/p0hnFvfoxrEyp/yKoUdQ2S1
         2aCnEvsZed/qapAswjf3R0CCMMgGqiQy+yh4skj1F+RIiBGvxzcCT1hKH5CAfAiCX/cX
         XvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417495; x=1776022295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=ER3ZwXzg5Guwb84w7+iSnZOna1GNIFlDNqIaKRc9+lV5UtzynwgQ79kKRbvUZQpskn
         GwmooCdFWPWPc7jNkKxyx1GDAUjVbfNfSKItmC98jTdSurizi/Kxjx8TczFLrdudhMfy
         FEf10mRCwNXQHwcRdUnCLNp62SN+gesqo1N62ZAcTlK6OOHY1AprC2BmhSALZsAjjl6k
         bjugP4J2732aRBZv6GlPuy7A5owGn6JH5v2G9vCvmz2nfOX2i3gsnbMHje0nYSyuxGVK
         CVNw22iIii5kMFGQuS8LCF/4JxtmFDCQv6J/W7JmrVFNqEALry8FFnxUrNgki4nwV9jD
         pviQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJgfahzlTqOTsZ6Ep41aKLqdYUprEd+SuoS5frRU25ArVv/yHT0ksy17tZF7QJoHwKmHPWdgzKp02CL3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8mxAH4bSzctt9n0vtknrNEfKENj+U3X1NgcTweFtAfVFJb7j
	JSdWHSIyMSDdjBCPQ15plY5Fg/r5QDcAmclaXt5e2xGcPeIh+xC31Ug+3cJUorkuFD0HeBCxiCO
	8nRCFIEak59KOh5XFLipPJJ3t1vYgRkA=
X-Gm-Gg: AeBDievruG7zwZ0d5h3Of1bFFNLkSz7KoYt8IYciuOyeLp0JiW8jQn30Ijbz/uRpkna
	If3rEGEudpe8qzdnXi5DqxA7PeBuPkkGtgmpSv0MJC/t8T6Uav3msnFds+RFpoZbFulBxYX1NN1
	CmXVRfvP7JAWLyOkYzxqkMW4pzo6/fytnZOwFIMsJvmwVv3/PZTxDtQBCOxXSFMTlPt2IAPgbRV
	eFe4Bo+zrFpIXYRi9pVZ07kMFKB+mN13g9tNjZrP10C0h8lpVpt2LuhcPkHeJ36XwQ2+UA9oAD2
	b5CKZTENXHv41tYpc7J6eubYoVDxa6rdJP6BhVTX6oPPX3y9qB+1rFwxW64iVd/AqmyXiX6yrrT
	svVv/jdYsIzJ1adKcPR7K688=
X-Received: by 2002:a05:7300:aa8d:b0:2cb:cc20:1771 with SMTP id
 5a478bee46e88-2cbfdb8142amr2476120eec.7.1775417494698; Sun, 05 Apr 2026
 12:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-12-ojeda@kernel.org>
 <177508434445.73816.7873322235592463050.b4-review@b4>
In-Reply-To: <177508434445.73816.7873322235592463050.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:22 +0200
X-Gm-Features: AQROBzAFcfOg6EKctMXZNeC0mwP27xs6Xk4PYTGLQOlXdHdfwi1d9GtE-fAbfxA
Message-ID: <CANiq72k1U0JacHf9rEVhOMmeZ4szCPBhbfLxC1K_0a0cQPw6HA@mail.gmail.com>
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12641-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 94A1B39F744
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> This description is inconsistent with the previous one which had
> citations for both the feature (function in this case) and the feature
> in which it became stable (available in this case). I don't prefer
> either style in particular, just that things are consistent.

Sure, I added a couple references. I think it is good to be consistent
(well, at least within a patch series, but I wouldn't say no to more
information even if it is inconsistent sometimes, especially across
different patch series, since everyone writes messages a bit
differently...).

Cheers,
Miguel

