Return-Path: <linux-kbuild+bounces-12691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI7LFiPE02mqlgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12691-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 16:33:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72E3A41DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 16:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CB16304CA68
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 14:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14D53806BE;
	Mon,  6 Apr 2026 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+As036J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA90537FF64;
	Mon,  6 Apr 2026 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485761; cv=none; b=mQ7VK418IXssjAvJZM42gXzPWrUcHhH72oaSxzWibCe5SzqXY4ikHMmP0ERYiOjrI1quSGAN85+XTkrmvjCc91GbbMdZQQD8svQQTwyIwwmDQueWGZhtI7w6w2AMN/Lf2zM70aub54R5hWRiZXJah5oZa4Aif5e2ElkKAoBjf1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485761; c=relaxed/simple;
	bh=mq7jaFSupKdEJsnxgCQqUuadHGtAR9I1r4rs0c7hHHQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=mMhlDuRv0ldSx/4YRxbtaarUVDdeDdp73AFgnHZRzHG7+HVwJp6U2OJw8ZjvrFxbsmMLj7lIXOksD0fjtmu+fhrJ9wl9OMsTqxz3ieOejV3uUj05LTJl+voLh6X5CGbHgM4qYTTowMe2VDlAQ2gpsR5WlmwZGJlUmJTXQewKp7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+As036J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18640C4CEF7;
	Mon,  6 Apr 2026 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485761;
	bh=mq7jaFSupKdEJsnxgCQqUuadHGtAR9I1r4rs0c7hHHQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=e+As036J1OE0LRbTE+udyTNDvuoDowrAh30WCvKKTZxym8JYzXrGS3G26uVdSwDP6
	 mK3MA9FuaKrw2yn6f4O66Z1zhBrF83QZGaW2/46S36F1e6+tbLI+XC7JYbZzu9Ff2r
	 Vc9MuNOWNw+/xBZ4JS1jso2x8nUy5yuCaECtI4kKEB+tx7ukCV87lbA0JAlLkDmp68
	 5qUbmQ7T+w79KOxCzYtbCnYkoItoAf9EdIcuSMqk4t18yFBWMycOAV32nSBypHspnL
	 g2OeTE7e+5JZx9HvznWqHMpzI2q+cViUAFIk3S0nmqEP7lP8RFEUbEhMLbJzveYwbK
	 H+dQk2i2obNKw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 32/33] rust: kbuild: support global per-version
 flags
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
In-Reply-To: <20260405235309.418950-33-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-33-ojeda@kernel.org>
Date: Mon, 06 Apr 2026 10:28:57 -0400
Message-Id: <177548573700.95472.352775942128786057.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=tamird@kernel.org;
 h=from:subject:message-id; bh=mq7jaFSupKdEJsnxgCQqUuadHGtAR9I1r4rs0c7hHHQ=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJmXD+tzWYj+6dTpkBWbUfp7wsO/m/iYktnfTG+7aHHYb
 GZpoV1Bx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKl+5czwP+PqFPMTQeFWGn039hd23v20JE567dHFIme6jpjbVEjwr2RkuOrsmlm
 kEVS0PyKl+13SNTPpN+1S8XIH9s/y+Sn8aJMrFwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12691-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE72E3A41DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 06 Apr 2026 01:53:08 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Sometimes it is useful to gate global Rust flags per compiler version.
> For instance, we may want to disable a lint that has false positives in
> a single version [1].
> 
> We already had helpers like `rustc-min-version` for that, which we use
> elsewhere, but we cannot currently use them for `rust_common_flags`,
> which contains the global flags for all Rust code (kernel and host),
> because `rustc-min-version` depends on `CONFIG_RUSTC_VERSION`, which
> does not exist when `rust_common_flags` is defined.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

