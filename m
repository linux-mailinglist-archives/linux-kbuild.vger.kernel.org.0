Return-Path: <linux-kbuild+bounces-4378-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F25B49B41EE
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 06:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18463283788
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 05:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FEB20101D;
	Tue, 29 Oct 2024 05:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O4MXc1dw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B414AF9D6
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Oct 2024 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730181098; cv=none; b=PjIu1SHem0oUooJYZSe+DuUe5rumCYXGQKuMs0qWLwDoKs5h5x7mLcA8VPZ3Q1lC455fGWkBvjx/cNQKkHIjBTCqQvg0joHS+1Lu9hAGznot3RmPi9pLWsjFlPqhoGWFZ/pSLcJOPP9Rnm1A87OX9N60PADYHEFoo2NrQ5Sorl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730181098; c=relaxed/simple;
	bh=rkJGzaJiGDNyDHmrzD6Ukn0kvrLRqUNFw7rsJbF66DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbUyWXwQHGQzbdTAXXTD5iyV5y5Smi1G4J8n5FPooxeK+P4C7fbYDKOTAOiTlb4httOZSgBCre/e+syOizFnonjT/it1Ogrg2sTEEQ6881VT1fRXzlaRDQDWkKCZl6KTqvcRFHCwnP7dDplrqn1STVUaZMegt/x5c3veFs+dD4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O4MXc1dw; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460a8d1a9b7so138821cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Oct 2024 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730181095; x=1730785895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS+AWBnCO/J18Xc6TcuxqR5XEdAGr/Rpio3YV4nA0AE=;
        b=O4MXc1dwxcgbsQWGK53emGves46j/aC/NBO5mU8uxHNFbMgm99YV1mCvYt9FMmNEza
         Nrd0l09XgIndpa3N3+rrO40GWHE8PMH7DSRn3APfxUKc4+e+mpNPr5krVYfDQMYaBz23
         nH1KKMPj/U8SaZ35spcPGvPCabb5tlab7e/+5XDtZbEyF3Vt2zbgaTjPJRaLBEgdjAW8
         aOkTwCEQ+Zcgy00U/n839uEzdgcCnE5gwi3sacJIgOnnSCbV2+TP+4lRbRS1z4BLEBFu
         y1KDxn2N4Xlmsy+XhzHUd8ZpFcdvQNNezNsYWFO3DJcGqSuqYguNEDUe50pXcQrHwjMI
         zJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730181095; x=1730785895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS+AWBnCO/J18Xc6TcuxqR5XEdAGr/Rpio3YV4nA0AE=;
        b=mCPIWS7oAuI+5FSyZmdJZft5SsUv6YYqhdxJ9KdY/VoT0yNBVne2wYdqAoe7sBoTCI
         I02WDB3oFp2KoxhBaUWdPRBu3cXQW+HIYrAfT5c8+kBTMpFtz9tOQlyuvB888sc+djne
         VkVdvomCQrCcT5wMYVbGkTwIehFSLyQ+704ghmhYcaqUch5gnsAGNW0pYFblwcKUwkRc
         J5c45Iuqtzml3rVbRMgaJlUDji1L9VYP7FhvSlOkPEEGEHeuFfdVqxXc4Am2O3V/dXIC
         A3p5eNXBBp+9u+s974kQXKprUaGrF5yU+Gw10kBSULzJ/dwQWFF7/PfwpjwkZo6PG+64
         jzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkYswYeu5aiMNRNNhHzmYYM85xtBRsi+CTU3Fbf8WUecfXhWMuaRjm2g6PC/5TR8FqLNDy+F3nXI3V6WY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV0hsbFNC9fRjeM9zQ9/aIPsmH+3597aLGcOJU3QSPTIppQd+S
	Oa2uKGu12h5Kf0DIvuIGH6+mtXPSMcZJC4rpDHrI598PB6T5REALRYz8LTuw1nINuGw9s3gubX1
	Mq94EoGDNVMHL5pX7zpT604vq4YbsolYCCMMz
X-Gm-Gg: ASbGncv/XvmTQ7nLYTCAu9liKRVAgtCTDGilDt98m2wTeupvg7EYFctrN3rrKRD1Xe3
	Z4xqozFpIF4cIcPry5Q1I906odWJJZIuD9025+N4+39X9jvzCXo78EGGb5J4=
X-Google-Smtp-Source: AGHT+IEVAXdFG3fNtFOsbcJBNRZwq6dZ7NPHf4Fl17QtrnIba/Ad0eOq8gq9bIFuScwN6QgnbyAorRomVIE9wKpqH3w=
X-Received: by 2002:a05:622a:38b:b0:45f:6f3:5671 with SMTP id
 d75a77b69052e-46164fa2de0mr2424301cf.20.1730181094473; Mon, 28 Oct 2024
 22:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-3-xur@google.com>
 <202410281716.0C8F383@keescook> <0605fa9c-0e48-48ec-b04d-c2ef1c48fdd9@zytor.com>
In-Reply-To: <0605fa9c-0e48-48ec-b04d-c2ef1c48fdd9@zytor.com>
From: Rong Xu <xur@google.com>
Date: Mon, 28 Oct 2024 22:51:21 -0700
Message-ID: <CAF1bQ=QDQ+ACsH2CchnRk2LDRpN_WYjJOAjr9FDspxiar+YbrQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] objtool: Fix unreachable instruction warnings for
 weak functions
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Li <davidxl@google.com>, Han Shen <shenhan@google.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the objtool works on individual object files (or vmlinux.o).
The -Wl,--gc-sections flag, on the other hand, is a linker flag that
acts on the final link -- it's applied after objtool invocations.
Therefore, even with -Wl,--gc-sections, we'll still encounter those
spurious warnings from objtool.

-Rong

On Mon, Oct 28, 2024 at 5:19=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On 10/28/24 17:16, Kees Cook wrote:
> > On Fri, Oct 25, 2024 at 10:14:04PM -0700, Rong Xu wrote:
> >> In the presence of both weak and strong function definitions, the
> >> linker drops the weak symbol in favor of a strong symbol, but
> >> leaves the code in place. Code in ignore_unreachable_insn() has
> >> some heuristics to suppress the warning, but it does not work when
> >> -ffunction-sections is enabled.
> >>
> >> Suppose function foo has both strong and weak definitions.
> >> Case 1: The strong definition has an annotated section name,
> >> like .init.text. Only the weak definition will be placed into
> >> .text.foo. But since the section has no symbols, there will be no
> >> "hole" in the section.
> >>
> >> Case 2: Both sections are without an annotated section name.
> >> Both will be placed into .text.foo section, but there will be only one
> >> symbol (the strong one). If the weak code is before the strong code,
> >> there is no "hole" as it fails to find the right-most symbol before
> >> the offset.
> >>
> >> The fix is to use the first node to compute the hole if hole.sym
> >> is empty. If there is no symbol in the section, the first node
> >> will be NULL, in which case, -1 is returned to skip the whole
> >> section.
> >>
> >> Co-developed-by: Han Shen <shenhan@google.com>
> >> Signed-off-by: Han Shen <shenhan@google.com>
> >
> > This seems logically correct to me, but I'd love to see review from Jos=
h
> > and/or Peter Z on this change too.
> >
> > Reviewed-by: Kees Cook <kees@kernel.org>
> >
>
> Does this happen even with -Wl,--gc-sections?
>
>         -hpa
>

