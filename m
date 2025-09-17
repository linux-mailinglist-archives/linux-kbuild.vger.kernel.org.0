Return-Path: <linux-kbuild+bounces-8841-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DEFB7CEAB
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 14:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 12DC04E16FC
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 12:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB69832BBFD;
	Wed, 17 Sep 2025 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anfGVJbO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DD032BBED;
	Wed, 17 Sep 2025 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758111236; cv=none; b=ophFblMDLLihnBIK7UOr+pGy2N0+9n/evaBaYL+vw7oJtmgfm/lCQGXswCirMESXhIGZglISDWY6c/UpmsWuDj/O8AMu96BXrLS+s0Wht8a6sp4TdMklQS2NghsS3ZHCSRnGDMZf3ugMZo9ROBVW0V30XZoiw6zey0pZDPYdSn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758111236; c=relaxed/simple;
	bh=LqRWtS1sP7B5lAKG4NiZ4OwXKCQ+4DM+sFwKGhKBCRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZp+q2YGVVX4UpzeVtv5gwikpNJzKua/GyMp3BCEygrCU4INN4FmoI732MdhYo0Q1yhpUfzo1+OqlvJSwGqTLbbxxPS9/AUdCsuWniDS5L8bNqL+YQvoDA7qThPPiJYskE0rStKoVK0nIOhYC57lKgrfIhx/xT5bwlR5VuFtrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anfGVJbO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81EBC4CEF0;
	Wed, 17 Sep 2025 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758111236;
	bh=LqRWtS1sP7B5lAKG4NiZ4OwXKCQ+4DM+sFwKGhKBCRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anfGVJbOjccq4Um5w31gTeSe2q+k1mtc9hK52Rk/DnnU3iR7mJKWHevRLTD9q2bA+
	 y3AkCLwlN+iVJf06RPZKbyAM/90+HsIZX+qa3+P9+39WWaOV+ctXR6vPRwZG1rxWRQ
	 cE/gB6y1bFQzGBB1YGgGLOsdztotDEGSjTxMqDGhoE7JaG+e0/H1IaOBWpQds7O29n
	 AKQ/ifGr1FIdGpMfo3t99pj98NdLTK1mflMPcL1BVWzd9v/KK8W0M3pc1TS6JePV3l
	 lbScKLDL3b0kEYwlVx6tx5nxRDHvS3zNt/MFPLv3Q+s3JXCO0CNAdTri9RGuibpLwB
	 N5QXp0J4te1Pg==
Date: Wed, 17 Sep 2025 14:13:38 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Asuna Yang <spriteovo@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Han Gao <rabenda.cn@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
Message-ID: <aMql8oB4GuU87lie@levanger>
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <20250910-harmless-bamboo-ebc94758fdad@spud>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-harmless-bamboo-ebc94758fdad@spud>

On Wed, Sep 10, 2025 at 03:27:19PM +0100, Conor Dooley wrote:
> On Tue, Sep 09, 2025 at 06:53:11PM +0200, Asuna Yang wrote:
> > Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> > + Rust builds for RISC-V due to differences in extension handling
> > compared to LLVM.
> > 
> > Add a Kconfig symbol to indicate the version of libclang used by Rust
> > bindgen and add conditions for the availability of libclang to the
> > RISC-V extension Kconfig symbols that depend on the cc-option function.
> > 
> > For Zicsr/Zifencei special handling, since LLVM/Clang always enables
> > these two extensions, either don't pass them to -march, or pass them
> > explicitly and Rust bindgen libclang must recognize them.
> > 
> > Clang does not support -mno-riscv-attribute flag, filter it out to
> > resolve error: unknown argument: '-mno-riscv-attribute'.
> > 
> > Define BINDGEN_TARGET_riscv to pass the target triplet to Rust bindgen
> > libclang for RISC-V to resolve error: unsupported argument 'medany' to
> > option '-mcmodel=' for target 'unknown'. Improve to output a clearer
> > error message if the target triplet is undefined for Rust bindgen
> > libclang.
> > 
> > Update the documentation, GCC + Rust builds are now supported.
> > 
> > ---
> 
> FWIW, this --- breaks git, and anything after this line (including your
> signoff) is lost when the patch is applied.

FTR, there is good documentation about '---' in patch mails:
https://docs.kernel.org/process/submitting-patches.html#commentary

Kind regards,
Nicolas

