Return-Path: <linux-kbuild+bounces-9824-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3319CC821DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 19:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC41C349E7C
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 18:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA07319617;
	Mon, 24 Nov 2025 18:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1fSJT7H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A652BEC57;
	Mon, 24 Nov 2025 18:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764009404; cv=none; b=RWaFZDVtCKZEZDXFKFyV5qmXZjm85pgt9S3AF9N6A2GaRx2+pn/SeKu5WDCUQF0pPXOlRDHP68/bC0EmOO3DzGJBw5t0jSlYZ3RCJRvAHDtLudThYYojxtiET40Gd7VjprJDnqD6UfvJIEQ6KOsT1ad8WJOQLJ6uosSDVOmMCfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764009404; c=relaxed/simple;
	bh=jMxics1T7D2zTTTxC0vYNoJLPcTUUbdGJ0mccHHyjHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ue3BNbmShXrEJYOpM8so6cepCwNWTe4pAgYSPhsE22DLwqMfVW2GNry3NK98EsQu5A1lS9vTxrdCeoYmdexoqNI1mBqnpWWB3VW+HcFH+cywSLNMFjj7oLlpEVrsc2zZLFQDAWf3S4GfXWbstERmLDH5P7IBKFPBCFxz57aVT0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1fSJT7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A174C4CEF1;
	Mon, 24 Nov 2025 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764009403;
	bh=jMxics1T7D2zTTTxC0vYNoJLPcTUUbdGJ0mccHHyjHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1fSJT7HmKhn2wr95Fzte+w0fDStdZ19Koc4ocZ9w9Lv1ZKt3nVWLGlA26AZcYIBd
	 XKfwmqWPffprf14DmbfY6Hm5j/1/ejPGlDlwNuFIRw1N0GPXXidPvbRI1kZRjDkUst
	 lxlN7EigtVgqc+fIfhuxCNIlYXK4ef8i04srNtF1wifrLNEVNM+NR7SpOAcbdGrg7v
	 hihOY/jKZ7DoINdso0BUTLv4L5A9BvRRkePHheh15RSGNoF7D2cJfXEluSf/P5lGfT
	 f4QtlDZ7HjBA/60fv0OV4KvirM84SvnkcqHiqUqHjnG8bEuDjFwXa/TWHaZHPowV6h
	 Vynb3itZkcYog==
Date: Mon, 24 Nov 2025 11:36:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Asuna Yang <spriteovo@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Han Gao <rabenda.cn@gmail.com>,
	Jason Montleon <jmontleo@redhat.com>,
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
Message-ID: <20251124183634.GA1084995@ax162>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
 <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
 <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
 <CANiq72nDpBodFh5Zqy2p9jwWyfAiY6KcEEyugHeMDEmOR6Rogw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nDpBodFh5Zqy2p9jwWyfAiY6KcEEyugHeMDEmOR6Rogw@mail.gmail.com>

On Mon, Nov 24, 2025 at 04:08:36AM +0100, Miguel Ojeda wrote:
> On Mon, Nov 24, 2025 at 3:42 AM Asuna Yang <spriteovo@gmail.com> wrote:
> >
> > I will separate them into two functions in the next revision,
> > `bindgen-option` and `bindgen-backend-option` (or `bindgen-cc-option`?
> > Which one do you prefer?).
> 
> If we don't need `bindgen-option` (the normal one I mean) so far,
> perhaps we should skip it. On the other hand, `rustc-option-yn` is
> there and is not used either (it was added for consistency). Up to the
> Kbuild team, I guess.

I do not have a strong preference one way or the other. These macros
tend to be low maintenance and do not take up much space regardless so
preemptively adding it so that it is ready for use in the future is no
big deal in my opinion.

> As for the name, no strong preference. `bindgen-backend-option` sounds
> good, but `bindgen-cc-option` is more consistent with `cc-option` and
> probably easier to understand for people new to `bindgen`, and anyway
> the flags we pass there wouldn't make sense if the backend is not a C
> compiler.

Yeah, I think either one sort of requires knowledge of bindgen to know
the difference between a flag to bindgen and a flag to the C compiler
behind bindgen so no strong preference from my side (Nicolas may feel
differently).

Cheers,
Nathan

