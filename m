Return-Path: <linux-kbuild+bounces-6291-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9C4A6CB1B
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 16:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3000A163C4E
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 15:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5177322AE5D;
	Sat, 22 Mar 2025 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="O1fL6+eG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBC722D79A
	for <linux-kbuild@vger.kernel.org>; Sat, 22 Mar 2025 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742655765; cv=none; b=NCszc1O5JAkm9q1UPwln80g1+NihlKP+B9D3P3x7aqrbzgx1AlKJjYXQWYw2WhuUY0lXBfrNbcLK2eQ9FzwQvvOIBIPGwWlXICocd4qcdOyICyYOqr6aJYOCa7u5G788r+2qJyKC42zXzFKEbXkpLDHpyGu1ogO6mzy3Jf1qveA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742655765; c=relaxed/simple;
	bh=xmaBHHV+pBO1cdNj9lOsTobDcjk4fT7ScUbArphMew4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/LEk0YmqDBdt5gtDVmxBZQ5txO/ESw3xTFZ5Pf8tHgBK3PA2WekwW54YDO9DBgQoMUrQOz7seVdbeU0DSWPqBdpI58i4yM8JZSBviQf+pt1y2XKJIqGFR06W0cQiQ7zHGi1Wtv3X+fZuL+erSoER8j0PUSkwyBtg7xtJ4uu4RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=O1fL6+eG; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f768e9be1aso38427907b3.0
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Mar 2025 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742655762; x=1743260562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFV0r1ify5HIIcyLd8ZfZYsL133OkFOEjRPT1PjsIps=;
        b=O1fL6+eG7WedNBGfCyX6/ec/mBPCCb788J+BJh7tB8p3zVmQ7INQcPc45cFSPplr9N
         QBp6FJpA4MRSt8veEfCsYPJQUSvALQz/uAdsxcNRtPoc4ydzj4g8REAZt/olEW9YBK68
         1aPxSdWBeL4/F09EQEx7TJ14dQ6kMl+vxw16I07bgjapgHdsnhx7agg4LSWWKGMNd+eU
         l++CCrhQanhHnIKfaf0AzPG/6Yn17kCebG7d94Z1oh8DRTSGKXwe0IIrgflr6OQ5p4Vk
         j1iNBn8wUNxWpyDrL61eNZNxUSxzBjasg4/YcHt3kV0eciGx9kw6l+poNDi6KNKints7
         aJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742655762; x=1743260562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFV0r1ify5HIIcyLd8ZfZYsL133OkFOEjRPT1PjsIps=;
        b=pzOcYE2lQPKUITJyVoqFbAUuz0PeoVOHuAC+ZWi8AEq1VoU8i3PGM5fPp/uL9bYvn6
         WbLXQVfh5V1tPZW2LLven37ZU77N9905GkLnJMzY7gkb/ZDCVOoC5FdC/IqY9P8xndZG
         6KU4tRLTIJ5JSNMA+1PLk3DMyO9Q/+v0MsI2c17AdpE1HHDoiXlGiE4r9kk8ukOU9bNA
         RMZWzCdK7bLoqZDJaESJSGHatwnJSOgbpY31JRIDGcJ5XeOckqbTsx20sdmNq3NvDH4N
         SkjuWJ2Q8op8d4nYpjuP5Cds58yoQCDXVyUfah9Ok+6U/2x0XOSUPT0XHVfNJNBFBwHa
         nC1A==
X-Forwarded-Encrypted: i=1; AJvYcCXaHbNAtVIp6/7HnUQ5lpBhaRDAEOU6VYAYsjBmhDxxlxcBlRdONTqH6YAG4ycmxGE0j1zeKx49IIFlj1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKVLYoXJyRpBIY2oUgTeEQRACtB1QvabNi1tJxg8rdcShKNzd6
	x/lUhQ7trtdB+IWlIA/xCzd6Ut8cgVs2PTxTHulKUDb/Ln+5Lq3eIQW5EP3Hvps=
X-Gm-Gg: ASbGncvrfjN3+NAlK9Y6vSb/ZHsDcZVc67L0xEE/tIpof2Fvwpz+zdtZptPdhFbEW8n
	whYBNoPE616CbYbonQxLvmXhc8EXMD6fcIrroJ7tuB0vGW9G6k2jpCmwQhY9jU65FxQo6oc4bIO
	K9/2z/MT8NaHAApayRNEfr4bJCMGMUbgGGvvK6MnhPdbVU3Dsymjq1ySicHRnGDVx0JhxDlqssv
	B9mWyS16gyzHA64RDpNGxU6knsH0qGUssWEx84FleNiPQw2pnEvruBOfGoCA4/7VpM367GSEoDP
	Im/BnGIQG3lqddZkxIui+EtuaLLK3rKRxogl2WrMINuFar0ykBRx23oQOO52N+5mrPvM0ZFnLPb
	+CHnHW1oDQgpHwTFV4RdFL4RmjQgdDq51aAtD4HWy
X-Google-Smtp-Source: AGHT+IF2ZG+6e1bR4Awen52wPxMIUEY8IX43biiu2wKoBJJwjGEumXzrFQv+3RyxSGDzYPrMHT7LBg==
X-Received: by 2002:a05:690c:6c8e:b0:6ea:8901:dad8 with SMTP id 00721157ae682-700ba305d15mr106328367b3.3.1742655762158;
        Sat, 22 Mar 2025 08:02:42 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba73d085sm7897807b3.15.2025.03.22.08.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 08:02:41 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: benno.lossin@proton.me
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
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
Date: Sat, 22 Mar 2025 11:02:35 -0400
Message-ID: <20250322150235.1851241-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D8MPT9V5JAEN.JZ5APEZ4TYPA@proton.me>
References: <D8MPT9V5JAEN.JZ5APEZ4TYPA@proton.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Mar 22, 2025 at 10:16:01AM +0000, Benno Lossin wrote:
> On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> > Since Rust 1.82.0 the `raw_ref_op` feature is stable.
> >
> > By enabling this feature we can use `&raw const place` and
> > `&raw mut place` instead of using `addr_of!(place)` and
> > `addr_of_mut!(place)` macros.
> >
> > Allowing us to reduce macro complexity, and improve consistency
> > with existing reference syntax as `&raw const`, `&raw mut` are
> > similar to `&`, `&mut` making it fit more naturally with other
> > existing code.
> >
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1148
> > Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> 
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 993708d11874..a73aaa028e34 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
> >  	$(call if_changed_dep,cc_lst_c)
> >  
> >  # Compile Rust sources (.rs)
> > -# ---------------------------------------------------------------------------
> > +# --------------------------------------------------------------------------------------
> 
> Not sure about this change.

This change is so I could enable the `raw_ref_op` feature for doctests
since the minimum Rust version 1.78 still has `raw_ref_op` as an
expiramental feature, and will throw errors at compile if a doctest uses
it. Is there a better way to do this?

Thanks,
Antonio

> 
> ---
> Cheers,
> Benno
> 
> >  
> > -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons
> > +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op
> >  
> >  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
> >  # current working directory, which may be not accessible in the out-of-tree
> 
>

