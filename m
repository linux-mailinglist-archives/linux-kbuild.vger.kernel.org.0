Return-Path: <linux-kbuild+bounces-12583-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNQnJMGnzWmvfgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12583-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:18:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CFD38198E
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4069831A9237
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 23:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEFF48164F;
	Wed,  1 Apr 2026 23:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qd+wRJd3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223FE48125D;
	Wed,  1 Apr 2026 23:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775084508; cv=none; b=ZPc3ZICf+PRMeod4qOAR1AdBWCVYSzMrmqXdzScdXH0jcb/d6Uvr4/gPrwyZWHIjKXbqPluG+U5+ohyaSxssISescn7bm0nA1RoxCU/hMaLeME58XsNDgcVOPYNbyQ1Ohr77UH6ybzKMxN8u1BnVBwGva6PLepLMgR/Y6DdWbjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775084508; c=relaxed/simple;
	bh=EHz4n5YTSN6LWX8eGfRMr5/Bcb1koBvR3pe++ElzTzY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=RR3Si16QLa7LJIoCDkdBaN2Ps7Ty/La/2++5ijXbVkz6fZ8XZxzm4Iu8qdEvZge2pjbc88kHf1MvMlEdjeBa9k6CJ2RWrAuGTlKPHvrTIipeTSg2yF5hmBOBymK0MaQyaX9N93nqugsv6xjRFY7WXTnN9jvL0034TI0Qzi5/0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qd+wRJd3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846E1C116C6;
	Wed,  1 Apr 2026 23:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084507;
	bh=EHz4n5YTSN6LWX8eGfRMr5/Bcb1koBvR3pe++ElzTzY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Qd+wRJd3wir6TeK3EAz5gzl2NHC2qbwNimuevll/SRy4V4IoVSdIPJ/4HIkcpVXiG
	 GtFfzJ0Uj6ddY9J5/w6tj9QSfgXupx/UhHog42BcNvzDhUgr5spzGF1QfWVaUZH+fb
	 iF5k9s/ftekDdHeJsmoNNIvFYVjAEC4x1SXaEzy3EaO/cC9QWPOuxMq1vA1eNHEtRS
	 +Y+i6OT6GC5jocuqRICw6v3JGQnV5THSARnBCOWMrYgtgZCxzfaKzcO9IWLOzr+reU
	 u60yz8JAUjGkHwq1N23g+F4zbOlB149p/HY9HjKqGTpPtUqsCuPwugHxQp0kDHY9I6
	 FGWcAxJITh2Ug==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 29/33] docs: rust: general-information: simplify
 Kconfig example
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
In-Reply-To: <20260401114540.30108-30-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-30-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434471.73816.15753382261308172951.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=412; i=tamird@kernel.org;
 h=from:subject:message-id; bh=EHz4n5YTSN6LWX8eGfRMr5/Bcb1koBvR3pe++ElzTzY=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7ver/2//ckbsVnLfatPrvglsc9eXG7+eRe/fdsr7
 t1q97Gf3DGRhUGMi8FSTJElUfTQ3vTU23tkM98dh5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCqOfUYGRYmxl4TfflIb2K2ycHjlVO+/Z6+c57fBwNzU4O9vCKKM+8y/LPI/Sc
 h4bDDddL1t1ukjFU25JvonNtgcyE3XqZH4qBrCBMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12583-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 66CFD38198E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026 13:45:36 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> There is no need to use `def_bool y if <expr>` -- one can simply write
> `def_bool <expr>`.
> 
> In fact, the simpler form is how we actually use them in practice in
> `init/Kconfig`.
> 
> Thus simplify the example.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

