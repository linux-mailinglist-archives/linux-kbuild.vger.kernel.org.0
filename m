Return-Path: <linux-kbuild+bounces-12713-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OcrMRFf1WnU5QcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12713-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 21:46:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 684FB3B3F24
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 21:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D92D430231E2
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 19:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26249378D8A;
	Tue,  7 Apr 2026 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svL9lTOT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34D8378D74;
	Tue,  7 Apr 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775590795; cv=none; b=I0mLuvfGORrbXL9fAbbCOA+sR4Tis7ntpHXXdmZAnd06BkJwvZxi+aLHyrSn32rZQOAQ0TCkjB0197cqHTX6E0At2R+0BJjI1U1i4G5lVYuSO+Bxtfex27zBgdEimUhDtqA7ICdQwjzO9nPhE2e9EG4880EFnusUySaTE95WsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775590795; c=relaxed/simple;
	bh=VUPbEqFGGbOFWIwXYHWvivFzwPWAABqvcwZPV7b0Qgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj+FhvCvVVOwKLpIzj2xAKQjzSkC0XQXckSXMgFiL3kLn8cUCLnImfaCnM6Adk7biiKJ6wDoDZXKsChyQTK2hu2XNyUEoygrNhDi7eIMCNLReEURJwQD+z8d3l+h2k3ZIVefFZ9YbuQhT0XHkdSDTZPaViyqDb0nFalrVtwQq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svL9lTOT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7DEC2BC9E;
	Tue,  7 Apr 2026 19:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775590794;
	bh=VUPbEqFGGbOFWIwXYHWvivFzwPWAABqvcwZPV7b0Qgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svL9lTOTlQvQW0aFeFKP/n5yfvO3GIW0MAh6CQjV8BDjzRyW110HJqQrlD2OHyqtS
	 Q692ehekWJW1duvyjeW/LnXHSp1n3mpWZaBk/xLCaLVeBZEkNI7D1oxaJlKWl+nRu9
	 MD9N2qhC6DuDbgoJZ4YDrVlvpBOJ7yNWOojg41Ywe36x+PieL81EJg2L9U1AoNe0bS
	 n1kxPN3enhPp93NsycEDtH74lRzyCtF+jbuz4X/nLe5ukrZT49KmvSpj5+6QeACdNv
	 /8Enc1MenSmwjSptV9YecbQcl0TXA+nhfF3Bbo3ytWFXK7DZley68PuTxeTONWE4NR
	 aRSRs5uDp+BcA==
Date: Tue, 7 Apr 2026 21:35:58 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
Subject: Re: [PATCH v2 33/33] rust: kbuild: allow `clippy::precedence` for
 Rust < 1.86.0
Message-ID: <adVcnj-bD99tOWDy@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-34-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405235309.418950-34-ojeda@kernel.org>
X-Spamd-Result: default: False [9.34 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12713-lists,linux-kbuild=lfdr.de];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.995];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rust-lang.github.io:url,garyguo.net:email]
X-Rspamd-Queue-Id: 684FB3B3F24
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Mon, Apr 06, 2026 at 01:53:09AM +0200, Miguel Ojeda wrote:
> The Clippy `precedence` lint was extended in Rust 1.85.0 to include
> bitmasking and shift operations [1]. However, because it generated
> many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
> lint which is not enabled by default [2].
> 
> In other words, only Rust 1.85 has a different behavior. For instance,
> it reports:
> 
>     warning: operator precedence can trip the unwary
>       --> drivers/gpu/nova-core/fb/hal/ga100.rs:16:5
>        |
>     16 | /     u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
>     17 | |         | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
>     18 | |             << FLUSH_SYSMEM_ADDR_SHIFT_HI
>        | |_________________________________________^
>        |
>        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#precedence
>        = note: `-W clippy::precedence` implied by `-W clippy::all`
>        = help: to override `-W clippy::all` add `#[allow(clippy::precedence)]`
>     help: consider parenthesizing your expression
>        |
>     16 ~     (u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT) | (u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
>     17 +             << FLUSH_SYSMEM_ADDR_SHIFT_HI)
>        |
> 
> While so far we try our best to keep all versions Clippy-clean, the
> minimum (which is now Rust 1.85.0 after the bump) and the latest stable
> are the most important ones; and this may be considered a "false positive"
> with respect to the behavior in other versions.
> 
> Thus allow this lint for this version using the per-version flags
> mechanism introduced in the previous commit.
> 
> Link: https://github.com/rust-lang/rust-clippy/issues/14097 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/14115 [2]
> Link: https://lore.kernel.org/rust-for-linux/DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org/
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

