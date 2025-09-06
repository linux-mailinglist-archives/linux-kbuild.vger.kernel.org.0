Return-Path: <linux-kbuild+bounces-8755-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331EB4758C
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 19:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 183CB580E17
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 17:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63E22652B7;
	Sat,  6 Sep 2025 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+gSYCJE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180626560B;
	Sat,  6 Sep 2025 17:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179165; cv=none; b=rNybJrJBAy7WJa4ThJCVNwOAXIKNu/aX6m4+FjHlMy3kmVaBP6Dwm7kXux9Af4/o318GflZY5rM/OTfFo++udxf+OzwKfvKP9RbvjsrAZWcwSVZj5sS2qDfUVddX3yOso8z1daa4D9EUH7Ab4Jij+Qca4uah57yfekAhl6zlE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179165; c=relaxed/simple;
	bh=Sl3sNp9u3l9/VwrUVrMZnvXHXzeQd6V3+jebM+bRp74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hr/LrfXczT1BNOCIyFUqgKaOC5UQVlFgAdA243vknoyBDwceUUgXPZvQycGnRmjDIZ0f4TlN84V3JfexosB13FabCgDBDTGPrrZ4LDUUlGRqsr8bC8t2UaPXVy8Oe7wuw5R0yvWHjhb6aVMDo5FRFK9ecFNQG7DRmDHdPjmFgnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+gSYCJE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e4aeaa57b9so1116495f8f.1;
        Sat, 06 Sep 2025 10:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179162; x=1757783962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/VsaAZE8BZZcz6ps/gV/vx/aBIFb7Atd0DyuiuXeeQ=;
        b=e+gSYCJEevyM/1k/yNBZyIpV9jIFnKcOUHi07G3iN2DObTRP4D7l0cW1aQovGhEfEi
         Jfxs8QE9z5K+fCEPsIYRh8ddpUo3EO0Z8bWWwI1ki7Su5vu17N5b49tTtgrsqfcEaY+2
         ZXZmi0xXvdsz0XYk1t9FtCCeSOmSgXSOD9oIaEdk83VUgynuyPk9G0P7aVkTic4DrQL8
         TzOv0MFu1E9rlHBcrxvzo9zGaC7lagvhdH5G8Bqpizf7rTrC6FPuhhQu9oLZIxATcJJG
         PTKvnF9n7nZ+iTEynlOJTC8K+QIF1zbhUKiXfUjQOFzb2hFnCmmAa7wi9cfPYqMxmG0T
         hxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179162; x=1757783962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/VsaAZE8BZZcz6ps/gV/vx/aBIFb7Atd0DyuiuXeeQ=;
        b=EBM6hWiBEAwXI71AeCI14GMCGCysQEbf2gDLhZove3GYVgujf8IITu3tttvR94JOCg
         4oqdJ4N7oQzMxmdhKlPHPc+gd3SYlQ+fy53ttjAgDmq3vZ3a2PWNxxbpNWv7luDJ8MiY
         FKImXXAJ8nqB5/tbaLEXuBBd6EXQEfFgW8XgrDXYvUIyvCgLyRKgnUGekHiEpQbGoiCC
         Ju+uzy6HGZOFIIZILNNHCIwWq/z+Yl7Mrqef46ToJ8o3S+9x/bOFjFQWcB1Fky+hd8EC
         Lsuyo61EaPElUiGqyMsYNoqk4SqUqNR0xfxPMwDlXvt/IgrnWGe0PsC2rEwnXYnOT7PC
         m4NA==
X-Forwarded-Encrypted: i=1; AJvYcCVXPP+YgcsbjFMdojSTQnsELxzyPir+ISzIDUlT3Qj89iDB+c6I0PGa0Bk9NscOXK3uRnvbxcJJ/nY=@vger.kernel.org, AJvYcCW+Za/BmU/1Ahpg3pp8aOQI1ulUQW5K0yoJ4IGo2D1ziXRYpspPnLowlOyPz9G4f7t2edXO40iOqKsExvXR@vger.kernel.org, AJvYcCX7otGKycCDtoZyiriFmwVmskbPM5oFfXIS7luHCULSnOxr6S/mQCraXSzP8/rPrKqKHAkgI8One4tp7sG9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlnz+jJY3EU/k//Q7EkbE6LEagcGYeQJrusIskNprP1XX8zNx5
	slV315DZY+qSWBZImQYk0JSnTdqLr0EE3IS9bHVrs2fyNo2jsrdheHxV8hR/5DqxXRhzB6ehvz8
	v12DXWp0gQnK9yXEfzLTBhQ2br4fpicw=
X-Gm-Gg: ASbGnctc/M+wsv48J8FP4JdBtyAaaIQ6Z+eTYKxSF6jYTGc0nDm0u6FWPGUAmipM71Q
	wH8MJv39OJ+bsBMBM6WAvDPW+mFcaEqPn/Z0ArqqMWb0Z0sqNtF5jGncCXN/o0po3qPH86wFx2L
	dJbpBxRkVWge91y5kXpZ+iH7aG3rfJtjn4lzsliBHq8NMGf8h0wZpGjuKYXDMeyrez4s/wyTQyj
	U6dEuTt
X-Google-Smtp-Source: AGHT+IHwMXVmgCNboW6n0WZeFTHhba11a2SFsS8Zt9OQUQAavArl8kiQY3QwMXTXdNAssOnQ/PiGObbIRc/kxueWvOY=
X-Received: by 2002:a5d:64c5:0:b0:3e5:47a9:1c94 with SMTP id
 ffacd0b85a97d-3e645e858b9mr1560400f8f.49.1757179161926; Sat, 06 Sep 2025
 10:19:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <3339d11e69c9127108fe8ef80a069b7b3bb07175.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <3339d11e69c9127108fe8ef80a069b7b3bb07175.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:19:11 +0200
X-Gm-Features: AS18NWDcebDXZ0CncnyAGPmg6m7DGHRQKjrUi3A45HP3A_5pPACdVmuNY1mdCAs
Message-ID: <CA+fCnZedGwtMThKjFLcXqJuc6+RD_EskQGvqKhV9Ew4dKdM_Og@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] mm: Unpoison vms[area] addresses with a common tag
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 10:31=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> The problem presented here is related to NUMA systems and tag-based
> KASAN mode. It can be explained in the following points:
>
>         1. There can be more than one virtual memory chunk.
>         2. Chunk's base address has a tag.
>         3. The base address points at the first chunk and thus inherits
>            the tag of the first chunk.
>         4. The subsequent chunks will be accessed with the tag from the
>            first chunk.
>         5. Thus, the subsequent chunks need to have their tag set to
>            match that of the first chunk.
>
> Unpoison all vms[]->addr memory and pointers with the same tag to
> resolve the mismatch.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Move tagging the vms[]->addr to this new patch and leave refactoring
>   there.
> - Comment the fix to provide some context.
>
>  mm/kasan/shadow.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index b41f74d68916..ee2488371784 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -646,13 +646,21 @@ void __kasan_poison_vmalloc(const void *start, unsi=
gned long size)
>         kasan_poison(start, size, KASAN_VMALLOC_INVALID, false);
>  }
>
> +/*
> + * A tag mismatch happens when calculating per-cpu chunk addresses, beca=
use
> + * they all inherit the tag from vms[0]->addr, even when nr_vms is bigge=
r
> + * than 1. This is a problem because all the vms[]->addr come from separ=
ate
> + * allocations and have different tags so while the calculated address i=
s
> + * correct the tag isn't.
> + */
>  void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>  {
>         int area;
>
>         for (area =3D 0 ; area < nr_vms ; area++) {
>                 kasan_poison(vms[area]->addr, vms[area]->size,
> -                            arch_kasan_get_tag(vms[area]->addr), false);
> +                            arch_kasan_get_tag(vms[0]->addr), false);
> +               arch_kasan_set_tag(vms[area]->addr, arch_kasan_get_tag(vm=
s[0]->addr));
>         }
>  }
>
> --
> 2.50.1
>

Do we need this fix for the HW_TAGS mode too?

