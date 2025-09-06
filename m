Return-Path: <linux-kbuild+bounces-8749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC1B47572
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 19:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FFF4580B38
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 17:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0074A238C0F;
	Sat,  6 Sep 2025 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmvJyCJP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96411EDA0F;
	Sat,  6 Sep 2025 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179072; cv=none; b=DbnTtczWrgoyXWwDZ6hx5SV9/Ncd01cx/aNqRu+qvUw1vaZXfZN4AU8MgToVTTYKbZXIcZxE58apv8b9osWSol+Whq/yGG4XzCs6pB5FeSpMVYHpvVp5ZlYwBbFGYp7dqpZ4cbWVRn1YaH4/SodHah+X4U9pg3GTuVzugcH/iZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179072; c=relaxed/simple;
	bh=kKrq/MCCR73lY4AEd/I+jf9g1amuIeN2wz2wvgU7fls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWEdPy9HG7pvsLPxfomy7y2jtv9V9TFDr9Tvq4TW0y5APNOdGkas84T8fpxHullqFv2gTo1rTMUwUbZ+4pkRHXPs10pM63Rlvhe5ysMF1UMwx/hm6Yx/VEz10a/XojEeCLbuhfvNRoWnsJhCYPdHfE8oQHhfhcTCoFustaMT1U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmvJyCJP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dddfaeb21so4631315e9.1;
        Sat, 06 Sep 2025 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179068; x=1757783868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLznC9wbj6fsrEsXcR7N+oZqquNx2F+cSjxXWY46pjI=;
        b=kmvJyCJP7SKETGWjI1NudacR4lOjIY/DCGcngVhf1HhxKWDBkEohsDbTpd37FlcevH
         TasorLawyE/manBJC1OjtaQd2ik++zMnLUaSPcIvA8WQbYcOq6TnFL/kcdDdX5sp2gbs
         kxkQbWyUj39IC70PokQRPRJ0RI3RuH+78zqnqMiNwWY4ah0zHx7/pxqrZGZvfuaOmfSo
         08aWJ2ovVuJKU9bGfva8f+V2ly6pEnlzUUVPomZWh4ND1CoHGsBF+qDcMScWmc/V1POZ
         7lH9QtQn1xOKyyFIK/9+t8n87rbo+ObEjXjn8CA+5hKP3WPVP9S2OgLpmvYl97FfNbhI
         TVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179068; x=1757783868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLznC9wbj6fsrEsXcR7N+oZqquNx2F+cSjxXWY46pjI=;
        b=Y25uSr9HCFXOcfNsCwVQNIALH4OSYV80yJsDFVM1/Ai7zk4O/LTIehZ5iRKVXrj6NK
         4MiQ6SmnvgpSx3AC7EVKxBfGW/aVFSvwcbKu8YFmrb/XYGnn827kK2aegi1NEp3QXTF9
         lHGw66MQEzPJfRdVTLqx5BvF4n6aGlxH6zdJjNDceyfzcXXR31h1ODrdolRc7arZSj6J
         UD6fROsMx/0etGhe3E6jzOZZzFaZ00Pcv48L4BHx/PVp3/LqDsM0Xzq6YFtcZ5OoeDvj
         L0ETQZZavmYMRImclHQ0SUFzQ8v76EcgUTFSFB5s11ZKIyg7ygiNcLCRGiAteKDfZcai
         /spQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmFJydKteCtE6dHPSSX9GU72geHDXPxCn1yStjF1OJ2XiAl0M/ajBJzrvMCbYsenNQSTXylnTAaapPasRk@vger.kernel.org, AJvYcCX/S71A2ys3TfQngG+8MAJ0wSAl0SvXUXs7ypHqHVZDyFdqeLlt2VbumkRfrE4hGOoPxt5F9sLFxKfBXa9i@vger.kernel.org, AJvYcCX0VpxjYnFIFI4LKLl+INcAluD4hdbfzi1a3heAstghd6ZE5WXUdZnQFsonS62ZA9ysLoKr33aEapc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsN+OJUqFh1t9cmCphxNpXYltZwsx+lKhYBnAxxFkjFh9AYLKu
	AfL0tsPJVOldenqcq8x5xZ8dGkATP2Kbm5KL8r+5ppO5oxObGFzuOz5y4k3AHwHNgSnkRFrMUFA
	KhucnOk3FaS1QXdyavw1W5NNKGjjjWJ0=
X-Gm-Gg: ASbGncuQWA6EDyHUvjN63POFtKXXudvjfFnCDKaCICPJRgLy9kQFRuUre/C9f/lrHFq
	k5pg9KR7KsXLyzV/En5F1Eqsr3WJxPiQdUofwj2c1lF0Zb1qHQU4U46MLmKA+UMP3BWwUo+Gt/8
	buoh86HUhzsA/D8nd18+NBvJ5M7QcmIOnCPv1o0C9NFlFihcA7OlsWj/adplKTJV4EB+2Xnuiff
	zFrhrE4
X-Google-Smtp-Source: AGHT+IGTe20HJiXqLSJfJyxPwH5laIdS/e09aggAl2LoVQ0seNUv6wq8RVdpjnRNLbGjxROfKqJvUGIbnoDiK2kwDcQ=
X-Received: by 2002:a05:600c:3b1a:b0:45b:9291:320d with SMTP id
 5b1f17b1804b1-45ddded3454mr23011575e9.31.1757179067563; Sat, 06 Sep 2025
 10:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <98d2c875da80331a51a5c61e8a67ca43fc57cbd3.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <98d2c875da80331a51a5c61e8a67ca43fc57cbd3.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:17:36 +0200
X-Gm-Features: AS18NWBlGrTUf2BbYo1ooSpg8yIusv-EYuyVF2j8Xf3UqWFYOvg4hL7GWGKDqp4
Message-ID: <CA+fCnZeUvsvGy02k4zQwkGUkL7KbuLzah5XC7kp1m5uwp4bPVg@mail.gmail.com>
Subject: Re: [PATCH v5 03/19] kasan: Fix inline mode for x86 tag-based mode
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

On Mon, Aug 25, 2025 at 10:26=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> The LLVM compiler uses hwasan-instrument-with-calls parameter to setup
> inline or outline mode in tag-based KASAN. If zeroed, it means the
> instrumentation implementation will be pasted into each relevant
> location along with KASAN related constants during compilation. If set
> to one all function instrumentation will be done with function calls
> instead.
>
> The default hwasan-instrument-with-calls value for the x86 architecture
> in the compiler is "1", which is not true for other architectures.
> Because of this, enabling inline mode in software tag-based KASAN
> doesn't work on x86 as the kernel script doesn't zero out the parameter
> and always sets up the outline mode.
>
> Explicitly zero out hwasan-instrument-with-calls when enabling inline
> mode in tag-based KASAN.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v3:
> - Add this patch to the series.
>
>  scripts/Makefile.kasan | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 693dbbebebba..2c7be96727ac 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -76,8 +76,11 @@ CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
>  RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
>                    -Zsanitizer-recover=3Dkernel-hwaddress
>
> +# LLVM sets hwasan-instrument-with-calls to 1 on x86 by default. Set it =
to 0
> +# when inline mode is enabled.
>  ifdef CONFIG_KASAN_INLINE
>         kasan_params +=3D hwasan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)
> +       kasan_params +=3D hwasan-instrument-with-calls=3D0
>  else
>         kasan_params +=3D hwasan-instrument-with-calls=3D1
>  endif
> --
> 2.50.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

