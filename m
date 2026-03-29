Return-Path: <linux-kbuild+bounces-12335-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNKtOU9jyWlXxwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12335-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 19:37:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 507463535F1
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 19:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19ABE302003D
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 17:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CAE1FCFEF;
	Sun, 29 Mar 2026 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8gkz0ui"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A0379ED6
	for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774805639; cv=pass; b=M6hpHAuQ5mXYRsep/oW2VHfmcmVdVIUSaj3BxYK+5wKWsuTtVKD6fz5Y50bD/Aj3g+2518/Y1UOgAuN94inj7U0YZ9vrtjUHzqGh2ehq6ma5useCNnXkCSuF5UVrtn8Blv74xSB2X4pZn/CXQN0JKmha/p3mkj5c3ypbxCVwrjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774805639; c=relaxed/simple;
	bh=wH8d3KmUa0Vc2ojlkNpKwIlP5oooedUQAm8z4psgdIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvSXN8goMd2nyhidWwYKN8DXjonlDt6oexYOElsxvZqQhfBrHe/qsKHnosYNUYjPvhD8ki/dijyajWv1X4CN+JcJBCLRJHULJzhzigwgpKlhPM0aYJVQhUQIALWWDpuIu/MdCdKJY/lLhjfyQzdRodQfFE/gbhPW128+YpuCEYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8gkz0ui; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c3d815778eso43405eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 10:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774805638; cv=none;
        d=google.com; s=arc-20240605;
        b=EO6SN+LzAcU0CtXT7ZYZX/b/RKnQ//2xecpjziuIQ/yCe/ZTwEMTHjbRKvz0xCuXOv
         xV3HbRz6bUsGe/8tiACxrG/vihGDeVYyvwdHEhUlFS8cxrGeu1RmwyqyvQDyUSzQzD1r
         uXRpwbLaV8XtRsC/KVxTjJkMiq0o6CS4v+TEEiyT+z43hptCjn4r3vWWHAJhviuxi1lC
         ACPauMKRXyIwGJkv76+ZvFZfkUbZckGY+E+p5fsiiJ7giV+ElvMBFrznkOlzgGZ/MVeA
         ycQ1dbRhZfeR4tXphm26Gu7Jmwsb6IzLj4Zp+NMsfA6HEUUKs/tNd88FbAan9kV4/bqp
         n2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QkCmTI7yYjAJjvmfpeVl++cohGyuqaJEN8ofoKb3dzU=;
        fh=Fyjdt8APXm4upffOk+HaRBe+m+9xxluHdloopYYKiFk=;
        b=Z7MLWMOnIMGRj4+Gb6A4/xxNaVwz6Ywh/ws8A3DU9ksoyrKMyAnXz0SO6/o8d1mehM
         RMwvUH2asTLVQx+JstKdUNLoqku/ShEyiQDMKooPE1qL2RQIbbIV/wzsIE8quH36z7rV
         LxVsXdDhz87UVYpLswgKj5bLXjIETUB313bmPzIOXLndtqd+Dq47bFsT197qoudlKfXq
         Zts0sFO4KuIfx94idds3J9HiFxlX0E6cx0UU20oBvbwvRlYXr3EOImWgTXUUgnW/EXpJ
         afpb6ZY2i5vQy2jfwAUC161DdBeMHD0qiBA4mz10tFq3B228kJscOSaMzYuOGC0lhmf0
         qP3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774805638; x=1775410438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkCmTI7yYjAJjvmfpeVl++cohGyuqaJEN8ofoKb3dzU=;
        b=R8gkz0uifeOQrZ3VtI0b5MrFddR5tpPbEMV0EA8EqSxlycYShixhwCC2HPhWtkugWv
         vJtnVqtMXUO6TCz2Ug/wo2yOgtAtSYlwluZ4/LCDdiDyacdIAQaFmczL/ASPAqDLPvc2
         GZLu3sP9CK+5GAdwPNtTOcO7MgP/bxYbns/85j+vAICvXJfP3D68T1LjsWPyhLpXNjo8
         bx9sLBZJGFHgX37rycwXVRoPZv65fWY/bTjh01VGg6ooOaTLLXABI44BH4dbLkcXPTjB
         fPtVmCuSI3uBLJkC2UewNGj/XBO3q3/YN4NF0KKhxZI8b/w8Lu3mD+8vF6tA/TQ9pUvn
         oSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774805638; x=1775410438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkCmTI7yYjAJjvmfpeVl++cohGyuqaJEN8ofoKb3dzU=;
        b=czKtHbCeFUhoE7axfCN8w2dZE7xinIqjTlbL5n8pcbkN79qTIPmLq88pst10ylxJZ3
         VDSbuktw4ui3UDEVj+O2Rb+5S1f7MIS5Yjcqf5h9NUyxc6ZDdM7K/U0MfOU38+HQoP/M
         iCnd1+GuixilJaFTgj+T0Sm6CFoFRQjf5wsCwNsX16KhwInAl6R17QQcwdFHOyqeK2+7
         h0Y86LGGe1eaYprYmHLtbut1C+pczIwY3QeT+GtgMO4StDwOG9aPowASRV5kir8C+vni
         KrBtqZrwniEBX/rjrMYoaNwrewUEj44me9IIs2fIPdz1OIER08tfHdfnCqWm0fe/upZh
         JeFw==
X-Forwarded-Encrypted: i=1; AJvYcCXb9dzVS/4JrMLGfNtmRbiJr9KYj19Hgqa2sW5mdlCUw4r1Euoqs8tjOD2cM8QZXWEUHo4jcRuOShbe5Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxduqXYKwXExBQYmvoR6j+pLZlJZUdQWwHDzAQWrdaWkIIPK8mQ
	HO3ovUCgLaR8RgBk0ZqP67uU3Q2efTxXchogFcpNNiGBqYF8ScwXdlyB0SiKUIcd2IFk+xVjfnu
	rP08CfEI6EQJKMq0155vCE9GnvWyMywM=
X-Gm-Gg: ATEYQzzr4jJmwSnQUAh3yDQtve8silqdat2W7KTQnePVSQo3ATr3xBVNayjeNkuyLuJ
	ccWTUF7IaIlG/rxc0Wz53rqd4cwO9qaTrFp+g6kQ3TBxPCawOaFvn8OXdcNeYnRw7LG7pctDlIe
	c254nVNRzfLltWfS3P/UxWYEYnOT4ci8P/Kb/qnaWyGxcxDIDIahN/YI7wSfG/r+XmRH1Y88VQs
	XEYWJqZvdDRdlRiKV33VWF0E+9xIftLQ9CQBqZS5zvx5ofKms1rxR9Nga/zvyntuWYnkM42jGXe
	cuJCKzjLFL0ojS6D/1u48IkBA2XOgqXXwO+PZB2vxzX96lY1i/bGOvUgGZDbI5ID82sc5YjB5jd
	eATAu2Atdj1QG3JHsxJlEl3s=
X-Received: by 2002:a05:7301:129b:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-2c185f3463bmr2051760eec.8.1774805637680; Sun, 29 Mar 2026
 10:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
In-Reply-To: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Mar 2026 19:33:45 +0200
X-Gm-Features: AQROBzAbWz3xOUBnSqR2d9NqgOZyOCJXfUW2zEO1m7L8IHXJSZ_QeR_z2lJXCRY
Message-ID: <CANiq72=ns52NksGEj-5kBCkD0RxH12wKawr2pH_QvHshSsz6Kw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12335-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 507463535F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Feb 3, 2026 at 12:34=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Currently the only way for Rust code to call a static inline function is
> to go through a helper in rust/helpers/. This introduces performance
> costs due to additional function calls and also clutters backtraces and
> flame graphs with helper symbols.
>
> To get rid of these helper symbols, provide functionality to inline
> helpers into Rust using llvm-link. This option complements full LTO, by
> being much cheaper and avoiding incompatibility with BTF.

Applied to `rust-next` -- thanks everyone!

    [ Fixed typo. - Miguel ]

    [ Andreas writes:

        For the rnull driver, enabling helper inlining with this patch
        gives an average speedup of 2% over the set of 120 workloads that
        we publish on [2].

        Link: https://rust-for-linux.com/null-block-driver [2]

      This series also uncovered a pre-existing UB instance thanks to an
      `objtool` warning which I noticed while testing the series (details
      in the mailing list).

          - Miguel ]

    [ Some changes, apart from the rebase:

      - Added "(EXPERIMENTAL)" to Kconfig as the commit mentions.

      - Added `depends on ARM64 || X86_64` and `!UML` for now, since this i=
s
        experimental, other architectures may require other changes (e.g.
        the issues I mentioned in the mailing list for ARM and UML) and the=
y
        are not really tested so far. So let arch maintainers pick this up
        if they think it is worth it.

      - Gated the `cmd_ld_single` step also into the new mode, which also
        means that any possible future `objcopy` step is done after the
        translation, as expected.

      - Added `.gitignore` for `.bc` with exception for existing script.

      - Added `part-of-*` for helpers bitcode files as discussed, and
        dropped `$(if $(filter %_module.bc,$@),-DMODULE)` since `-DMODULE`
        is already there (would be duplicated otherwise).

      - Moved `LLVM_LINK` to keep binutils list alphabetized.

      - Fixed typo in title.

      - Dropped second `cmd_ld_single` commit message paragraph.

          - Miguel ]

...to boldly go where no Rust build has gone before.

Cheers,
Miguel

