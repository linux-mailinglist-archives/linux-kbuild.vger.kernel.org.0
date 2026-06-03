Return-Path: <linux-kbuild+bounces-13551-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P3uRLbW8IGpJ7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13551-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:45:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852F63BE4F
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CyJYab49;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13551-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13551-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 884DB3042E74
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802594A2E03;
	Wed,  3 Jun 2026 23:45:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113DF426EB7
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:45:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530355; cv=pass; b=ZO//dGD16Pvt4wbIwKLL2brU1ruhL3XtHlxhOKi/qsreh+qyUNwaOr6UCQ2F5A7O1nTw4PD9nbXcoQ7AtRw4GQDzA796iyUeLz3nNp1GYO4gltat5RxT1ZFK4tAZCQhVVcB7zPAZdC3TtSUhO8sEaWQT6DSSNwSopZgjHpuYUa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530355; c=relaxed/simple;
	bh=GsSyQi0Rmh/mLhiNbNqbWD9VQM1yl2uSBWhUyK8SnkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2o3XfKgX4pPga3Ul384GWole7RJcdMRog5/3x7Os6MssR08cE0Rxzrkwm/EG2cMEodzRgqK8/vGAGVLo69gMmwAADTzSwU+cu82yxMkDhqbbP6y0haAr4bA6k9bFZMDlCourG5MQDO40VqQ+jWTathL9r6HsZWpevJoI1P3eBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyJYab49; arc=pass smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84229481d44so34776b3a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530353; cv=none;
        d=google.com; s=arc-20240605;
        b=H6QwXiX+glckhgSrrOEuI/zrleFLeS1Dvf+HTh5CImK2hg/6dY+s8jhKreZBfDd2qA
         JLig1CDSbIZbEkJ10pAaCiS3uckAk/LaLA98m6v8xqYkBppgJInYYdIJi4ADUqkJ4ifW
         8QzlmtU0xw3EudKw08iFaDNyjAmodmJlb4HlIo07ikB/2/1lMcsSTcanWIgPhmTVfit8
         W9pCfEHBJ57UQXTMCu0s1a7IGLQ4fjn+rU2KI7uTt78xkUUAHI2cs7vRh3deMhJbUjEn
         f0RkpIq70k0BL1DlBaflGzkEoNv+7NrLLwQCYqe8y8PMI1SeHplfEkfTYWaTO21r7P8c
         IPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CkgZL+58ql+bztqsx7oOmXRiL9ccnlrzQ1mrYu35Xvg=;
        fh=VXw9bCxcv8W/U1b9Asmo8OTo2qioX+uz/qsST/c4Euw=;
        b=JhwPartvBUOVt22QkNbnLgfucyk/jn0LH7nfawNydfL1tMYx+QyQpFDf37quIkLVEg
         UXNHxuRES9a2d1KuKF+5Yy4kHYv2lu9Iw03y7lnOsQ8JUJWmqROyGN1cQEwLmQ3SgxLm
         ZnzYql+PNour5WYVBy0Z/qjfxA/uBv8CJlD/4lRUop9CKfC8WCu97Gl8Myu+XQDQ8iTl
         UXxkf2R5zPbW5TUVeMGnqTcOabyozqCKl3qoh9+cvCZrO7jBv5g1fDhEJhv87JulmLuX
         vAkCB2LO38Eu5fwldlOqkC0P2PZly79C97XaGrv469inqy6VpC0M4/YlJSWnvsUYj8kx
         DO3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530353; x=1781135153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkgZL+58ql+bztqsx7oOmXRiL9ccnlrzQ1mrYu35Xvg=;
        b=CyJYab49d2KS7ZSpECWXOmMphUBLw5d9yLgmLE7HWU/dil4hLKIaV6w7XZjt/BcAlt
         ovZQCdKENij95X6SmEvql9TeFYlcPnhphf8/aro1tXHtl+lfqQ7mUyVqI5TTdRnXeain
         8OJbF8u4Sx+x7CG/buvdlURQIZlGCcmtYBv5BNmrtQyf34AExoxu1+vq2BnJvIAuydei
         0vQ7hq6RmKwfwJjLCIufhGtV1EvQuAL4comS/O7raPM5G4fvazQgGGy9Ug4lTXc33sXl
         +owHzpJ8bY9dguUjNX8wQXY45Cgd5C7fpmhjpBLg4ubIsYaXP9onptBzZzQedeLv4b1X
         ausA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530353; x=1781135153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CkgZL+58ql+bztqsx7oOmXRiL9ccnlrzQ1mrYu35Xvg=;
        b=fDoqz8BUGur7vFkcqN4VGg6EPOyjjP+Yf+WgAnWiSIeyoCNzRptED5al6UIEh5nBDB
         PQE2d4TuX+eTdr7yF+a+gKJPSmBuuAvR4sU3qBWTLqzI0F8G33s5tiEt6iRy7xW5RwYd
         5oAmk39lD/gPQ808BiYI/CBOR7ZMUDdWdA7XCUEBpWQrRmG+9z4yRrETAaDhpz8fZ0ci
         pgaI76jszbMeHNcqJwhqF9HdnDGcGvv7qOnBZW7hKxm9yU+3Rt+JPMqRLEKYhX1PAQ/e
         gylAo0HZwnjD5yWAEYfvi1jzyWed70Z0YI4gghA6H0UHfb8thrLnftyuL6fW+K5RBl+5
         4pgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LXORu2+rjyQ0m6dd5029nVBN+YljXJgl4A00n+5t67lQB/GOJJfI6yx+KIMSb7ye/LqgLWoR+1mdxHYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8AVQxWETkoeDjRIeZ84MGNF/YpumveYG7ZmqJgd3RZDraip7Z
	MVNW2i3ZsIKHUm+dMBr+G6wSxfJzCGDY9ndvVP205SNWXKQiNALto8e86ulJ2Bm7/G0q1K4rGKh
	Q6zRJTxeCuxasvW240uIYKdqOIjTVGoo=
X-Gm-Gg: Acq92OGCSKaCbgVo/2iyxFmvSuQjiCU8JbBoUM0Eq3cDFXVbUmNnRezfWTj3L042tLX
	sr7m0l4T/J819bXZxWVByVglyO5wbdaWjjaPdskQ2BMsEcUb0UinleU/hSmtB1G6W4BdPxIXoBF
	wxMWLOW32MduMqf3chIUUTJOjF7k2fszT8NboJPIcxiCHntw4bZoApKeLgk9qV2gXw+Z0fxyg3u
	Ouh2KfeG/g0NL2IjPukOdnYAy9fdoHTZq8usXuNV8pwIJL/HzezrboYlq1ZXtLnoJGO0u52D5D5
	5WOUl7XzovuFsLH0LA==
X-Received: by 2002:a05:6a00:b56:b0:838:a46:ce96 with SMTP id
 d2e1a72fcca58-84284f5f5b7mr5135584b3a.27.1780530353094; Wed, 03 Jun 2026
 16:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev> <20260601221805.821394-4-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-4-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:45:37 -0700
X-Gm-Features: AVHnY4IHUCMvhhzS4aH2hkfZA7z-wgFlsD2LjwAgYH16lMrWOW9SOCVNACcMLxs
Message-ID: <CAEf4Bzawb0qkNR3Cf5aQve5anGDvrfBX6g2B-B7RESdsvUVdvg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 03/14] selftests/bpf: Fix resolve_btfids test
 reads of BTF ID sets in PIE builds
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13551-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,sourceware.org:url,gnu.org:url,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3852F63BE4F

On Mon, Jun 1, 2026 at 3:18=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> TL;DR
>
> On aarch64 with gcc toolchain, when test_progs is linked as a PIE,
> reads of BTF ID array by C name return garbage because the GNU
> assembler on aarch64 unconditionally folds .local symbol references
> into section+addend form, and GOT slots cannot carry an addend per the
> AArch64 ELF spec.
>
> Fix by marking the test's BTF ID objects with hidden visibility, which
> makes gcc emit a direct access that bypasses the GOT entirely.
>
> Details below.
>
> The subsequent patches adding kfunc checks to resolve_btfids test may
> cause test failures on aarch64 / gcc-15:
>
>   test_resolve_btfids:FAIL:kfunc_set_flags  actual 13 !=3D expected 1
>   test_resolve_btfids:FAIL:kfunc_set_cnt    actual 0  !=3D expected 4
>
> The test defines its BTF ID sets with the same macros as the kernel
> and reads them back directly by C name (in the same way as the kernel
> code does).
>
> test_kfunc_set is a .local symbol emitted into .BTF_ids by inline asm
> and declared to the compiler as a plain default-visibility
> extern, that is:
>     extern struct btf_id_set8 test_kfunc_set;
>
> Depending on the build environment, test_progs may be linked as a
> position-independent executable (for example, gcc defaults to -fpie
> [1]). In a PIE, taking the address of a default-visibility extern is
> routed through the GOT (Global Offset Table) [2].
>
> The GNU assembler's adjust_reloc_syms() pass (gas/write.c [3])
> replaces references to local symbols with the corresponding section
> symbol, folding the symbol's offset into the relocation addend.  On
> aarch64 this conversion is unconditional: tc_fix_adjustable() is
> defined to 1 for all fixups (gas/config/tc-aarch64.h [4]), so even
> GOT-generating relocations are subject to it.  The resulting object
> file therefore contains:
>
>   R_AARCH64_ADR_GOT_PAGE      .BTF_ids + 0x54
>   R_AARCH64_LD64_GOT_LO12_NC  .BTF_ids + 0x54
>
> However, the AArch64 ELF specification mandates that GOT-generating
> relocations must have a zero addend [5].  The +0x54 is therefore not
> honored: the linker creates a GOT slot pointing at the .BTF_ids base,
> and every access through that slot reads offset 0 instead of 0x54.
>
> This is purely a read-side problem, specific to the PIE test binary on
> aarch64 with gcc toolchain. resolve_btfids patches the set header
> correctly and the .BTF_ids bytes in test_progs are correct. vmlinux is
> unaffected because it is built with -fno-PIE [6] and reaches .BTF_ids
> with direct, addend-preserving relocations rather than the GOT. clang
> is unaffected because LLVM's assembler retains the original symbol for
> GOT relocations instead of converting to section+addend [7].
>
> To mitigate this issue, mark the test's BTF ID objects hidden with a
> visibility pragma so that gcc treats them as non-interposable and
> emits a direct access instead of a GOT load. This keeps the natural
> by-name access, works in both PIE and non-PIE builds, and needs no
> change to the BTF_ID macros or resolve_btfids.
>
> [1] https://gcc.gnu.org/onlinedocs/gnat_ugn/Position-Independent-Executab=
le-PIE-Enabled-by-Default-on-Linux.html
> [2] https://gcc.gnu.org/wiki/Visibility
> [3] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dgas/wri=
te.c#l922
> [4] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dgas/con=
fig/tc-aarch64.h#l279
> [5] https://github.com/ARM-software/abi-aa/blob/main/aaelf64/aaelf64.rst#=
5733relocation-operations
> [6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Makefile?h=3Dv7.1-rc6#n593
> [7] https://github.com/llvm/llvm-project/blob/4b3bc46d1d794b8ed78b75ccd35=
a6cc30235bf31/llvm/lib/MC/ELFObjectWriter.cpp#L1213-L1224
>

fascinating! but you also missed adding your SOB

Acked-by: Andrii Nakryiko <andrii@kernel.org>



> ---
> ---
>  .../selftests/bpf/prog_tests/resolve_btfids.c  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/to=
ols/testing/selftests/bpf/prog_tests/resolve_btfids.c
> index d742ecb2ca8e..d0e51979d455 100644
> --- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> +++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> @@ -32,6 +32,23 @@ asm (
>  ".balign 4, 0;                            \n"
>  ".popsection;                             \n");
>
> +/*
> + * The BTF ID arrays below are .local symbols placed in .BTF_ids by
> + * inline asm, and are read here directly by C name. To the compiler
> + * they are plain, default-visibility extern objects.
> + *
> + * When test_progs is linked as a position-independent executable (PIE),
> + * taking the address of such an extern is routed through the GOT. The
> + * GNU assembler on aarch64 unconditionally converts references to
> + * .local symbols into section + addend form (".BTF_ids + <offset>"),
> + * but a GOT slot cannot carry an addend (the AArch64 ELF spec mandates
> + * zero), so the linker resolves it to the .BTF_ids base.
> + *
> + * Mark these symbols hidden so the compiler treats them as
> + * non-interposable and emits a direct, addend-preserving PC-relative
> + * access instead of a GOT load, in both PIE and non-PIE builds.
> + */
> +#pragma GCC visibility push(hidden)
>  BTF_ID_LIST(test_list_local)
>  BTF_ID_UNUSED
>  BTF_ID(typedef, S)
> @@ -60,6 +77,7 @@ BTF_ID(union,   U)
>  BTF_ID(func,    func)
>  BTF_SET_END(test_set)
>
> +#pragma GCC visibility pop

nit: empty line after pragma, no empty line before pragma so it "hugs"
relevant pieces of code instead?


but also, can't we just use BTF_ID_LIST_GLOBAL instead to avoid all this?


>  static int
>  __resolve_symbol(struct btf *btf, int type_id)
>  {
> --
> 2.54.0
>

