Return-Path: <linux-kbuild+bounces-9554-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A03C4C983
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0B6E188A79F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 09:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B489C214A64;
	Tue, 11 Nov 2025 09:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NRrFaKzc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96AD2E8B95
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852477; cv=none; b=R9XIlBboAOn0nMOYD7OuLVCoGAPkbO1wVKelJF2MqG15mrYHGIWLW/Rv7b0mOXYm86IHLPZE01P1P/Cz4olBKaJ66FmbTeG7dcWA8P6R2eipp36ZB+0QmIyxTk80Q49mhdg3J1T0QY8kG1gYd6ZLCJfjkdNzbRx3A3vCsiMTr/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852477; c=relaxed/simple;
	bh=+fuZTmVdwbIHymrZKqGvMnKmh2q+5Yh8TQx/OG4Qt8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoSF+qG4cFfcEVYv+UiCxNqGhCV31sUq/VPvuxL52buv326txGbQu2S3II4GkP6ULq+gKNvNiR++tl4d3nyezuaUdmbRNs/K6GUCeJi44NHtEqpmPWOkDTlDlRBfRL+MPOxf2xelrrr0kgRBZoCLgkR8YUnuhX6ua2lXY0JetEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NRrFaKzc; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4eda26a04bfso39094831cf.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 01:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852474; x=1763457274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZTy2q2TNTCA3OHKdlCs5XdCV4IXpZdhN+lpNGYPqtA=;
        b=NRrFaKzcpsTBVmpCaZ88hi5hfqVLH+Jt04xmWSfk9MhSpvSRNUV0pkCXnEUjkOAMM9
         agQMVqNpFeEV1DVWSAt7Z7iM9Rqdb52RznIWb1B1S+Ji/ueerXlQHls2OtfCtQRJl22P
         d/n75+H+NlPtPQUzosQ11Q/OpCBDhACo5+1r9u9HyDsjOuij0NyhyoWLGQECkuWp5eoe
         U9OAQvkPVprcN4KmkW7oregyEJF50ilVdKnHmjn0TstCsOsIGWA84M9bS15Y7myiYkLo
         Dcak/e2F0jhM6+39EAKTNBVhOZ6RxiA8eam7nK+zkGanVB6ruA2dajPcEzAvcOcAH4vK
         nzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852474; x=1763457274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZTy2q2TNTCA3OHKdlCs5XdCV4IXpZdhN+lpNGYPqtA=;
        b=NKnJmVOewoN3jTEzdJS88xMQpavkQ/J6gFCy6fX160PyL2x0F2S/7xGYaML8qPK2BG
         H4oukyuUPLqb2zZUL4X+NsLYbMpf4+YtJDcofAAdw1IUlv56a55mOHRQ4vjff7UYljOe
         ycr2nuQ9bpJJL2JardqoLmsDHNtyWQdw61hgBlDB6g9KocGiD4Dqnie64SbMWiSzR57m
         trsSYUIhAFfYHoM99cK5XULVrIx2YXmLzPMP9Cl7RgYs9Fu1L54jrr3nfYBJLh0kKKxC
         na4aUy6vydg0BkXnXIEbtady3McoN9AE0XlJ9W/+yWmph3uKxxXPJeTM/UGjTADbaGQu
         LgjA==
X-Forwarded-Encrypted: i=1; AJvYcCXtIVLsGMEhVHdgSkWD81AURRk0IQCX7+k/46XwPVLsihKT5UjMVo0BQ+a+Wtl10TbxjQQtTISHV3sUv6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YywJlitHF2qjNlURnE0nbe4mi2VexXpmhvEWZhpY8hbQKKtM5eS
	IrG1xZh+Ss2w9aOibSQ6uqh/xKtlDJRP5o4eDUatsci5SFG/l0U2YPiHynMOzYNybnMUZNwMSli
	+5775PPD6yVYHk4VB3eTKkkC5l88qgMbGX9t+qzDe
X-Gm-Gg: ASbGncsXqdhHxwwsLWQv0W0T61AXqPd0jGNUKT+R+4McqI7IFViLaHueEH9nISWlkxN
	0Fq/s/xtqiZJ/pG7TRKHxdsua6ByyN4nEB3RBJqRMlsg8qMIggV0s0a4bVfo86iauAMEv2uVQVH
	eUfdHjyvOK13Yd9vaADWHZwnUE5u6z8Ro3aIHgjVpAWE8fed/E8fw8Npy3o4G8YGDIcrqQ4eRfB
	W/5PIlhFjN8wQkPmrl1kKeSvMJvY7WUpYeD3D9EWaYYNKgaJnwKgzHaTQs7Zf5GN9cSgWWCup5i
	yw6KJ66FV0OOiJSydPhjr8uyu6PfSERhTQ3s
X-Google-Smtp-Source: AGHT+IFHyI5tV3uPkHfzZQDwtLCu1xXfZdNpjQHEIN8gqbseljKndHdCHWJHLu5LbqQguzv8YlVvlOC2YwOH7fkw7n0=
X-Received: by 2002:a05:622a:205:b0:4ec:f151:6559 with SMTP id
 d75a77b69052e-4eda4ec1851mr145606591cf.27.1762852474078; Tue, 11 Nov 2025
 01:14:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <d6443aca65c3d36903eb9715d37811eed1931cc1.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <d6443aca65c3d36903eb9715d37811eed1931cc1.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:13:57 +0100
X-Gm-Features: AWmQ_bknFBa8gAhB6UE8n7ZlyUgSKcguUN9eypJruwNRSxK5vCFPizbRNuQ2qaE
Message-ID: <CAG_fn=V4jVyS41MDxJeN-A2zk6WhTnxp7m3FRWmkXMpy5f+haA@mail.gmail.com>
Subject: Re: [PATCH v6 09/18] mm/execmem: Untag addresses in EXECMEM_ROX
 related pointer arithmetic
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:08=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> ARCH_HAS_EXECMEM_ROX was re-enabled in x86 at Linux 6.14 release.
> vm_reset_perms() calculates range's start and end addresses using min()
> and max() functions. To do that it compares pointers but, with KASAN
> software tags mode enabled, some are tagged - addr variable is, while
> start and end variables aren't. This can cause the wrong address to be
> chosen and result in various errors in different places.
>
> Reset tags in the address used as function argument in min(), max().
>
> execmem_cache_add() adds tagged pointers to a maple tree structure,
> which then are incorrectly compared when walking the tree. That results
> in different pointers being returned later and page permission violation
> errors panicking the kernel.
>
> Reset tag of the address range inserted into the maple tree inside
> execmem_vmalloc() which then gets propagated to execmem_cache_add().
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Alexander Potapenko <glider@google.com>

> diff --git a/mm/execmem.c b/mm/execmem.c
> index 810a4ba9c924..fd11409a6217 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -59,7 +59,7 @@ static void *execmem_vmalloc(struct execmem_range *rang=
e, size_t size,
>                 return NULL;
>         }
>
> -       return p;
> +       return kasan_reset_tag(p);

I think a comment would be nice here.


> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3328,7 +3328,7 @@ static void vm_reset_perms(struct vm_struct *area)
>          * the vm_unmap_aliases() flush includes the direct map.
>          */
>         for (i =3D 0; i < area->nr_pages; i +=3D 1U << page_order) {
> -               unsigned long addr =3D (unsigned long)page_address(area->=
pages[i]);
> +               unsigned long addr =3D (unsigned long)kasan_reset_tag(pag=
e_address(area->pages[i]));

Ditto

