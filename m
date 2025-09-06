Return-Path: <linux-kbuild+bounces-8752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F9B4757F
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 19:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C8E91B22664
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 17:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8549C257844;
	Sat,  6 Sep 2025 17:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJ4+Boe+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA821226D0F;
	Sat,  6 Sep 2025 17:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179135; cv=none; b=mEKCP2wTFTDSnGzuYeb54FWwFqCtQcQ/2WKifCwUzxfYs8lEZv615d3P5fcJ0/fFzVLKIVD+XN5erBuB3lpOMEHBZcSOZcErxGOFREzsMCDrGhXBwEIGtBXeY+8xtJsmjdU8IjyvPA3x0Q8zKKvg+/MXTwdmmx4bF461hsiezn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179135; c=relaxed/simple;
	bh=mxDBO5qa3GGN7XPNHYXzxxDrs+cKVmCs/FaGHSo+vTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z78Gv4IpbMoIsz6NzX6kQyAn4+qBSvKUKeW2WlbGwYujxylB6vakLdeKi4C3RdLn2+s0nkr5iKU/u5C8d1kUxcEw4a0NE3Q8iQ8GAU8e5ygitbqw7kLHhWRRKTqaXasfqOtyQExaNHlDvppOYpLt05eXKuVq23M0xT0bBmMC9V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJ4+Boe+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso19699395e9.2;
        Sat, 06 Sep 2025 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179132; x=1757783932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvnXgjkKA1Pp2ZMyBbTXIoHx/IW3dCtqfz+u+Yq42DE=;
        b=AJ4+Boe+VdB2UtKljlPdnSu0Y3Dx1L7M5Wgko7fORMctI6IJ3g3m81Pl6v1bHQNcYk
         5TpTIQSQdGbJe5fzJBpIbxOo2zL+gYmq/+oGNeJEak+zb55NimDf2fe5FiDBFmXNju0W
         IOnBmCHswieNaNuLoA3txtCkHYvxy8bC4vlsmf1dNe8xJRmWMt5VhAMaKdDkI4p8VOtX
         jsHyveNlcMgU/T6b86hel+/tcBG+JHSpw5L35JlYMXiAIrfqTKuqhbT0mDoiVr5pYlsg
         J1vLUiaBKD+WSRYporTti9RCI68L5lruYSMCalPEDcT/JueBnUzy6MWHqMP+13ApVeoO
         qKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179132; x=1757783932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvnXgjkKA1Pp2ZMyBbTXIoHx/IW3dCtqfz+u+Yq42DE=;
        b=SSIom5KJgBnRWw/MD3Vq+j0sJF6bxJpvGzpvoIk16W93PuyGiyhZdx4dQeg72rPWLv
         4fik+kCbwlst2ny7rMNPxWcCVKfo0rU5TDsU0Zwq9sBOdHwb2G0euX1RXhzt1NwZ/Oo6
         61LiNl1bJ3HPQyJxwwS9K1nDvIq1OhVd5bi/d5xsJu5AXcwPay0gD2P8SPV6aikOZfo+
         TBEEjgqooY9/DsT14ftiDLnY6nEhHRojfAPWA/q/Z5OvKsv9tVjv9LWhE2oim/PhxBpX
         o/6Lety2c3RsbjCVVf9SLdtfnDPzbWUAxwO5N2tTmx/14sPL/4mWj+papHfV504zz39R
         DTsA==
X-Forwarded-Encrypted: i=1; AJvYcCUAnfKAYQfvbvzCy4Ua7aA5jHwdYKYfZrnHPxBVo3IVZmsyrDoaqXYqaj1Ko25ibTGuIqrPmGOiCZ3ydhc5@vger.kernel.org, AJvYcCUSs5p9Gy2K2iGpmJGi2S7/xinTQOEce7Fo5SVFjdeC/mDsLPIZNCL3EYiiKRbIjRy3xhg+ek9l7IQ=@vger.kernel.org, AJvYcCWTo934z/eFxzEWWjcdZzDI5n0A6AUrScynYwYhTWX+7d95shZ0Nc1KQBJ4gQBFhdbQz52JIFR4k4lvCsUo@vger.kernel.org
X-Gm-Message-State: AOJu0YzzT7p10yJofCFDyv+ERQQuHkcTxu9KxgXR/j9lrxBn4ICDU/M+
	T9qzGHf7Z59nFm7rckEgU4c/3QZrUjTecbY8NwpCAS910YQf/Xbny+eTBMT4de97qTX8l9FUusC
	FjjKW876dncLmjNJ3ePSpYnQOo+OSZX8=
X-Gm-Gg: ASbGncv0ikCCwo0ztvBpwv0qvJ4SvvlLKOhk2YBQ73zztqXlxzxSu2qY+N/w2PV2pmb
	+QvH0PO4+Yyy2yq44XeOMEoGhDX33r84JiBhXrra+aFB12X7rhSVj4g2fScj2hbb5qWuXFxXxlb
	sl8SpuiajbVN2ZW45itszkdpzGIy5gVJ2z3kjyN+vH3sm3JoKMzOy6ouXCTLYds75LK6vdv5rkZ
	ZAgem4gDvMJg4NKqfo=
X-Google-Smtp-Source: AGHT+IFd67uPTqVPfMc7bozbMZ5rB/KKiiv3rdrmWYBThjYpOYSQHAfLhZfyUhJZKRt6LAh3XOHhPqNJnibRne/x5dE=
X-Received: by 2002:a05:6000:2910:b0:3e3:f89:ea31 with SMTP id
 ffacd0b85a97d-3e643c1e706mr1880888f8f.61.1757179131893; Sat, 06 Sep 2025
 10:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <c9dfcee8bd04161394f41a21f78fc3e01a007ddb.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <c9dfcee8bd04161394f41a21f78fc3e01a007ddb.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:18:41 +0200
X-Gm-Features: AS18NWAE44l-F8fxYkxmWh2eLEtrt0fldHS7j-JrDWBIap-lKzv70eyY1F7Ln-M
Message-ID: <CA+fCnZcBGhToB+pOhn+ACahyqVLWJ_7cnqBNZC5ob77wZD5iJw@mail.gmail.com>
Subject: Re: [PATCH v5 12/19] x86: Minimal SLAB alignment
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

On Mon, Aug 25, 2025 at 10:29=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> 8 byte minimal SLAB alignment interferes with KASAN's granularity of 16
> bytes. It causes a lot of out-of-bounds errors for unaligned 8 byte
> allocations.
>
> Compared to a kernel with KASAN disabled, the memory footprint increases
> because all kmalloc-8 allocations now are realized as kmalloc-16, which
> has twice the object size. But more meaningfully, when compared to a
> kernel with generic KASAN enabled, there is no difference. Because of
> redzones in generic KASAN, kmalloc-8' and kmalloc-16' object size is the
> same (48 bytes). So changing the minimal SLAB alignment of the tag-based
> mode doesn't have any negative impact when compared to the other
> software KASAN mode.
>
> Adjust x86 minimal SLAB alignment to match KASAN granularity size.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Extend the patch message with some more context and impact
>   information.
>
> Changelog v3:
> - Fix typo in patch message 4 -> 16.
> - Change define location to arch/x86/include/asm/cache.c.
>
>  arch/x86/include/asm/cache.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/x86/include/asm/cache.h b/arch/x86/include/asm/cache.h
> index 69404eae9983..3232583b5487 100644
> --- a/arch/x86/include/asm/cache.h
> +++ b/arch/x86/include/asm/cache.h
> @@ -21,4 +21,8 @@
>  #endif
>  #endif
>
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define ARCH_SLAB_MINALIGN (1ULL << KASAN_SHADOW_SCALE_SHIFT)
> +#endif
> +
>  #endif /* _ASM_X86_CACHE_H */
> --
> 2.50.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

