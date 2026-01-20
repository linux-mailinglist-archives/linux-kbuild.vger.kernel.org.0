Return-Path: <linux-kbuild+bounces-10746-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBCiEjzSb2mgMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10746-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:06:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC914A021
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B42062B98D
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DE94418CB;
	Tue, 20 Jan 2026 17:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiBz+h/a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25A3441056
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931703; cv=pass; b=f/6bC81FNHiW0MiRmq/J/hYWPTnkhbgsGv8epCoBMCm8eb6WcbjnKiq9uOuZw66PCtPA+VeoLneGDi5zfnbfzC3Yu3Y5PnDON/xbAeJpmYHD+JnNCiCIW7+az1htAKBXi2qN6Hxv2t/mgv0Z4ES9cEZ/xqjs+yqrSxzLsymxWAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931703; c=relaxed/simple;
	bh=oHcdxkzTnAC7Ywax8Vckvgjp4LUCRYz+0yKN85C0sUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5sPpqA6ixLj5xu7J9PDjm4y4HpnElRZqiyup2zDS8MEct+hCNYhyJeIDXAgwCjXTZ4UOcDalQsawYb7bntduhN5QDZw4EMjPo9EG8vgfDu1f8VUEiLyGfymMNWbGOiowTTYM18bm3GiJFdRDwrnq55N6emR9EuFuEy1BP7VoOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiBz+h/a; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so36746735e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 09:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768931699; cv=none;
        d=google.com; s=arc-20240605;
        b=JHQRMXoTKsXiUfXuBIHM+dFH/x1b6m1ndRgnzs6YHPFKZ0JDhSA5V/HluhhSjras/B
         +RHDzNwqBJWfCL4J1LifBk5GhYYvWYQ0a9OpI7Jl5Pcrjpa+lilQHPeipW1Zjsb6i4ej
         5RqwAZ9cz5rGVLIKIR/mcKm4ICu8LgW7UO4eJOMgF0wTZkCPG/gCz46B40/og+pafbGe
         BX6RWvVAlRHxqxkDH7AOgKBlqvTGiv5svAMMjyXECZfhgGbndmlOLNRcZBvMq/O3yvF5
         yCj4DxlyGNCF1suLEDLxtp1Knm5cDeHPVpHGNuQ1pbJX502MN+PuSCdXnA1a0LX+/FpT
         BX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSI8A4TsHJKLPFzycUoWUfFc682TNPoMjAF0fDDKMCo=;
        fh=1veo5iunkvocSUG3QelRMdkSc/8uD1QqN24KUf+iF+w=;
        b=gOeuNJCaYmEB1p8RSGnTgXawpadp/JP30hzorGxUo93ZG67b+xJnPAdZLbjvWQZzKm
         8lSNY2MIAUJ/LSGogqqfMXuyMR+JhuURlZ+Ec6B6FiEIvHQZDoLcROHvMYod6KPqKHOJ
         W86nohr6rwA43GH2C5bLRHFeoSfMwJs1lec7hF5YfoFZL0+qs6xXBEban1c5rI3JNzlg
         CH2ibPyEuw+IAJKBYHWD115m3sbUuzWCUBigHn3yQ+Lfaic/TSDRwi6U6I/oU5VUGY0L
         7/kFK3MfYYkJXE1PObRkVr8DZuSGiK7TQvMfA8ScefSZR4zoodjOC9RDY+mXFk6yt6bn
         Smaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768931699; x=1769536499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSI8A4TsHJKLPFzycUoWUfFc682TNPoMjAF0fDDKMCo=;
        b=eiBz+h/adRD4Em4CAOvIQdl2nHB4yFq4jv6rWxqr+54/c615zVMIiuTc63wA/yStk8
         Thj1tW2UovqgGXY+4vRzqgt/WlLKkZkWFNyVbyY6mIwSZnJQn775YBVaVB2rEZP8e+Mm
         l5NRmYE0vYnn0IICHD8bF2ZAOuvFEPa77P0VFf/Q+0z0bNnM9I3j8d3ujQoODmrrZbaj
         0NkzBYOFYLaf9LxWVoeCAjRoGkA93ixdK14uJNVnVMirdyEzHQ1PwK+yJRIywjLpqiZY
         bYclbjgffVlQSwXWwCOJvms6AaOegnuH/NMUTWwF0z/8zOqKKQ8w02HKufypU1y/5VPv
         W/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931699; x=1769536499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CSI8A4TsHJKLPFzycUoWUfFc682TNPoMjAF0fDDKMCo=;
        b=YA2nAfTwY2XKxjSWaX5LsGqNQ+bHUstw1c9ZY0IzyEs+SQMZAF7hESDaxGYSm1wiPP
         jjYC3S7sYJIWrosk1GvdcjY/OJLFj7ip+aOjVoTGfja6urG27ZNQPREOA/jVEEbrMO+E
         AzYqbCfaHPhQ3+kqk0a+ZBHlfu2qOwCDm5J7QpnlooxnJ7ywd3vLTdD/46DxD5bPVuHv
         G2dJfhyuNfEDEvF8Ll4aW43f1splXb+vVWRZw/mdOTx747tHn2LLG0lzHeLxtkJuKZRQ
         FlzE4eO5X2bytpv88Bc998lZ6J5g5lBptmr+qn+igjgkCqNnYQ/eiSHt5QBxob45+3yI
         lyJw==
X-Forwarded-Encrypted: i=1; AJvYcCUTDts7SPvWWj176r1UI/Zl3GEiubAtC3vs4IDXMjdkngFuzuCNwiSevfazKe1fKlhwNes2W5YRFljB4ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKXtZ7hpJhQeF5HIsroxuwjqMDaEkWGE9bAGc/sehzrtoKezqO
	M5XvJl0qI4TKOfE+0FNi8o4ahFit8VL6T+ieSH97KX7U9JbdUBbstS2qw9JcRkk9DrAZDu0jFJj
	lQXr9o8me0LHYfnSsX83XbPetP4zvxvU=
X-Gm-Gg: AZuq6aLXmgyxxm0XKZPxPdUG2b3JCJTboTivowsLFI3Y//Bj3xXj1tHfis5tTdmHMg0
	OogAQCZWd1cv5f1ciDHRwVt8EygQRyuF6mR2LRqx4UksDHFnN454XZlyTAYgU0EvbQ62BOaFEqC
	oZEq5sm6w0soYiE10oPd5IwVoiCuNX8ZpqRQN7Rm3RJ8mN1rIkdR9s/1Pw1ChZLgEGz/8OHzl8G
	LNXGUbLFbGCsDGExeFY7JA0OBj8im25ro5926UAXLuF0j6A1Kl9Cj9Q/osTJ5DFJ28biNS2ibDM
	fsvj/iKtInhnCU8rE3DAMBmbAaKq2Q==
X-Received: by 2002:a05:6000:310d:b0:430:f58d:40e5 with SMTP id
 ffacd0b85a97d-4356a051bbamr17722513f8f.30.1768931698830; Tue, 20 Jan 2026
 09:54:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768845098.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1768845098.git.m.wieczorretman@pm.me>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Jan 2026 18:54:48 +0100
X-Gm-Features: AZwV_QjKpw6bSXc49tC7Ft6D0ET5YLTkUvlrSRTXNNU3JrK5sgQbId38njXfil8
Message-ID: <CA+fCnZf+U3RhmMeGxQ-UypJw2yGd8RJ0gFKrCXsC1eQ5YO-eXw@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] kasan: x86: arm64: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: chleroy@kernel.org, surenb@google.com, justinstitt@google.com, 
	nsc@kernel.org, jan.kiszka@siemens.com, trintaeoitogc@gmail.com, 
	dave.hansen@linux.intel.com, ryabinin.a.a@gmail.com, kees@kernel.org, 
	maciej.wieczor-retman@intel.com, urezki@gmail.com, will@kernel.org, 
	nick.desaulniers+lkml@gmail.com, brgerst@gmail.com, ubizjak@gmail.com, 
	rppt@kernel.org, samitolvanen@google.com, thuth@redhat.com, mhocko@suse.com, 
	nathan@kernel.org, osandov@fb.com, thomas.lendacky@amd.com, 
	yeoreum.yun@arm.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	morbo@google.com, jackmanb@google.com, mingo@redhat.com, jpoimboe@kernel.org, 
	vbabka@suse.cz, corbet@lwn.net, lorenzo.stoakes@oracle.com, 
	vincenzo.frascino@arm.com, luto@kernel.org, glider@google.com, 
	weixugc@google.com, axelrasmussen@google.com, samuel.holland@sifive.com, 
	kbingham@kernel.org, jeremy.linton@arm.com, kas@kernel.org, tglx@kernel.org, 
	ardb@kernel.org, peterz@infradead.org, hpa@zytor.com, dvyukov@google.com, 
	yuanchu@google.com, leitao@debian.org, david@kernel.org, 
	anshuman.khandual@arm.com, bp@alien8.de, Liam.Howlett@oracle.com, 
	kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,siemens.com,gmail.com,linux.intel.com,intel.com,redhat.com,suse.com,fb.com,amd.com,arm.com,linux-foundation.org,suse.cz,lwn.net,oracle.com,sifive.com,infradead.org,zytor.com,debian.org,alien8.de,googlegroups.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,kvack.org];
	TAGGED_FROM(0.00)[bounces-10746-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreyknvl@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,pm.me:email]
X-Rspamd-Queue-Id: AAC914A021
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 3:40=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> Maciej Wieczor-Retman (11):
>   kasan: Fix inline mode for x86 tag-based mode
>   x86/kasan: Add arch specific kasan functions
>   x86/mm: Reset tag for virtual to physical address conversions
>   mm/execmem: Untag addresses in EXECMEM_ROX related pointer arithmetic
>   x86/mm: Use physical address comparisons in fill_p*d/pte
>   x86/kasan: Initialize KASAN raw shadow memory
>   x86/mm: Reset tags in a canonical address helper call
>   x86/mm: Initialize LAM_SUP
>   x86: Increase minimal SLAB alignment for KASAN
>   x86/kasan: Use a logical bit shift for kasan_mem_to_shadow
>   x86/kasan: Make software tag-based kasan available
>
> Samuel Holland (2):
>   kasan: sw_tags: Use arithmetic shift for shadow computation
>   kasan: arm64: x86: Make special tags arch specific
>
>  Documentation/arch/arm64/kasan-offsets.sh |  8 ++-
>  Documentation/arch/x86/x86_64/mm.rst      | 10 ++-

Still missing Documentation/dev-tools/kasan.rst updates. Feel free to
send as a separate patch to avoid resending the whole series.



>  MAINTAINERS                               |  4 +-
>  arch/arm64/Kconfig                        | 10 +--
>  arch/arm64/include/asm/kasan-tags.h       | 14 ++++
>  arch/arm64/include/asm/kasan.h            |  7 +-
>  arch/arm64/include/asm/memory.h           | 14 +++-
>  arch/arm64/include/asm/uaccess.h          |  1 +
>  arch/arm64/mm/Makefile                    |  2 +
>  arch/arm64/mm/kasan_init.c                |  7 +-
>  arch/arm64/mm/kasan_sw_tags.c             | 35 ++++++++++
>  arch/x86/Kconfig                          |  4 ++
>  arch/x86/boot/compressed/misc.h           |  1 +
>  arch/x86/include/asm/cache.h              |  4 ++
>  arch/x86/include/asm/kasan-tags.h         |  9 +++
>  arch/x86/include/asm/kasan.h              | 79 ++++++++++++++++++++++-
>  arch/x86/include/asm/page.h               |  8 +++
>  arch/x86/include/asm/page_64.h            |  1 +
>  arch/x86/kernel/head_64.S                 |  3 +
>  arch/x86/mm/init.c                        |  3 +
>  arch/x86/mm/init_64.c                     | 11 ++--
>  arch/x86/mm/kasan_init_64.c               | 24 ++++++-
>  arch/x86/mm/maccess.c                     |  2 +-
>  arch/x86/mm/physaddr.c                    |  2 +
>  include/linux/kasan-tags.h                | 21 ++++--
>  include/linux/kasan.h                     | 13 ++--
>  include/linux/mm.h                        |  6 +-
>  include/linux/mmzone.h                    |  2 +-
>  include/linux/page-flags-layout.h         |  9 +--
>  lib/Kconfig.kasan                         |  3 +-
>  mm/execmem.c                              |  9 ++-
>  mm/kasan/kasan.h                          |  7 ++
>  mm/kasan/report.c                         | 15 ++++-
>  mm/vmalloc.c                              |  7 +-
>  scripts/Makefile.kasan                    |  3 +
>  scripts/gdb/linux/kasan.py                |  5 +-
>  scripts/gdb/linux/mm.py                   |  5 +-
>  37 files changed, 312 insertions(+), 56 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kasan-tags.h
>  create mode 100644 arch/arm64/mm/kasan_sw_tags.c
>  create mode 100644 arch/x86/include/asm/kasan-tags.h

