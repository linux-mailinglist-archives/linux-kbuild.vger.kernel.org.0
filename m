Return-Path: <linux-kbuild+bounces-3908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4799A990928
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 18:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B7C8286FC4
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 16:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B068A13CF86;
	Fri,  4 Oct 2024 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OEuaGWQp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B396C1C8761
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Oct 2024 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728059333; cv=none; b=tDWrxuh7ceBqwPs7zOxEdTDEUaA6bIeS7NzQzz1q+LgjLkSjQfFdTpfHLSRjGNm0jDpxlrvp7YV5bNd8k8CNzz5yYn4ijqFB9GAU76vIz7O8cqdyYy8zqYzXqkbuwLYyxQI8WcQZnIgmkYHubW5PnI+GtufQQXepKGVWEza90Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728059333; c=relaxed/simple;
	bh=mcKXImcn/JYcaewMquzchQJQfQcUvJgG3O8bd9ZOhKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckOmLL0DF+1VUB8lx/0Q1ZfKWQFa/NeOBFHpw4O3dYW5l99wJkIhkRnyMT+TdrsKXVowcrKVsi06Q39nwMrH1BPRgu94wT0k1UFinHMwUoPD3keWo6IXAqsrECcPYWK4jzRtwlJMwzixaBJvD9GKzrMmATJEVlpj2DJ35z7VX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OEuaGWQp; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a376e3acfbso231295ab.1
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Oct 2024 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728059331; x=1728664131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgGY2eqskxrBEZxo84cDOux6pQgpEj/UNQt8PWqDZ8w=;
        b=OEuaGWQpE6165Gx1F0EDyOZczr5rpkXelnjrtxxNNsxaDjqfmVCqmEyKO4FTDuoRS+
         +0jodkObFIEn6xYD4LR5bQ6v4cj1oYg9wnaAL6n488WgVp1kyJNfyqPEgORe9+c/ua4k
         BdJzxB2E1oKBODPcTyPSYNlEDeGjMiaNQfsxXRTkuvdjPAuLI8xafYuyBdUviwnGaDZc
         M6ggPpx1f1EW3SPHvNeB8bftISZ5ZVoD2qebczwK1J4yP4XsV+lmPqiaDm6loPOB38qD
         D+sF6tku0H5Nqw/jMgafEQ6wvm+5dmMfjl6iRpfXj9qWNxytnn7LeMmf2hJ90gMOelMk
         rErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728059331; x=1728664131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgGY2eqskxrBEZxo84cDOux6pQgpEj/UNQt8PWqDZ8w=;
        b=DsKOCu+0m+UmaY8OhPeGSPLUEmJAbOVaL4KKOeEH1YmLTYqCDaWQPoW9ib+L0enL1M
         uV5Z+7RQpajgshPd85SK7WTzjiGJaeGqi2+nq2SMBQjDYsTT5VK8FYLzShNFjugUp7mv
         Z94U7g/XRpBPhTql159w+JL0u0GYcNxyOljuDM27hpBYXr20VMQXc3Lvf7rZEW0uL+Mj
         bveZ5uVMOnQiNXgAmfQLb14Woju+BtXixf7ZeB1AH2t1ZKKVdVir3v7FAgKLlIYmkRor
         ueA9daVVbMtXp4nQfiVn/0O15PVhtIzBv1eI6hcBKEVOoIIHM9pd4IP8yuT9P178pT4R
         SZPw==
X-Forwarded-Encrypted: i=1; AJvYcCV0yFwoJen35KNzP5EqzkWWVGQKEGdFsUYgLFSFUlHq6wJ4/aBEb8EEyu42pRANBYpWaeynVEC3861+4W8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZnwuiVVvLbXOnHyap5ikXum8n6n/4lUN4GwE9MMy8RcTsZ2Y
	28OyimjAU3rl9rfVe8WGavqxvWVNSuwywZRyIP/Lpu8Sx0GoGNPtEdCVap8rWNnp+kHpaWgZJuh
	fnO5LE765SLQzFROGjF8mDHCwDm1Y08oBNKJ/
X-Google-Smtp-Source: AGHT+IGCEt+Cx8Bcl8DmVXb76uKeIue9614VP76/1RwzU7Pr6FX0/77BJWA/5ijrvw6aJnbkMfeSKf9ghJEJrtNmO1Y=
X-Received: by 2002:a05:6e02:154f:b0:39f:3778:c896 with SMTP id
 e9e14a558f8ab-3a3767e5548mr3313975ab.5.1728059330603; Fri, 04 Oct 2024
 09:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <CAKwvOdnS-vyTXHaGm4XiLMtg4rsTuUTJ6ao7Ji-fUobZjdBVLw@mail.gmail.com>
 <20241003160309.GY5594@noisy.programming.kicks-ass.net> <CAKwvOd=CRiHitKeYtHH=tmT8yfDa2RSALbYn5uCC8nRq8ud79g@mail.gmail.com>
 <20241003161257.GZ5594@noisy.programming.kicks-ass.net> <CAF1bQ=RAizpP-T_sRGpE2-Kjsk_RZD3r_iz_dpn25W+uDzpWOw@mail.gmail.com>
 <Zv-Fy4hnuscnLH1k@kernel.org>
In-Reply-To: <Zv-Fy4hnuscnLH1k@kernel.org>
From: Rong Xu <xur@google.com>
Date: Fri, 4 Oct 2024 09:28:36 -0700
Message-ID: <CAF1bQ=S8Hg0FUThaDU0snVqerVos6ztzVvN6sm1Ng3FnTpJt_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Mike Rapoport <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Han Shen <shenhan@google.com>, 
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
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, x86@kernel.org, 
	"Xin Li (Intel)" <xin@zytor.com>, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 11:09=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, Oct 03, 2024 at 11:20:17AM -0700, Rong Xu wrote:
> > Writing the doc with all these code-blocks was not fun either.
> > We are happy to change if there is a better way for this.
> >
> > -Rong
> >
> > On Thu, Oct 3, 2024 at 9:13=E2=80=AFAM Peter Zijlstra <peterz@infradead=
.org> wrote:
> > >
> > > On Thu, Oct 03, 2024 at 09:11:34AM -0700, Nick Desaulniers wrote:
> > >
> > > > > It makes it absolute crap for all of us who 'render' text documen=
ts
> > > > > using less or vi.
> > > >
> > > > "It hurts when I punch myself in the face."
> > >
> > > Weirdly enough I have a job that entails staring at text documents in
> > > text editors all day every day :-) sorry for thinking that's a sane
> > > thing to do.
>
> Something like this should do:
>
> > +- For enabling a single file (e.g. foo.o)::
> > +
> > +        AUTOFDO_PROFILE_foo.o :=3D y

Do you mean we don't use ".. code-block:: " here and just use indented
text separated with blank lines?

-Rong

>
>
> --
> Sincerely yours,
> Mike.

