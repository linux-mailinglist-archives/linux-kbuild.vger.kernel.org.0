Return-Path: <linux-kbuild+bounces-3824-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3675D989194
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2024 23:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F201F22839
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2024 21:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EA517B4E5;
	Sat, 28 Sep 2024 21:35:57 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EEC2CA8;
	Sat, 28 Sep 2024 21:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727559357; cv=none; b=DnU0CG0Xq278GVdyZ3Rdtx9+b8GVI9rkZqFwl6bLqW3Us2fC6O84adzcvDoeiDBNsDpf6a5YXBkw7EEpHcM5rIqOtkOVfgPOzlVKuzqENvyq54uCkDDsdIcEJORq6hFpm+kQtjVsfLpUkb1hReULvV/qAtzjx5lf0AVVFkW+MUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727559357; c=relaxed/simple;
	bh=B/t4kD1AbCwCB5SiSo/l3YPD0B1hK+/d8IJSyqvZb3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V804fSzgsur1ZqF8uBWMO4G6xHF7PN0qTf8i3C5lphR1jBHQoj2cHM4lP2/iYMz7soptnhaOyT4wv/jVgUYa2TE+ux11QtG4Rz6axSRYRi3baLujVIesHrjXV6Q8yXWDxceAPO9hLqTUYsE0eO/duBNC8ndohePEm6qlPYfLsO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c88c9e45c2so791297a12.0;
        Sat, 28 Sep 2024 14:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727559353; x=1728164153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCiSAL0ORgtaaM2vvj2AlsQZedO1Wu1yaFUL2A/eH3Y=;
        b=SWojcYocp5bZkUF1tOZi2z/CRjei8IegJpbStvTFkoR2Vh23HMpDkDIhcMEQmCcAi/
         ftdWfEAx5o2Yri8ExP0wVeT+zaubXuQIJSL+CyjA7l0L5fh9HVyklgsHYAMaavfYbwUb
         FKD+w5eFeuUdhiPcLr2H3G4I6PE9z7gsh2AtlFfYGU8hFyGyD6yggZVqw2GPzhKH96nm
         VRHWctqL2d+vfPNeEMAib5Aoth3cS6VKSkIPfhY9k7jUuUtDEY7SLmWWj4U/hwWD8/XQ
         tso1SRa/ZuVJLAiI7L4xqwQXxxYrr8DnfBWzzYoqa0OT3Pev83zOkuiHqvY0AMRj4ASL
         Jg9w==
X-Forwarded-Encrypted: i=1; AJvYcCVhuE0L4kP0t073vkHwUAiABbdyNsUWlq1XSATsQIy1usbMWy6t9CKKTKCBaVPcry/83N+ELeacuoSQZM81NA==@vger.kernel.org, AJvYcCWoce2EykGiS2GmepFTYWPzMtOCEkMGe9MueDfMn85z+7BYV7ktBtbRb50mt++ASwFpx/q+9NYnPDKAK2UE@vger.kernel.org, AJvYcCXFLjLCdOjSCn93gR9xvNPcekUFsjMWao0rlRRJBUnQ1Zo8W1011ffsu1pl6BK5bEMmGqXWE2JQmLov7Tw=@vger.kernel.org, AJvYcCXxDwZe3n1WuvUYMCU41w+XcD5dAaxsLL/MLOgc8s/90kOu6OAh/I/YUuwZIq6tt9tFAVfddCvX0w3C4Wgs8tI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywji+ihVnAuOQ+0N0RIDYVV6YJaS69rnXzYCGi1hCY42ohcYztl
	/OvY6k/VsknSsuE7qmawomWCWQfqGOufoV8+R2E6C6yu6WIcGEaPxTRytVL+TPM=
X-Google-Smtp-Source: AGHT+IHopE8QQbgWQ66GJxR/KcUsDRhQfoStktAjeqmedpgcNwenn/dMp70mUhApsfR+RJC5MOw6Cw==
X-Received: by 2002:a17:907:98d:b0:a80:9c1b:554f with SMTP id a640c23a62f3a-a93c318c9b4mr985265666b.27.1727559353397;
        Sat, 28 Sep 2024 14:35:53 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776debsm290853066b.34.2024.09.28.14.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 14:35:53 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso360490766b.0;
        Sat, 28 Sep 2024 14:35:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2P6+gvv6KJ+VycXkM0yKRSH5LUTaapctIa+N+XABanp1hMlDhbgC/A9pZwRxMo3QIIkec8RNJiLP+0m8=@vger.kernel.org, AJvYcCVjNtcAhNyy4v37HwISxZvY6nLScGDjXOBtGR+pl7QDwmaIqSQKgO7LZsK3sN2xWdoSirDksAG5FrdQQH21V3o=@vger.kernel.org, AJvYcCW0ZTSx0JkqTaBMjWvT7gLSxqoNhs7BYv8buqmodRuKwr/ZTmUVAlK0KstytXH//X2N5e0U4qJIRI59yJFb@vger.kernel.org, AJvYcCWRxSiuZghRE7g2LnvI3IKrpNODwRgKlbR2oDdu4zx2vqAG1/8pXSbUWlqq1Sbt8R4yw/kniM/SD0NOQdgKIQ==@vger.kernel.org
X-Received: by 2002:a17:907:7fab:b0:a8a:8dd3:f135 with SMTP id
 a640c23a62f3a-a93b15d446bmr1325772666b.14.1727559352571; Sat, 28 Sep 2024
 14:35:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sat, 28 Sep 2024 17:35:15 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_Fn=OWdhJn0xnNd4dT5wZNKz6XkOAHvDu-pkkhirEwgg@mail.gmail.com>
Message-ID: <CAEg-Je_Fn=OWdhJn0xnNd4dT5wZNKz6XkOAHvDu-pkkhirEwgg@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] Extended MODVERSIONS Support
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 7:39=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> This patch series is intended for use alongside the Implement
> MODVERSIONS for RUST [1] series as a replacement for the symbol name
> hashing approach used there to enable RUST and MODVERSIONS at the same
> time.
>
> Elsewhere, we've seen a desire for long symbol name support for LTO
> symbol names [2], and the previous series came up [3] as a possible
> solution rather than hashing, which some have objected [4] to.
>
> This series adds a MODVERSIONS format which uses a section per column.
> This avoids userspace tools breaking if we need to make a similar change
> to the format in the future - we would do so by adding a new section,
> rather than editing the struct definition. In the new format, the name
> section is formatted as a concatenated sequence of NUL-terminated
> strings, which allows for arbitrary length names.
>
> Currently, this series emits both the extended format and the current
> format on all modules, and prefers the extended format when checking if
> present. I'm open to various other policies via Kconfig knobs, but this
> seemed like a good initial default.
>
> The refactor to MODVERSIONS is prefixed to this series as result of an
> explicit request [5] by Luis in response to the original patchset.
>
> If you are testing this patch alongside RUST by manually removing the
> !MODVERSIONS restriction (this series doesn't remove it, because the
> CRCs don't mean what we'd want them to yet, we need the DWARF patch for
> that) and have kernel hardening enabled, you may need the CPU
> Mitigations [6] series. Without it, the foo.mod.o file produced by the
> C compiler will reference __x86_return_thunk, but foo.o will not.
> This means that the version table will not contain a version for
> __x86_return_thunk, but foo.ko will reference it, which will result
> in a version check failure.
>
> [1] https://lore.kernel.org/all/20240617175818.58219-17-samitolvanen@goog=
le.com/
> [2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org=
/
> [3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
> [4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@sus=
e.com/
> [5] https://lore.kernel.org/lkml/ZVZNh%2FPA5HiVRkeb@bombadil.infradead.or=
g/
> [6] https://lore.kernel.org/all/20240725183325.122827-1-ojeda@kernel.org/
>
> Changes in v5:
> - Addresses Sami's comments from v3 that I missed in v4 (missing early
>   return, extra parens)
>
> v4: https://lore.kernel.org/asahi/20240924212024.540574-1-mmaurer@google.=
com/
> - Fix incorrect dot munging in PPC
>
> v3: https://lore.kernel.org/lkml/87le0w2hop.fsf@mail.lhotse/T/
> - Split up the module verification refactor into smaller patches, per
>   Greg K-H's suggestion.
>
> v2: https://lore.kernel.org/all/20231118025748.2778044-1-mmaurer@google.c=
om/
> - Add loading/verification refactor before modifying, per Luis's request
>
> v1: https://lore.kernel.org/rust-for-linux/20231115185858.2110875-1-mmaur=
er@google.com/
>
> Matthew Maurer (16):
>   module: Take const arg in validate_section_offset
>   module: Factor out elf_validity_ehdr
>   module: Factor out elf_validity_cache_sechdrs
>   module: Factor out elf_validity_cache_secstrings
>   module: Factor out elf_validity_cache_index_info
>   module: Factor out elf_validity_cache_index_mod
>   module: Factor out elf_validity_cache_index_sym
>   module: Factor out elf_validity_cache_index_str
>   module: Group section index calculations together
>   module: Factor out elf_validity_cache_strtab
>   module: Additional validation in elf_validity_cache_strtab
>   module: Reformat struct for code style
>   export_report: Rehabilitate script
>   modules: Support extended MODVERSIONS info
>   modpost: Produce extended modversion information
>   export_report: Use new version info format
>
>  arch/powerpc/kernel/module_64.c |  23 +-
>  kernel/module/internal.h        |  18 +-
>  kernel/module/main.c            | 647 ++++++++++++++++++++++++--------
>  kernel/module/version.c         |  45 +++
>  scripts/export_report.pl        |  17 +-
>  scripts/mod/modpost.c           |  39 +-
>  6 files changed, 628 insertions(+), 161 deletions(-)
>
> --
> 2.46.1.824.gd892dcdcdd-goog
>
>

The series looks straightforward and reasonable to me.

Acked-by: Neal Gompa <neal@gompa.dev>



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

