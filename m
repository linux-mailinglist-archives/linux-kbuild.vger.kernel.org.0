Return-Path: <linux-kbuild+bounces-8537-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C5B2CCC8
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Aug 2025 21:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 620071BC6860
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Aug 2025 19:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0768326E70B;
	Tue, 19 Aug 2025 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ft1WgwdJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C1E26D4DA;
	Tue, 19 Aug 2025 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755630697; cv=none; b=AE2KjfphPkK/dAphPl2R27aD92j67VCXhLd8RpspZKoa5PYEOQLndElV8UohBcnMnSh/n8ypuO01kQa4ZUt3+Dcolv68hIRSw7CDy8VVTyZupdSWTRocxLbdlua5mTEd+gVx5B0PlHCljk2I3fvUSV3659jF7vxbkR/7tmWOyoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755630697; c=relaxed/simple;
	bh=hHgmX2IlKh+H/jKJLuAW+0yjJbJ/Z7ekhE2zkEc2FNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmK8dLWvL3zw7eKa5TdWRAVnowi7TH8KyhR6sNYVopXDpnzplCpWuTddobfdNjUkY/CLl5jRsO08YFbrMnFUz/UlqNKKK8r3/+TNBKRF/fjCoEs1SKals/AuMSpgM6c3DWsDH1ovdpbTqbp7FDgP5M/UTn9fCWlmIvUIs6vHe5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ft1WgwdJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2ea79219so6520338b3a.2;
        Tue, 19 Aug 2025 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755630695; x=1756235495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EiOHPkXHOWRCoxSY55xxvCqttDk+IXhPL7KL7WKckI=;
        b=Ft1WgwdJ0WhSf3689bJ4lDM+HZzNGhhV4ZLeYkK+6hQsVe8tgAuEXLDNtqjbiy0ZFi
         QuPQ+Xk76HH67ozdG9sA4EL2f52jrimFdVzqSeJ+u9MfIvij8pKEdzl0ARgQGtEZeEuB
         /lHXpbU0g9ibZbOOhs+nzTLn7UAc9y5MxXSHZT81eBTpR8frgyBfYHprDntihUCk1cPu
         byinM+yQYMe6IFiBy407AGsGjr6KjuQL2W0vyGzuX333onHWgqLM7lvu3+YoSfJjwvq3
         ia274Dwo74TXXKywOtaQzn0IwhfKTJ2trWwgLHCZaclYeGxLLNBmaPxAi5f3Vb5OracT
         Iqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755630695; x=1756235495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EiOHPkXHOWRCoxSY55xxvCqttDk+IXhPL7KL7WKckI=;
        b=ivEZ4MeOENiQAf+e/9N9pVEm1hoVb50E8IdpZE2EhK88zPWvN3+OkjQapj79AP/MwU
         /nFep3gwx65/LI2xx8DrvAKYeMcmtRIMByhp2Fo5v7im9fVZ//oazZxJpRKww/vt4scI
         I3Q3BhbtAr0B6TJExDP7kno3bGWPmJ2e6HAydLowd9wpijpcpR5WDQ9w6NnBb0afkd3q
         q1JIhl4W6d9y3Pl9WRM/qYYMQgW6t8gahcBX8b5sQECiPdLl5pcVdu/M9bY3PMRsAS+f
         yqZ2XWQq33zBI930Lx24n7kBzP75OsN8tdFLfUx1WphuVqi450jTriBTcWav8bbyZVHW
         32bw==
X-Forwarded-Encrypted: i=1; AJvYcCUYegeozO8/vSJONjbsbg1JgXsLuWZyVAemPCaZFe2YtC2gDLuFB/6fVKII69APYKwHLXl5mMsIT/sH8UNrkAA=@vger.kernel.org, AJvYcCWu21LYadUyjH4sz0IXGfc9JUzhd45+yBH0Vk7ka4mxtGZ8gth9p5Kav/DcIs6tgmZWWsoyiLNPEsNqMpxt@vger.kernel.org, AJvYcCXU6QQcFKKkaxIiKmSq5nJHVnP3rNYy1EUuO5v7wJlnJSnlkDpeZTwYdb9Wh4EYZLgmFWZeCxQjckUwR9c=@vger.kernel.org, AJvYcCXh7VqfI890i0YNCBc8rHqPk3I5zAqUWOPPJ0IcRMFh2MbwaUa0x3MJD61Fe3NIonTYaGE9GsajwVWmhjXGIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJivMXwEzj2H0JiFfaNeoZ7PDdStrgDTX4/3G9+BoW4K4ehef
	C+5AH0aU0sB9NQtUVEWGLxNIPeSsB1cZKgjF1NWzFh0Pjq6Bt+oagVEu
X-Gm-Gg: ASbGncvVsdAkFd9p3ZZAZbCEWPO2CiUe7FUwIYNmcm/glRimA6/BfBXbbt8QyAky4JL
	bmrDcevwaiO6ETB5+RqnnoHZbDb6tVoeLPD1uHHtKr+fsprQlzVzqQXN5lunTgmF/GZRqW98Wz7
	s0QgJSbyWiOC4ptVzU5Ti/qresNooHXwtI+P083vT+NkW2/zTSygX532RBTjjSlbztVEa49gpAm
	Tq7VGLCk+wl4DHFJYAnaVVc+Ol+tPfdrmjATTvZ1h0c7+l8Dab2ZU+wqnSokws+9o7xHhTnFQ2H
	jt82UggiAsZbQYwjQmSgLOrQgW59z6p5xc6INU7flakB5QxIK0rA7Q2WifyLxUXrIQkkoUVIJua
	m4UHjD0jOF1hXE1QsscBSkcwUPE0jd1LRNA1UKfLFsaECUZe5nN9Z6PJWv6n4OQ==
X-Google-Smtp-Source: AGHT+IHE6gXoA6t88wZi7ZU7eCEJVWZQezy7yRl0UNN5MWMdprmoF2meOuqADXbXDYLksEeDxMWHeg==
X-Received: by 2002:a05:6a21:32a0:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-2431b7bb318mr630218637.20.1755630694387;
        Tue, 19 Aug 2025 12:11:34 -0700 (PDT)
Received: from localhost (75-174-53-95.boid.qwest.net. [75.174.53.95])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b47640b6554sm359877a12.48.2025.08.19.12.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 12:11:33 -0700 (PDT)
From: Darin Morrison <darinmorrison@gmail.com>
To: a.hindborg@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Greg KH <gregkh@linuxfoundation.org>,
	Fiona Behrens <me@kloenk.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-modules@vger.kernel.org
Subject: Re: [v17,6/7] rust: samples: add a module parameter to the rust_minimal sample
Date: Tue, 19 Aug 2025 13:11:33 -0600
Message-ID: <20250819191133.39413-1-darinmorrison@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711-module-params-v3-v17-6-cf9b10d4923d@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Showcase the rust module parameter support by adding a module parameter to
> the `rust_minimal` sample.
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  samples/rust/rust_minimal.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
> index 1fc7a1be6b6d..8eb9583571d7 100644
> --- a/samples/rust/rust_minimal.rs
> +++ b/samples/rust/rust_minimal.rs
> @@ -10,6 +10,12 @@
>      authors: ["Rust for Linux Contributors"],
>      description: "Rust minimal sample",
>      license: "GPL",
> +    params: {
> +        test_parameter: i64 {
> +            default: 1,
> +            description: "This parameter has a default of 1",
> +        },
> +    },

Thanks for the patches.

I've been using these in a new PCI device driver module and noticed
that the inclusion of `params:` in the rustdoc test here causes the
`rusttest` target to fail with a linker error (below) complaining about
undefined references for `rust_helper_atomic_try_cmpxchg_relaxed` and
`rust_helper_atomic_set_release`.

Building a real module and using the `params:` field seems to work
fine though so it must be something specific to the test configuration.

Any ideas how to fix this?

---

  RUSTDOC T rust/macros/lib.rs

running 10 tests
ii....... 9/10
rust/macros/lib.rs - module (line 61) --- FAILED

failures:

---- rust/macros/lib.rs - module (line 61) stdout ----
error: linking with `cc` failed: exit status: 1
  |
  = note:  "cc" "-m64" "/tmp/rustcVbJoqH/symbols.o" "<2 object files omitted>" "-Wl,--as-needed" "-Wl,-Bstatic" "./rust/test/{libkernel.rlib,libuapi.rlib,libbindings.rlib,libbuild_error.rlib,libpin_init.rlib,libffi.rlib}.rlib" "<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib/{libstd-*,libpanic_unwind-*,libobject-*,libmemchr-*,libaddr2line-*,libgimli-*,librustc_demangle-*,libstd_detect-*,libhashbrown-*,librustc_std_workspace_alloc-*,libminiz_oxide-*,libadler2-*,libunwind-*,libcfg_if-*,liblibc-*,librustc_std_workspace_core-*,liballoc-*,libcore-*,libcompiler_builtins-*}.rlib" "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-L" "/tmp/rustcVbJoqH/raw-dylibs" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L" "./rust/test" "-L" "<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "/tmp/rustdoctestTFYhZ1/rust_out" "-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "-nodefaultlibs"
  = note: some arguments are omitted. use `--verbose` to show all linker arguments
  = note: /usr/bin/ld: ./rust/test/libkernel.rlib(kernel.kernel.a8a3768e1a8b2c2e-cgu.3.rcgu.o): in function `kernel::sync::set_once::SetOnce<T>::populate':
          kernel.a8a3768e1a8b2c2e-cgu.3:(.text._ZN6kernel4sync8set_once16SetOnce$LT$T$GT$8populate17hab8d57b99b7ebbcbE+0xd3): undefined reference to `rust_helper_atomic_try_cmpxchg_relaxed'
          /usr/bin/ld: kernel.a8a3768e1a8b2c2e-cgu.3:(.text._ZN6kernel4sync8set_once16SetOnce$LT$T$GT$8populate17hab8d57b99b7ebbcbE+0x2a8): undefined reference to `rust_helper_atomic_set_release'
          collect2: error: ld returned 1 exit status
          
  = note: some `extern` functions couldn't be found; some native libraries may need to be installed or have their path specified
  = note: use the `-l` flag to specify native libraries to link

