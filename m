Return-Path: <linux-kbuild+bounces-10423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D34D7CF5EF0
	for <lists+linux-kbuild@lfdr.de>; Tue, 06 Jan 2026 00:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2CCC3082B1C
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jan 2026 23:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20C22D6624;
	Mon,  5 Jan 2026 23:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDEuDAkw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951CC3A1E6D;
	Mon,  5 Jan 2026 23:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767654208; cv=none; b=qF11ITASeM8BfdLCbZ7wgnlLckk5dlY9aVMTOqpVs1iYaUUHlGgzcoMNibw66OO1px0dhsFvP604Bjz06H+QcUDHvq1jcly338MoZ/Gqekfxcyh1aShGkIKXnDfMA3bN+CGStiBcRjP91q9A8Hb5QU+3QvFJmPZUuUXjVnyhhpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767654208; c=relaxed/simple;
	bh=xMpoAjOMiDQD0DfTNUYeG05v1tNz9/4y1VvJcgXMxf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDnAD9Y4YjkN5wE3QZT+VX7G5pxl60/TjdSctnuz4yXoft1ToHYJ4ScXRSMpTHbgrEc6rprJTo2nDWZaMPqHOZNjyG2IVa+wIsSWQ4a2lMtiQjCjgQwMvqf3uy1oXx4JmMmB8wJfGfjq1X9R3o+EKuKLg08YCuLKXSBuDxYUQeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDEuDAkw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA0BC116D0;
	Mon,  5 Jan 2026 23:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767654208;
	bh=xMpoAjOMiDQD0DfTNUYeG05v1tNz9/4y1VvJcgXMxf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDEuDAkwdNtHJo0bsAkb1kq//l7nlma7NpMmPFsPAvSuQr2+ULCqLQKhf6dBKpzHy
	 qt3BAnz9ZUNuGkz4c5FlVYPxJKMT7bsZEHfy6gaB1DH1Nuv6fTkBM2/g0J/qvYwGUR
	 jqhNR/zr9MUmPMuHZmYOtCCF5uZtYoULCRIDWl0o9z99KakGyyWrZOreeVFFcenCfR
	 tYFmtTNdgqVNT4M5NpvXf1JYItFIgCfOUtCdW4w6Sq5BpDLN08SGNUOyHlzPAOLxK0
	 ikRMDFWE0OrutVVaRtblgciEUEg7c/M48AVNclFVP7TYnBEJoMds1IKvYetKwWxayC
	 Yab4rcXbjF7fQ==
Date: Mon, 5 Jan 2026 16:03:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Siddhesh Poyarekar <siddhesh@gotplt.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	stable@vger.kernel.org,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [PATCH v2] rust: Add -fdiagnostics-show-context to
 bindgen_skip_c_flags
Message-ID: <20260105230322.GA1276749@ax162>
References: <20251217150010.665153-1-siddhesh@gotplt.org>
 <20251217224050.1186896-1-siddhesh@gotplt.org>
 <CANiq72n0BtCxAsXOaNnSMWC-aW2bNTPzN=4VGb+ic8YA6jhsAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n0BtCxAsXOaNnSMWC-aW2bNTPzN=4VGb+ic8YA6jhsAw@mail.gmail.com>

On Sun, Jan 04, 2026 at 09:53:25PM +0100, Miguel Ojeda wrote:
> On Wed, Dec 17, 2025 at 11:41 PM Siddhesh Poyarekar <siddhesh@gotplt.org> wrote:
> >
> > but clang does not have this option, so avoid passing it to bindgen.
> 
> This looks indeed correct, although it is not yet in a released GCC
> (testing quickly in Compiler Explorer, GCC 15.2 doesn't have it, but
> GCC trunk has).
> 
> I will apply it -- Cc'ing ClangBuiltLinux and Kbuild so that they are aware.

Right, this does look correct, as this option is specific to GCC for the
purpose of exposing more information from GCC internals to the user for
understanding diagnostics better.

I will say if this makes 6.19, the stable tag is not necessary since
7454048db27d6 landed in 6.19-rc1 and I would not expect it to get
backported (but even if it did via AUTOSEL or something, the Fixes tag
should ensure it gets included).

Cheers,
Nathan

