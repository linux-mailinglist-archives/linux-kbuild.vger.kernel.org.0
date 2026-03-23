Return-Path: <linux-kbuild+bounces-12150-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JeQIDwQwWk7QQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12150-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 11:04:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292B2EFA1E
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 11:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4D4030151D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 10:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6813438911A;
	Mon, 23 Mar 2026 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0YF0Xiuw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC0F37BE66;
	Mon, 23 Mar 2026 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260232; cv=none; b=Rm6uQn0pet2LEQ+WtPsWloV8vPYlj8EIim4bdOqi+C/wBHvj9r2XbZ21Rkh5KJGZuIUmzVYURPSzwgBwAKClvzBtU/o5gPbxJVeYtgLETKjUb4bqjZaBeCRctYvWPGSDDB6t4XptRJUnVNuyBr4oWRYxYWeMhl1qm9FPtZYT+Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260232; c=relaxed/simple;
	bh=xro7tl4zvQyJrRWdcW7R6YorirXJvSVqLPErH59zAT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6YkiVhJRukVIitbtAVqvMaEe9bbwn2fEw1wcQNw5OELkQPeA8Nxdut7L3ZxIg6Ebl5I/ss3gKV9FjC0omiq9e5zkiqBn9wm7pUXIM/TQd/S2KlI84ynV7PzjIFBJgYsGw7uDnDCPXd9y/+RIrlKg8W4qb7H1cQWSJoqK8W37mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=0YF0Xiuw; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cz+j7B7EZWXqL1NEdjNkb8+tqvgFwGtEmQlc0a4uF/I=; b=0YF0XiuwT3u8tR4oPMYWEV/KFK
	H9fwrg4T/+n+RJ03PpS/Fav/FeJLLU7KVNxg/rC1jqK+w+LeTgzBtMY5uSRpKHO0wDv+X6cxP7NiC
	m75SRUqkIW5e3TcIYnU2V/9uxpyA8Sc/j0NWipcGGGzkIgVZX5Q+p4QRq+XPer8SHbcl8QxCKLAjM
	+YmYDZJz5gc2FBjWWOLytVpK4pbu5cpv+VXUz3RUGr/wvAMjrH6Zo5aYlwvQ2q7xNgwDr/8QYZiUW
	W9lgLx+4dBjuEbKoTDvDCm6znHsF6AcsyhR8Ua14v4nYL8zIAC5TUrwz1CHT9EOJzgzdxIrCwHslC
	8tWM9ivQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45792)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4c8C-000000000IN-2POJ;
	Mon, 23 Mar 2026 10:03:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4c86-000000003wH-1o0a;
	Mon, 23 Mar 2026 10:03:26 +0000
Date: Mon, 23 Mar 2026 10:03:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, akpm@linux-foundation.org,
	aliceryhl@google.com, anton.ivanov@cambridgegreys.com,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
	david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net,
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-um@lists.infradead.org,
	llvm@lists.linux.dev, lossin@kernel.org, mark.rutland@arm.com,
	mmaurer@google.com, morbo@google.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev,
	nsc@kernel.org, peterz@infradead.org, richard@nod.at,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com,
	will@kernel.org
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Message-ID: <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323000327.111235-1-ojeda@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12150-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-kbuild@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 2292B2EFA1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 01:03:27AM +0100, Miguel Ojeda wrote:
> On Sun, 22 Mar 2026 20:21:59 +0100 Miguel Ojeda <ojeda@kernel.org> wrote:
> >
> >     On the other hand, regardless of whether we fix this (and another
> >     issue in a separate email found thanks to the UML build), we could
> >     instead add `depends on` listing explicitly the architectures where
> >     this is going to be actually tested. That way maintainers can decide
> >     whether they want to support it when they are ready. Thoughts?
> 
> Another one for arm 32-bit:
> 
>       LD      .tmp_vmlinux1
>     ld.lld: error: undefined symbol: __aeabi_read_tp
>     >>> referenced by uaccess.rs:349 (rust/kernel/uaccess.rs:349)
>     >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
>     >>> referenced by uaccess.rs:543 (rust/kernel/uaccess.rs:543)
>     >>>               samples/rust/rust_misc_device.o:(<rust_misc_device::RustMiscDevice as kernel::miscdevice::MiscDevice>::ioctl) in archive vmlinux.a
>     >>> referenced by uaccess.rs:543 (rust/kernel/uaccess.rs:543)
>     >>>               drivers/android/binder/rust_binder_main.o:(rust_binder_main::rust_binder_ioctl) in archive vmlinux.a
>     >>> referenced 36 more times

Why is Rust generating code for userspace thread accessors for kernel
space, where userspace threads are meaningless. This is totally wrong.
The kernel must not reference __aeabi_read_tp().

Note: I know nothing about Rust, but I know enough to say the above is
pointing to a fundamental issue in Rust for 32-bit ARM.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

