Return-Path: <linux-kbuild+bounces-4533-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE79BF924
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 23:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F7AC1F211EF
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 22:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBF120C48E;
	Wed,  6 Nov 2024 22:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RvjM3cOT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D31DF265
	for <linux-kbuild@vger.kernel.org>; Wed,  6 Nov 2024 22:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730931593; cv=none; b=f5Kaq1zLwpnpq8wD89x9zrYPhmtpAI7oLOYwY7rLDGkufeQR8WsvaeSqyRLJFn0mKDrJMSzVew/2Ne+2hhESM3V8uhhymGO55dfOf6Fwzv8SypfXVE46Rfg62/zpSgnknooAbEklxwZBiqM9wP4/8lqg20Tgopj2Pe4iwrktLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730931593; c=relaxed/simple;
	bh=oBnBqWpM8lRdtEoqkpENq0fMTF0z3JfZf00+3RNW9zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWHeeYr2HtpJOAPtdd4hItiLRIv7AZ3WEGXUv6X60aoZOKCIUu41/a93Js1Xr13H4X3Kbhx12s5D8RjNyu5rtxHDsaKMv27+8lf/1/zCDgc7DOKX0jQMI2fr/32fHnillhL508OQHxgQuZp2rXLaxGqZ8HXy1nyhgxJhjotEDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RvjM3cOT; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c947c00f26so2432a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Nov 2024 14:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730931591; x=1731536391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VIfMB0/RRt0Ar1Plzd0i42wcI4LGr6zVtLHR+97rgBY=;
        b=RvjM3cOTcqB/hxPw4bBvMJEFKEJsFueDkFcki+11WjTgflchF3SVXTd+1Ay0uD2CUK
         KwPGBCImdQtQU/UYiPcEzzHHd95JAeNnXeyJOqokGNR8IPJEnB8qwaHGvXF/ePSceMdm
         WmDm6c8WDspITHEtx709i2VHyfzomGBHmhVz5x75dy0iJK0gb042cUOdhWwxdmheK7+E
         00v5aQzV9FObAVyhGgPTqB/Usfg5opluGpSchzfG1o6JgELDa56AToVMZXoZp61guguo
         M4ve8BOVjtaVk9PZg1Zz7Ll5FpBkFQqJ9hwX1Eka6K73yvHfEQeI8BesACY2ERg4RYFE
         h37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730931591; x=1731536391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIfMB0/RRt0Ar1Plzd0i42wcI4LGr6zVtLHR+97rgBY=;
        b=twjS7a5oaMXoWUq9rQLu57hNZd+A8+L2qV01pyEvDimR8JCfyhFcynwAnAXNaNUCLv
         zapPuzz78eB71Y1v0hPGkGJEHqT7XbpZEraL6R6OvviZBpFilX0LBZLVmR3u9Ar7wtVi
         sNPPdLDSdV9c0cc5u7aBEMx31nuz31BOPMYgG+AQHQ5QcYd6gHPJI/kOQiOFC2sJLEaE
         GsyRzATwwGeVJ4X+HwOtzMWT9erUB3Ktd73atdegr2C3N08kBB5Eaqe0VjEioj8zHuUY
         4ClL2MKKPzTzSNpd6q+YhoBp1Tl+aEil34XsvTOHwpxvZ1k9wtBqHcuJfQePDc60dsrQ
         fLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjizflsm/LU0rIgDjcnXkr24YjF98NlbkZt8Oiq9BWA5RgViDZsAmy+NRKW1JTbNkvF4H88H6WV2BDACU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN4QMqcBFfCg5wECYlIY5o/qTnGXFr5RlktDK1lvJLjt6L7zhl
	mLkrOev9TRcPqO9l+bb08xN+yVp0KwXA8IGGBuDzs5nba28n7RiIXDDVaCaDsQFZgjod6OBG4ms
	Bfz0b0igA9MG7CWY5F1jDqxJqzEqPxneUq5CQgcv4v/c4icqU2SZf
X-Gm-Gg: ASbGncu4nxOFZ2pW3lBIuDFD99q4pX8nBxv4DJX8m7rBs1MlOQ6f7GOhgNzvkuwBJqv
	8etz+Vt4OMbz1s/9upCip7CGZIbXwL2IuUVORibRFuddcODDNz9X3OPLhtwo/
X-Google-Smtp-Source: AGHT+IHr43cQPFdqXPCZMuhW0YfDPZKYdGnYJyq09Flo3eqNIAHnldTJTztppmJyfXcIKbSiu12OxTpcgO6RCsjM9mo=
X-Received: by 2002:a50:8d09:0:b0:5cb:6b7e:9634 with SMTP id
 4fb4d7f45d1cf-5cefbc29fcfmr233654a12.2.1730931590492; Wed, 06 Nov 2024
 14:19:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org> <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org> <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
In-Reply-To: <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 6 Nov 2024 14:19:38 -0800
Message-ID: <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
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

>
> > If booted against an old kernel, it will
> > behave as though there is no modversions information.
>
> Huh? This I don't get. If you have the new libkmod and boot
> an old kernel, that should just not break becauase well, long
> symbols were not ever supported properly anyway, so no regression.

Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and
then load said module with a kernel *before* EXTENDED_MODVERSIONS
existed, it will see no modversion info on the module to check. This
will be true regardless of symbol length.

>
> I'm not quite sure I understood your last comment here though,
> can you clarify what you meant?
>
> Anyway, so now that this is all cleared up, the next question I have
> is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
> userspace requirements aren't large at all, what actual benefits does
> using this new extended mod versions have? Why wouldn't a distro end
> up preferring this for say a future release for all modules?

I think a distro will end up preferring using this for all modules,
but was intending to put both in for a transitional period until the
new format was more accepted.

>
>   Luis

