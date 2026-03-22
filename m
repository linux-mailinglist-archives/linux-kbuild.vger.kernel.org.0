Return-Path: <linux-kbuild+bounces-12134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEZTB25BwGlQFQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12134-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 20:22:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D1D2EA792
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 20:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D5813007CB4
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 19:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5F535F8B7;
	Sun, 22 Mar 2026 19:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFJL0HTl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ADE74C14;
	Sun, 22 Mar 2026 19:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774207337; cv=none; b=JopQOaCcKY3Vzks9hTcrgiHLADyIUY5c757TlZQnSZ0BY89rksCw6ndD5CyGDoCwdCNYNc0YNCNlJwDzB7IyRpHDmXmEIuuIK5r9PVaub8rOGjZ4bkkpYHrQJpH/gscG/sd4LbafO1LmUPeQzJNJYkzx49TzI2lCCoBQN5dbslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774207337; c=relaxed/simple;
	bh=KE0Ehn2v53KTMI2yWR0Gn7GG8ek8iWJ5qKwd+6T9w6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIOG6t/UO6mB+Qt0Lj2KH+RbJDbipNDWCco8o6SQqWWXPsA+M+Tziwl2LblTEOsGGa7FOY2Nf4sUZZNCBPlqFxUv2p+8uFwEC/KtRz3pgHOSN4ZEeXWvLzfJe8x4e8tSQRIczWppWfKE92E2TB5XQ17noPQMPWTcoxVYU4N2OiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFJL0HTl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192DCC19424;
	Sun, 22 Mar 2026 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774207336;
	bh=KE0Ehn2v53KTMI2yWR0Gn7GG8ek8iWJ5qKwd+6T9w6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jFJL0HTlpz2kyveKolahrRLNphDakm+Q0lH8RMUli8M7xc1fwB7R2zBva4trgzUpd
	 lk8r9iTZ7RK9+n11jpBQXj1Y4rhWoaJvX51FBQNmMEQ4I19oTrOeT5zbF/kKWhqeho
	 6b4Aq0d6LPYr0Yw97mZL2MZRfOYyM+WWsosZrbssdYmQvnxj51nQJGuT66y6OcCvRw
	 hNpkBjyo9j85cWcwnilz/5/JIyry8guW3hTlC48UGLFpxvnc67sza+0l5xyMRo4/u6
	 2FI0aKfs+8mqtv6TmnabtUH0CdEYOwNh97gqsacWIR5/7UbfPNWxkFDoq3gmq13g2s
	 WMG4aJ4fhX7tQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	David Gow <david@davidgow.net>,
	Russell King <linux@armlinux.org.uk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	aliceryhl@google.com
Cc: linux-um@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	a.hindborg@kernel.org,
	acourbot@nvidia.com,
	akpm@linux-foundation.org,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lossin@kernel.org,
	mark.rutland@arm.com,
	mmaurer@google.com,
	nicolas.schier@linux.dev,
	ojeda@kernel.org,
	peterz@infradead.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	urezki@gmail.com,
	will@kernel.org
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Date: Sun, 22 Mar 2026 20:21:59 +0100
Message-ID: <20260322192159.88138-1-ojeda@kernel.org>
In-Reply-To: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[lists.infradead.org,lists.linux.dev,vger.kernel.org,kernel.org,nvidia.com,linux-foundation.org,protonmail.com,gmail.com,garyguo.net,kvack.org,arm.com,google.com,linux.dev,infradead.org,umich.edu];
	TAGGED_FROM(0.00)[bounces-12134-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,davidgow.net,armlinux.org.uk,nod.at,cambridgegreys.com,sipsolutions.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 70D1D2EA792
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 03 Feb 2026 11:34:07 +0000 Alice Ryhl <aliceryhl@google.com> wrote:
>
> To get rid of these helper symbols, provide functionality to inline
> helpers into Rust using llvm-link. This option complements full LTO, by
> being much cheaper and avoiding incompatibility with BTF.

I have been testing this. I think we can go ahead with it, with a few
notes.

I will reply to a couple other bindings in separate emails to avoid
spamming people too much.

  - I will mark the Kconfig option as "(EXPERIMENTAL)", since that is
    what the commit message says and it allows us to be a bit
    conservative.


  - Clang passes `-Werror=unused-command-line-argument`, which means
    under arm (i.e. 32-bit) we get:

      clang: error: argument unused during compilation: '-U arm' [-Werror,-Wunused-command-line-argument]

    And under UML I see:

      clang: error: argument unused during compilation: '-I ./arch/um/include/shared' [-Werror,-Wunused-command-line-argument]
      clang: error: argument unused during compilation: '-I ./arch/x86/um/shared' [-Werror,-Wunused-command-line-argument]
      clang: error: argument unused during compilation: '-I ./arch/um/include/shared/skas' [-Werror,-Wunused-command-line-argument]

    So we would need e.g. `-Wno-unused-command-line-argument` there
    close to the `-Wno-override-module` one, unless Kbuild or
    ClangBuiltLinux thinks it is important to keep it for this case.

    On the other hand, regardless of whether we fix this (and another
    issue in a separate email found thanks to the UML build), we could
    instead add `depends on` listing explicitly the architectures where
    this is going to be actually tested. That way maintainers can decide
    whether they want to support it when they are ready. Thoughts?

    Cc'ing Nathan, Nicolas, Nick, Bill, Justin, David, UML, ARM.


  - If we use the `.bc` extension, we need to add a `.gitignore` for
    `.bc` files, and an exception for `kernel/time/timeconst.bc`.

    I guess we will not have too many `bc` scripts in the future for
    that to be a problem. On the other hand, we have the chance to use
    another extension (either for LLVM bitcode or for `bc` scripts).

    But please let me know on e.g. the Kbuild side if someone has
    concerns...


  - Do we want to have the `cmd_ld_single` step even if the new mode is
    not enabled? i.e. we are gating the other steps, so we could gate
    that one too easily, no?

        -       $(cmd_ld_single) \
        +       $(if $(link_helper),$(cmd_ld_single)) \

        -       $(cmd_ld_single) \
        +       $(if $(CONFIG_RUST_INLINE_HELPERS),$(cmd_ld_single)) \

    I mean, it only affects `CONFIG_LTO_CLANG` configs, which are on
    their own experimental as far as I can see, so it is probably fine
    as it is, but still, while making things unconditional on the caller
    is good, it is also a behaviour change for configs outside the thing
    introduced here, so I am asking.

    (We could use something like a `is-rust-object` to do it on the
    definition side, but I would leave that for later.)

Thanks!

Cheers,
Miguel

