Return-Path: <linux-kbuild+bounces-3892-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E998F3AD
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 18:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76566280FCF
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 16:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F121A705F;
	Thu,  3 Oct 2024 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="htZCYnHn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3291A705A
	for <linux-kbuild@vger.kernel.org>; Thu,  3 Oct 2024 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971909; cv=none; b=b8kBJ4iU0onkL37CxgCKyAvBWS9u8TQZZdr1ZDP4j044X6psy1WOn2OaF7mCp4BkBMSVjNC/paOcqRLEfJoR1cD3HgwdSLa/fyTl5GGHnwCKtJQZqvMh7sH7G41Kc+KUSteM9nV88YssnCPswTn78MCx5VgGglCtHRT4pFncdio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971909; c=relaxed/simple;
	bh=KAJhNktsKQBL31h4FFeDeoZJgORcWmVqd2YZcjRTjio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEAPy+CPA+DtsWBIbhDokFLn3LCygPvz/1hCkol3LK1o/ZRgq52r82nONtKdMGdzTBxg+rnXATDF5bLxIiz5OWi8WDGta/TQwySCfEuQsQXdagh98YuE16EssbZGml+PKetzffQrzm2Ie22in0qBsM2Q+ddzlEYDAtVn8tSNCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=htZCYnHn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so10192225e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Oct 2024 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727971906; x=1728576706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8M94Szf86aflf7GYtGP4IFREoq5t6mzeSASTe2kb0E=;
        b=htZCYnHnXDGWCP+6zbxUw779bJe8vH6gOTcHBU0FS6B+yhLxoYKbh3SeI9QwfA95m7
         OUUCpDRNaFtGYJMc84CNmcWcJNAJc/2pnjuJkMQy1CbQJbZVmfsl9/udA67Zkr33hyMV
         YKJtPC0B25j8jGWbG5CZy1BRX9K4QgmsZ0fZ0/PUX/wBVk+12sHBFBI+mMCdnWM2A/xB
         M4D995eTb2Op1U6It1TzoW4+rp9IkCmpbZMGxDK1CICnRODHIhNEHZJGj7Z7UFMssR1s
         rqfaObnFpqU9kAN5Uxw0VzHDv5ddSv4E3HJR0/I62I0XkCHnUfnG3tTcQmeas7S1199s
         SxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971906; x=1728576706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8M94Szf86aflf7GYtGP4IFREoq5t6mzeSASTe2kb0E=;
        b=HXIqK58ZkhkCp1F8KQ9XYA0P4g9ksMITj2YhVtbxUa2tXkik9pNfajJAf6BqIlwzgX
         vm3a1JktgC3BGAviBlYBtTEK565otaBi7eswa5vFdslo1xNKpD3jqi6IdQzmbVNx1HNS
         i4UcNquICtG9wI5n1UyhFkOQKGdo/2q6oKyJEX4DapmrePUN2t0sRSpfKrwyaCu8EO4P
         pEZUOXtF38k9FLU1KAzVs8+ff78c5Jn0bJBGhTnl7maJg02zRzwUKAmg2ipTdS4UOf1z
         n5pnEhWM1gF0D1RlmPh6yjUI7WH5juU6TUL+ATCMQjilo1ejZ0AzQ9c45yWVZf37CXX/
         dY5A==
X-Forwarded-Encrypted: i=1; AJvYcCWy0u36gPqbuZQuFmIsKUF2vB4LMNPNguVXmvthAcyb6EUtInIW9kyGB5gO/d86gGfJDyrT97Td/BjtTbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzPIA6VBEXkGeKwP88v/DhmrO3KS0iUlNyWn79mee7Yiw2cKxx
	E1ZSRpxkL0pOf4VV4OyNdpjqQ9yRpvIXqYPAo2dHGQvLsvdr4EUlzSI0ANDb9QaVzghOeZ60ex+
	sN7WJIP/5NvB0SCsfspsj8Lt/51m2Y0fmgCNM
X-Google-Smtp-Source: AGHT+IGsVwokVwDnq0q9EW2iHbb+PYH+PmCbmotDyShkoPWSykbINIhoAZtW8xfR6197nX/vMfmDWCNcz9sMeU0B/yE=
X-Received: by 2002:a05:6000:4009:b0:37c:c605:218b with SMTP id
 ffacd0b85a97d-37cfb9c8d6cmr4943794f8f.35.1727971905843; Thu, 03 Oct 2024
 09:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <CAKwvOdnS-vyTXHaGm4XiLMtg4rsTuUTJ6ao7Ji-fUobZjdBVLw@mail.gmail.com>
 <20241003160309.GY5594@noisy.programming.kicks-ass.net>
In-Reply-To: <20241003160309.GY5594@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Oct 2024 09:11:34 -0700
Message-ID: <CAKwvOd=CRiHitKeYtHH=tmT8yfDa2RSALbYn5uCC8nRq8ud79g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, x86@kernel.org, "Xin Li (Intel)" <xin@zytor.com>, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 9:03=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Oct 03, 2024 at 08:51:51AM -0700, Nick Desaulniers wrote:
> > On Thu, Oct 3, 2024 at 8:42=E2=80=AFAM Peter Zijlstra <peterz@infradead=
.org> wrote:
> > >
> > > On Wed, Oct 02, 2024 at 04:34:00PM -0700, Rong Xu wrote:
> > > > +6) Rebuild the kernel using the AutoFDO profile file with the same=
 config as step 1,
> > > > +    (Note CONFIG_AUTOFDO_CLANG needs to be enabled):
> > > > +
> > > > +      .. code-block:: sh
> > > > +
> > > > +         $ make LLVM=3D1 CLANG_AUTOFDO_PROFILE=3D<profile_file
> > > > +
> > >
> > >
> > > Can this be done without the endless ... code-block nonsense?
> >
> > Dunno, I think it looks pretty nice once rendered. Makes it
>
> It makes it absolute crap for all of us who 'render' text documents
> using less or vi.

"It hurts when I punch myself in the face."

https://docs.kernel.org/ is where we point people to, and what we
should be optimizing for (IMO).  Jonathan, do we have a policy about
using code-block consistently throughout the kernel docs or not?
Otherwise, this complaint smells like "non-technical non-sense" to me.

--=20
Thanks,
~Nick Desaulniers

