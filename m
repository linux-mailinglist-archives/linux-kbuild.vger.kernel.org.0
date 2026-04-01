Return-Path: <linux-kbuild+bounces-12559-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEXuMZmjzWmvfgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12559-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:00:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D893813CD
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DAA9D303F3EC
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 23:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308CE40B6DE;
	Wed,  1 Apr 2026 22:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGRYhbV4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D73F075C;
	Wed,  1 Apr 2026 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775084383; cv=none; b=kVV57TSX4XOfKHzUipXaFzKGWdgcSKeBkckYc7wxyarY9+khBfrPJTdKfxpOBP9CE4/cFgBpaKpQQyFnRrpwsXN5mqy4+KIjTDNtph6MnCacOvmZDWA4S9pfmS1o933rsf6ao76I9/xHkdsY4p9GMJO+wsKagh9qZTVl/dZDyhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775084383; c=relaxed/simple;
	bh=0MM8/3CTNZDnO2QJpUmaXqxHB1Rvcg/ziIyw641Wqc0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=iwOcx8uwMIfoJu1fyZSB/GgHIGNe0TqQpqS48gBQN3AiTZaRA5okXskLQa+0fMFwhFzQasVqEUkzYtt93/OaYlcxlLy0aBYLshF/HEeqANvT2haIEVL0J0Aj8csZ/Frz9IQaI5nfeCgJsGIASTf0mBB0kmbTQdd8Fe/rm2wSFkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGRYhbV4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA88C4CEF7;
	Wed,  1 Apr 2026 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084383;
	bh=0MM8/3CTNZDnO2QJpUmaXqxHB1Rvcg/ziIyw641Wqc0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=EGRYhbV4HQSbzNtKzfTww5lA+Uerrsg7IL+49jk5/fWwiQGmws0MFMhs8KmPYz0bF
	 3hpRw9q7h5+2vsLnlgC8jieG/3JmIARlD8LqGGxCtDEsOdOBbWTv/En/Z/2cYLAJ/g
	 KFjsHZnFL9/lOaqiBVjiOUmt3S211fe3JvmErJhlpKeBwep4sg/58vKaN+T1X2ZJIj
	 IXfJxWhpfJRuYHAo5iZpPOMvh3OuelV4yFlkJ3iT397bKazKJdSXENYbbXIHAdGnHU
	 ada09pio/4900X3hmHEj0e1yW+yEOAoruxQR92rFOFjCm6P7F+vzIHw2KdG6BFCIQS
	 SUk7ZWvKLfHKg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 05/33] rust: remove `RUSTC_HAS_COERCE_POINTEE` and
 simplify code
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
In-Reply-To: <20260401114540.30108-6-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-6-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434436.73816.122481804122122631.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=534; i=tamird@kernel.org;
 h=from:subject:message-id; bh=0MM8/3CTNZDnO2QJpUmaXqxHB1Rvcg/ziIyw641Wqc0=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzsVnH0zxWC9R/ANvpJUecsms4XCUiWnE8NnXbaJM
 e9U1snrmMjCIMbFYCmmyJIoemhveurtPbKZ747DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNX+LAx/uJbsjFg3f+LhiIYgi5c3D9v0XNCTe7U7u0BV8Zd9a8apLwz/K5gL3IJ
 uV04KNozfPuWL62X+Tw3F2+5yhDU41dklfM9lAAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12559-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 71D893813CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026 13:45:12 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> With the Rust version bump in place, the `RUSTC_HAS_COERCE_POINTEE`
> Kconfig (automatic) option is always true.
> 
> Thus remove the option and simplify the code.
> 
> In particular, this includes removing our use of the predecessor unstable
> features we used with Rust < 1.84.0 (`coerce_unsized`, `dispatch_from_dyn`
> and `unsize`).
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

