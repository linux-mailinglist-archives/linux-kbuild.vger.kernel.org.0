Return-Path: <linux-kbuild+bounces-4223-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 264DD9A9382
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 00:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E1B9B22297
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 22:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FF51FDFAF;
	Mon, 21 Oct 2024 22:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UWncrZaY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCF1FCC51
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Oct 2024 22:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729550617; cv=none; b=jC4LDqtB52CAfKWNQh9kNhZEJ/5GwBbM01MI0BAlkAxhg/wZWt+sT/emOVYBsXw2zPOhuWOi0DA6K+SehU/+WxT7zkiGng/M+FHs71P+pkzE5BSXKzJVyCNp22n1/hWAjf7MzWJw5bZ5Tyiw5W5JO2qt1E0VD8lDNGrw+dKNvIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729550617; c=relaxed/simple;
	bh=18SuxrItI+6f+tfrvR4g2u78bJrgXnBh0EqpwvVjrEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwrgvVSI7ovvyju8CfZdxPwyDTKprxQEh6QXIprlCzWkPLCE7vuAOSj7118qqLD5VXtqrXNls2zTdgf5lTJYbwujhfayktEa+5Em9R98b2//NE5ZWxOGYKNIAn3WFOo3ILS3USJA8JXF9AqmWo2ewHPV404DaV+FZZI/kKohUqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UWncrZaY; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a3b3f4b599so93105ab.0
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Oct 2024 15:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729550615; x=1730155415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yovHp8/4KQS/SjRw8rzJ2RWtyZhJZCAGgSQbJZaDAus=;
        b=UWncrZaY9hUbvqNviMND55QvslQ7k3erHzT24fSS4U6U+PyeCjgO+fLTHuZR6Kb0JI
         pxBLjBuNKYeg+an90FewLvDzGSf4AlgE2kh5DmPp+VBYtyBUBDBnh2ZTkzn2gH84/MCG
         VELzUbJOBjcJiZwzj7Fa6CI+cJxccUcc9AlsEOFaLaSf4PFIV5mw4N9EkoiQzvpQlwj9
         0OpRdCKJzH2RdPecKe5A0Z2xqTDaBGNLJlxQwqh/60xO40+40RXy75l+oxDoGEhcAtL3
         +G1jzQlIEWUMOlj+hlJj31Qp5E7LGzzzF+GSO/sklNnTB+BFrC6zGKcBxdTdfIMjRIc6
         I0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729550615; x=1730155415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yovHp8/4KQS/SjRw8rzJ2RWtyZhJZCAGgSQbJZaDAus=;
        b=FsT27Sx2jZYI/yYdIa3Q9rwY8qVvfRPJkHCoCRsL83ju1HG5AA3JPGGOY6b8FnUlV/
         +0IPKIyd4UjbVYr1pvB6/bu4zAEcZzLzOHOKrcOAIlsYg4/kpqEsNpWFv+K/KfSwWm+S
         UEtQhVxAkl22TzCUROFnQBrBZFkNBHbU7uck/mgW+hh40f6AmF9LSAphHGH6xJJHdvNw
         B+CD4UAL5L225QK648+dezgk/K3vBFrLPYD5YS1drGazFCJC1aaYruJ+sPX8lZl3z6A/
         3UUnPuSzC8WHpcJRlVd7RjFzI1eNffSLzJXZFB+d8U28UMU6zfAVhnroqzXyeACgb3qe
         VPEg==
X-Forwarded-Encrypted: i=1; AJvYcCXkePaqVHcWGSQLCtySuCYDym6sA6+QxuvXfFuQJI4sQBVe+vXnFdBsdq0uBpNOeygJ0LiBbOb1M0eAnUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfoxU7TvPaAPv7q1+M3QjCwBKbVmPcIuiwdzk7Q70otxSL3NE
	cN9rxkxrzbe1cxrbjaJ0aHjPxayNGrNwL7sxy05VHnxOCYvMLGg7OjHBRJn5Tq/GpAIFkS6BkTr
	Fkeah98DHvHtmkDKWiAfubpuqBwi8WTX40niB
X-Google-Smtp-Source: AGHT+IH0HVg3fvyt1+QDr1YQLUpP3z4mO+u5A4ersGEMt75VHmDTieIO3qGEubKhoWD+zxsaZ/P7FpluFK6JQL6j+ro=
X-Received: by 2002:a05:6e02:148d:b0:3a2:6d54:33f1 with SMTP id
 e9e14a558f8ab-3a4cc972f72mr1555125ab.16.1729550614610; Mon, 21 Oct 2024
 15:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-2-xur@google.com>
 <CAK7LNAQ5yNKvZDtJuvo9Lt4rZwLSv0UN4=Ff=WcCDy1CCEpQ7Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQ5yNKvZDtJuvo9Lt4rZwLSv0UN4=Ff=WcCDy1CCEpQ7Q@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 21 Oct 2024 15:43:22 -0700
Message-ID: <CAF1bQ=Syxi46xnGbpZWhYfqKhQZqrBPPh5FGaqzmJTg6MMDJSA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] Add AutoFDO support for Clang build
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the detailed suggestions! My comments are inlined below.

Best regards,

-Rong

On Sun, Oct 20, 2024 at 9:33=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Tue, Oct 15, 2024 at 6:33=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
>
> > +Customization
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +You can enable or disable AutoFDO build for individual file and direct=
ories by
> > +adding a line similar to the following to the respective kernel Makefi=
le:
>
>
> Perhaps, it might be worth mentioning that kernel space objects are
> covered by default.
>
> Then, people would understand ':=3D y' will be less common than ':=3D n'.
>

Good point! How about I change to the following:
"
The default CONFIG_AUTOFDO_CLANG setting covers kernel space objects for
AutoFDO builds. One can, however, enable or disable AutoFDO build for
individual file and directories by adding a line similar to the following
to the respective kernel Makefile ...

>
>
>
> > +
> > +- For enabling a single file (e.g. foo.o) ::
> > +
> > +   AUTOFDO_PROFILE_foo.o :=3D y
> > +
> > +- For enabling all files in one directory ::
> > +
> > +   AUTOFDO_PROFILE :=3D y
> > +
> > +- For disabling one file ::
> > +
> > +   AUTOFDO_PROFILE_foo.o :=3D n
> > +
> > +- For disabling all files in one directory ::
> > +
> > +   AUTOFDO_PROFILE :=3D n
> > +
>
>
>
>
> > +3) Run the load tests. The '-c' option in perf specifies the sample
> > +   event period. We suggest using a suitable prime number, like 500009=
,
> > +   for this purpose.
> > +
> > +   - For Intel platforms::
> > +
> > +      $ perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c <count=
> -o <perf_file> -- <loadtest>
> > +
> > +   - For AMD platforms: For Intel platforms:
>
>
> I guess this is a copy-paste mistake.
>
>
> For AMD platforms: For Intel platforms:
>
>    ->
>
> For AMD platforms:

Thanks for catching this! Will fix this.

>
>
>
>
>
>
> > +   (https://github.com/google/autofdo),  version v0.30.1 or later.
>
>
> Please one space instead of two after the comma.
>

Will fix it.

>
>
>
>
>
>
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > new file mode 100644
> > index 000000000000..1c9f224bc221
> > --- /dev/null
> > +++ b/scripts/Makefile.autofdo
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# Enable available and selected Clang AutoFDO features.
> > +
> > +CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enable-fs=
-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
> > +
> > +# If CONFIG_DEBUG_INFO is not enabled, set -gmlt option.
>
>
> Meaningless comment. It explains too obvious code.

Will remove this line of comment.

>
>
> > +ifndef CONFIG_DEBUG_INFO
> > +  CFLAGS_AUTOFDO_CLANG +=3D -gmlt
> > +endif
>
>
>
>
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 01a9f567d5af..e85d6ac31bd9 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -191,6 +191,16 @@ _c_flags +=3D $(if $(patsubst n%,, \
> >         -D__KCSAN_INSTRUMENT_BARRIERS__)
> >  endif
> >
> > +#
> > +# Enable Clang's AutoFDO build flags for a file or directory depending=
 on
> > +# variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE.
> > +#
>
>
> This comment would give the wrong understanding that this flag is opt-in.
>
>
> The comment for KASAN correctly describes that it is enabled by default,
> and can be opted out using KASAN_SANITIZE_*.
>

I can change to use KASAN's expression:
"
# Enable Clang's AutoFDO build flags for kernel except some files or direct=
ories
# we don't want to enable (depends on variables AUTOFDO_PROFILE_obj.o
and AUTOFDO_PROFILE)
"

>
>
>
>
> --
> Best Regards
>
>
> Masahiro Yamada

