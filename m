Return-Path: <linux-kbuild+bounces-8184-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D25AB12271
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 19:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DF56585ECF
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 17:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A70F23B63B;
	Fri, 25 Jul 2025 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="t94vxJl8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A21BBBE5
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 17:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753462894; cv=none; b=B009ETNXgDKDKFziRd75/X7ONtAsPaw9T1nnPWoBdXh/DB6GkznhSDWoSiM1pygNzksENpyawGqkJ/yU81u9hEriEi4qSNvH9D1k5MoGDFp6bzwksnyTPwjGXkhG9fLa8F+68opWzbsQjepBpuSU/NOPAMOO4IG4qvayaOtjxm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753462894; c=relaxed/simple;
	bh=ps+zs+NSAsN+PYjwfWa7tJ1eiD1ycr9gRg61OjyMFyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/lEqojeUsEUrCjxwFI1A/2OzPq1vfZoXcgRZgo9Bo0+1XFQDXWswDuaNTSp28kKgkDPNqdz/g0hyaDIeUacy8Zbe3xt4Tb2QsE9A6S5s0YUsTMP4NrKGVrUH9V1xP2cDX8/hPhMs1DJSNJOEaJ54afhAvx+y7vrBo8o4QTzhZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=t94vxJl8; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b31c84b8052so2734813a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753462892; x=1754067692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ps+zs+NSAsN+PYjwfWa7tJ1eiD1ycr9gRg61OjyMFyc=;
        b=t94vxJl810wjnWi23XjACqBBJRBb7G7yggUtRZw51FDYgopSAdmVrwrYzKjHauMsv0
         Y5RRRqSFvnhJl04PEF+JPqKRklAmBjJ/+ax4rHf68oPP/7T0qiH+lw6NCofexWzInVlw
         6QStMhCu7zjbluXLLYVeu6jWvj3a7b5X+n4tv2D6gtHoKpkg5tthZGVOwGz4ZDkXwUza
         2MGjuLBJhBlfu+Nb7AmnZ64uCPFKJINY1canL3m07xoYSzcRYEQeqAuqLhuSlP/fZA0x
         FNMxK4ep55MC+3eTYLdyBWeDEO/gMWLzQSdZCXuxTpvCIuf/lfysqs3oGh0ZM4pUWlW5
         Shrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462892; x=1754067692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps+zs+NSAsN+PYjwfWa7tJ1eiD1ycr9gRg61OjyMFyc=;
        b=G1HLG8bGbM2ZhN58W6AdizwcEtJ5JsiWedxDrq8/bdTyB2oEcp6ljqElK0Ps2PNmuN
         71o8BdniaUX8r5ZoNJwQxcSEaNEcoO8IFD0LUBf98IokmLlMa3kVkGio3ySsyOUP2CYn
         EnFDdFYEbzf4pE0bSWCEXjerSsu6eO0Aqn5f8BITKbtjFTtHLeQM1X/WqVIcrAnGPMaB
         3hd5bwHiFh6vIY7RI5+2XsxsgXL5DFByLo3WSSfmBv71La1Yq2+txOAIWjUCLcGwtbrX
         yL992gD6Om5lSAXNHZW30TP/qX8WUHb4zVz1jOshdAMdIIqAIcI7/5lPVbnWgEjYEKJu
         iJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd+Im6a6b1NM1uNMb6zLnWqkLFbcPm1DwADJ56vEtubgShLh32CofjSL9W76BKY25zbxbYLgCep9+Ps34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn6iLrsIAS2d1IClraIVJFowJ9QjYDfQkxfQxc2M997RrAP0p4
	fdvSoaHhexH4u/hvZGFrW3HaPkxOXvtFFe+x23bfim9qGGVDTuJdUm/RjwRG4PI63Eo=
X-Gm-Gg: ASbGncuw6vbL0S8Qw5VBIfefJLxvwxhAW2nTCfuGDa7YnqopnrFGuY4V2SjHRVz/nQe
	76G9/Ccln56iIuHAiHKlfE0WNIh7nkIA0QfFtHpyu+V8E9VdWvNF5x2Jmce/U/KgScvbUgqmzhN
	P+xsDEcGh1M73qI6xjOwYQM5wPr8aZyWWYAfgbKVvfWOtmDlAB+mAr0htST3ha1qK/nICI/r1Y9
	aYyqDRMK5gFsoxvtG1YwVzTkj/bRIEzxQwu7qTniaITzDaNgmMK0urxz0qUr+aPdBCHIEAUG8qt
	NxpoMrHAvfT3V89Dk1B4N7gKPDRFyqil7Cace3XhNK1wGEtofXXzQjn95ydeQSey30ECrAgzOfV
	vzNo+AlY1YSc0ymm/WnNIu5o2p6ohvN4L
X-Google-Smtp-Source: AGHT+IGuTlAbK0hf8yj3kF3pYRz1gmjdG+I1foCKZPdWRPnBU4bPy84CJCnMtZUdxZdhK10DgDBerw==
X-Received: by 2002:a17:903:2b10:b0:234:f1ac:c036 with SMTP id d9443c01a7336-23fb31c4de1mr42286925ad.50.1753462892029;
        Fri, 25 Jul 2025 10:01:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30bdf6sm1493345ad.37.2025.07.25.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:01:31 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:01:28 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
Message-ID: <aIO4aLLFrMVp_Yht@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
 <20250725152745.GA1724026@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250725152745.GA1724026@google.com>

On Fri, Jul 25, 2025 at 03:27:45PM +0000, Sami Tolvanen wrote:
>On Thu, Jul 24, 2025 at 04:36:54PM -0700, Deepak Gupta wrote:
>> SYM_* macros are used to define assembly routines. In this patch series,
>> re-define those macros in risc-v arch specific include file to include
>> a landing pad instruction at the beginning. This is done only when the
>> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
>>
>> TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
>> support.
>
>I glanced through the proposed signature based landing pad labeling
>scheme, but didn't see any mentions of lpad_hash for labeling assembly
>functions. Is there more information somewhere about how this is going
>to be implemented?

Take a look here for generation of type string
https://github.com/sifive/riscv-gcc/blob/f26ae78e21e591f78802a975b68dbde9a224a192/gcc/config/riscv/riscv-func-sig.cc

For hash scheme, take a look here
https://github.com/sifive/riscv-binutils-gdb/commit/1d027fd590c8ad79eba997bcf9b979872ff38eef
`riscv_lpad_hash` function has detail about how 20bit hash is extracted.


>
>Sami

