Return-Path: <linux-kbuild+bounces-4323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B589B07E3
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 17:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99EFC282436
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 15:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A2820BB5B;
	Fri, 25 Oct 2024 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="US8TsSCh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3435186E34
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Oct 2024 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869445; cv=none; b=SfbOvMPMIgFUp+MFp17wm/ZzrG/p8t9QKZxmvDp8ovX99tXmYkAb3k4/7HHt9Wwpo7uxpxnkXWKfVmuFCAzB3bQ55q56yT3EjFzNKKU/pvITDcnDsy5UcUYF41xpwXSuL0/cVPsJQ/JjC8w0dFJDwgSowWiO/+79bxBiz1Ux0fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869445; c=relaxed/simple;
	bh=WyV1hkEvF+T/HeQTn57dPx/lNsuJ1E8Fo9iYV0s5bYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4xaXukNp1sFnsKY3kHXQLsai51dcorcvkQZ04N5DLOoD3DUBhRHgabUNwUqLquAAhaAM31yOV1QZeojQbyxrbf7NMhVqFJoVaW3BGrowwdEiYLK6vG9C/G7G0b6uYRxYHEWTUlzJ6+A57IqSavGGu08M3jw3NtH5YH4Jfys4Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=US8TsSCh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43153c6f70aso196355e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Oct 2024 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729869442; x=1730474242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+qZdWqWXtWylOyw2WfWUb01ZrPpEIVk78Q8a8ZQT7Y=;
        b=US8TsSChL9L6bQ3qGqZAqeFxud9UpLeAyY6yLwsVHa94dX63/wjmo1Z0tfnpfRr1Cq
         0bOi8+m0FY2WA7+nInHYsUk49TjqgWuMEP+WI6Czib7M8C+imMfvZ4eCzQURSNgqLaet
         IAfiiqs8rHGwm5EOZuqHhw2pbRzbz47UadrmB4D60P283hWUxhBb+khWYbeiABbleHs5
         rxs57eREzZh47ibtGpqi4gDpR7AILpQHDH2gEQW44SyfdzxYUnUq2jMvN9p2Ua8COVKA
         V61xmxmAf5tWQKFIOIn41O1f7GAHIWrASyzXCF4d9oxzevRH9PZl2gmUimAsJUiL9zq/
         xDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869442; x=1730474242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+qZdWqWXtWylOyw2WfWUb01ZrPpEIVk78Q8a8ZQT7Y=;
        b=v8htSJWJdr+49fqcCRb+fvT1KyF4lid+9inHUW6AbeiPtlGaSwbpif9MsNwsOYH6ob
         XMaQuH9sAUzeYQLXhWozy5RT1NXjlunY65k+ZOGc/ENiQIcUbhi7uGQ9L9W2wq3gtEAJ
         a5quVL1IeXn1Iz7+O4naI3wZ65Q2vwNFgB1rGZ9EqKpnAokgBs7ghNlqPdywam3UWbiR
         B/EvTGj5ox96z9Q5NCbhyMs1S4sBjfTYDs8QjDzxaBv9z4ziOlWSxWbht1KppcabNFuo
         J4xFEiEK/9cOxTYDI3UmFvgk7SC0FktdQMjbYdYf/RXquvEMrToEKmB0EPNBy6h6KZVU
         Br4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJmkMg4IAh/NUm91exqIa9YCxpi3c/BNJ8DjMcaHHZbs+U49pCIPF697+CcPvwCgslqr5x6febRuyCj2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWk9WgtTzq2ZUzxVVxIjSB56OR2AZqmNTQ83tJmZoQhS0lmVcU
	HJ4fp3OBUgzJ+zcPxj2wB775aFsblELR0VszCovMXk6ElN58Y1TPUXrrjhsunxeVCTU2xpFofX7
	fqs8PUkt2swxAkhHUtr/jNl1jTuK1qZt5md8R
X-Google-Smtp-Source: AGHT+IEGaAp8MS7+26iNwYNpWISUUbwzO5Gpf75slOy8OxD2gSiQH/Cp9KNx7+Lhww385En/cRWbywx/almGe6T6PY4=
X-Received: by 2002:a05:600c:34c3:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-43191f8e5f8mr4966315e9.2.1729869441852; Fri, 25 Oct 2024
 08:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-1-339787b43373@google.com> <874j50juyp.fsf@mail.lhotse>
In-Reply-To: <874j50juyp.fsf@mail.lhotse>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 25 Oct 2024 08:17:08 -0700
Message-ID: <CAGSQo03L--HDUBeo3xEUANbBcSf4GK5GUNGmHSBzL+ixpRGuqA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] modules: Support extended MODVERSIONS info
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Sorry I realise it's version 7, but although the above looks correct it's
> kind of dense.
>
> I think the below would also work and is (I think) easier to follow, and
> is more obviously similar to the existing code. I'm sure your version is
> faster, but I don't think it's that performance critical.
>
> static void dedotify_ext_version_names(char *str_seq, unsigned long size)
> {
>         char *end = str_seq + size;
>         char *p = str_seq;
>
>         while (p < end) {
>                 if (*p == '.')
>                         memmove(p, p + 1, end - p - 1);
>
>                 p += strlen(p) + 1;
>         }
> }
>
> The tail of str_seq will be filled with nulls as long as the last string
> was null terminated.
>
> cheers

As you alluded to, what you're providing is potentially O(n^2) in the
number of symbols a module depends on - the existing code is O(n).
If leading dots on names are rare, this is probably fine. If they're
common, this will potentially make loading modules with a large number
of imported symbols actually take a measurable amount of additional
time.

That said, I take your point about complexity, and trust you to know
your arch's inputs/requirements, so if I don't hear back again I will
incorporate that into the next revision of the patch (to be produced
after the gendwarfksyms update comes out).

