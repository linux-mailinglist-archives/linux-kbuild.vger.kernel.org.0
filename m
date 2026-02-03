Return-Path: <linux-kbuild+bounces-10997-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEOYD9rjgWmDLQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10997-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 13:02:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A867D8B8C
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 13:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7AA3B30055FD
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 12:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B98274643;
	Tue,  3 Feb 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XUlIt+j5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4931AA96
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Feb 2026 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120149; cv=none; b=IU5O0moSKRBlSQKSGkyKhby8jd4DsweGADCmXwCN+UBTnQFakvCwaT1VdSc+sDFUz5Ai3nr10wHjfApupGki53qzRqv3pgBbMBXYKkoyO2ymwCuOTqt8Td23709L2Io9SV0F+VPC1D30rOWzECnNaqqSZ0x4Ril9Ie4frW24Yeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120149; c=relaxed/simple;
	bh=dpKUZIU7z1aYhC8w8Rm05OCOoTYlD9hUxat984VBQ+M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oiQEr+gcx0ND5UdQ8XEQzP70EU+wS6WxAgZjt5mVhIkHaCVcq4eUGJSmwO5Ls2Wc/q6sEvPKNHhLss7oPwN6c4KazdhUcB9vToNRkBcL4A6roJzMCKfSOUSDNhJffW7g4N1sFfeh1tHTLx41d41/OgFEmMDrDU1YWOxeABHEa0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XUlIt+j5; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47ee432070aso45365615e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Feb 2026 04:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770120146; x=1770724946; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcL6kf6GDnL4z3aaa3ZQiFzxve6GNyY/d0R1gVrt74Y=;
        b=XUlIt+j5wS57/fN2F8WzgEYOc5b+JnqhRZkjgyaHDKzi0TWoExV04khjb939Q8xq5w
         wZrJAP6WsEkEY8DgZnphgkkG7h0/UVka1kFpqxRN8+it+6j+XivD3uhJu43D4H0Z/jW5
         akffhaJsnIAiB3wT3kbrkGxtyaOyh82YGsA7cLAAFSkeib2BncTMWcLhBx79S7KOqgiq
         1JYcWA8HwMyEROgV7TCuzj7zlGSl3YO9Glymg5i4xf1nWlLaVua5zyZtkYRAcpNdAHES
         V9ugjADyUTBrIcEVx3PivyEf5u6/8TvkjRgrYotLcvMB2RxUYv75zf0C+LKQ+vAWF9dL
         861A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120146; x=1770724946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcL6kf6GDnL4z3aaa3ZQiFzxve6GNyY/d0R1gVrt74Y=;
        b=jzuq0HKPEwT3O1Z27VSogz/QRVd2yIjZABrhb/9SbS0HfzkE22mEneZOIWqqIqq555
         8pZZ6fbqwtnnsbNxYnPIvf2E9zB2v8nDO9S9v4/f3c19hyaqeh06VAbZHY/N17aK4rx8
         ++PHpWSAUGN60SX2gt5tNCMROMk70QvKHT3j9iuoD0tK/COUKkl2gUqigfpKfJvH5JAR
         qLcSFRJhE2PnByRM+l7yVhqusaBss9zyPaiaePaqfXl3rO/RWlqCM9mWrqhbzZc2s9Qp
         1Npaqlmne2NQlqUvGLRJFVYzWBbXe+OkuwgA9iT102Atme2nIc9bL91HZZk1V47ImIG0
         n0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXzPRLL+3JXsobgZjSX+Fj2tItpn9wR9F9f3fSQVVXsYmdVLyi6BGlzcCpetelzxs6F/XaJB3R4e/N4n9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZTn7HQzxgxznVmLGIvuiIULr6eABiCa02HYIppMiUd+lOHL0q
	EIma7KsnVpLH0ZERZBzEqd3qHWQHf0APvQFQcQ3H7uKf3gwvrWmhzuAy7KEX/fRrizakB67Js/Y
	EYqPTSrnWi2J/OpRKfA==
X-Received: from wmber11.prod.google.com ([2002:a05:600c:84cb:b0:47a:8fa6:6a57])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34ce:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-482db491e61mr218064275e9.17.1770120146251;
 Tue, 03 Feb 2026 04:02:26 -0800 (PST)
Date: Tue, 3 Feb 2026 12:02:24 +0000
In-Reply-To: <aYHgtJ_xLeo5W-lZ@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-1-beb8547a03c9@google.com> <aYHgtJ_xLeo5W-lZ@willie-the-truck>
Message-ID: <aYHj0EbrMWMornMj@google.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
From: Alice Ryhl <aliceryhl@google.com>
To: Will Deacon <will@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>, elver@google.com
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10997-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rust-lang.org:url,garyguo.net:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A867D8B8C
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:49:08AM +0000, Will Deacon wrote:
> On Tue, Feb 03, 2026 at 11:34:08AM +0000, Alice Ryhl wrote:
> > From: Gary Guo <gary@garyguo.net>
> > 
> > This config detects if Rust and Clang have matching LLVM major version.
> > All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
> > matching, otherwise it may generate errors, or worse, miscompile
> > silently due to change of IR semantics.
> > 
> > It's usually suggested to use the exact same LLVM version, but this can
> > be difficult to guarantee. Rust's suggestion [1] is also major-version
> > only, so I think this check is sufficient for the kernel.
> > 
> > Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
> > Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  init/Kconfig | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/init/Kconfig b/init/Kconfig
> > index e95d43457851862afc8313389777e4dd9348c178..0e900d3d8be7874a33e0f44754a8d038e68d7e65 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -82,6 +82,21 @@ config RUSTC_LLVM_VERSION
> >  	int
> >  	default $(rustc-llvm-version)
> >  
> > +config RUSTC_LLVM_MAJOR_VERSION
> > +	int
> > +	default $(shell,expr $(rustc-llvm-version) / 10000)
> > +
> > +config RUSTC_CLANG_LLVM_COMPATIBLE
> > +	bool
> > +	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION = $(shell,expr $(cc-version) / 10000)
> > +	help
> > +	  This indicates whether Rust and Clang use LLVM of the same major
> > +	  version.
> > +
> > +	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
> > +	  LTO) requires the same LLVM major version to work properly. For best
> > +	  compatibility it is recommended that the exact same LLVM is used.
> 
> Is cross-language LTO something we're actually looking at doing for the
> kernel, or is this just stale help text given what you're using it for
> in this series?

I would like to see CONFIG_LTO actually perform cross-language inlining,
but it'd require doing something about both:

1. The issues mentioned in patch 2 of this series.
2. The issues mentioned in commit 5daa0c35a1f0 ("rust: Disallow BTF
   generation with Rust + LTO").

As for whether it's stale help text ... CONFIG_RUST_INLINE_HELPERS works
by performing cross-language LTO too. But I can see your point that it
would make sense to improve this wording given that we're not making
CONFIG_LTO work now.

Alice

