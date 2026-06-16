Return-Path: <linux-kbuild+bounces-13756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fM2jDAHzMGo+ZQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13756-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 08:53:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 834EB68CA8A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 08:53:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etsalapatis-com.20251104.gappssmtp.com header.s=20251104 header.b="AAPLxm/1";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13756-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13756-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23467304C102
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 06:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EFB31327F;
	Tue, 16 Jun 2026 06:53:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DA330E83F
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 06:53:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592819; cv=none; b=nVjOgHRY+xVCAp30HbJsylmbrLVRXv+WMOTA6qzgMl/jBsCGw1MlrhUpes/fVXTPMrgmJ59Xzl/sw8OKYQWc3jsipsF+mqBp9rz4wz65tsNF/2z2DC+8B2a7OHxKBYZDlHgTSh3WFayGrW6GL47mtOOCLJJe6JKQ65UsBfVA5aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592819; c=relaxed/simple;
	bh=FtzjIdGBmXPdBVqQqp0OKnPq2Aj8qUFPkZb0y+c03Rs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hTON7IH8XNa5AsQaUiEjUgaI6KNkk3LA6yrr6/ZFJd6fLRLBXNIW5wA0teXWwV3VOJ36fzplgwMWP5MEr8R5NhS43rSwJuJiyt0rfE5Nj2Omuub3nEtTI0fV07+ZDXIYKYWXy8zK5PRQzvv5/2FKE8XtONbhmupHOEN5DPaPkDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=AAPLxm/1; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d8b644473so3649850a91.3
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jun 2026 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781592817; x=1782197617; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAMbizAsvE1IYkvWb+JTaAfoViw+PfXliSYcH4bZRMM=;
        b=AAPLxm/1jeu3jgFZ3Z8cCssDwEvIoTrhiRVyHwlSCQ5cpnkmB/rqWyvnNrp3Nqj2hh
         oUtaVY+WsyB/ZRV0XWh5ksjByByplhN2uRUkeNFzJ4azGuWd4XZQknwhBtqZ8/+uNum1
         O/8SLRCH24aknB68goVlk30Z9DSoW4/l0UqZSzQSSD9vruIeqeqkvoiHN3v7I8FzVfjD
         vZ/BO5UX9HnRNvIxPU1mhBOD3qJ4kjtlT/MSzYHd+z7pa9u4mnJVyFckyrbzw/leUy/F
         gC/VMSL5jhm7yx5zS7zeJQm/zlkmX+jC2dknewWbhBXwMMU8t0FB8mD4NU4Tuyip3AZx
         jR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781592817; x=1782197617;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAMbizAsvE1IYkvWb+JTaAfoViw+PfXliSYcH4bZRMM=;
        b=CXjNYESEU4laaqdK2+xBvQUni0xqe0tKzFh6mYtXWk28koZehYm/10amjZ8Ht4PLjU
         mFuciL9GJ94ceajcCZEvt776YX6/uPWOK3CGiADTgx/DEXJfdgAhlHJvBMXFGTrNDEj+
         d0VQudfPbyD51P1GRIyj8mT+Q/Y/F53fwBS4aZPcAgIaWBduSNO1MqFrEBF8SXUdiHz9
         QPcO4+LLiWPsSrzzyGyRAEybtCFqdANikUQY4uuNMo+dzrkqT02mtcttzyOycRkujQvG
         OADA6JFH1YpJ3DctStUjcH0IEg0CYaAElCPxcxbslVdz2pOVCDPjZuv+gAi7Z92a1qqL
         2Tzg==
X-Forwarded-Encrypted: i=1; AFNElJ+xHBijkdcZUS19jUd3pR2BVxAzmZV2/7gZvJFiI+rdBdEfUVlwsprsCaAufLSkcDbC5ZTF20R4D3OVdsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcmZeEZeRwzTlJHMoHKYuu/Ap9L3+n7v+pjsNyEL3nl5dY8wzO
	S+ndd21Om5T0QgpRjKumXS3YezoNCILt+BSWoL+TijIjd/ruAtZoOns3G7DtkthiAjo=
X-Gm-Gg: Acq92OGkd8c9OXfsIJim+DA/vIhd0ezEn/ZeTqD8Mqg5eGGKoWvklWumEKu3tU2YCpf
	DHvzIQoMzVKlzUbhk0QjCJ6sV3feCtiXAveSB4p3Kb2qZ8qvaOxUc3aVajHbG81uGmF3gqOpsyR
	qD7+Mt4ZJAqrS2RTMidXqTuh85SF9RH5e7NlxaIGRHrkjxy3HuSW0u/e6B0S7+TAOtraLOTggiY
	kPasAhrYXjjLL9XTtzGCXVbg/dOi/L7d72KJNX2+bN14TE+5F/OxGtGEj77++SLoT4RQinp8z8q
	tM4nOah/oBKUf4oGpI3qhznT8aqckjVbR+aB7SchsBVNfAPyB/TJNahnV48Ve0K/10sY+FF038l
	KW1JqtJf8RmFSNo6lpFhNPQ0MFpALsTd0GDLsX7amf0Kqpl5CvLbcGHAnGPfa/oAv/Ofw0Bi/H4
	ww00fLtow4307GPoN4b8UPA/h2DnPfDoN1QJ2icBcqTGLTgnGATwSWQbgS
X-Received: by 2002:a17:90b:5388:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-37c52909376mr2464111a91.17.1781592817310;
        Mon, 15 Jun 2026 23:53:37 -0700 (PDT)
Received: from localhost (d206-116-244-52.bchsia.telus.net. [206.116.244.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c52092ee3sm1838204a91.0.2026.06.15.23.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 02:53:36 -0400
Message-Id: <DJA9Y0YAOZG3.1TEPN0383EAL2@etsalapatis.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Jiri Olsa"
 <jolsa@kernel.org>, <bpf@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 03/14] selftests/bpf: Fix resolve_btfids
 test reads of BTF ID sets in PIE builds
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-4-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-4-ihor.solodrai@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[etsalapatis-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[etsalapatis.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13756-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etsalapatis-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,etsalapatis.com:email,etsalapatis.com:mid,etsalapatis.com:from_mime,etsalapatis-com.20251104.gappssmtp.com:dkim,vger.kernel.org:from_smtp,gnu.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 834EB68CA8A

On Mon Jun 1, 2026 at 6:17 PM EDT, Ihor Solodrai wrote:
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

(This is missing your SOB)

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

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
> =20
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
> =20
> +#pragma GCC visibility pop
>  static int
>  __resolve_symbol(struct btf *btf, int type_id)
>  {


