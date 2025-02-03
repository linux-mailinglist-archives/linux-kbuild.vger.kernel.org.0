Return-Path: <linux-kbuild+bounces-5606-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F37AA25D7C
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2025 15:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20135188AE32
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2025 14:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FF320A5C7;
	Mon,  3 Feb 2025 14:44:56 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2193209F58;
	Mon,  3 Feb 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593896; cv=none; b=G/VbJD1xIbFwRM5bL30Ui++63YHrXVFMaoWoN/oNroVllpqmufeOxtuQBpqHXrVb8+vDlSeh2K+ikN4O98gEHxASSO8Q6EHP4x/1w/vDVBT9zqJGL/uBd4TLCtBUBWwCFXk/QbR1Eis6ygfPt/7rVFc9YYiBKU7immAchHQygdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593896; c=relaxed/simple;
	bh=oCFTl9ONo7RNluF4OduNuYzo9TaknkGoj/lwhRP2goE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJRgM4OckN0fnXiempASfkuPU7OVUPMAbqYcNuJIEtNrU2n2ACs+WAMjAMgxDyumtfQbbn6qRAvmGC7N9XL2TuoyI3SlBMGKE9Azot4GGmPs1f2I0EGK55zA8LKpyaewJ/wsuFtns/FC37Frhgp8qXASLeRawCuIeJZwxJObW8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85c5adbca8eso989365241.0;
        Mon, 03 Feb 2025 06:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593892; x=1739198692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=495pAs8BTk65AfSEE1DQQmDU62IOKL0yIh5oz0CPpMg=;
        b=cSm27XyBIILWK46Ka7R0MrLKl9xMoraDVxw+IidILZ/OW8CM/h5RaUt6oIZppoKmmV
         Qtuj/jCoPtb0tVXwfyrtx41szy7fHNIui9g+CDXQ+d2Erzdzri+RZQVt55Mf8h68gt/2
         6J9w+3/pxLiYNPiD5SeXpmCCENZxNyzYSU+nMhUkirlXVIOxyTpzjXI2mzOdDTnTxNNg
         kAkYw73/NTQVbm48erNRgsTpoHqenY19pR7YTzCmHYLxSPGwHpQOHoVt7Nb3R4s4sk+X
         VwyQlQMiy+Jkkb7CzFMREV2m+EABRxN5fXY1HlVTEQt5jgdJfpTjXZlqm1FpfEw+H4cP
         C+3g==
X-Forwarded-Encrypted: i=1; AJvYcCVkHRvm/sqkyDIIsm7NHgzgDfsH06R0vy5Hc1P9ON/fvMJsbts5VNwMWjnphG/SMiqBpHm5eO0fBm7/VDL3@vger.kernel.org, AJvYcCW7qou1IMNNYsp3i+n1iq2X76010eVVm/U877DGhUsFViqAUokkbu35nkkD9MREDlzYPSwDR4VkQLSD28LG@vger.kernel.org, AJvYcCWsaKnRvs9NpkyRadsteMp36rwrM2WVssP/1SmJ9E7DOk29tFcJTFdpmtuJ7euaWOAMqTxRZIyJwzqBipus4eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJRnrEweC1cq9fWMIR+zFUIdPZq8buMtMZrimdI9Y9uKwElZG
	46d3ktWHF4FFefb/DxyaC4/J3jnI0ajPV3MpJN5klfhwh9SPD4qm+ltUf2ff
X-Gm-Gg: ASbGncu7gQBLRTbYj0ielizzz5/vhjVKW1lUxQukELNtrOnmeevjy6h9ZzYy9BWpxK5
	dAqFPyXwAqJLafI8jHIqkyrlRqwbo9r5jmaZU3L2cdtmXbLxWryNDAs6coC9pvGf5zSlW/bOLKM
	YYvWdf1FnHUFmsJAI0W+42YH2uR/8B7qB6C+l7o7rO1qZ3KfcVxAoQ03WUyT2pXI1Ap621gN7bn
	TRkMMOHLzLCr4NLXJ6nh3QwIF6eUVD2GPMvBAm6sfmmFwzpdu38Nm83Dj+4pV+tIeechLLAOH9w
	icA2HTu9UKkVsmvt5nvDhDTd3TcmzIDtxFpc2yEEN0Cx6s4QPCraVw==
X-Google-Smtp-Source: AGHT+IEMFtyvuiG7LqmsUg0tsQkZBGG+3WLxFa94pmmU5ohT1ikdrfOFiGJQuMSyOakfnV+8s57t4A==
X-Received: by 2002:a05:6122:45a1:b0:50a:b728:5199 with SMTP id 71dfb90a1353d-51e9e4fdb03mr17729004e0c.7.1738593892147;
        Mon, 03 Feb 2025 06:44:52 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1bed875sm1233291e0c.4.2025.02.03.06.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:44:51 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afe1009960so1161743137.0;
        Mon, 03 Feb 2025 06:44:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVENmyE85IJ2/YyM4E97KAzmkvYaYIj+JDtnDatykvLlT+x+z7m4BPVBtmmmCSnlzprJ/BJDm49ZHr84nmx@vger.kernel.org, AJvYcCW2+LiI6nlb73S+dMFIQgZODVnIJEAhkoyTEchquPOhkqIZwKwKLLnUa1VwBkrmlGDga0ZHccRoXDDSw0FVo70=@vger.kernel.org, AJvYcCWrlHtIpNKqe3YzqwJBMj15g/xAplvQ44p7KwUTH2T6w/vxgJypzeqlrO0cxLAhswHsE/KmXxza0cssQB0T@vger.kernel.org
X-Received: by 2002:a05:6102:2acf:b0:4af:f275:e752 with SMTP id
 ada2fe7eead31-4b9a5269b95mr14933042137.22.1738593891606; Mon, 03 Feb 2025
 06:44:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127190636.it.745-kees@kernel.org> <20250127191031.245214-2-kees@kernel.org>
In-Reply-To: <20250127191031.245214-2-kees@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Feb 2025 15:44:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXW8VbtOAixO7w+aDOG70aZtZ50j1Ybcr8B3eYnRUcrcA@mail.gmail.com>
X-Gm-Features: AWEUYZn4f2U45kmhTSRYxW6gXgpadIvKhLBo_20ukhjFkcFf9ymUqDMOZnVdOso
Message-ID: <CAMuHMdXW8VbtOAixO7w+aDOG70aZtZ50j1Ybcr8B3eYnRUcrcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] stackinit: Add union initialization to selftests
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jakub Jelinek <jakub@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kees,

On Mon, 27 Jan 2025 at 20:11, Kees Cook <kees@kernel.org> wrote:
> The stack initialization selftests were checking scalars, strings,
> and structs, but not unions. Add union tests (which are mostly identical
> setup to structs). This catches the recent union initialization behavioral
> changes seen in GCC 15. Before GCC 15, this new test passes:
>
>     ok 18 test_small_start_old_zero
>
> With GCC 15, it fails:
>
>     not ok 18 test_small_start_old_zero
>
> Specifically, a union with a larger member where a smaller member is
> initialized with the older "= { 0 }" syntax:
>
> union test_small_start {
>      char one:1;
>      char two;
>      short three;
>      unsigned long four;
>      struct big_struct {
>              unsigned long array[8];
>      } big;
> };
>
> This is a regression in compiler behavior that Linux has depended on.
> GCC does not seem likely to fix it, instead suggesting that affected
> projects start using -fzero-init-padding-bits=unions:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118403
>
> Signed-off-by: Kees Cook <kees@kernel.org>

I ran stackinit_kunit from v6.14-rc1 on m68k under ARAnyM.
All small_start tests failed:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: stackinit
    # module: stackinit_kunit
    1..108
    ok 1 test_u8_zero
    ok 2 test_u16_zero
    ok 3 test_u32_zero
    ok 4 test_u64_zero
    ok 5 test_char_array_zero
    ok 6 test_small_hole_zero
    ok 7 test_big_hole_zero
    ok 8 test_trailing_hole_zero
    ok 9 test_packed_zero
    ok 10 test_small_hole_old_zero
    ok 11 test_big_hole_old_zero
    ok 12 test_trailing_hole_old_zero
    ok 13 test_packed_old_zero
    ok 14 test_same_sizes_zero
    # test_small_start_zero: ASSERTION FAILED at lib/stackinit_kunit.c:428
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 15 test_small_start_zero
    ok 16 test_small_end_zero
    ok 17 test_same_sizes_old_zero
    # test_small_start_old_zero: ASSERTION FAILED at lib/stackinit_kunit.c:429
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 18 test_small_start_old_zero
    ok 19 test_small_end_old_zero
    ok 20 test_small_hole_dynamic_partial
    ok 21 test_big_hole_dynamic_partial
    ok 22 test_trailing_hole_dynamic_partial
    ok 23 test_packed_dynamic_partial
    ok 24 test_small_hole_assigned_dynamic_partial
    ok 25 test_big_hole_assigned_dynamic_partial
    ok 26 test_trailing_hole_assigned_dynamic_partial
    ok 27 test_packed_assigned_dynamic_partial
    ok 28 test_same_sizes_dynamic_partial
    # test_small_start_dynamic_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:438
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 29 test_small_start_dynamic_partial
    ok 30 test_small_end_dynamic_partial
    ok 31 test_same_sizes_assigned_dynamic_partial
    # test_small_start_assigned_dynamic_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:441
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 32 test_small_start_assigned_dynamic_partial
    ok 33 test_small_end_assigned_dynamic_partial
    ok 34 test_small_hole_static_partial
    ok 35 test_big_hole_static_partial
    ok 36 test_trailing_hole_static_partial
    ok 37 test_packed_static_partial
    ok 38 test_small_hole_static_all
    ok 39 test_big_hole_static_all
    ok 40 test_trailing_hole_static_all
    ok 41 test_packed_static_all
    ok 42 test_small_hole_dynamic_all
    ok 43 test_big_hole_dynamic_all
    ok 44 test_trailing_hole_dynamic_all
    ok 45 test_packed_dynamic_all
    ok 46 test_small_hole_runtime_partial
    ok 47 test_big_hole_runtime_partial
    ok 48 test_trailing_hole_runtime_partial
    ok 49 test_packed_runtime_partial
    ok 50 test_small_hole_runtime_all
    ok 51 test_big_hole_runtime_all
    ok 52 test_trailing_hole_runtime_all
    ok 53 test_packed_runtime_all
    ok 54 test_small_hole_assigned_static_partial
    ok 55 test_big_hole_assigned_static_partial
    ok 56 test_trailing_hole_assigned_static_partial
    ok 57 test_packed_assigned_static_partial
    ok 58 test_small_hole_assigned_static_all
    ok 59 test_big_hole_assigned_static_all
    ok 60 test_trailing_hole_assigned_static_all
    ok 61 test_packed_assigned_static_all
    ok 62 test_small_hole_assigned_dynamic_all
    ok 63 test_big_hole_assigned_dynamic_all
    ok 64 test_trailing_hole_assigned_dynamic_all
    ok 65 test_packed_assigned_dynamic_all
    ok 66 test_same_sizes_static_partial
    # test_small_start_static_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:437
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 67 test_small_start_static_partial
    ok 68 test_small_end_static_partial
    ok 69 test_same_sizes_static_all
    # test_small_start_static_all: ASSERTION FAILED at lib/stackinit_kunit.c:437
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 70 test_small_start_static_all
    ok 71 test_small_end_static_all
    ok 72 test_same_sizes_dynamic_all
    # test_small_start_dynamic_all: ASSERTION FAILED at
lib/stackinit_kunit.c:438
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 73 test_small_start_dynamic_all
    ok 74 test_small_end_dynamic_all
    ok 75 test_same_sizes_runtime_partial
    # test_small_start_runtime_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:439
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 76 test_small_start_runtime_partial
    ok 77 test_small_end_runtime_partial
    ok 78 test_same_sizes_runtime_all
    # test_small_start_runtime_all: ASSERTION FAILED at
lib/stackinit_kunit.c:439
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 79 test_small_start_runtime_all
    ok 80 test_small_end_runtime_all
    ok 81 test_same_sizes_assigned_static_partial
    # test_small_start_assigned_static_partial: ASSERTION FAILED at
lib/stackinit_kunit.c:440
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 82 test_small_start_assigned_static_partial
    ok 83 test_small_end_assigned_static_partial
    ok 84 test_same_sizes_assigned_static_all
    # test_small_start_assigned_static_all: ASSERTION FAILED at
lib/stackinit_kunit.c:440
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 85 test_small_start_assigned_static_all
    ok 86 test_small_end_assigned_static_all
    ok 87 test_same_sizes_assigned_dynamic_all
    # test_small_start_assigned_dynamic_all: ASSERTION FAILED at
lib/stackinit_kunit.c:441
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 88 test_small_start_assigned_dynamic_all
    ok 89 test_small_end_assigned_dynamic_all
    ok 90 test_small_hole_assigned_copy # SKIP XFAIL uninit bytes: 1
    ok 91 test_big_hole_assigned_copy # SKIP XFAIL uninit bytes: 124
    ok 92 test_trailing_hole_assigned_copy # SKIP XFAIL uninit bytes: 1
    ok 93 test_packed_assigned_copy
    ok 94 test_same_sizes_assigned_copy
    # test_small_start_assigned_copy: ASSERTION FAILED at
lib/stackinit_kunit.c:442
    Expected stackinit_range_contains(fill_start, fill_size,
target_start, target_size) to be true, but is false

stackframe was not the same between calls!? (fill 32 wide, target offset by -12)
    not ok 95 test_small_start_assigned_copy
    ok 96 test_small_end_assigned_copy
    ok 97 test_u8_none
    ok 98 test_u16_none
    ok 99 test_u32_none
    ok 100 test_u64_none
    ok 101 test_char_array_none
    ok 102 test_switch_1_none # SKIP XFAIL uninit bytes: 80
    ok 103 test_switch_2_none # SKIP XFAIL uninit bytes: 80
    ok 104 test_small_hole_none
    ok 105 test_big_hole_none
    ok 106 test_trailing_hole_none
    ok 107 test_packed_none
    ok 108 test_user
# stackinit: pass:90 fail:13 skip:5 total:108
# Totals: pass:90 fail:13 skip:5 total:108
not ok 1 stackinit

m68k-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU
Binutils for Ubuntu) 2.42
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

