Return-Path: <linux-kbuild+bounces-12585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGVKNdCnzWmvfgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12585-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:18:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B33819C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03B6F30AB62C
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 23:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE87B481657;
	Wed,  1 Apr 2026 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMSgCFmp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5547DD76;
	Wed,  1 Apr 2026 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775084518; cv=none; b=KfOV8MTv4PM9PH+5yfVcaKqW1nk6c7NgXzctVlnTv2in/rnWAOqcMQEtnIWQHt7SGV320PlerHjcLAgmV76j24Uebh+CVarAQOe6eukst7sgStvG4XVgzQPQlTrqsfDCFS42c4N9pDTO4PbaF9XD7vQ4PRLNtkyGq9YZVtbrZwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775084518; c=relaxed/simple;
	bh=U0z1f7WmJb1y4dfJmsmO4rtz8iO1tJNxLkugN/iERrs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Kp9wot/+RsdXiyl33cOT4HS6Pq26unJd9uKAa2XwEOt+2YDIUR8wZJl5SfEcrnIxW5OSL0AWvDgBK0/1HFPqVKRlTht9JA2vblIwyGUU64y7HJ9dRoYq/EB5y3Z4oRkYh46qFawkT2mjzFMydeGgd7BCF3XDxlRAlaxi1l6FNVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMSgCFmp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8523C2BC9E;
	Wed,  1 Apr 2026 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084517;
	bh=U0z1f7WmJb1y4dfJmsmO4rtz8iO1tJNxLkugN/iERrs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=UMSgCFmpPFESaRAbvbhDhQiCJwvV4rRI29EQmB0081nHG47VaoK9DsZ87N20ilTx/
	 obHtZ+aT5eDe/3CUF+QYMPNqdkzwcsrBaGB1uzVm0pfcDYp1VJCmo1jL/0HIoM5RNj
	 iTgu7PyZZxOsj1m6IjusGOJ8iwfJNFnzHmJfDNcZtTbfSTgPXc+UHvwPqOeAhJLE9x
	 9u7MJDThp4/mCBjG1VZ4wucl6sy1ZHstjCSifT+LAuUqrMCVKULTuDsCABCCXg5Pcu
	 NYCkfoRZxaFdEAWjprgGpGCncCf/8BXJkgVTpuN4aIwNu5Zj1mJbJXZWpJ0DCEQqMU
	 VoIcuuTDapCwA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
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
In-Reply-To: <20260401114540.30108-33-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-33-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434474.73816.6769206170563558152.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=622; i=tamird@kernel.org;
 h=from:subject:message-id; bh=U0z1f7WmJb1y4dfJmsmO4rtz8iO1tJNxLkugN/iERrs=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7tyXN4UGNjIVv7Oan+7TIj6c2bpm5kOwsVmLFFFf
 8NvnHXomMjCIMbFYCmmyJIoemhveurtPbKZ747DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNVZoYwMb+bI30yW8DzreTVxsqJRzf+lz5/tNI542cmT8HXZjAvVExn+h3398Mm
 ieVJUs0Cb2/LGPIbW10HT78y/fv6PU+iXZ/O/MwIA
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
	TAGGED_FROM(0.00)[bounces-12585-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E5B33819C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026 13:45:39 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> [...]
> defined after the `include/config/auto.conf` inclusion (where
> `CONFIG_RUSTC_VERSION` becomes available), and append it to
> `rust_common_flags`, `KBUILD_HOSTRUSTFLAGS` and `KBUILD_RUSTFLAGS`.
> 
> An alternative is moving all those three down, but that would mean
> separating them from the other `KBUILD_*` variables.

My prefernece is avoiding duplication over grouping, but either choice
should be justified by a code comment that acknowledges the
duplication/inconsisntecy.

-- 
Tamir Duberstein <tamird@kernel.org>

