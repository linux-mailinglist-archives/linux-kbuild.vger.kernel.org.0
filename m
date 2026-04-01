Return-Path: <linux-kbuild+bounces-12506-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKghHYIXzWmMZwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12506-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:02:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D737AE2E
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 395B0327580B
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 12:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7772B4035CA;
	Wed,  1 Apr 2026 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6SsTE3W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35C402B81
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775046303; cv=none; b=eXAN9S8Enijbq0IND9857b+kLCA/oNK2qLXObhRHLrUSdJ+8mv1DG66T1GXxWNzhy1zvyqz2L3f8El6tFGsQp87QTzBPVCg79iywyMahU1l87xZN/bHrjdgXuBuz6JVVCpVobcfoUw1/Jv5MhamSs2x8wS1gvLoEdnYrlxoHrFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775046303; c=relaxed/simple;
	bh=yZLwdPudHgAh/FG2OADadb/MS8JqcR/BjsVN9oFtlNA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rdQXZt+D//2uklFClu5gpy9Oe+M4dq/MS/0fFeMDMdxNsguZIMJk3Ip/ejV6ByGwxmkoGl3KtQtnfIkie1lFT2aT2Wr+7kk8ohsqsbZmk5UTmEmpRRpfqHwkOOQPO4YiNDXDPTFN2/3j3VOmZibIsrBdMtmaiKlo2JpintDVwHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6SsTE3W; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b97a3f9ebfaso538047566b.2
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Apr 2026 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775046298; x=1775651098; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=;
        b=t6SsTE3WFu/gCt0PjF1971y/5E2KV+O5Z5ki8//jv3wpGuFpiOl/lveW1ob11D4Xp5
         gUaL062812D/2InxzBdhgIY9Is9sKz5DUo08SZVKfRT1AB181cq3ISUH2PverhdM0cXo
         eJxtGFZEvPzlWWRxr9ZOfcPEcmzYNNhOFdZc6g/AU917x0QaD55f3aBf8pDx2XrHvYFj
         NsaZuhl13q6nOYsHXDbWJdfHH6PRRXwCsQ35RXNb/gpkhAKdfr74+zdwXjHlaT/Hibk3
         OT913PTd/JlAlHZ1bjqlNcaTJO/4V1AziHV6PRGPFLB8JJf7GKpTb/QqQUPhiTNONx9Z
         Fblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046298; x=1775651098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=;
        b=HJk06GYpAs+paxPDLFmoXHp3YqLFIQpOfz/Vo0tjckCISyiRd4IkemHC112R/J6rGF
         SRr/7rAza25lPSDyaxoLU3ZxRkiVecTOv8WYnlGQ9YNhjgjJy++qonQ+eHMTd/sTfpQJ
         5tIiPYGyiPldmOtn9bktiWbWHj95pcIcBQzerE6eg+Pkmo4lZsI3v+GRzOIJXJ/6V3yj
         LJ421M6l9Blushh7hzurWptr5u+5ppK6N9xyKi1JpyvOjOuKIil36bIGgP9wVihP/d+3
         qxtxfOrbbqE+dU0Aoi7BzjzJWP78NMhNJTkbOu/D3LSwe8izYzoUGlnNwE34VCLVMwea
         PWaw==
X-Forwarded-Encrypted: i=1; AJvYcCW2EWRJZwzSRwRW91DAUnwA6cJoiJBxRoELlPv8/1cqw66UEdcCJFxaxeKnQ3KsmKGLjIoQKvARlqvy9Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZFRfLfA4GN4kzgLRqQyI96wk1MdGIy239LDBe4T7K3RDuAQJ
	4MBQCX4gdNOCY8wtFzcr3VheNa8yBD2ClkKDY7AvMi+VsaZ9aX8QdgvVpAfSH15OuHNwn0nlRfH
	5jXl4maMw+NZrabfFSA==
X-Received: from ejcbp3.prod.google.com ([2002:a17:907:26c3:b0:b9b:54ac:688a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c448:b0:b99:5f69:9ee2 with SMTP id a640c23a62f3a-b9c13cf93e8mr221111666b.52.1775046297024;
 Wed, 01 Apr 2026 05:24:57 -0700 (PDT)
Date: Wed, 1 Apr 2026 12:24:55 +0000
In-Reply-To: <20260401114540.30108-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
Message-ID: <ac0Ol1PaRTWNK6O9@google.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12506-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:url,ubuntu.com:url,launchpad.net:url]
X-Rspamd-Queue-Id: 949D737AE2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:45:08PM +0200, Miguel Ojeda wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
> 
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).

Debian really *should* pick up 1.85.1. It contains bugfixes serious
enough that the Rust team decided it was reasonble to release a point
release.

> Debian Trixie's release happened on 2025-08-09 [4], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
> 
> Thus bump the minimum to the new version.
> 
> Then, in later commits, clean up most of the workarounds and other bits
> that this upgrade of the minimum allows us.
> 
> pin-init was left as-is since the patches come from upstream. And the
> vendored crates are unmodified, since we do not want to change those.
> 
> Note that the minimum LLVM major version for Rust 1.85.0 is LLVM 18 (the
> Rust upstream binaries use LLVM 19.1.7), thus e.g. `RUSTC_LLVM_VERSION`
> tests can also be updated, but there are no suitable ones to simplify.
> 
> Ubuntu 25.10 also has a recent enough Rust toolchain [5], and they also
> provide versioned packages with a Rust 1.85.1 toolchain even back to
> Ubuntu 22.04 LTS [6].
> 
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://www.debian.org/releases/trixie/ [4]
> Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=rustc [5]
> Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [6]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>


