Return-Path: <linux-kbuild+bounces-12323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CKrAnUFx2nWRgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12323-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 23:32:21 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F0A34BF82
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 23:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8A29300B9F6
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 22:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3FD390CBA;
	Fri, 27 Mar 2026 22:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y8KHMIeT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD6371D0E
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 22:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650571; cv=pass; b=PvBh71b2Q9+PDfmcjzAQ8jMf3S8ZvRqRFEDF74tCxnJ/ZvlN1dh15SFdrYB1zeXno3GIaWiORFrM03pJUV075rJqUyGNA9F1VewwnUBBAuGeCHCVeq2/mrQNEKAh+vsCV/ASmiNarW5OQp/vOhuSde9u0TLYTSvPy22PtS7oUzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650571; c=relaxed/simple;
	bh=+zK/IjuErEG0mSVkQ2Ixds0Bt/74frZ/HefXmED2JbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNLvPEOWYNY/ipJN45D5UcTAzm6K7FzAT2Y7v99kwTPq+0znDDthZYxI/N0zeQuSolAVtMfyTtDl+PxDrhCayof43QIyKCpaX2W6jh2hkZSzkP43AfYtq2PybIrubN8MJNMw2zNmuQ1j+HVU9Won24ZLxFSOCnliEGN/ADOC4eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y8KHMIeT; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9539b80db32so97095241.2
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 15:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774650569; cv=none;
        d=google.com; s=arc-20240605;
        b=CfXqVpVBlOrhukDJBETCsamLv//vaH/XCxpfy9HIUyILHtQwxvWnCXK0l8GAq27aBj
         G8ezBcXp5wGULWkJyX78tmtzbDR7hLNKfzl8QMjFZojd2WDjN5o7bnH+gl+pzRscqjQc
         3t05Grp6ATTVXdcBlaaV3Xlo2pWuoMFrj7+cLeK8Vrgx3IMCKeau+o1xR0Lmt3XG8V0z
         If5vkEuOT5uXkWa7RwaNmA120ptZT6R9rd2mLhVJVUI01oaHBoystwnO5/tlGQfuLvF+
         KnRuwYhK9ql2mMXUw9MT+zo+V9Ni2l7vE7ZoDLvBA41h1R+UEIhmXhmzrklUpm9d3BMB
         WAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DmvSXyuF97zXrdEx+TZcwBI74PTPGa+q4rDT1NiLTo=;
        fh=AGrlKJ7gj+rjHw/AaZZ38e16pnu8KtFGSs0y+Rr39hA=;
        b=bLFJVW1HJGWQ7w/lTBH0vVfpnHPlsThTneImu+6EOw2dOdBNWYEBz3yrymUuYxoB/Z
         StABasN4m0PoTq5nzmckeOVmR72igAPTePldzWjzhJmlTT2mg/fL3vfElm2R5Ylf8VU+
         BPVGq1FA6AXhLKtvfrnrDazUBkE9Wn16EZAtfgiLy8owydTg2o6dKYNmaUgB/KYYdaJ9
         drvjBggc7u/cDYczy75yUu+RhBxgvcJ6gUe1BabRKNUvt98tJemQJgCdgfvVtPhOO9nB
         dbWKbh7lw1hBFOLlhYHjXwr0zkO+qzbAQj6tqsfBpZpamTEyCztKZSvPq2+j4rFXxrUP
         c85w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774650569; x=1775255369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DmvSXyuF97zXrdEx+TZcwBI74PTPGa+q4rDT1NiLTo=;
        b=Y8KHMIeTI1krvqe+NzoU0Uopi3ynp0ohW77iOwOgaIImAIFpuKS15lVKmvdSkrE8v/
         YHmXsAHowehL3GcufChcDX41kr6qav6MRAY2QGiay1ELmf6GYfCmHdt2uZQLaOj9iKJL
         M/KE//Cjc7r9ZBnrsS29b3bDy5OPNx3CYZZa9QVegdPx3HjPyVg/vWyCB4oZY7WF/t0k
         pTwGFBXck3f1CYlBw/guZHbhmBh9zlFBDsBuZfUxUpcWJYf7GHOIYQw7poeXx5xGsspm
         UUNdqioH6NDfL/CiugWy1KYWdl4lJK30Oxe6RgIhbxCoZk8NaM0YbsnFlHklOMg15yPT
         ImUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774650569; x=1775255369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DmvSXyuF97zXrdEx+TZcwBI74PTPGa+q4rDT1NiLTo=;
        b=AwKff9i5iqDDFk9xZhTpt8QWMtZL7bgnZ+SjaediFpeNSNvIcQk9WoLIKaKfx+HZsz
         x/euQ7rx5nzgMqUdZhe2zFeGkHMDICjFBiAJ/bsWfTSxdvYLrU4WBkJPHXFAjhbNSAe/
         cAiGjCo0Xs0zAKxIm4FTYvCH+DwqxgHDC//vV3NERg+xWAk3gdELq++ozrsG8al4J0X0
         C0cTL+h58iYqrK+WUlaN+a9vi+Z1aMqKAYa1LKIHu8QmkAPUTR7Ox1IEg0u7troog8hY
         z7c23q8yHBITQR3TMvPCQIhFtGOq5ci7V8SDRTd4nPYfxVRKhR7wJyeneNn80BN9inrL
         WrVA==
X-Forwarded-Encrypted: i=1; AJvYcCUMERnMxIYOjVL0QRXiBLQQAXY82VTsUBJfamAczKWVGBbavAV5dzZSKgYl7ziUxseLKXS5lPz1vX9Lx4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4EIyj3Ig1yJfLIVjNks56puLG609c1NV6rrrQiIM83y3oCt67
	NP019yweBEfRXHUPrh5jMpWBubf0X3UYXHA+e00le7KMaW7hV6G1OjfEIR0yWS/Kg7PvQuqO/2l
	KwwPJSZPAJpFWbw6zN97W/tac8DtJGelzU9ZUUqJK
X-Gm-Gg: ATEYQzwVr819uS+OI6kIkMsTGClXyZUF+PD1EsFXNmAPEKH06fECJH/KJ3uSUfdZfRI
	QRyJDZy9IWwp73TpmW3rEZBc7fcQadCEU1w0yApQqBKbWisziBlpI7nM7hEFJvw+JkqROYL3tcM
	rrtjpYKjHtNHbpxXKi5EPHew+4O3OguZpawQ/t/TIPBzGBJpujJsa6GAIy2LTgp3dkSZP/v4FQr
	8K/PvIqCXFjv/hrteSd7cdZsgsCA1JkTaT3sj5vxv+pZGL8nJScJCZC43hA4LFsAFPR67UHf9G9
	Wz9qBH6r1c3LRMtTrA==
X-Received: by 2002:a05:6102:6047:b0:5ff:2569:cfe7 with SMTP id
 ada2fe7eead31-604f9082af7mr1815817137.10.1774650569160; Fri, 27 Mar 2026
 15:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com> <20260327221837.GA3622500@ax162>
In-Reply-To: <20260327221837.GA3622500@ax162>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 27 Mar 2026 15:29:18 -0700
X-Gm-Features: AQROBzDBMJYR007qSz1FH4Yl2MRm5BJFykXdmb0qHAOvrPorltKgcSvxgsAtd-0
Message-ID: <CAFhGd8pWwbjjLt=FSaDtFysqRU5k_YozDgBFMJBN4YmnAEaktw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -fdiagnostics-show-inlining-chain for FORTIFY_SOURCE
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12323-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64F0A34BF82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Fri, Mar 27, 2026 at 3:18=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Fri, Mar 27, 2026 at 02:59:20PM -0700, Justin Stitt wrote:
> > Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
> > the visibility of inlining chains in diagnostics. This is particularly
> > useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
> > inlined functions.
> >
> > Add this flag to KBUILD_CFLAGS when CONFIG_FORTIFY_SOURCE is enabled
> > and the compiler supports it.
> >
> > Link: https://github.com/llvm/llvm-project/pull/174892 [1]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1571
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> >  Makefile | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index e1279c4d5b24..978726aeb1ef 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -973,6 +973,12 @@ KBUILD_CFLAGS    +=3D $(call cc-option, -fno-stack=
-clash-protection)
> >  # Get details on warnings generated due to GCC value tracking.
> >  KBUILD_CFLAGS        +=3D $(call cc-option, -fdiagnostics-show-context=
=3D2)
> >
> > +# Show inlining chain notes for FORTIFY_SOURCE-related diagnostics.
> > +# GCC does this by default while Clang 23+ supports a flag.
> > +ifdef CONFIG_FORTIFY_SOURCE
>
> While this is indeed particularly useful for CONFIG_FORTIFY_SOURCE, this
> impacts the warning and error attributes, which can be used anywhere
> (see __bad_copy_from() for example). Is this being wrapped due to the
> potential compile time impact? Can we use something like hyperfine to
> quantify it and see if the impact is worth the trade off of always
> having it enabled for friendlier diagnostics?

The compile time impact is not measurable (within expected noise). The
peak memory usage may increase by somewhere in the 0.5% to 1.5% range
depending on build configuration.

I bundled this under fortify to limit initial impact as its had
virtually no real-world testing and may produce unhelpful diagnostic
notes under its heuristic mode. I don't expect folks to use `-g1` in
the kernel (which would enable full-proof diagnostic notes).

> If not, maybe worth adding a Kconfig option that is force selected by FOR=
TIFY_SOURCE with
> clang or can be optionally enabled by a user?

I'll defer to you on this one. We could add
CONFIG_SHOW_INLINING_CHAIN_NOTES or something similar?

>
> > +KBUILD_CFLAGS        +=3D $(call cc-option, -fdiagnostics-show-inlinin=
g-chain)
> > +endif
> > +
> >  # Clear used registers at func exit (to reduce data lifetime and ROP g=
adgets).
> >  ifdef CONFIG_ZERO_CALL_USED_REGS
> >  KBUILD_CFLAGS        +=3D -fzero-call-used-regs=3Dused-gpr
> >
> > ---
> > base-commit: 7df48e36313029e4c0907b2023905dd7213fd678
> > change-id: 20260327-kbuild-show-inlining-557d31d2293a
> >
> > Best regards,
> > --
> > Justin Stitt <justinstitt@google.com>
> >

Justin

