Return-Path: <linux-kbuild+bounces-9740-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A97C7740E
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 05:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E15C35EE4D
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 04:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E742DAFAA;
	Fri, 21 Nov 2025 04:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH2LE0Jh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CE2223339
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Nov 2025 04:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763699879; cv=none; b=MZKohRTESZlKgqz/o8Jm5XMbejDi52pB0HmWaSe3IJWLpsj226MeyOB+mLijb8HMPmdqpywxgTQcFqoB88Um8HdYQBMzjaSNr7vWlq16XNvXQ/ObrBznDdtTkpGvQEy9BVBgNoSPFlPa8DV+Te3TMf8mA0V7FZTppPz//G8cuR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763699879; c=relaxed/simple;
	bh=6s8PHWdOSG+1W/WLK0jEINIZHtjaB4NfAJ0TkZr4vkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuL2JmnAMJ1QQbQcNlhEy95tiuFkjS7NI4h23rlC7+watcT6sldiKW6zxB6jGkF0t8dGjRvWOEo+qFKVmtzeRRivyoGuL60D9ARY9zotGeThh0E8c00/elNN8U13mjdkCiwhTumw5GTzwRkE09joRCVlgLNnbMPrJD/98JQU9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KH2LE0Jh; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso1734431a91.3
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 20:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763699877; x=1764304677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TynGywYl6RyYw3CZDKcyLY9zDRebGixEzoKG3/4NI9s=;
        b=KH2LE0JhyE2zTCeE6mJ7eikYcUCnr1NnkTjUf1TqnZlHxYgIvR+bDQv49e6oEFxwE4
         LZSUtsMolUC3IaS2L01wFjcqaOyKH5VNIhIFDuicQN7Z+QLxV/EHJrsp0XcAX6FHU+GG
         mx/W1l3O0sy4Rk3Egi6NF3tEU3ZfecQbPgKKU4q9WoH2rEfqEoInHC2Gn060HcWlEuoA
         pkqIuNMTx+gbXho1zJLRYLqyfAtS+p1y98daRWPlQUKoCYcGGZp1jNolshSXT5u7wFPm
         qShlbs9z5b87A5Ob5IlBB6SutBoHsyHi3utJMXBRvbsHKnXE8i/Vg7nXeZI3SdPJoS3d
         M8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763699877; x=1764304677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TynGywYl6RyYw3CZDKcyLY9zDRebGixEzoKG3/4NI9s=;
        b=lm+lBSvMPdETxGbbAB2UCwBD6Fub8AFfAw3BV9+rcZpdv+LVfuTOa3tbTJm1ENZRCD
         97e5K8U+uaKj2p5xNkUrzcA5KeKG1vOVClYIATWlMq5Mj4TUm7xspbjwTEG7ehrhK8qC
         YU+1ngiwE4IwRSrdGNKojB6+d1BNpmM4oQFFodKqB26ZTDP8FD1VXGJBU619suHcLJho
         fBonkscggiCDTHxuZYcilwZ5+ubJ4Zmu13wMmMbdkFTb7cdPWuL6olo9zDTunKLavIg9
         oj0Tm5TOVd5jDEdrzRu4viAMbYk2yLhk9xGekg1X5woV2EDJZVENNSaGhOfW7Fg2vxDq
         I8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXvqvjym/txx0wHhAC136yvM+N2HjN3tsiBW9FFemJDzcWbjRhrhSuMFYsNQgu22CkC/Mxynd3+wTSmOSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60h+8q8D5YKWGkIT3N1G+VBjKlN4EU1kvqd5feLzNPyQqiZ6L
	ucxQb6DT86a4J5GdK5u0Bbo+AN80hh2Oe6p6jM4wllQg+PwHBDYj//Ap
X-Gm-Gg: ASbGncuZhV+oiJVyF6XSA5asST2YCtQEytYSQGw5LVzG6W/FuuNfnHXrtK34RrFBReZ
	036UdonNO9P0+HetkCnGZX/6vR/8H/17MDdmTLTDa5kG2jKVDH7rUbsxkgMkTFp+Rk0EB1vfOPI
	1xbl2CMbDrLSc6BFuRb4tF4xa/s7jlv0DPkU18lyn6wlWX4yABgmZBjKp8xMPEvYE8VuGGZzBLZ
	oxOJTkKX6o0bctg9DuQd9TxxCE+T1d5UpzC+Pv9lenxvlivEG/gZpQTMk90QPiEcF6jdHpbh6DD
	g+nAqcVg0cqFRzQx3Opfmmb4MIVtQbzsTJEJDybG2Khzejrla0VROal0ADQiAK2ZBq80aKwEyAg
	ygDt+M4O7SWoI+SX0cTocQhMcCvvdyLEkg4rMwce9uhM4+dMBUtodYB+KQfM8RUrUHcOfRn5dTo
	sm7cgVuZw6Ob0vMjvpJ4w89g==
X-Google-Smtp-Source: AGHT+IFpy8aEMiz+rI49VLVFHENbF/NAOcnRM7T5COE/u2FbKYQ0ITBcar491x6jUidWBixZMc+Z+Q==
X-Received: by 2002:a17:90b:48c4:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-34733f163c7mr1355810a91.19.1763699877463;
        Thu, 20 Nov 2025 20:37:57 -0800 (PST)
Received: from localhost.localdomain ([104.28.217.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34726696cd4sm4150711a91.4.2025.11.20.20.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 20:37:56 -0800 (PST)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: gary@garyguo.net,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	patches@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH 00/18] `syn` support
Date: Fri, 21 Nov 2025 04:37:47 +0000
Message-ID: <20251121043750.298843-1-y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251110135927.05d83da2@eugeo>
References: <20251110135927.05d83da2@eugeo>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gary Guo <gary@garyguo.net> wrote:
> I can build with these patches and I've verified that libmacros can
> indeed reference types within `syn`, so also

Hi,

I've been trying to apply this patch on the current rust-next HEAD
494de8f67b1e ("rust: sync: replace kernel::c_str! with C-Strings") and
test it, since I need this series for my future patch revision.

Unfortunately, when I make the following change:

    diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
    index 793f712dbf7c..084633b517be 100644
    --- a/rust/macros/lib.rs
    +++ b/rust/macros/lib.rs
    @@ -444,3 +444,14 @@ pub fn paste(input: TokenStream) -> TokenStream {
    pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
        kunit::kunit_tests(attr, ts)
    }
    +
    +use syn::{
    +    parse_macro_input,
    +    DeriveInput, //
    +};
    +
    +#[proc_macro_attribute]
    +pub fn dummy(input: TokenStream) -> TokenStream {
    +    let input = parse_macro_input!(input as DeriveInput);
    +    todo!()
    +}

It fails to compile:

    error[E0432]: unresolved import `syn`
       --> rust/macros/lib.rs:448:5
        |
    448 | use syn::{
        |     ^^^ use of unresolved module or unlinked crate `syn`
        |
        = help: you might be missing a crate named `syn`

    error: aborting due to 1 previous error

It appears that the vendored crates are indeed compiled; I can see some
build artifacts like `rust/libsyn.rlib`, `libquote.rlib`, etc.

For reference, here's the sequence of commands I ran to compile the
kernel:

    make LLVM=1 ARCH=arm64 rustavailable
    make LLVM=1 ARCH=arm64 defconfig
    scripts/config --enable CONFIG_RUST
    scripts/config --enable CONFIG_SAMPLES
    scripts/config --enable CONFIG_SAMPLES_RUST
    scripts/config --module CONFIG_SAMPLE_RUST_MINIMAL
    scripts/config --enable CONFIG_KUNIT
    scripts/config --enable CONFIG_RUST_KERNEL_DOCTESTS
    make LLVM=1 ARCH=arm64 olddefconfig
    make LLVM=1 ARCH=arm64 CLIPPY=1 -j8

I'd appreciate any guidance on steps I might be missing. Thanks in
advance!

Best Regards,
Jesung

