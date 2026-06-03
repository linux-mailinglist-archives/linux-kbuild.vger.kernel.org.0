Return-Path: <linux-kbuild+bounces-13550-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FZ8xDui8IGpa7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13550-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:46:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C11AF63BE69
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:46:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=l2vdA5x7;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13550-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13550-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FC4C301CCCE
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00330439006;
	Wed,  3 Jun 2026 23:45:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FDF37C930
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:45:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530335; cv=pass; b=Ytp7bQHkS+3r0BM8IkM7OBdRTrDazXukB4bSempQd0QIMm7GGeywyEEaQw/m6Ms38kGY1SLzmA6Gb/PZxPMpSq/IHJZ2Gwl0liM1S4kJjIRyXbA5ow1Kefs/02HUXO/8usYHbq6ydALTF9q25mZHCOzr8yGjgF1Ml2dRVn2O5KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530335; c=relaxed/simple;
	bh=ukEmX+T4FtTUtTZCL/lPwLl9iXp9MlnxJQR8kzn3ggo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enNNbgVSTHz5NUa1tJlSanm5FU8rzxxjlx1JmJq58xOutxLOKqjZ8JSXXryFWMk7muOHG1LGTcnZRbwQJlBkga8cRxcqat10wBvkzeGIQBB9dGwqKfcR59Lm0JI9JXQKRbioWQlhkZW9J6yYlMcEVgbIn2uYMp2VY+Jtf6ebQJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2vdA5x7; arc=pass smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36c68964315so34082a91.2
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530333; cv=none;
        d=google.com; s=arc-20240605;
        b=cA0hksFkP99bwms0hOamrpZlVNLHwR6gwZ/f0h5Nua/n7UWhjA2L0W9mz8T7U5AJkv
         SUJJcZNB0NOiRB/T5bPy1g8LFHeASh0Hh6BfwSr+icsasH54tKscumDP5ubdoe3c3dsV
         4dNCtuH0r3Fq7I7ezOIlYJdwsF9GH1YLkX1OLbmUG7jJstMaKedE/7nnBZiTnpUihlYz
         KmJR3DpVj8Jj2gddsTfGY8VSM0/iSzRsa5a5smB2hlkfPLnWhFObTAmmj/aS/7wJR5Ty
         ZvrNwm3V8VPSQ4p0hkMdzpinH8pUogRBdH5eWbACOukb7DKNiykDz7cWy/QuUNrOjBbH
         dTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=616jwIAoA5bGuvYScrJCMq4D/vbuwVet8wc8Km9Ju/0=;
        fh=YQV1Wx/0inhStrqsNMolSivWjpRblem7qlKqSZTiK9Q=;
        b=P+OLwr2blPcqCWk4hcDm+9STDeK+FJunsr9YEm/Pfe+hZ1zKT2DVWzVGoP0Ank6raH
         XOmvl3ydmaES6xD8cYgIluqiBba1N9clb5U79t6Xf0iIHHV1+4Fm7BS09/0daYJAjuCD
         RpfUc3S+B8hV/jtGyl2SqbY9b46EzH6Ni67vaaKXPI1jPgBy5vayN6ntlZHnsAe6DLoy
         KiVAW9FVkFTNHQQlwGbfUEqnwVshvFESqI/DPOzEWd8TB1z7xzuOTqeZrwAGKwjD1lC2
         6d5y3mJls9VD0IiWU5tIxC9ms1I40OQ8O7XFnF+pnSjj6prYcJiH+KobDvIOkE5dm4Do
         ApNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530333; x=1781135133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=616jwIAoA5bGuvYScrJCMq4D/vbuwVet8wc8Km9Ju/0=;
        b=l2vdA5x7/Zg4ivsLRfstUVFPTBI0PJC3tkvLaLkVmENcfMBb9rIdsk+2NBryhsroGg
         Utl3BRr1FfoDJEQNe7wLX1IC57BeoxoLcCm0NSUUKWoUNN1GPB8eWxuVRjvJlKZNjH8N
         Cedsu6dUpeTUxM3tAQWSF7iWmirQPJeHjIDbwsdF+FD+rZWlynKZt9JbVXz7F1+40LvS
         JAvci6w3qr5X+aPycSRsA361LevDUprTeOkByr53TBPfLu2Jcs4qJEEovgXfQBTKWkKw
         tRpRcafk/g1PB3G6vyAzUQSYcX/Ura4NEa/aylhdaMlGJ6lHmv5Pr747cmH8LbmcRkpR
         OD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530333; x=1781135133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=616jwIAoA5bGuvYScrJCMq4D/vbuwVet8wc8Km9Ju/0=;
        b=ApWm040kGWYzoiulKQ9briYRk9SVFIlS0+PVNJ8ybicZP2Gg2t595lzcCUxRyKkgx+
         yL2fdtacbwUBw0IGiEb3sv19yUsSAUGlkKBz/bcnoa3LIXtgAY6mHagX1BN8mGR/cEkB
         ii/it/dtpQWULLpBWry19NaBwyTbjjgufCykCxLRuDtRlOhMA7fGYI+2IogtcrjwkN3Y
         hM9EM/Hg88O5kYTkmNscwwj0scn3dd/qkLsdXphcURYoEW1AvXRopgyK6HCknk8jhdFk
         VuhX3U5PMDs9EmdhoTT13SO90Eq5yhl+pUr3NTpe9yvKYYEwoiWS3maBfDbIaelIxwPa
         yhGA==
X-Forwarded-Encrypted: i=1; AFNElJ+ELzkFmQMrgE4LNfXeW8zV+jWflX8+wdVlgVrbn4ISxA/wr4Vhf0NIlABqevoeZp5P5oAzdZi6Wten2is=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMRkrV5GL315D9P7DNG1q+z6B3dUMRj+JrQcE1OYMnYgl3YJJ
	LLQLa6xei0fKZM+awc3SgbeTFCcw0LfdbJh3LQqsdeNFMBbwhDZvU3//Rga7lwJs84bmmN9qOJp
	BqzRfGGf2qN0w8lWUmKoPra+48Qr0zQyw1A==
X-Gm-Gg: Acq92OFH5dKqhzsjy/+VqkriOHpC2FEtbFUD2+jxBepWZcilGEh9HKJY/+H5bACoTxz
	iDE6mVgQVkJWvph1AI/+Z2F85jehrn+Oju2kDJQ748Sy8Y/LPUGrpsC3C9rVBfjp7ug9B/uSOVL
	lazSr3HTiRgkm802T/7qRG/VK9VWvSaqyQRImy/9asXpBg4pwCa8Ag0UFTZL3YcIvbMb8TzZDIo
	cVDpAvhmjfxFLMnWMr2TixNSRq//6UDJNx8EozDC2QrfL3qt+qcNI3n32XQs0YU+3yUbYnUax45
	89fDDbN2I38PoOJTww==
X-Received: by 2002:a17:90a:e7cc:b0:36a:95c:7613 with SMTP id
 98e67ed59e1d1-36e32667b13mr4974479a91.10.1780530332953; Wed, 03 Jun 2026
 16:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-1-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:45:20 -0700
X-Gm-Features: AVHnY4INjDXF7hSJRIa00bIaxKi8FRuuo6Sgu8XFMwxGFLNxme-XDEiK8fAeB-U
Message-ID: <CAEf4Bzb-MuvFqsBdNCYyU=X7O+OXGK33TKA3GRe=P0gVFR=S2g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 00/14] resolve_btfids: Implement BTF tags
 emission for kfuncs
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13550-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
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
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.dev:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C11AF63BE69

On Mon, Jun 1, 2026 at 3:18=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> BTF data for the kernel is generated through the following pipeline:
>   * DWARF is emitted by the compiler
>   * pahole reads in DWARF and produces BTF
>   * resolve_btfids makes kernel-specific btf2btf transformation and
>     patches .BTF_ids section
>
> This is orchestrated by link-vmlinux.sh, gen-btf.sh and Makefile.btf
> in ./scripts directory.
>
> Historically kernel-specific BTF features were implemented in pahole,
> and controlled by the feature flags. This requires kernel build
> process to be aware of pahole version used for the build to set
> correct runtime arguments for BTF encoding [1].
>
> This is a burden which can be alleviated by splitting kernel/module
> BTF generation in two stages:
>   1. Generic BTF generation from the kernel source code.
>   2. Kernel-specific BTF modifications to support various BPF features.
>
> So far both stages were fused in pahole's BTF encoding. By moving
> stage (2) in-tree, the dependency of kernel build on pahole can become
> much more loose.
>
> Recent work [2] made it possible to do btf2btf transformations in
> resolve_btfids, and it is already responsible for a few important BTF
> modifications for the kernel:
>   * .BTF.base generation for modules [3]
>   * BTF sorting [4]
>   * KF_IMPLICIT_ARGS support [5]
>
> This series continues the migration of kernel-specific BTF
> transformations from pahole to resolve_btfids, implementing emission
> of decl/type tags for the kfuncs and handling of the KF_ARENA_* flags.
>
> The implementation is idempotent with respect to BTF modifications: if

This sounds like an unnecessary complication. Can't we just control
pahole through flags to guarantee there will be no kernel-specific
information emitted?


> input BTF already contains target tags, corresponding resolve_btfids
> transformation is a noop. This allows for more flexibility in terms of
> dependency on pahole. In particular, older pahole (without
> decl_tag_kfuncs support, for example) can now be used in kbuild and
> the resulting vmlinux BTF will contain properly tagged kfuncs
> anyways. Conversely, if for whatever reason pahole emitted the same
> tags, they will be properly skipped.
>
> The series consists of the following patches:
>
>   * patches #1-#4 refactor and fixup resolve_btfids selftest, adding
>     kfunc checks
>     * patch #3 is a fascinating rabbit hole with a two-line test fix
>   * patch #5 refactors resolve_btfids introducing an address to
>     elf-symbol index for efficient lookups
>   * patch #6 changes how resolve_btfids discovers kfuncs: instead of
>     relying on decl_tags emitted by pahole, identify kfuncs directly
>     from BTF ID sets
>   * patch #7 implements "bpf_kfunc" decl_tag emission, with the next
>     patch testing it
>   * patch #9 adds "bpf_fastcall" handling, with the next patch testing it
>   * patch #11 implements KF_ARENA_* flags handling in resolve_btfids,
>     with the next patch testing that
>   * finally, patch #13 drops now unnecessary pahole runtime flags from
>     the kbuild, and patch #14 adds a bit of documentation
>
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/scripts/Makefile.btf?h=3Dv7.1-rc5
> [2] https://lore.kernel.org/bpf/20251219181321.1283664-1-ihor.solodrai@li=
nux.dev/
> [3] https://docs.kernel.org/bpf/btf.html#btf-base-section
> [4] https://lore.kernel.org/bpf/20260109130003.3313716-4-dolinux.peng@gma=
il.com/
> [5] https://lore.kernel.org/bpf/20260120222638.3976562-1-ihor.solodrai@li=
nux.dev/
>
> ---
>
> Ihor Solodrai (14):
>   tools/bpf: Sync btf_ids.h to tools
>   selftests/bpf: Modernize resolve_btfids test scaffolding
>   selftests/bpf: Fix resolve_btfids test reads of BTF ID sets in PIE
>     builds
>   selftests/bpf: Add kfunc set test to resolve_btfids
>   resolve_btfids: Index BTF ID symbols by address
>   resolve_btfids: Discover kfuncs from BTF ID sets
>   resolve_btfids: Emit bpf_kfunc BTF decl tag for discovered kfuncs
>   selftests/bpf: Verify bpf_kfunc decl tag emission in resolve_btfids
>   resolve_btfids: Emit a decl tag for kfuncs with KF_FASTCALL
>   selftests/bpf: Verify bpf_fastcall decl tags in resolve_btfids test
>   resolve_btfids: Process KF_ARENA_* flags in resolve_btfids
>   selftests/bpf: Verify arena type tags in resolve_btfids test
>   kbuild: Drop decl_tag_kfuncs and attributes from pahole flags
>   docs, resolve_btfids: Document kfunc BTF annotation emission
>
>  Documentation/bpf/kfuncs.rst                  |   8 +
>  scripts/Makefile.btf                          |   7 +-
>  tools/bpf/resolve_btfids/main.c               | 391 ++++++++++++++----
>  tools/include/linux/btf_ids.h                 |  78 +++-
>  .../selftests/bpf/prog_tests/resolve_btfids.c | 218 ++++++++--
>  tools/testing/selftests/bpf/progs/btf_data.c  |  20 +
>  6 files changed, 602 insertions(+), 120 deletions(-)
>
> --
> 2.54.0
>

