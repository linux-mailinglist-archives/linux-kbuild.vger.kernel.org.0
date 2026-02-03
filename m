Return-Path: <linux-kbuild+bounces-11008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHM0EVF2gmm+UwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11008-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 23:27:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D374DF3B7
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 23:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DE37309FC75
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 21:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED79E2F90C4;
	Tue,  3 Feb 2026 21:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jzuroon2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E8828DEE9
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Feb 2026 21:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770155951; cv=pass; b=R3RJtwWXbF++HUU6HpCKOnyur7Od2VCZcYatJCPLdn8MrvdaRTo/STdbYCPes1Ite83JgecyiK9EmhDIQMXTgXbjJx+3TmVSOpiZ/4W6e6n3oupnGXfW9z2QDGiEDkk9eHcwZnUJREPNgcNhAVMfT2UfZawsmpi+FPLqr7GPRHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770155951; c=relaxed/simple;
	bh=VNoUMpZq/NW5vYdHmYs8tiX+lNepdpvQhvLHKj5V3+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbVO7umfiDG8VZ1DxdKdLJdpoV3+7ZAvwnxXIiQk9VG7KkKjW5PoCGF9PtcM0oxWcPRCyQpcOvFcpbkVMLiB8dHjxM5G7YCJYu5U9ls3LasWzO0Hnw2Y5IrNM/Wm+BGAQwop2vhwcsqHEKFum/X++xORLLPMyNVfhGcrcPA2m+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jzuroon2; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-658b7d13f09so11100135a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Feb 2026 13:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770155948; cv=none;
        d=google.com; s=arc-20240605;
        b=hyLpMG2HXSUnIw9g9ZCmeJ9IkFtnn+8dRNZMRS4Dlr7hGhBxfX5Iv1Bj4wQ1HyfF9O
         4UUi8eGi/HH1DkD4tZ6hbeKmV025Ol7PbafvsRyjCOnznW+ptmPAOa13wBcZl9TJ/H59
         xNhNghiSc7XBFX//5iPKYOqZpHZ2wn/odiV9NpwOc7xMcxIgVP7w6Mt46OwIRQyl2JyQ
         8K9cg5AaaDwZnvTJ244CjnDBtxQ5bwK13sRTjSN4Gla198REsOPVAVE0A628nqepreJG
         Gqo/OZrbElgks1ifUbM6szM2OHpHY0skh4f9aaFs0j3QjO82kn2ppGOrFfNw/YFm6h9c
         RvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJj3/QP6caTVis5Rz+kzf4H/oWtK4J3y31szogVsajQ=;
        fh=HZhU7CMcuMfFOMt4ZLn6/CvZ5hU7KEyYCLVIYQ6iNdk=;
        b=ZyyRfj6+ypItE9ej8wGSFsaQ6W1Ywjf9llrCuQGoaJ8ubGP4XgjigDRUKIrJwH5NLh
         yCzodEJ4sCkNnl9rCMhJ9Zu6nSWV0xEmuCwaE8yfWlOhF7IMN4JrlIZQF51TAZLWdNta
         O8cvx7SHPN0r7kqWYrhfh586XjFis44pR+2PVEH/lnQCou9UCdRvnt1ggvUKhtGhmXDp
         vuadzjLhkQoOcm510GBUn2L6KM+gKRjrbPZGWKc+yENFzlDFnSopEnDWn06Beo2kpUHs
         AH2Ly96Sh5/hG7uT0Q0Pi/NrR24dppPJ/geumbee3geHYjp+If1cHv4+SFl+p7+lLc7F
         F9wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770155948; x=1770760748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJj3/QP6caTVis5Rz+kzf4H/oWtK4J3y31szogVsajQ=;
        b=jzuroon2gq1SEbP+eno6DZcd+Bb8gdf11Dfimn03dDFKWYQO9YqsGPXbxCXjecQP4i
         94IyNiwIABO4m7TgcRPiXqTWsxAFVroEhU41b7kjNsk9OL5rbntgWU1PpsX5jyH2HAsi
         ZgVInAh1zlq49jplGF+HcZecQCtGmjvoY9eSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770155948; x=1770760748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJj3/QP6caTVis5Rz+kzf4H/oWtK4J3y31szogVsajQ=;
        b=Twq9iezQFAMzbwnX64x7tTJfVPx9FarkEbdOaYyrN90ofIKTMryv6sSxsK9d/dIWpT
         v5rs3e/R6tTlrYfELwk412XsBOd5EAL6S14rqOj4SuHqD+wi35j+uScFPWpmD5PiOEf2
         ackYajZAOwEJSxz/Fafnaok/Zp8DhHuDt4qwJaNvpdqE4cgGjlg5Of+bPbCu5hQKqRrS
         opdey2ohNwHFk7ARPy8Sv4XjFwPFGVnFPMOi9Bfb1cL1uzhXoDCXtzSTWnVeOm4Vomgl
         t/5aClm1dzasiMOuIJgjCrqHS0Q7wxeoszFuy1glJo/gnlVEprnG0x6eSwEC3Em9lfa1
         WvdA==
X-Forwarded-Encrypted: i=1; AJvYcCUjEAN5J9CXmdlRxIlKDyu0WTv+Uw/zEvIYbJBr9atrw9PECa3MWJsxLkk274FnTxOGooJBauLkOjVq0s0=@vger.kernel.org
X-Gm-Message-State: AOJu0YztSJy+1QWLJZ3djsWRpR24N9vLb4Hu1QtdbyYgP31FLywKn2w6
	8T1cWUcsrRy/p/9QyWqhXUQchy5+yyNBPIgZB7Q10KpTqwrAwBGWFhqf0hC6wg5jIHbnVRiY3TU
	wzYNbKL2AfDm8AkKJteF3zogIdRGcegSlatReuaU8
X-Gm-Gg: AZuq6aKMqwF/F5FR7wBwqLA7dyejTrM9XHk6+6or/Ed8w1RrAmX5uuWM8g0KUgka5qd
	ZhIFu2SkeHg340rxW7dIR1NfAV0FFJCNrF3KESZZx9nTU31a9nkdCWAe4ay3hwU9RfQdRzArNJm
	x0tJVKE/0Cw+lA42T6wi6K52JKTs6ly58gWHKtBqAFOQemjeN3+obWUxLphi25EFKcBZ6ulKKE3
	x8KJUbT8BFkiPqj2b9VkVkhLMTkNB1HMgwQQvPS3Vpc07jHEtyW/z0UfMEd0vZGAj+rPZE=
X-Received: by 2002:a17:907:1ca1:b0:b87:1d71:f44d with SMTP id
 a640c23a62f3a-b8e9f10a4damr57769066b.11.1770155948501; Tue, 03 Feb 2026
 13:59:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106162738.2605574-1-sjg@chromium.org> <CAFLszTgQWjewjYHWUhG44em+deNY9xWDFz_YohduWvM=Bd_D5A@mail.gmail.com>
 <20260203045123.GB3049363@ax162>
In-Reply-To: <20260203045123.GB3049363@ax162>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Feb 2026 10:59:11 +1300
X-Gm-Features: AZwV_Qj3mtvlK51npKsxvp0S4DmwpPor2j5UgXAtFx_-Gz--puhV1FjqYFXFZsc
Message-ID: <CAFLszTg3aDQoSj5YcszYQGWP85V85jvcL4uw611m66Ek8L9Eow@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster operations
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, David Sterba <dsterba@suse.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Nick Terrell <terrelln@fb.com>, Nicolas Schier <nsc@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11008-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:email,chromium.org:dkim,image.fit:url]
X-Rspamd-Queue-Id: 9D374DF3B7
X-Rspamd-Action: no action

hI Nathan,

On Tue, 3 Feb 2026 at 17:51, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Simon,
>
> On Tue, Feb 03, 2026 at 03:45:36PM +1300, Simon Glass wrote:
> > On Wed, 7 Jan 2026 at 05:27, Simon Glass <sjg@chromium.org> wrote:
> > >
> > > This series updates 'make image.fit' to support adding a ramdisk to the
> > > FIT, provided as a parameter.
> > >
> > > It also includes a few performance improvement, so that building a FIT
> > > from ~450MB of kernel/module/devicetree files only takes a few seconds
> > > on a modern machine.
> > >
> > > For this version I have dropped inclusion of built modules, as there is
> > > still more discussion to happen in that area.
> > >
> > > Changes in v9:
> > > - Rename the variable to FIT_EXTRA_ARGS
> > >
> > > Changes in v8:
> > > - Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'
> > >
> > > Changes in v7:
> > > - Add a note about the " -> ' change
> > > - Add a new patch with the MAKE_FIT_FLAGS change
> > > - Mention xz as well, in the commit message
> > > - Drop patch 'scripts/make_fit: Provide a way to add built modules'
> > > - Drop patch 'kbuild: Split out module targets into a variable'
> > > - Drop patch 'kbuild: Allow adding modules into the FIT ramdisk'
> > >
> > > Changes in v6:
> > > - Drop the load address for ramdisk, as it is not needed
> > > - Bring back the ramdisk 'compression' property, set to 'none'
> > >
> > > Changes in v5:
> > > - Fix 'use' typo
> > >
> > > Changes in v4:
> > > - Update the commit message
> > >
> > > Changes in v3:
> > > - Move the ramdisk chunk into the correct patch
> > > - Add a comment at the top of the file about the -r option
> > > - Count the ramdisk in the total files
> > > - Update the commit message
> > >
> > > Changes in v2:
> > > - Don't compress the ramdisk as it is already compressed
> > >
> > > Simon Glass (6):
> > >   scripts/make_fit: Speed up operation
> > >   scripts/make_fit: Support an initial ramdisk
> > >   scripts/make_fit: Move dtb processing into a function
> > >   kbuild: Support a FIT_EXTRA_ARGS environment variable
> > >   scripts/make_fit: Support a few more parallel compressors
> > >   scripts/make_fit: Compress dtbs in parallel
> > >
> > >  scripts/Makefile.lib |   2 +-
> > >  scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
> > >  2 files changed, 145 insertions(+), 36 deletions(-)
> >
> > Can this series be applied, please?
>
> Who are you expecting to apply this series? It does not look like it has
> gone through one tree consistently and it is not clear from the
> addressees. I guess it could go through Kbuild?

Yes, that's what I was thinking.

Regards,
Simon

