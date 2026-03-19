Return-Path: <linux-kbuild+bounces-12087-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ2tEtCMvGnz0QIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12087-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 00:54:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1042D44DF
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 00:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFE1C302733B
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 23:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E92F3ACA48;
	Thu, 19 Mar 2026 23:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GC+Ib6i0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA8523505E;
	Thu, 19 Mar 2026 23:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773964489; cv=none; b=VL5l1vykPkKY/G2WnptnpLV5Zyw2jJMtnKA9FHW+5Fnsds6sNtCc6EZKU3uYiPt/l+tEN9VWzDiRGrFS8qtKZITjNUHG+Cymhb2ZM+DcAVcn+zoACpMJ4RnanIcvRpi1Rzs8e6M/oxf13Dx+NEDrmHe0mtoH7y//KL7xiOG7CHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773964489; c=relaxed/simple;
	bh=sU/jatnuzx76BoLcqPHAxKB3qQmhfXZrbKvsBu2ZEfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9lv/BEP4RKfZcm8u3z6atHJAlUC9qKoRPbfPWHHASWrA4PBXBtwkxNBFYoUf0AL6vDy3fieWNqZQYAtzU79N20lNM07yWgR9Aliy/lgATrdFG2eMqQhmCoGNEKF4XzfMhJup5RlC7Uu/bPrLxAXjEcEm8Bj7M6LeD/m/2yKwxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GC+Ib6i0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB300C2BC9E;
	Thu, 19 Mar 2026 23:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773964488;
	bh=sU/jatnuzx76BoLcqPHAxKB3qQmhfXZrbKvsBu2ZEfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GC+Ib6i0j22/J3N6Pu2IcvuDy8/E/U+HbDQ9mVoqoAT/w0oYu7yJCLvQMZP6CUe1I
	 6EwcCI5QdvkCnUeqenTOGctrg6YirWQa6iXo6d4LZf6M7k/Qspvl5ZmoBY6uuw9lrS
	 2oxCqhXDsRdmhJc6FqvmKA0NmfBAzCfjeOlFpcMmGyvJpIDPj0UPxbsxILx6LQcJE/
	 VUoZXJbxnmhcCdHhlGEfyJYB635VHFGi3F0MNzRAqBWt+5WuyezDXI6BrRja3GgfSa
	 z6E4JCOX+2vBdxlXHPtH06CJ+NWtg1uC+rplLx5t2YCtoQUk3ACs28fOeC1Kn+iD/L
	 zeiOsIitJXYrQ==
Date: Thu, 19 Mar 2026 16:54:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
Message-ID: <20260319235443.GB769346@ax162>
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net>
 <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net>
 <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12087-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,protonmail.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: AB1042D44DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 07:09:22PM +0000, Gary Guo wrote:
> On Thu Mar 19, 2026 at 4:33 PM GMT, Alice Ryhl wrote:
> > On Thu, Mar 19, 2026 at 12:47 PM Gary Guo <gary@garyguo.net> wrote:
> >> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
> >> > Do you think it's worth having Rust not match the CFLAGS here?
> >> >
> >>
> >> I think the C flags should probably be renamed AUTOFDO_LLVM too. After call, all
> >> the perf tools involved here are called llvm-foobar as well.
> >
> > But isn't it just called this because the config option is
> > CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to that
> > particular config option. It may make sense to rename
> > CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
> > this change, in my opinion.
> 
> I get that it's an existing config name, but previously it is a correct
> description, while after this change it is no longer accurate.
> 
> I don't know if there's an established practice on renaming CONFIG options when
> this sort thing happens though. Perhaps one way is to have add
> CONFIG_AUTOFDO_CLANG that selects CONFIG_AUTOFDO.

As Miguel mentioned, there is the transitional keyword for Kconfig to
handle renames now but I would really like there to be a compelling
reason for the rename other than LLVM is a little more accurate than
CLANG. The kernel has never really done a great job of referring to
Clang when it means the C compiler vs. the whole LLVM toolchain (like
LTO_CLANG and all its derivatives should be LTO_LLVM since it requires
ld.lld, llvm-nm, and llvm-ar in addition to clang). Additionally, aside
from the configuration, there is the user facing Make variable
CLANG_AUTOFDO_PROFILE that would presumably need to be changed for
consistency.

If we want to change the internal Kbuild variable names, I don't care as
much about that.

Cheers,
Nathan

