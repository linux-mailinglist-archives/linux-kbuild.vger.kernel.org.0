Return-Path: <linux-kbuild+bounces-9220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7CFBF347C
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 21:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 367704FD293
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 19:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFCC219E0;
	Mon, 20 Oct 2025 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dOz6CSTW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724F1B7F4
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 19:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989729; cv=none; b=lgOoR1xXBxpfwyBIhR5u0jtab2Y3JO3uQWIbWoudNMyRPZWnO1sgjHogZLgNBqCcPi2AUtWJqXs8sN/RHbZjn/SOOGHbqzplOuRFXm1pBReEYAblsG6dLefqOsWFFn3F9qvYfVjB1COEnJL5Hx6ZEMqY2qZtfuowiajm1DDnUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989729; c=relaxed/simple;
	bh=MgGpsHbRyLLEuSO5v1+IPH3mXujQi4ThCOVYq9DwidM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbPS0vn7UN00Ki0pHMjNWJ/ZxH9QQsqKTPQZ9vL+tYo6bFjYIg9WtXkp1bEPmNv8Dz6J3zri8iJa/4VPT78omuybUuDxXQFSZcZrEB1+vz3BXWq76wwLCZryvk0ARH5WEKg7gQpBdqrN8jR4bAfomasaN5XfBp5C4AKC5ogYmUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dOz6CSTW; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b40f11a1027so943644266b.2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 12:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1760989726; x=1761594526; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NptN9BDkwDpbcOFbQiGabvU6AAsiO9hE4CrjxRY1XC0=;
        b=dOz6CSTWYXVxQsGMGkpUXnyayS2S70l/nSvjKXfe/OEs19ry23HhsRoO0/Fg06LvB9
         ueX6vdqijllH1b3IsfGyOyLlSGzNG2kPgI+nfS/4G57LtRke23SxeSKcaWur9c9c3yaH
         Mq/e16bOdRR6Mzgbff5hSI5KsbzslNGP4c4IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989726; x=1761594526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NptN9BDkwDpbcOFbQiGabvU6AAsiO9hE4CrjxRY1XC0=;
        b=ltOVzkx4RVRnV5ItO+Oc648yoPbj9rM9IRpe27TRJEzXRZIoqZLOdGg51orqOKgKIt
         bZ9vluccJaoQH5mjj/OKCbdaC+KfNZ78dwVXyAp+rQPXwqk2D8YACOo/DaDXqip9mOBi
         lP6H+48J4t0jlOpMp1stC1nf1aUXPfeDk0ciECaUk7+3nFU1g1nxuCG/SVQZuh97HvRP
         zPRlE+9u2Gvc67PoZyaC9u4h5SzXtZxU03qVHN8xH7kOYN5R92zEptLfM/VAOU2FEZxJ
         6BXCsjipT+eg1JFE1YKKL8/aohwsfuU9/UsFcV9udyduMH889OBd/pEVSYs5Y5NY9gYl
         22ow==
X-Forwarded-Encrypted: i=1; AJvYcCVUKF7lGer0NR9k8nshLxnHuO22LN3HaHi7VDA0SdKeVHjcBrFvmkls13vdM+purJ2U7cGLN2YJJB2sk9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwATfRw4F+tFv8b0ZZfhix5hsdO1AYRA4UKl5Oct8xyZ2Ud1HH/
	hl31TyhSs0uz/WA4NkBnPX2J2LlfCkq+mkt9KhIaylthTEf9RLUCW+sx27UpcZF/k2Xlxg1iB5Q
	BzuEhRoA=
X-Gm-Gg: ASbGncsbsSokQxj0qLR2hyTi9f8c/jqW+CvxuKKrlAgcrVppnxE3QJJ8G1cqnhyGDR7
	/qwqOmLrwdpX4bck38+5BcsPITNfRowOMaW3mF+I+MB9DPNGYlzjsMzAGZxOtwlKwOzNdxZ3c51
	6wTMQCGdUXaWBKCuBsuBlEQI+1TBZGPyw6aO+mN+GmAqOoXcS4YtAtENhZTKPilRzw3l94zzwij
	pzJNMS/zW2QLnWQqGsJ4+koAEpSI19pdLt8l+yW3ZR/AZxSucmrThqRU9Ysn0qNVQKJAvXGdhgu
	CqyQg7BIka6ErY9eSEceuFu9pIAKrnxFIR/KkFUUuEmpLZRX0Cv2XC1oAyHK1GDvjD4LzQ7C6vn
	YBlJZJjyNDPd4MnhL4Dt6QMxS/PH54DIf3q1UGqtjI467gJ6S27DphlC0hYgocvfDzXcw0iEYU6
	Pp6Xsnq1D67/lWWd7wrX+PUpN6XbLy61r+DJGeh+irIHwejxbGug==
X-Google-Smtp-Source: AGHT+IHBmHxXh+Ep16Y90UKrj+VbVSBCDFt1UguCMHKZMVe4N+XxV82UHfZKCC+q3rlFfCCczxte8g==
X-Received: by 2002:a17:907:d06:b0:b43:b740:b35d with SMTP id a640c23a62f3a-b6474b36015mr1646185266b.33.1760989724099;
        Mon, 20 Oct 2025 12:48:44 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da33d1sm869587766b.7.2025.10.20.12.48.42
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:48:42 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63d6ee383bdso478261a12.2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 12:48:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHlp6T2I4ixw4oJAJ8qdHg8gau1+1GZl0CUqCquUjVQ673MV5nu79GdUtFIT9wuqwq22PoYopjfE3L1u8=@vger.kernel.org
X-Received: by 2002:a05:6402:4407:b0:63c:eb9:4778 with SMTP id
 4fb4d7f45d1cf-63c1f626e36mr13356445a12.1.1760989722393; Mon, 20 Oct 2025
 12:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020142228.1819871-1-linux@rasmusvillemoes.dk> <20251020142228.1819871-3-linux@rasmusvillemoes.dk>
In-Reply-To: <20251020142228.1819871-3-linux@rasmusvillemoes.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Oct 2025 09:48:25 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgHLkpQAEDpA9pwXp_oteWkdcs-56m7rnQD=Th0N2sW9g@mail.gmail.com>
X-Gm-Features: AS18NWDyOPEZYLlpZ_IDtTxJF93fgCvTBpU4BXYpNtKXdpZRRnqLlSITzLAUJMM
Message-ID: <CAHk-=wgHLkpQAEDpA9pwXp_oteWkdcs-56m7rnQD=Th0N2sW9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] btrfs: send: make use of -fms-extensions for defining
 struct fs_path
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Oct 2025 at 04:22, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
>
> +struct __fs_path {
> +       char *start;
> +       char *end;
> +
> +       char *buf;
> +       unsigned short buf_len:15;
> +       unsigned short reversed:1;
> +};
> +static_assert(sizeof(struct __fs_path) < 256);
>  struct fs_path {
> +       struct __fs_path;
> +       /*
> +        * Average path length does not exceed 200 bytes, we'll have
> +        * better packing in the slab and higher chance to satisfy
> +        * an allocation later during send.
> +        */
> +       char inline_buf[256 - sizeof(struct __fs_path)];
>  };

It strikes me that this won't pack as well as it used to before the change.

On 64-bit architectrures, 'struct __fs_path' will be 8-byte aligned
due to the pointers in it, and that means that the size of it will
also be aligned: it will be 32 bytes in size.

So you'll get 256-32 bytes of inline_buf.

And it *used* to be that 'inline_buf[]' was packed righ after the
16-bit buf_len / reversed bits, so it used to get an extra six bytes.

I think it could be fixed with a "__packed" thing on that inner
struct, but that also worries me a bit because we'd certainly never
want the compiler to generate the code for unaligned accesses (on the
broken architectures that would do that). You'd then have to mark the
containing structure as being aligned to make compilers generate good
code.

So either you lose some inline buffer space, or you end up having to
add extra packing stuff. Either way is a bit of a bother.

                  Linus

