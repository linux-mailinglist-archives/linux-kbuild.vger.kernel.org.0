Return-Path: <linux-kbuild+bounces-3245-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC62960B24
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 14:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85F651F21FA1
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 12:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092E41BA875;
	Tue, 27 Aug 2024 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1USXRxL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA3A19D8AC;
	Tue, 27 Aug 2024 12:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724763266; cv=none; b=i0UaqWmcswPdFaQXRdMUxTFOqzKEk0H1perTO8toENGjoD6VJWWbytrsYTJ9QI52uq4sunM21AgKHNQ4WPN12qlbU83DIVjPAcWJX4cVGVYBDWhBbdWFP239OD9A7EM6ZawmIvnkocJmkZwGLijsy6WPg6bqT0xVTy3gtcJUpgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724763266; c=relaxed/simple;
	bh=VMUzRAM5Hw52cDsbFyBaNOrcpREqdpt0SHKNWwSUbGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzOaoNlMxZQ+KIaT0twshibCAKaBD8HLd7ZOFBwEIOtDt13KrMX6TQtifK4c8A012LHce52vJnNDudhqgcGvvtOFpZ9jGK5oKh+5AtPgjB5YA875NGytRnplHdqyNdHUIHuKMMakWPAzl45iaDp74Kfo2wy0M3vje7OzLd38deg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1USXRxL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EE1C61060;
	Tue, 27 Aug 2024 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724763266;
	bh=VMUzRAM5Hw52cDsbFyBaNOrcpREqdpt0SHKNWwSUbGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1USXRxLuKv9RSf1QYGvs6fH7m858MTeSVxGH13wbiZUR9323Kl8Y9I0s1pJKygos
	 ATDercIrA+OEr8zd4rrl2bE93RPZybE4kpbVRiyKJt0tf1U0Ir8wIwVtY22k5H/IpQ
	 OSc3iSrJWl+HCV09IQ7zqaF+Go0HpSpWmB+f4eaRMSl/Js9kbNZ5BHtzuictFeKkfc
	 W76MOA8oIXiiA8tkFzawU7qyp6ZlNA8QSxrxOKXXUSBEKdarzusPVRb02BIDO/QQZq
	 i1gngIYnnEKiSDV+bNklcMohWpfW+2RkygrlWRiPgrozQBQ3qr4mWV9kdKKTVGVfAS
	 Ufi9qvuScyqLg==
Date: Tue, 27 Aug 2024 13:54:18 +0100
From: Will Deacon <will@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor@kernel.org>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] rust: support for shadow call stack sanitizer
Message-ID: <20240827125417.GE4772@willie-the-truck>
References: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
 <20240827125037.GC4772@willie-the-truck>
 <CANiq72kAS9yYS1EJvmwL9LXk_k3nVQ=ShE=k6_Baa7vuBNgnqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kAS9yYS1EJvmwL9LXk_k3nVQ=ShE=k6_Baa7vuBNgnqA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Aug 27, 2024 at 02:52:30PM +0200, Miguel Ojeda wrote:
> On Tue, Aug 27, 2024 at 2:50 PM Will Deacon <will@kernel.org> wrote:
> >
> > For the arm64 parts:
> >
> > Acked-by: Will Deacon <will@kernel.org>
> >
> > In which tree do you plan to merge this?
> 
> If it goes in this cycle, and that is OK with you, then I think it
> would be easiest to put it into Rust, since it depends on
> `RUSTC_VERSION` which we will want to put there too since other things
> will be placed on top too.

Fine by me! I just wanted to make sure you didn't need me to do anything
else.

Will

