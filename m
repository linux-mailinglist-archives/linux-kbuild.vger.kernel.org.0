Return-Path: <linux-kbuild+bounces-6298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76414A6CBF5
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 20:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E393C17BE05
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 19:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDE24C6C;
	Sat, 22 Mar 2025 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="NKkRKj1k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595751F4E5F
	for <linux-kbuild@vger.kernel.org>; Sat, 22 Mar 2025 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742670741; cv=none; b=B1QM0MoRmIBmUbUtDF9hyKB1XgBkW14khLxG+RsAo9tzWw5mjoJHOa/gApqaWRiGV1knZeykP4rZlYIPy5hc17xiEDr/X37nsoRe4TN92XD2sYqhaq5yyqB/ExXgBC8xESa/oSOm4kVVxMTyrrWlGwDiBjzuOGcclb+m4nmrirA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742670741; c=relaxed/simple;
	bh=Ms3GzoMd0rlk4O2lv0P7VKB/JXaNBBDottrVBUZkhXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJniLYoj3cKzoMoY4wo19eUPrvyfiQFRjGqWJZmBNa5v7sGQqV7lp2nl6k1OP25k8Z/TITuwDk1NiIcaRGtHqsz72qVk02b6FkkBlbWxdgOrtrGMpyiHoZJc8/t1T/w31SU8OQ913v04Mcane3k+yCx3LRZYUylPwR5E0iLS+JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=NKkRKj1k; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6feb229b716so28666877b3.3
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Mar 2025 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742670738; x=1743275538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xc66qLysPvi281ZD9mTakiRweaXqO3hMAEWrZlpzBs=;
        b=NKkRKj1kiT/HQmu7ibaWo0/LNpusXk8Ar/5FeSLeH+saNcYNMyJWURQX2Iv+IXbltR
         44TwBxHyYkNmkaiFLCLKFTL3uzOhknmC974TPHuyPHL+8qe83Zpl4TTtKahg/syAyefj
         G1Exhd3VOx7FFCIa2Honz/z67Tor/gkCr7Q/aTv3ytcWpM/1OvI8KFfP4T3lVWNq82Dt
         RjyqrarQJskwFIue9SlxnRHQ0JSVL/89g8rzO3tHNMqAWDY9Rc+O3K/i0HAq5XViqBqC
         keaZ2w9i8MFb6shtt11rKJn3PvvZ+PuGXJehe2N4CSgFCdNxEzTwFAdoTWC6TVWbs+XE
         L8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742670738; x=1743275538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xc66qLysPvi281ZD9mTakiRweaXqO3hMAEWrZlpzBs=;
        b=c3PRoSAKvi3mmYCqZgba4y5nw7/I8sgJPi7ht7mZJ85uTGRrPr1TPuaENB9LpdS3+F
         Ks96hD2g+WyR9SlW2RhiScCQUylEMdz1T9NhzvYfv1gn8J34HmQleXewuFtcEeS8mhIa
         xmUjWuSBanhsTsyKEuoCT4R3e5FT/W/SK3CeaJj9hMdcaPeBtE3UTmuEW0yV6PynflTn
         lRIN3x4hQtz0SfN5H5wDnezZvZn7c9T0A4DFF0SFW+xVEjZjU0UPEVKuw1x74bKvAvEo
         XemIMvjJFsZmTr5nL3KBsWI0mkpd1EyVlKdzlL2D7sWRVB9NRBhyOiVXv1ayWa4cRftJ
         xCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqD32xBfJ0So4nKGkfx0yYq3zcpjar8hMHeITl1Xx9Of2I+eZ2k0v9ShxpDHye2NE06JuZN0eUXJ4zqfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJBBIbSBToOy8TVMjb10FQmgpHT89xrCsoBG+99VHDkdBpy1A
	Fq/2IGcyansEUFh8404JA+JK8O17FYMq7SCCfn3YU7TD68fW2oHE19q9CUfJ3Gc=
X-Gm-Gg: ASbGncvuVsQt0esyg/RVTjsaigT/X09RoHYdERIWxmoA3dj8QGHRfWEXOm32AQmD6ey
	sOKyiC9yYUobcfSuQApoTDtQxZ4+GuTM9IGfVnU2bJ4Z2+dZmlkfIvERsLXnmqGyuOKwvHd/0FB
	WR52nD5qFpl97Cb35Ni3AEkeCd5Dk+gf0qokhUBkFoBNazm5+lP5DXE/LS8xFjVtWHH7F8pDwtw
	INAxsbWJuL3AR+sg5yFfIN7d7nthPULVbiIe6J0ja1PJJvgstfDgyMy5IazMN0zCfX/1wqJVwFC
	X0ZmS9NqDnAhCDN9JzsJ9TknQLy+iboWKW6EXpWy5KlD4SC3ZR1r1RAGSdjcd0/V6WVsY3EJq0U
	zAt2vxdpPW30lrFTvCQSVfw2VVUl2m5gZ3CKdVUd7
X-Google-Smtp-Source: AGHT+IGKshaTgbMcpr9UNssd5GQF9rWZ6akyX1Lym+sKao77CEU4NvOIGlBPRgaIF+zI1BiKem6ung==
X-Received: by 2002:a05:690c:fca:b0:6fd:2321:567f with SMTP id 00721157ae682-700babed947mr87056967b3.8.1742670737953;
        Sat, 22 Mar 2025 12:12:17 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba7938e6sm8572027b3.64.2025.03.22.12.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 12:12:17 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: tamird@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	contact@antoniohickey.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature 
Date: Sat, 22 Mar 2025 15:12:09 -0400
Message-ID: <20250322191210.1926380-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CAJ-ks9=GHVfd=iRT73DviOD=6dio3U7wQWLaXAhKr3UG5-ivvw@mail.gmail.com>
References: <CAJ-ks9=GHVfd=iRT73DviOD=6dio3U7wQWLaXAhKr3UG5-ivvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Mar 22, 2025 at 02:24:30PM -0400, Tamir Duberstein wrote:
> On Sat, Mar 22, 2025 at 11:08 AM Antonio Hickey
> <contact@antoniohickey.com> wrote:
> >
> > On Sat, Mar 22, 2025 at 10:16:01AM +0000, Benno Lossin wrote:
> > > On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> > > > Since Rust 1.82.0 the `raw_ref_op` feature is stable.
> > > >
> > > > By enabling this feature we can use `&raw const place` and
> > > > `&raw mut place` instead of using `addr_of!(place)` and
> > > > `addr_of_mut!(place)` macros.
> > > >
> > > > Allowing us to reduce macro complexity, and improve consistency
> > > > with existing reference syntax as `&raw const`, `&raw mut` are
> > > > similar to `&`, `&mut` making it fit more naturally with other
> > > > existing code.
> > > >
> > > > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > > > Link: https://github.com/Rust-for-Linux/linux/issues/1148
> > > > Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> > >
> > > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > >
> > > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > > index 993708d11874..a73aaa028e34 100644
> > > > --- a/scripts/Makefile.build
> > > > +++ b/scripts/Makefile.build
> > > > @@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
> > > >     $(call if_changed_dep,cc_lst_c)
> > > >
> > > >  # Compile Rust sources (.rs)
> > > > -# ---------------------------------------------------------------------------
> > > > +# --------------------------------------------------------------------------------------
> > >
> > > Not sure about this change.
> >
> > This change is so I could enable the `raw_ref_op` feature for doctests
> > since the minimum Rust version 1.78 still has `raw_ref_op` as an
> > expiramental feature, and will throw errors at compile if a doctest uses
> > it. Is there a better way to do this?
> 
> I think Benno is just asking about the extension of the dashed line.

Ahh ok yea that makes sense, thanks Tamir, sorry Benno I misunderstood.

So the reason I extended the dashed line was because before my change 
the dashed line perfectly aligned with number of characters in the line
I changed. I figured it was supposed to match the amount of characters
of the line.

Giving this a deeper look it looks like the all the other dashed lines
are maxed at 77 characters. 

I will update this.

Thanks,
Antonio

> 
> > > >
> > > > -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons
> > > > +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op
> 
> This looks correct to me.
> 
> > > >
> > > >  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
> > > >  # current working directory, which may be not accessible in the out-of-tree
> > >
> > >
> 
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>


