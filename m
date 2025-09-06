Return-Path: <linux-kbuild+bounces-8750-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4832B47575
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 19:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A2A1B220BF
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 17:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D707924677D;
	Sat,  6 Sep 2025 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGN6WCY3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC51B1EDA0F;
	Sat,  6 Sep 2025 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179079; cv=none; b=MeaJDwRR0PfusLc4ZCkQHEBsl6q3vgGGN+Ip2xaOkdNZyRQ/JPgJr8jjvaqbIyaGw42/a2+w/sApWL+/1YQ5pDDiCM8K9jf23+fGfiiN3LfOjVdU9wgaSN9OFk4jnxyDxl+3UjDFYdhM7lWA09xvj41KeGrTOTSIE8R+Fy+mLPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179079; c=relaxed/simple;
	bh=okqMJmQM18DFt0EJcZLNQqQ31vImauwlrNbsv0Z8scA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ofh/o//E1CUIj9XGU4HpQ2fq0Ci/XeCZXeGzQmtv6sLqIHlFWAmg10HFHr5SbjRihgqNJKC8Q4yuR39e4hB+0t5ZB5YEoPNQt4GsdA+F0J6DJ7kCjpSQ5JSTC9NdyNRNahqiGi/34kxTWeaH6huCcdcOjqCA+EX2RPqwiYE3kmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGN6WCY3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3dea538b826so2524555f8f.2;
        Sat, 06 Sep 2025 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179075; x=1757783875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8m7gNbOiJ7wFumA8eH5KhxcoFHJTBnL28AX35/mxZ5k=;
        b=MGN6WCY3vJW9YmzRzT38yrg40sWRAErFIqR9gqWdTtJv7ZdsPolbApTJWFeYKturFT
         uTvAf7DswNz+8tcXhD55t+eLil9rs2o9XNIWlWAWxufYotwd8nDLrClgkbzIuKxuhv1c
         fWDC+b6UIWpLETxtVQTnykbnApjrsUye8lJPI/L3EqNAzvHmV4rhNB9KbBk7Eo1JV9WL
         8rZpunSc59TGZrVFTMEY8fBdbSavJO0qkASx5qk4NObKW50blN311eTnRGF/W92sjlIT
         YpI0cTHZBDRSk4Wx8d1tOND3LZ73E/daMP0ZgJNsysgEDLFNbddJpwcoSvnG6pzcFwsk
         VQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179075; x=1757783875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8m7gNbOiJ7wFumA8eH5KhxcoFHJTBnL28AX35/mxZ5k=;
        b=XZ4xK3WckwXBA+n+LCDM2qR1P6x0Mlt//EBiveQ0jQALJZg5h4Lr+LJKlPHwpGKo6D
         VxdSUIIA0wLeaziNimbtrN8GDoysgkEx0XRl1tQ0s0jQwzLo8vt47YHSWC0r33qFdpln
         bCPanEWL7D2jq74nRi6BaYDQ7cISsUbBBXfYiV0ewmCY0M4NoGzGEDmq+6BUwDl+oFqF
         7JmEh8/zqPGLvDRzMEeeoI9j8SzDEsTORB3fQ+4Jx2p/48DyvqvvPTWy8LQX0Ucz4TRY
         mLNVd74nA9F0iwGFO2Wy2Kcttr71XpKI1V7bXeh9yZiFU+fIZ5Ugnt6z64Bnc+F/4yJW
         vwyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtLG8siN1gr2CjrUUZOUIfz/EcCtsIFzlf+RmAZGluOwdvXtZybH1/WO9nropDGpJiR8f+wBJTjhq+3hHA@vger.kernel.org, AJvYcCWsgzCPqAdYJOTfCIrafwHlii30k3CqHY6Ou9vUSJUNDjAR1a12pI8WwENE3K5KOz3wsDMJ/Xj3IA0ddtWz@vger.kernel.org, AJvYcCXM/cg4WjHPhOLRW3HNbq211VyFq74FxOTsKpIDKNDOnDjHO6awMpSUrJKdraDbU59FcOMTZbwVlzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxszATCnqAryjDvaV8T+bhKXeCjTi4CyRppySMqI5G3LOU0/i0V
	W6Wx8g4NSzVDPoRHPkKTfuo9HsCDntcJ2lGz9aqzEDZhjIiaQ5gIcfmxw37iHd+15ChhdtjO+3Z
	s8FRUG6gwfmMQMLNCVBUZsW4N2vxYIrM=
X-Gm-Gg: ASbGncvVtOKRZd6JEX4arJqGMiuuzBLUQkyOWtZltkH0ZeBs42JWTtVU7NrtycXdcLO
	aa8hz7ULnvaoxrEaGAcABG6XkXdpSnrs0Rt5tWPZpfQaq/GDePshymLbsBHVJp7gr764B66aQ+9
	3iX7hI3vJQ+CjHoqNPU+54MzTIR5Vu9s2fenS9f2VtT2Tfibc3xnd1oaWdMvi7DkhWgyYz9GONX
	A28K5F9
X-Google-Smtp-Source: AGHT+IEVaxv1flhMNQ21ny8HzxKdUksbjU1IsnfWBaLSu+i+o5RQBFuNsHWY/aKwSfi08c9LffaO8ru3O0fOtcOI6wM=
X-Received: by 2002:a5d:5886:0:b0:3e4:64b0:a760 with SMTP id
 ffacd0b85a97d-3e642026e72mr1764739f8f.18.1757179074706; Sat, 06 Sep 2025
 10:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <7cb9edae06aeaf8c69013a89f1fd13a9e1531d54.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <7cb9edae06aeaf8c69013a89f1fd13a9e1531d54.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:17:43 +0200
X-Gm-Features: AS18NWAccC9JiiN3oBmxBjTrrK8-6qYxZFkRTV1lkD1J_h60FmCfpfZ83r4hey8
Message-ID: <CA+fCnZd7tM5i5jOriaYyR1GgjgREv0PhyxpFuEC5506FkndzAg@mail.gmail.com>
Subject: Re: [PATCH v5 04/19] x86: Add arch specific kasan functions
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

On Mon, Aug 25, 2025 at 10:27=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> KASAN's software tag-based mode needs multiple macros/functions to
> handle tag and pointer interactions - to set, retrieve and reset tags
> from the top bits of a pointer.
>
> Mimic functions currently used by arm64 but change the tag's position to
> bits [60:57] in the pointer.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Rewrite __tag_set() without pointless casts and make it more readable.
>
> Changelog v3:
> - Reorder functions so that __tag_*() etc are above the
>   arch_kasan_*() ones.
> - Remove CONFIG_KASAN condition from __tag_set()
>
>  arch/x86/include/asm/kasan.h | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index d7e33c7f096b..1963eb2fcff3 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -3,6 +3,8 @@
>  #define _ASM_X86_KASAN_H
>
>  #include <linux/const.h>
> +#include <linux/kasan-tags.h>
> +#include <linux/types.h>
>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>  #define KASAN_SHADOW_SCALE_SHIFT 3
>
> @@ -24,8 +26,37 @@
>                                                   KASAN_SHADOW_SCALE_SHIF=
T)))
>
>  #ifndef __ASSEMBLER__
> +#include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +

Nit: can remove this empty line.

> +#define __tag_shifted(tag)             FIELD_PREP(GENMASK_ULL(60, 57), t=
ag)
> +#define __tag_reset(addr)              (sign_extend64((u64)(addr), 56))
> +#define __tag_get(addr)                        ((u8)FIELD_GET(GENMASK_UL=
L(60, 57), (u64)addr))
> +#else
> +#define __tag_shifted(tag)             0UL
> +#define __tag_reset(addr)              (addr)
> +#define __tag_get(addr)                        0
> +#endif /* CONFIG_KASAN_SW_TAGS */
> +
> +static inline void *__tag_set(const void *__addr, u8 tag)
> +{
> +       u64 addr =3D (u64)__addr;
> +
> +       addr &=3D ~__tag_shifted(KASAN_TAG_MASK);
> +       addr |=3D __tag_shifted(tag);
> +
> +       return (void *)addr;
> +}
> +
> +#define arch_kasan_set_tag(addr, tag)  __tag_set(addr, tag)
> +#define arch_kasan_reset_tag(addr)     __tag_reset(addr)
> +#define arch_kasan_get_tag(addr)       __tag_get(addr)
>
>  #ifdef CONFIG_KASAN
> +
>  void __init kasan_early_init(void);
>  void __init kasan_init(void);
>  void __init kasan_populate_shadow_for_vaddr(void *va, size_t size, int n=
id);
> @@ -34,8 +65,9 @@ static inline void kasan_early_init(void) { }
>  static inline void kasan_init(void) { }
>  static inline void kasan_populate_shadow_for_vaddr(void *va, size_t size=
,
>                                                    int nid) { }
> -#endif
>
> -#endif
> +#endif /* CONFIG_KASAN */
> +
> +#endif /* __ASSEMBLER__ */
>
>  #endif
> --
> 2.50.1
>

Acked-by: Andrey Konovalov <andreyknvl@gmail.com>

