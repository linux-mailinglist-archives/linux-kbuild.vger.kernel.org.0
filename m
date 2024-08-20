Return-Path: <linux-kbuild+bounces-3119-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B29958D23
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 19:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51621B216C6
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 17:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181E21B8EAE;
	Tue, 20 Aug 2024 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R34Db0DX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3717B18C92C
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 17:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724174576; cv=none; b=hCMTt9F/jw+ZhAoEwoxbK4kJDj4hDtMbjY6wxXuI+eoNNHpuR8l6zEXHW1zTTCDsTXNy9ZlKq9l4zHhS5yuhNnzLKY4ieUAwECunR2G1UA9qFZwndagcMtIGbRxhcEkyDQurgHASa9UjYzZBxd5Yra0qhB5T2TrdSPeXrnujEYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724174576; c=relaxed/simple;
	bh=Yk067SnRDTB/yWZvQw5AoltCb9lkUfMXeEMYixaFhDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8I6rOSXziG9df5TgSF/TYQ7/lUjTJds0hKC/x+WYItSzbnnP3+E1zbbkop/X1In89BKCJWc8tB/MdunrHTxC2JbI6XZh2/0xJHqUHaeoLXNVzYk8rd+J7g8bYyWWKbkVUjesPV8+nW7PWCAA67D+1pZInGcuv9r+ogv697LIUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R34Db0DX; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bebb241fddso603a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2024 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724174572; x=1724779372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/1WG/9ldCtAUxEKSi+2OpNUvCL9Q6L1YzxrQLiosWY=;
        b=R34Db0DXoE9il9XPwMR4eGxEgnmtotI7Eycc8RfswYB1hERV/3o6A9ziFSM6UEyGmC
         kTwSHLUCfHtMHNjCX3TmRSOqOfp5Pf6akwc8Wn3rZZk2EwS8ccMbGmnDiTadTU1T48vA
         74A3OgNo72Yw6lq28qaHKUc3lHE6VMGJrxDaLYXzKQ2EdfLr2V6pRuIDTuiPb5B70gwN
         ltv2lAj/Yn+0k7OJX5YWsxL2EHhh0F/D5d8jCjAfpCNJlSY8+B7dxN5R0TFMdqNtJeKG
         CiqXHzEv/a2lDqyEoNrjDH1ntftTaKZZk1yQNX8dUSxPZchvRyFTm8bsFcyK/jgphgfq
         ZWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174572; x=1724779372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/1WG/9ldCtAUxEKSi+2OpNUvCL9Q6L1YzxrQLiosWY=;
        b=rgrCW0WA1oSZjPmYaR/f5rsBYWAvjictK1QW0m1beH8e9WWdNhsR7v9VfkmFnfCxpx
         0vXexxB0gBH2dLdRn6qPdz8XgLqV4cZPapR2RJhC3T82Frih7StGeAiUnj76rVCwS6lK
         6x8s3qx3Nx2j9rQvOdxGI2FGXmk0Kyeu9AdputxmzXP1VgVW+lQE6eXyyOeuJ5ldodtD
         1z4HKdJd6Dqa3gV6FT2UZIe2RdcpLNi26fj0JQ9uzETH0nMEnl4s/5giyJ5n8GI48eAN
         1eEwJUVej0iBB4HvHMyjTmFXLsLoSBQqiOora7Esx4MQsvcF7cBF2bkqpdfbicbhDyMc
         TIhw==
X-Forwarded-Encrypted: i=1; AJvYcCUsBoiafyshCx3X1VrydZOWNLsxwmHz1Siu4oMnFK/xgCfM4MhH0StQIYsCFmmQxgnDi8tghCZBtxPWq7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW1RpmZ1RAIuQn/FBtavpQnne4B+gpzQyokMaQYjqWj87DgBFE
	TyPkg8sv3xHBfmGMIG/VZYlx/Oa13chBqjbmU34EkKs5f2bXxcEl+DLyGHDfpUT8ByCzkXWdmTh
	QF6jbNwx1/j6fN7kFbijYIvL2ptqxKjq23oCU
X-Google-Smtp-Source: AGHT+IHnzEjfKJoOP6zSpqnlVKYAp79gjJZtHxgxIKFwml3ILU+99PRFpoeiHBZGo2fYFeU5opRvNpd5SUSI7TMWSrI=
X-Received: by 2002:a05:6402:35c4:b0:5be:9bb0:1189 with SMTP id
 4fb4d7f45d1cf-5bf0be0c727mr163175a12.2.1724174572142; Tue, 20 Aug 2024
 10:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <20240819213534.4080408-2-mmaurer@google.com>
 <CANiq72k8UVa5py5Cg=1+NuVjV6DRqvN7Y-TNRkkzohAA=AdxmA@mail.gmail.com>
In-Reply-To: <CANiq72k8UVa5py5Cg=1+NuVjV6DRqvN7Y-TNRkkzohAA=AdxmA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 20 Aug 2024 10:22:39 -0700
Message-ID: <CAGSQo03GVik5_yXFmCUnNUnPUwuwk-YFA0kqBd640PUjFOXcGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] kbuild: rust: Define probing macros for rustc
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, 
	samitolvanen@google.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	glider@google.com, ryabinin.a.a@gmail.com, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 7:20=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:

>
> I had some feedback on v2 -- was it missed?
>
>     https://lore.kernel.org/rust-for-linux/CANiq72khUrha-a+59KYZgc63w-3P9=
=3DDp_fs=3D+sgmV_A17q+PTA@mail.gmail.com/

Sorry, I did miss that in the refresh. To respond to a few points
before I send up a replacement for this patch:

>>
>> 1. `rustc` support will soon be a minimum rather than a pinned version.
> In the meantime, this happened, so we should update this sentence.

Will update.

>> 2. We already support multiple LLVMs linked into `rustc`, and these are
> I guess you mean `rustc` is able to use multiple major versions of
> LLVM -- or what do you mean by "multiple LLVMs linked"?

I meant that the `rustc` consumed by the kernel build may use a wide
range of different LLVMs, including unreleased ones. This means that
which options are valid fundamentally needs to be probed - there's not
necessarily a clean "LLVM version" for us to use. I'll rephrase.

>> +# $(rustc-option,<flag>)
>> +# Return y if the Rust compiler supports <flag>, n otherwise
>> +# Calls to this should be guarded so that they are not evaluated if
>> +# CONFIG_HAVE_RUST is not set.

>Hmm... why `HAVE_RUST`? Should that be `RUST_IS_AVAILABLE`? Or what is
t>he intention? Perhaps a comment would help here -- e.g. something
>like the comment I used in the original approach [1]. Otherwise we
>will forget... :)

Yes, this should be RUST_IS_AVAILABLE, will update.

>Also, I guess you wanted to relax the precondition as much as
>possible, which is great, just to double check, do we expect a case
>outside `RUST=3Dy`?

I expect this to be potentially used for whether you're *allowed* to
set `RUST=3Dy` - for example, if a particular sanitizer is enabled, you
may need to probe whether Rust+LLVM supports that sanitizer before
allowing RUST to be set to y.

>> rustc-option =3D $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(=
RUSTC) $(1) --crate-type=3Drlib /dev/null -o .tmp_$$/tmp.rlib)

>I also had `out-dir` [1] since, if I remember correctly, `rustc` may
>create temporary files in a potentially read-only location even in
>this case.

OK, I will add that.

>> Also, should we do `-Dwarnings` here?

I don't think so - I can't think of a case where we'd want to error on
a warning from an empty crate (though that may be a failure of
imagination.) Do you have an example of a warning we might trip that
we'd want to make the build reject an option's availability?

>
> Thanks!
>
> Cheers,
> Miguel

