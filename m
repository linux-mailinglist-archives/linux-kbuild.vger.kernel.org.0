Return-Path: <linux-kbuild+bounces-11549-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGOIFhtEqGlOrwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11549-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 15:39:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED44201B45
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 15:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B6C8300A138
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2026 14:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4432B3AEF57;
	Wed,  4 Mar 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqYh3mbC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE6F3AE194;
	Wed,  4 Mar 2026 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635158; cv=none; b=mvi7m0ZuNCk9ainnlvfHlkc6WbDkB/u6TUxd7JChMvBtdQzOD3kpFBMwm6CIXM0SwHBkkHs6xeOf4QAB7r3HLN9DC3UJP75QRkBZEZPMv/aZ0Lju4BlJAx4MRriI8Z6Peq+EyVyPRcv7b6hSV7bK9xzobKavDUiiILhRUc8bcU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635158; c=relaxed/simple;
	bh=jpHbkjBSvqWn6OcfIJDrEntNWYvpRmD8DXYmBcL7tLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBSbAInUQAxVC+1rCeDk9wttyyFz66+6tqzjoqjSlOUlrhaC3jDUu4qOxuT/WaVBBT6vCWS1cN6bAoCSC/6qXzGi/WbggCdDGOtSBkyxDnJyY8geudd4B4aZKEfum3r1HWf4KYRSHRT7luzhxozlcYM9a+77Q73XMF8MYy2TMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqYh3mbC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3438AC4CEF7;
	Wed,  4 Mar 2026 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772635157;
	bh=jpHbkjBSvqWn6OcfIJDrEntNWYvpRmD8DXYmBcL7tLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqYh3mbC6G+LZqZcA349+DHmgVGJez+uBJZFvNa/vvofVcpmLVlfolAwovLD1kpSr
	 wqFBelLyJhq49roMuFGDnAoU8Kmr/N3htigXB42qH4Z8tKRe8F6f8yelEAuAKKKS91
	 ZblkvtoBp/REJT6AFsI1bCjYhRG1cHkKEMcC9nHOOwjaaPNVrWZYWUVkdqHHzu5ky9
	 MXEqQ6fTT3evFo1axez4UodBTySB5pJ6qzg0mcofU4oMP7DoUJal/l5hF/YSkWZYjj
	 /oXFTEF+y8aOk858fCKQPlx0d2+Q4KbkDK86cBr99e0UuMtbjCjnUb+yXPSrE45y7x
	 qJ99426pRHing==
Date: Wed, 4 Mar 2026 11:39:14 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Dmitrii Dolgov <9erthalion6@gmail.com>,
	linux-perf-users@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Levi Zim <i@kxxt.dev>, Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v4] tools build: Fix rust cross compilation
Message-ID: <aahEEkHP5g-T_tFg@x1>
References: <20260218154800.367720-1-9erthalion6@gmail.com>
 <CAP-5=fXLNybYv08dDfAqAsDBzbOPzQY4EZQvdY0WZsfrMu9Yyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXLNybYv08dDfAqAsDBzbOPzQY4EZQvdY0WZsfrMu9Yyg@mail.gmail.com>
X-Rspamd-Queue-Id: AED44201B45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,kxxt.dev];
	TAGGED_FROM(0.00)[bounces-11549-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acme@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,perfwiki.github.io:url]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 08:41:57AM -0800, Ian Rogers wrote:
> On Wed, Feb 18, 2026 at 7:48 AM Dmitrii Dolgov <9erthalion6@gmail.com> wrote:
> >
> > Currently no target is specified to compile rust code when needed, which
> > breaks cross compilation. E.g. for arm64:
> >
> >       LD      /tmp/build/tests/workloads/perf-test-in.o
> >     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
> >     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
> >     [...repeated...]
> >     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
> >     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
> >     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a: error adding symbols: file in wrong format
> >     make[5]: *** [/perf/tools/build/Makefile.build:162: /tmp/build/tests/workloads/perf-test-in.o] Error 1
> >     make[4]: *** [/perf/tools/build/Makefile.build:156: workloads] Error 2
> >     make[3]: *** [/perf/tools/build/Makefile.build:156: tests] Error 2
> >     make[2]: *** [Makefile.perf:785: /tmp/build/perf-test-in.o] Error 2
> >     make[2]: *** Waiting for unfinished jobs....
> >     make[1]: *** [Makefile.perf:289: sub-make] Error 2
> >     make: *** [Makefile:76: all] Error 2
> >
> > Detect required target and pass it via rust_flags to the compiler.
> >
> > Note that CROSS_COMPILE might be different from what rust compiler
> > expects, since it may omit the target vendor value, e.g.
> > "aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus
> > explicitly map supported CROSS_COMPILE values to corresponding Rust
> > versions, as suggested by Miguel Ojeda.
> >
> > Tested using arm64 cross-compilation example from [1].
> >
> > Fixes: 2e05bb52a12 ("perf test workload: Add code_with_type test workload")
> > Link: https://perfwiki.github.io/main/arm64-cross-compilation-dockerfile/ [1]
> > Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>
> > ---
> > Changes in v4
> > - Fixed incorrect target name for riscv
> >
> > Changes in v3
> > - Improved commit message, add an example of the compilation failure
> >
> > Changes in v2:
> > - Map supported CROSS_COMPILE values to corresponding Rust targets
> >
> >
> >  tools/build/Build.include  |  9 +++++++++
> >  tools/perf/Makefile.config | 14 ++++++++++++++
> >  tools/perf/Makefile.perf   |  2 +-
> >  3 files changed, 24 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/build/Build.include b/tools/build/Build.include
> > index e45b2eb0d24..cd0baa7a168 100644
> > --- a/tools/build/Build.include
> > +++ b/tools/build/Build.include
> > @@ -98,6 +98,15 @@ c_flags_2 = $(filter-out $(CFLAGS_REMOVE_$(basetarget).o), $(c_flags_1))
> >  c_flags   = $(filter-out $(CFLAGS_REMOVE_$(obj)), $(c_flags_2))
> >  cxx_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=\#s" $(CXXFLAGS_$(basetarget).o) $(CXXFLAGS_$(obj))
> >
> > +###
> > +# Rust flags to be used on rule definition, includes:
> > +# - global $(RUST_FLAGS)
> > +# - per target Rust flags
> > +# - per object Rust flags
> > +rust_flags_1 = $(RUST_FLAGS) $(RUST_FLAGS_$(basetarget).o) $(RUST_FLAGS_$(obj))
> > +rust_flags_2 = $(filter-out $(RUST_FLAGS_REMOVE_$(basetarget).o), $(rust_flags_1))
> > +rust_flags   = $(filter-out $(RUST_FLAGS_REMOVE_$(obj)), $(rust_flags_2))
> > +
> >  ###
> >  ## HOSTCC C flags
> >
> > diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> > index a8dc72cfe48..214d8f6d9b8 100644
> > --- a/tools/perf/Makefile.config
> > +++ b/tools/perf/Makefile.config
> > @@ -1163,6 +1163,20 @@ ifndef NO_RUST
> >      CFLAGS += -DHAVE_RUST_SUPPORT
> >      $(call detected,CONFIG_RUST_SUPPORT)
> >    endif
> > +
> > +  ifneq ($(CROSS_COMPILE),)
> > +    RUST_TARGET_FLAGS_arm      := arm-unknown-linux-gnueabi
> > +    RUST_TARGET_FLAGS_arm64    := aarch64-unknown-linux-gnu
> > +    RUST_TARGET_FLAGS_m68k     := m68k-unknown-linux-gnu
> > +    RUST_TARGET_FLAGS_mips     := mipsel-unknown-linux-gnu
> > +    RUST_TARGET_FLAGS_powerpc  := powerpc64le-unknown-linux-gnu
> > +    RUST_TARGET_FLAGS_riscv    := riscv64gc-unknown-linux-gnu
> > +    RUST_TARGET_FLAGS_s390     := s390x-unknown-linux-gnu
> > +    RUST_TARGET_FLAGS_x86      := x86_64-unknown-linux-gnu
> > +    RUST_TARGET_FLAGS_x86_64   := x86_64-unknown-linux-gnu
> > +
> > +    RUST_FLAGS += --target=$(RUST_TARGET_FLAGS_$(ARCH))
> 
> I'm wondering about lesser tested platforms like loongarch, csky,
> xtensa but I don't know how to concoct a triple for these. I wonder if
> there should be a test for a missing string like:
> 
>   ifeq($(RUST_TARGET_FLAGS_$(ARCH)),)
>     $(error Unknown rust cross compilation architecture $(ARCH))
>   endif
> 
> other than this:
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

Thanks, applied to perf-tools, for v7.0.

- Arnaldo

