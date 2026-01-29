Return-Path: <linux-kbuild+bounces-10924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBGHOM8oe2nRBwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10924-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 10:30:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B3AE284
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 10:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FBC7300B460
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 09:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E8137FF60;
	Thu, 29 Jan 2026 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUwz+LnH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF9F37FF52;
	Thu, 29 Jan 2026 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679012; cv=none; b=oM4lmgkTlrPGPW0ZJeNHZ79g97lN4zLMibrAmnu47awN9ItUHmszUV1JugVqlppv2/2vDUPgYQSyMns5EHM5uw8q1gj1jcrDc3peaNEpXLs8lkmYHZkoOaTCuZr0UDDpTSNU2Q65cvfrQ7AY4zFCuqIXLgu/IPCX+oWmZNF4JdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679012; c=relaxed/simple;
	bh=xemk5R9c0XBMFkfsqFG6Q4L/gjGhsjDRn0zzEzSMa90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpeUAlB9GP43ZTdgyNGvbHtazbhFQ4/3UlvUqHAYRoFaXzFGACOULhA/8rsf0jR4nv7Qiye9/ifW+7lVSfNEFHQuXGojiqhhkfvhiJ9WxSz+w6P+KcRWVUjwM07W+ETs4tVrv8f7/recIN+NlIa6wGCrAuE0yWldCFjW+ctp5sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUwz+LnH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAAAC4CEF7;
	Thu, 29 Jan 2026 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769679012;
	bh=xemk5R9c0XBMFkfsqFG6Q4L/gjGhsjDRn0zzEzSMa90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUwz+LnHgUcVFtoo0b2HEzsOSMgcxbMhQzc+/zvvZEIA85eNlDA4e/1bXcoUFnZ3L
	 EAC83mru8G+SExtGFKPL8i0BEtAmxq1bUCjxFtAC74PaXqEyapWu4bl2B/AKkEQec4
	 FFbWv5qEOEUJcyXLs07Tf+iFdievMNhdXex2Cj5csKLTAAsrHwEtSTq0tUA/UwZzX+
	 zY62haKBZPe/WuXWy942+xg7Fn6N8daAdJKismKdiN/EnPC03ZjsKDzBSDJCTOZhdl
	 +ykBscp+UdHi9Hg/v4g9ciPjzXsrr4saxJiSNwSg8cMmUb+UIp21fvarqR6s/qylfV
	 Wkppu5eOrXNlg==
Date: Thu, 29 Jan 2026 09:30:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>, Mingcong Bai <jeffbai@aosc.io>,
	Han Gao <rabenda.cn@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Jason Montleon <jmontleo@redhat.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
Message-ID: <20260129-removed-audacity-398bc9363728@spud>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <1b0943c4-b1c5-460a-8944-c8d9c868b085@isrc.iscas.ac.cn>
 <47d1dab9-a379-7b3a-d06c-03d674cfbb76@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QKMJgd/nBci7YAcW"
Content-Disposition: inline
In-Reply-To: <47d1dab9-a379-7b3a-d06c-03d674cfbb76@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10924-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[isrc.iscas.ac.cn,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lwn.net,aosc.io,iscas.ac.cn,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 614B3AE284
X-Rspamd-Action: no action


--QKMJgd/nBci7YAcW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 12:47:26AM -0700, Paul Walmsley wrote:
> Hi Asuna,
>=20
> On Thu, 22 Jan 2026, Asuna Yang wrote:
>=20
> > Gently ping. I think this patch is ready for review. Is there anything =
else I
> > need to do before merging?
>=20
> I guess this should probably go in via the arch/riscv tree?  If you agree=
,=20
> then from a maintenance point of view, it would be good to get some acks=
=20
> for the first and third patches from the relevant maintainers.

Not a rust maintainer of course, but from a "I was involved in this and
haven't replied in a while to the versions" point of view:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

I've just not had the time to test this and so I've been putting off
replying, but the idea is what I wanted to have done and I appreciate
the work done on it by Asuna, so I'm acking it now rather than stalling
until I can test and give an r-b. It's the right thing to do for a !gcc
point of view too in my opinion, even if the possible issues are
unlikely to manifest.

Cheers,
Conor.

--QKMJgd/nBci7YAcW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXsonAAKCRB4tDGHoIJi
0kF2AP93HfQl4GXLKv+F+l7CHk71pVcDlMAwzxs2+idjHHx6dgD+L2F5hZImjg6F
g44c/V/wgIz/uLfWhDq4WhEI0ZuJMAQ=
=BvJH
-----END PGP SIGNATURE-----

--QKMJgd/nBci7YAcW--

